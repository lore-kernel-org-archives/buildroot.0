From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 4 May 2015 09:53:28 +0200
Subject: [Buildroot] [PATCH 1/4] support/download/cvs: add support to
 use a date instead of a tag
In-Reply-To: <5544A509.6040501@mind.be>
References: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
 <1430091621-4698-2-git-send-email-fabio.porcedda@gmail.com>
 <5544A509.6040501@mind.be>
Message-ID: <CAHkwnC-_LJu5SbLiBJsmYHNM-nobLEuJ=z5rEUSPX3UA+QuGgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 2, 2015 at 12:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 27/04/15 01:40, Fabio Porcedda wrote:
>> This is useful when a tag is not avaiable.
>
>  Actually, we currently only support a date. The cvs co -r option has the
> following syntax: -r tag[:date] - so we currently always interpret the version
> as a date, since we put a : in front of it.

Where have you found such documentation? I've checked the "man cvs"
but I've found only this:

  -r tag

         Use the revision specified by the tag argument ....


>  The :date extension is only valid when the tag is not a tag but a branch. If
> the tag is empty, it refers to the trunk.
>
>  AFAICS, the -D option is completely equivalent to -r :date .
>
>  I applied just the third patch of this series and could build expect successfully.

Are you sure about that? I've tried to download the source without
using this patch but it fails:

>>> expect 2014-05-02 Downloading
cvs [checkout aborted]: tag `:2014-05-02' must start with a letter
--2015-05-04 08:57:58--  http://sources.buildroot.net/expect-2014-05-02.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net
(sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2015-05-04 08:57:58 ERROR 404: Not Found.

>
>  That said, I think the current behaviour is ridiculous, so perhaps the : should
> be removed from the -r handling. The : can be added explicitly in the version
> number - but then the directory name of expect will be
> expect-_2014-05-02 which is also a bit weird...
>
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>>  support/download/cvs | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/support/download/cvs b/support/download/cvs
>> index 2c3a666..9cf9304 100755
>> --- a/support/download/cvs
>> +++ b/support/download/cvs
>> @@ -26,7 +26,16 @@ rev="${3}"
>>  rawname="${4}"
>>  basename="${5}"
>>
>> +if [[ ${rev} =~ ^[0-9] ]]; then
>> +    # Date, because a tag cannot begin with a number
>> +    select="-D ${rev}"
>> +else
>> +    # Tag
>> +    select=-"r :${rev}"
>
>  Note that this won't work, since the space will be interpreted as a tag name.
> It should be
>
>         select="-r :\"${rev}\""
>
> and remove the quotes from where ${select} is used.
>

It fails on my pc (Fedora 22):
>>> expect expect_5_45 Downloading
rev: expect_5_45
cvs [checkout aborted]: tag `:"expect_5_45"' must start with a letter

e.g. it's works using this:
             select=-"r ${rev}"

IMHO the simplest solution is:

+if [[ ${rev} =~ ^[0-9] ]]; then
+    # Date, because a tag cannot begin with a number
+    select="-D"
+else
+    # Tag
+    select="-r"
+fi
+
+export TZ=UCT
 ${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
-       co -d "${basename}" -r ":${rev}" -P "${rawname}"
+       co -d "${basename}" ${select} "${rev}" -P "${rawname}"

Thanks for reviewing
-- 
Fabio Porcedda
