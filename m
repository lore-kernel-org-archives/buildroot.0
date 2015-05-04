From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 May 2015 18:47:24 +0200
Subject: [Buildroot] [PATCH 1/4] support/download/cvs: add support to
 use a date instead of a tag
In-Reply-To: <CAHkwnC-_LJu5SbLiBJsmYHNM-nobLEuJ=z5rEUSPX3UA+QuGgQ@mail.gmail.com>
References: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
 <1430091621-4698-2-git-send-email-fabio.porcedda@gmail.com>
 <5544A509.6040501@mind.be>
 <CAHkwnC-_LJu5SbLiBJsmYHNM-nobLEuJ=z5rEUSPX3UA+QuGgQ@mail.gmail.com>
Message-ID: <5547A29C.4020306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/15 09:53, Fabio Porcedda wrote:
> On Sat, May 2, 2015 at 12:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 27/04/15 01:40, Fabio Porcedda wrote:
>>> This is useful when a tag is not avaiable.
>>
>>  Actually, we currently only support a date. The cvs co -r option has the
>> following syntax: -r tag[:date] - so we currently always interpret the version
>> as a date, since we put a : in front of it.
> 
> Where have you found such documentation? I've checked the "man cvs"
> but I've found only this:
> 
>   -r tag
> 
>          Use the revision specified by the tag argument ....

 I guess my Debian sid has a different cvs version. Mine is
1.12.13-MirDebian-11 - which seems to indicate that there could be some
Debian-specific patches in there.

 So this means that the current code simply doesn't work at all for you, right?

> 
> 
>>  The :date extension is only valid when the tag is not a tag but a branch. If
>> the tag is empty, it refers to the trunk.
>>
>>  AFAICS, the -D option is completely equivalent to -r :date .
>>
>>  I applied just the third patch of this series and could build expect successfully.
> 
> Are you sure about that? I've tried to download the source without
> using this patch but it fails:

 Yes I'm sure,

[snip]
>>> +if [[ ${rev} =~ ^[0-9] ]]; then
>>> +    # Date, because a tag cannot begin with a number
>>> +    select="-D ${rev}"
>>> +else
>>> +    # Tag
>>> +    select=-"r :${rev}"
>>
>>  Note that this won't work, since the space will be interpreted as a tag name.
>> It should be
>>
>>         select="-r :\"${rev}\""
>>
>> and remove the quotes from where ${select} is used.
>>
> 
> It fails on my pc (Fedora 22):
>>>> expect expect_5_45 Downloading
> rev: expect_5_45
> cvs [checkout aborted]: tag `:"expect_5_45"' must start with a letter

 Which kind of proves my point - the current situation doesn't work on F22.

> 
> e.g. it's works using this:
>              select=-"r ${rev}"
> 
> IMHO the simplest solution is:
> 
> +if [[ ${rev} =~ ^[0-9] ]]; then
> +    # Date, because a tag cannot begin with a number
> +    select="-D"
> +else
> +    # Tag
> +    select="-r"
> +fi
> +
> +export TZ=UCT

 Small nit: UCT is correct, but I see more people use UTC (which is also what
e.g. LANG=C date -u prints) so let's stick to that.

>  ${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
> -       co -d "${basename}" -r ":${rev}" -P "${rawname}"
> +       co -d "${basename}" ${select} "${rev}" -P "${rawname}"

 Looks good to me. Will you cook up a proper patch?

 It would be nice if it would be possible to give _both_ a branch and a date,
but that is probably pushing it a little - especially for a VCS that is almost
dead...


 Regards,
 Arnout

> 
> Thanks for reviewing
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
