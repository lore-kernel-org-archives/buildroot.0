From: Cam Hutchison <camh@xdna.net>
Date: Thu, 24 Nov 2016 09:32:58 +1100
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
 with old distros
In-Reply-To: <20161123215748.GC13048@free.fr>
References: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
 <564d.5830d7d7.de49@xdna.net> <20161123215748.GC13048@free.fr>
Message-ID: <CABa6e=pRGouHYF5bQL3tRLGey-L5a4Qqc2PASY_m3aLz_ZZbDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thanks for the review.

I often said in my last job that if you get five people to review your
shell script, you'll get ten opinions. Something about shell that
gives such a diversity of views.


On 24 November 2016 at 08:57, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> I don't like it much. It is very intrusive, when we are so close to the
> release...

It's a fair point but the script is small enough that it can easily be
tested with a variety of inputs to validate it, which I did. There was
a one character difference between the original script and this one in
one test case but that was not significant.

> You are entirely getting rid of arrays, even the indexed arrays, even
> though bash has had support for them for ages now, and even RHEL-4 (4!)
> has a bash that supports indexed arrays...

Sure. I was presenting a solution that removed the arrays altogether.
The approach I took did not need any arrays, so while the direct
problem was the associative arrays, just getting rid of them and
leaving an indexed array did not make any sense.

> Getting rid of the indxed arrays complexifies the script quite a bit.

Really? To me this is so much simpler. The state has been removed, and
state is always an additional cognitive and testing burden. The script
functions become functional in that their output is a product of their
input. This makes testing simpler and reduces the scope you need to
keep in your head to understand a function.

> Also, using a function to retrieve fields makes the code even yet a
> little bit more complex.

Factoring into smaller functions like this is both a benefit and a
hindrance. It makes the initial reading of the code a bit harder as
you need to understand the abstractions, but once understood it makes
it easier. Since the function is a single line, it is easy to verify
but since it also reduces repetition the complexity is reduced.

