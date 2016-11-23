From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Nov 2016 22:57:48 +0100
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
 with old distros
In-Reply-To: <564d.5830d7d7.de49@xdna.net>
References: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
 <564d.5830d7d7.de49@xdna.net>
Message-ID: <20161123215748.GC13048@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

(Arnout, Thomas, question for you at the end)

On 2016-11-19 22:53 -0000, Cam Hutchison spake thusly:
> Since eval is kind of icky, how about something like this patch instead?

I don't like it much. It is very intrusive, when we are so close to the
release...

You are entirely getting rid of arrays, even the indexed arrays, even
though bash has had support for them for ages now, and even RHEL-4 (4!)
has a bash that supports indexed arrays...

Getting rid of the indxed arrays complexifies the script quite a bit.
Also, using a function to retrieve fields makes the code even yet a
little bit more complex.

Indeed, the eval are icky, but they are pretty much contained.

Plus, see a few comments below...

> Currently, the br2-external script uses bash-4's associative arrays.
> 
> However, some oldish enterprise-class distros like RHEL5 still use
> bash-3.1 which lacks associative arrays.
> 
> Remove the arrays by reading the external.desc files as we generate the
> output file.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Cam Hutchison" <camh@xdna.net>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
>  support/scripts/br2-external | 94 +++++++++++++++++++++++++-------------------
>  1 file changed, 53 insertions(+), 41 deletions(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 055dc08..2afc88e 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -61,14 +57,16 @@ do_validate() {
>          return
>      fi
>  
> -    for br2_ext in "${@}"; do
> +    for br2_ext; do

I always find this notation to be puzzling. Yes, I know it uses the
positional arguments, but I don;t like implicit behaviour; it always
leads to maintenance burden.

Just keep the explicit iteration:   for br2_ext in "${@}"; do

[--SNIP--]
> +validate_unique_names() {
> +    # If there are any duplicate names across the external.desc files,
> +    # generate_dupes will output at least two lines of the form:
> +    # <br2_ext_1> name
> +    # <br2_ext_2> name

In fact, the full output would be something like:

    br2-ext-1 name-A
    br2-ext-2 name-A
    br2-ext-3 name-A
    br2-ext-4 name-B
    br2-ext-5 name-B

> +    # If there is more that one duplicate, extra lines will be output but

At first, I was not sure what you meant here. But you meant that, in the
example above, br2-ext-3 will not be reported, and neither would
br2-ext-4 and br2-ext-5.

(That's OK, the current code does not report them either).

> +    # we do not include them in the error message due to formatting limitations
> +    # of the error message. Once one duplicate is fixed, subsequent runs will
> +    # identify the next duplicate(s).
> +    set -- $(generate_dupes "${@}")
> +    if [ ${#} -ne 0  ]; then
> +        error "'%s': name '%s' is already used in '%s'\n" \
> +            "${1}" "${2}" "${3}"
> +    fi
> +}
> +

The documentation of the output of generate_dupes should go there:

   # ...here.
> +generate_dupes() {
> +    for br2_ext; do
> +        printf '%s %s\n' ${br2_ext} "$(get_field "${br2_ext}" 'name')"
> +    done | sort -k2,2 | uniq --skip-fields=1 --all-repeated
> +}
> +
> +# Get a field by name from an external.desc file
> +get_field() {
> +    local br2_ext="${1}"
> +    local field="${2}"
> +
> +    sed -n -r -e "s/^${field}"': +(.*)$/\1/p' "${br2_ext}/external.desc"

Mixing quotes is always tricky... ;-) I try to avoid it when possible:

    "s/^${field}: +(.*)\$/\\1/p"

>  }
>  
>  # Generate the .mk snippet that defines makefile variables
>  # for the br2-external tree
>  do_mk() {
> -    local br2_name br2_ext
> +    local br2_ext br2_name br2_desc
>  
>      printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
>      printf '\n'
>  
> -    # We can't use ${BR2_EXT_NAMES[@]} directly: it is not guaranteed
> -    # to be in the order paths were added (because it is an associative
> -    # array). So we need to iterate on BR2_EXT_NAMES, which is sorted
> -    # in the order names were added (because it is an indexed array).
>      printf 'BR2_EXTERNAL ?='
> -    for br2_name in "${BR2_EXT_NAMES[@]}"; do
> -        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
> -    done
> +    printf ' %s' "${@}"
>      printf '\n'

You can do that in a single command:

    printf 'BR2_EXTERNAL ?= %s\n' "${*}"

>  
>      printf 'BR2_EXTERNAL_NAMES = \n'
>      printf 'BR2_EXTERNAL_DIRS = \n'
>      printf 'BR2_EXTERNAL_MKS = \n'
>  
> -    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
> +    if [ ${#} -eq 0 ]; then
>          printf '\n'
>          printf '# No br2-external tree defined.\n'
>          return
>      fi
>  
> -    for br2_name in "${BR2_EXT_NAMES[@]}"; do
> -        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
> -        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
> +    for br2_ext; do

Please, keep explicit listing of positional arguments.

> +        br2_name="$(get_field "${br2_ext}" 'name')"
> +        br2_desc="$(get_field "${br2_ext}" 'desc')"
>          printf '\n'
>          printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
>          printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
> @@ -151,12 +163,12 @@ do_mk() {
>  
>  # Generate the kconfig snippet for the br2-external tree.
>  do_kconfig() {
> -    local br2_name br2_ext
> +    local br2_ext br2_name br2_desc
>  
>      printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
>      printf '\n'
>  
> -    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
> +    if [ ${#} -eq 0 ]; then
>          printf '# No br2-external tree defined.\n'
>          return
>      fi
> @@ -164,10 +176,10 @@ do_kconfig() {
>      printf 'menu "External options"\n'
>      printf '\n'
>  
> -    for br2_name in "${BR2_EXT_NAMES[@]}"; do
> -        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
> -        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
> -        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
> +    for br2_ext; do

Please, keep explicit listing of positional arguments.

However, I'm not sure you should fix and respin, I think this patch is a
little bit too intrusive and makes the code a little bit more complex
than really needed.

Yet, let's see what others think. Arnout, Thomas?

Regards,
Yann E. MORIN.

> +        br2_name="$(get_field "${br2_ext}" 'name')"
> +        br2_desc="$(get_field "${br2_ext}" 'desc')"
> +        if [ ${#} -gt 1 ]; then
>              printf 'menu "%s"\n' "${br2_desc}"
>          fi
>          printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
> @@ -175,7 +187,7 @@ do_kconfig() {
>          printf '\tstring\n'
>          printf '\tdefault "%s"\n' "${br2_ext}"
>          printf 'source "%s/Config.in"\n' "${br2_ext}"
> -        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
> +        if [ ${#} -gt 1 ]; then
>              printf 'endmenu # %s\n' "${br2_name}"
>          fi
>          printf '\n'
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
