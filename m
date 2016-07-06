From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 6 Jul 2016 14:46:16 +0200
Subject: [Buildroot] [PATCH] support/apply-patches: re-instate set -e
In-Reply-To: <1467740163-10650-1-git-send-email-yann.morin.1998@free.fr>
References: <1467740163-10650-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <e58d3879-22ca-cefa-05f4-5f16d4a3e489@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 05/07/2016 ? 19:36, Yann E. MORIN a ?crit :
> As reported by S?bastien Szymanski [1], the apply-patches script
> doesn't stop if a tar command can't extract an archive.
> 
> Use "set -e" to exit immediately if a command return an error.
> 
> Be sure to ignore any expected error: when we check if a patch to be
> applied has the same basename as an already applied patch, the grep
> would fail when no such patch was already applied. We should not fail
> in this case.

Thanks for the respin!

Sorry about the mess in the autobuilder yesterday.. lesson learned :)

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> 
> ---
> Tested with:
>     make defconfig
>     make allyespackageconfig
>     [remove luainterpreter to avoid multiple providers for
>      luainterpreter; disable qemu-user; disable tar rootfs]
>     make source
>     make $(make -s show-targets |sed -r -e 's/ |$/-patch /g')

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Tested with the commands above.
Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  support/scripts/apply-patches.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 694302d..7ccb39d 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -31,6 +31,8 @@
>  # applied. The list of the patches applied is stored in '.applied_patches_list'
>  # file in the build directory.
>  
> +set -e
> +
>  silent=
>  if [ "$1" = "-s" ] ; then
>      # add option to be used by the patch tool
> @@ -103,7 +105,7 @@ function apply_patch {
>          echo "Error: missing patch file ${path}/$patch"
>          exit 1
>      fi
> -    existing="$(grep -E "/${patch}\$" ${builddir}/.applied_patches_list)"
> +    existing="$(grep -E "/${patch}\$" ${builddir}/.applied_patches_list || true)"
>      if [ -n "${existing}" ]; then
>          echo "Error: duplicate filename '${patch}'"
>          echo "Conflicting files are:"
> 
