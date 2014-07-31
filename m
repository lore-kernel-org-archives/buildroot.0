From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Jul 2014 08:41:09 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/patchelf: new host package
In-Reply-To: <fc8f5090621f94da255a6191eec78125047eb318.1406760999.git.yann.morin.1998@free.fr>
References: <cover.1406760999.git.yann.morin.1998@free.fr>
 <fc8f5090621f94da255a6191eec78125047eb318.1406760999.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LX0ozu1JCOiBzrixFBxjs5MfSeA2ioVJrpA8jcycJSJUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 31, 2014 at 12:57 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> In some situations, users may want to tweak the dynamic section of the
> binaries (for example to add/set the RPATH to $ORIGIN/../lib).
>
> Because it is not trivial to do it properly from the Buildroot
> infrastructure, allow those users to use patchelf (e.g. from a
> post-build script) to tweak binaries.
>
> patchelf is able to:
>   - modify an existing DT_RUNPATH tags
>   - add a DT_RUNPATH tag if not already present
>   - do the above to the DT_RPATH tag, too
>   - set the path to the interpreter
>   - remove DT_NEEDED tags
>   - query a binary for the DT_RUNPATH/DT_RPATH tag, or for the
>     interpreter path
>
> Does not really fix #7172, but this is an appropriate workaround.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Mike Zick <minimod@morethan.org>
> ---
>  package/Config.in.host          |  1 +
>  package/patchelf/Config.in.host |  7 +++++++
>  package/patchelf/patchelf.mk    | 12 ++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/patchelf/Config.in.host
>  create mode 100644 package/patchelf/patchelf.mk
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 062c6c9..e05bbfa 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -13,6 +13,7 @@ menu "Host utilities"
>         source "package/omap-u-boot-utils/Config.in.host"
>         source "package/openocd/Config.in.host"
>         source "package/parted/Config.in.host"
> +       source "package/patchelf/Config.in.host"
>         source "package/pwgen/Config.in.host"
>         source "package/sam-ba/Config.in.host"
>         source "package/squashfs/Config.in.host"
> diff --git a/package/patchelf/Config.in.host b/package/patchelf/Config.in.host
> new file mode 100644
> index 0000000..d1c8375
> --- /dev/null
> +++ b/package/patchelf/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_PATCHELF
> +       bool "host patchelf"
> +       help
> +         PatchELF is a small utility to modify the dynamic linker
> +         and RPATH of ELF executables.
> +
> +         http://nixos.org/patchelf.html
> diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
> new file mode 100644
> index 0000000..1a8e48d
> --- /dev/null
> +++ b/package/patchelf/patchelf.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# patchelf
> +#
> +################################################################################
> +
> +PATCHELF_VERSION = 0.8
> +PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.8/
> +PATCHELF_LICENSE = GPLv3
> +PATCHELF_LICENSE_FILES = COPYING
> +
> +$(eval $(host-autotools-package))

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

I do agree with Baruch's comment that it will be helpful for users
desiring to use $ in the LDFLAGS to know that patchelf exists in
buildroot. This could be added in the first patch of this series, or
as a third patch.

Best regards,
Thomas