>
> Indeed, the eval are icky, but they are pretty much contained.
>
> Plus, see a few comments below...
>
>> Currently, the br2-external script uses bash-4's associative arrays.
>>
>> However, some oldish enterprise-class distros like RHEL5 still use
>> bash-3.1 which lacks associative arrays.
>>
>> Remove the arrays by reading the external.desc files as we generate the
>> output file.
>>
>> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>> Signed-off-by: "Cam Hutchison" <camh@xdna.net>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Cc: Max Filippov <jcmvbkbc@gmail.com>
>> Signed-off-by: Cam Hutchison <camh@xdna.net>
>> ---
>>  support/scripts/br2-external | 94 +++++++++++++++++++++++++-------------------
>>  1 file changed, 53 insertions(+), 41 deletions(-)
>>
>> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
>> index 055dc08..2afc88e 100755
>> --- a/support/scripts/br2-external
>> +++ b/support/scripts/br2-external
>> @@ -61,14 +57,16 @@ do_validate() {
>>          return
>>      fi
>>
>> -    for br2_ext in "${@}"; do
>> +    for br2_ext; do
>
> I always find this notation to be puzzling. Yes, I know it uses the
> positional arguments, but I don;t like implicit behaviour; it always
> leads to maintenance burden.
>
> Just keep the explicit iteration:   for br2_ext in "${@}"; do

I can't disagree more with this. In the expanded form, there are four
ways you can iterate arguments of which only one is correct. I have
seen the incorrect ways too often that now when I review code, I tell
people to use the form I use here. The four ways are:

for var in $*
for var in "$*"
for var in $@
for var in "$@"

Not many people understand the different expansions here that I avoid
it altogether. "for var" is valid shell and is *more explicit* in a
way because it means only one thing - iterate over the positional
parameters, correctly maintaining word boundaries. You can't get the
quotes wrong, you can't use the wrong expansion and you can't
accidentally drop in an extra argument from a typo.

>
> [--SNIP--]
>> +validate_unique_names() {
>> +    # If there are any duplicate names across the external.desc files,
>> +    # generate_dupes will output at least two lines of the form:
>> +    # <br2_ext_1> name
>> +    # <br2_ext_2> name
>
> In fact, the full output would be something like:
>
>     br2-ext-1 name-A
>     br2-ext-2 name-A
>     br2-ext-3 name-A
>     br2-ext-4 name-B
>     br2-ext-5 name-B

Yes, and they are both the same *form*. And I did say "at least two
lines". The extra verbiage is not relevant so I omitted it.

>
>> +    # If there is more that one duplicate, extra lines will be output but
>
> At first, I was not sure what you meant here. But you meant that, in the
> example above, br2-ext-3 will not be reported, and neither would
> br2-ext-4 and br2-ext-5.
>
> (That's OK, the current code does not report them either).
>
>> +    # we do not include them in the error message due to formatting limitations
>> +    # of the error message. Once one duplicate is fixed, subsequent runs will
>> +    # identify the next duplicate(s).
>> +    set -- $(generate_dupes "${@}")
>> +    if [ ${#} -ne 0  ]; then
>> +        error "'%s': name '%s' is already used in '%s'\n" \
>> +            "${1}" "${2}" "${3}"
>> +    fi
>> +}
>> +
>
> The documentation of the output of generate_dupes should go there:

I did put it there at first, but what I found in the end was that how
the output was used was more important to understand. I could put a
"head -n 2" in generate_dupes and then move the comment there which
would also make some sense.

>
>    # ...here.
>> +generate_dupes() {
>> +    for br2_ext; do
>> +        printf '%s %s\n' ${br2_ext} "$(get_field "${br2_ext}" 'name')"
>> +    done | sort -k2,2 | uniq --skip-fields=1 --all-repeated
>> +}
>> +
>> +# Get a field by name from an external.desc file
>> +get_field() {
>> +    local br2_ext="${1}"
>> +    local field="${2}"
>> +
>> +    sed -n -r -e "s/^${field}"': +(.*)$/\1/p' "${br2_ext}/external.desc"
>
> Mixing quotes is always tricky... ;-) I try to avoid it when possible:
>
>     "s/^${field}: +(.*)\$/\\1/p"

Yeah. There's no sanity here. I hate backslash-quoting things that if
I can put in the right quotes to avoid it, I will. The mashed-together
double- and single-quote looks a lot more confusing now I see it in my
mail client rather than my editor.

>
>>  }
>>
>>  # Generate the .mk snippet that defines makefile variables
>>  # for the br2-external tree
>>  do_mk() {
>> -    local br2_name br2_ext
>> +    local br2_ext br2_name br2_desc
>>
>>      printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
>>      printf '\n'
>>
>> -    # We can't use ${BR2_EXT_NAMES[@]} directly: it is not guaranteed
>> -    # to be in the order paths were added (because it is an associative
>> -    # array). So we need to iterate on BR2_EXT_NAMES, which is sorted
>> -    # in the order names were added (because it is an indexed array).
>>      printf 'BR2_EXTERNAL ?='
>> -    for br2_name in "${BR2_EXT_NAMES[@]}"; do
>> -        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
>> -    done
>> +    printf ' %s' "${@}"
>>      printf '\n'
>
> You can do that in a single command:
>
>     printf 'BR2_EXTERNAL ?= %s\n' "${*}"

Ack. Good call.

>
>>
>>      printf 'BR2_EXTERNAL_NAMES = \n'
>>      printf 'BR2_EXTERNAL_DIRS = \n'
>>      printf 'BR2_EXTERNAL_MKS = \n'
>>
>> -    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
>> +    if [ ${#} -eq 0 ]; then
>>          printf '\n'
>>          printf '# No br2-external tree defined.\n'
>>          return
>>      fi
>>
>> -    for br2_name in "${BR2_EXT_NAMES[@]}"; do
>> -        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
>> -        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
>> +    for br2_ext; do
>
> Please, keep explicit listing of positional arguments.

Ack. See rationale above.

>
>> +        br2_name="$(get_field "${br2_ext}" 'name')"
>> +        br2_desc="$(get_field "${br2_ext}" 'desc')"
>>          printf '\n'
>>          printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
>>          printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
>> @@ -151,12 +163,12 @@ do_mk() {
>>
>>  # Generate the kconfig snippet for the br2-external tree.
>>  do_kconfig() {
>> -    local br2_name br2_ext
>> +    local br2_ext br2_name br2_desc
>>
>>      printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
>>      printf '\n'
>>
>> -    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
>> +    if [ ${#} -eq 0 ]; then
>>          printf '# No br2-external tree defined.\n'
>>          return
>>      fi
>> @@ -164,10 +176,10 @@ do_kconfig() {
>>      printf 'menu "External options"\n'
>>      printf '\n'
>>
>> -    for br2_name in "${BR2_EXT_NAMES[@]}"; do
>> -        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
>> -        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
>> -        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
>> +    for br2_ext; do
>
> Please, keep explicit listing of positional arguments.

Ack. See rationale above.

>
> However, I'm not sure you should fix and respin, I think this patch is a
> little bit too intrusive and makes the code a little bit more complex
> than really needed.
>
> Yet, let's see what others think. Arnout, Thomas?

I've got no attachment to this - to me, this code was simpler so I
threw it out there (and I hate eval so much - forget trying to quote
sanely with eval). Up to you guys.

>
> Regards,
> Yann E. MORIN.
>
>> +        br2_name="$(get_field "${br2_ext}" 'name')"
>> +        br2_desc="$(get_field "${br2_ext}" 'desc')"
>> +        if [ ${#} -gt 1 ]; then
>>              printf 'menu "%s"\n' "${br2_desc}"
>>          fi
>>          printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
>> @@ -175,7 +187,7 @@ do_kconfig() {
>>          printf '\tstring\n'
>>          printf '\tdefault "%s"\n' "${br2_ext}"
>>          printf 'source "%s/Config.in"\n' "${br2_ext}"
>> -        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
>> +        if [ ${#} -gt 1 ]; then
>>              printf 'endmenu # %s\n' "${br2_name}"
>>          fi
>>          printf '\n'
>> --
>> 2.1.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
