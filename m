From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 01:09:22 +0200
Subject: [Buildroot] [PATCH 02/13] core/pkg-download: change all helpers
 to use common options
In-Reply-To: <20170704162211.13238-3-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-3-maxime.hadjinlian@gmail.com>
Message-ID: <fbacea0c-0c08-d8d0-9cda-3e404207ab1d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 18:22, Maxime Hadjinlian wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>

[snip]
> diff --git a/support/download/check-hash b/support/download/check-hash
> index c1ff53c02b..bf2dbb1a8b 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -19,7 +19,7 @@ set -e
>  #   3:  the hash file exists and there was no hash to check the file against
>  #   4:  the hash file exists and at least one hash type is unknown
>  
> -while getopts :q OPT; do
> +while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do

 This doesn't make sense to me: the global DL_GETOPTS are never passed to
check-hash, and you're not using any of them. So I'd keep the explicit :q here.

>      case "${OPT}" in
>      q)  exec >/dev/null;;
>      \?) exit 1;;

[snip]
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index f944b71db5..a29411e0ae 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -19,6 +19,8 @@
>  # We want to catch any unexpected failure, and exit immediately.
>  set -e
>  
> +export BR_BACKEND_DL_GETOPTS=":hb:o:H:rRq"

 Since this variable is defined here, it makes sense to also document the
options here. In fact, to make it makes more sense to document them all here
rather than in each individual backend. Of course, no need to go and remove it
in each backend, but I would like to have then documented here. Especially since
a later patch will also parse them here.

> +
>  main() {
>      local OPT OPTARG
>      local backend output hfile recurse quiet
> @@ -83,7 +85,10 @@ main() {
>      # If the backend fails, we can just remove the temporary directory to
>      # remove all the cruft it may have left behind. Then we just exit in
>      # error too.
> -    if ! "${OLDPWD}/support/download/${backend}" ${quiet} ${recurse} "${tmpf}" "${@}"; then
> +    if ! "${OLDPWD}/support/download/${backend}" \
> +            ${quiet} ${recurse} \

 I don't like it very much when options are mixed like this: either fill lines
up completely, or do one option (or option combination, of course, like -o
"...") per line. But since this will be changed again later it's not worth
changing this patch.

 Regards,
 Arnout

> +            -o "${tmpf}" "${@}"
> +    then
>          rm -rf "${tmpd}"
>          exit 1
>      fi
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
