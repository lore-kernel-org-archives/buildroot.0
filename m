From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 13:25:52 +0100
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
	with old distros
In-Reply-To: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
References: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <ee9dbecc-41de-9e34-3fd6-831ea2877728@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-11-16 11:52, Yann E. MORIN wrote:
> Currently, the br2-external script uses bash-4's associative arrays.
> 
> However, some oldish enterprise-class distros like RHEL5 still use
> bash-3.1 which lacks associative arrays.
> 
> We restore compatibility with those oldish distros using 'eval' to
> emulate associative arrays, as suggested by Arnout.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Max Filippov <jcmvbkbc@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Below some things I considered while reviewing.

> ---
>  support/scripts/br2-external | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 055dc08..84bc334 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -1,10 +1,12 @@
[snip]
> @@ -91,9 +93,10 @@ do_validate_one() {
>          error "'%s': name '%s' contains invalid chars: '%s'\n" \
>              "${br2_ext}" "${br2_name//\$/\$\$}" "${n//\$/\$\$}"
>      fi
> -    if [ -n "${BR2_EXT_PATHS["${br2_name}"]}" ]; then
> +    eval d="\"\${BR2_EXT_PATHS_${br2_name}}\""

 Just for bikeshedding comparison:

eval d="\"\${BR2_EXT_PATHS_${br2_name}}\""
eval d='"${BR2_EXT_PATHS_'${br2_name}'}"'

 Your version is better :-)


> +    if [ -n "${d}" ]; then
>          error "'%s': name '%s' is already used in '%s'\n" \
> -            "${br2_ext}" "${br2_name}" "${BR2_EXT_PATHS["${br2_name}"]}"
> +            "${br2_ext}" "${br2_name}" "${d}"
>      fi
>      br2_desc="$(sed -r -e '/^desc: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
>      if [ ! -f "${br2_ext}/external.mk" ]; then
> @@ -105,8 +108,8 @@ do_validate_one() {
>  
>      # Register this br2-external tree
>      BR2_EXT_NAMES+=( "${br2_name}" )
> -    BR2_EXT_PATHS["${br2_name}"]="${br2_ext}"
> -    BR2_EXT_DESCS["${br2_name}"]="${br2_desc:-${br2_name}}"
> +    eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
> +    eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""

 And another comparison:
eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
eval BR2_EXT_PATHS_${br2_name}='"${br2_ext}"'

 On its own, the version with single quotes is better here, but your version is
more consistent with the other eval lines.


>  }
>  
>  # Generate the .mk snippet that defines makefile variables
> @@ -117,13 +120,10 @@ do_mk() {
>      printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
>      printf '\n'
>  
> -    # We can't use ${BR2_EXT_NAMES[@]} directly: it is not guaranteed

 This comment was already wrong, it should have been BR2_EXT_PATHS. Without the
associative arrays, the option of using ${BR2_EXT_PATHS[@]} is no longer
available, that's why the comment can be removed.

 Perhaps the sentence above should have been part of the commit message :-)

 Regards,
 Arnout

> -    # to be in the order paths were added (because it is an associative
> -    # array). So we need to iterate on BR2_EXT_NAMES, which is sorted
> -    # in the order names were added (because it is an indexed array).
>      printf 'BR2_EXTERNAL ?='
>      for br2_name in "${BR2_EXT_NAMES[@]}"; do
> -        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
> +        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
> +        printf ' %s' "${br2_ext}"
>      done
>      printf '\n'
>  
> @@ -138,8 +138,8 @@ do_mk() {
>      fi
>  
>      for br2_name in "${BR2_EXT_NAMES[@]}"; do
> -        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
> -        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
> +        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
> +        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
>          printf '\n'
>          printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
>          printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
> @@ -165,8 +165,8 @@ do_kconfig() {
>      printf '\n'
>  
>      for br2_name in "${BR2_EXT_NAMES[@]}"; do
> -        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
> -        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
> +        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
> +        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
>          if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
>              printf 'menu "%s"\n' "${br2_desc}"
>          fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
