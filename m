From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 8 Dec 2015 22:43:25 +0100
Subject: [Buildroot] [PATCH v2 1/2] apply-patches: only use first field
 of line for series file
In-Reply-To: <20151208205514.GV4188@free.fr>
References: <1448070305-10768-1-git-send-email-ryanbarnett3@gmail.com>
 <20151208205514.GV4188@free.fr>
Message-ID: <CALq67GCjBCXQ50efoZrb2DV0Y7UxNOqpzh_K_kjWuvJEMnUmnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Dec 8, 2015 at 9:55 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Ryan, All,
>
> On 2015-11-20 19:45 -0600, Ryan Barnett spake thusly:
>> A series file for quilt has a valid syntax of:
>>
>>   fixes/autoconf.diff -p1
>>   fixes/doc-html-local-css.diff -p1
>>   fixes/gnu-inline.diff -p1
>>
>> However, with the current way that a series file is handled, it will
>> error out because the -p1 is tried as a file. This is because in the
>> for loop that iterates the files, we only look for invalid lines. Then
>> each line is used within a bash for loop which uses spaces a
>> delimiter. In order to fix this, we should only use the string that
>> comes before a space in the series file.
>>
>> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
>> CC: Arnout Vandecappelle <arnout@mind.be>
>> ---
>>  support/scripts/apply-patches.sh | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
>> index 2edf054..6525f94 100755
>> --- a/support/scripts/apply-patches.sh
>> +++ b/support/scripts/apply-patches.sh
>> @@ -115,7 +115,10 @@ function scan_patchdir {
>>      # If there is a series file, use it instead of using ls sort order
>>      # to apply patches. Skip line starting with a dash.
>>      if [ -e "${path}/series" ] ; then
>> -        for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
>> +        # Some series files for quilt contain a '-p1' at the end, handle this
>> +        # by only using the first word from series file
>
> Wrong. The format is not -p1, but -pN where N is an integer greater than
> or equal to 0. Some quilt series (in some Debian packages or in some
> Gentoo packages) has -p0 or -p1 or -p2 ; I even saw -p4 once.
>
> So, simply ditching the last field in incorrect.
>
> However, since we only have one packge that has the -pN field, and all
> of them are -p1, we don't have a test-case against a generic -pN
> handling. We can deal with that when/if the issue is raised.
>
> Still, I'd prefer we have a little comment stating that we explicitly do
> not deal with the genericc -pN format, and just assume -p1, whether that
> field is present or missing, something like so maybe:
>
>     # The format of a series file accepts a second field that is
>     # used to specify the number of directory components to strip
>     # when applying the patch, in the form -pN (N an integer >= 0)
>     # We assume this field to always be -p1 wheter it is present or
>     # missing.

Agree that this comment is much better than mine. However, I would
include it after fixing the spelling - s/wheter/whether/

Again, it will probably be some time before I am able to respin this patch.

Thanks,
-Ryan
