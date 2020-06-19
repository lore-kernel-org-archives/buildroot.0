From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 19 Jun 2020 11:26:33 +0300
Subject: [Buildroot] [PATCH v1 1/1] package/fuse-overlayfs: new package
In-Reply-To: <20200618191839.398771-1-christian@paral.in>
References: <20200618191839.398771-1-christian@paral.in>
Message-ID: <CALFsTFWb=6=1OANGVzEmu58ccgDGimtfEXxQ0SK+PuW53VSpeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Jun 18, 2020 at 10:18 PM Christian Stewart <christian@paral.in> wrote:
>
> FUSE-overlayfs is an implementation of overlay+shiftfs in FUSE, intended to be
> used as the backing filesystem for rootless containers.
>
> Reference: http://github.com/containers/fuse-overlayfs
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/fuse-overlayfs/Config.in           | 15 +++++++++++++++
>  package/fuse-overlayfs/fuse-overlayfs.hash |  4 ++++
>  package/fuse-overlayfs/fuse-overlayfs.mk   | 15 +++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/fuse-overlayfs/Config.in
>  create mode 100644 package/fuse-overlayfs/fuse-overlayfs.hash
>  create mode 100644 package/fuse-overlayfs/fuse-overlayfs.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cbe6bc1856..acecf1f3bf 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -539,6 +539,7 @@ F:  package/docker-cli/
>  F:     package/docker-containerd/
>  F:     package/docker-engine/
>  F:     package/docker-proxy/
> +F:     package/fuse-overlayfs/
>  F:     package/go/
>  F:     package/mosh/
>  F:     package/pkg-golang.mk
> diff --git a/package/Config.in b/package/Config.in
> index 1f44fe7ca9..3de5559505 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -203,6 +203,7 @@ menu "Filesystem and flash utilities"
>         source "package/f2fs-tools/Config.in"
>         source "package/flashbench/Config.in"
>         source "package/fscryptctl/Config.in"
> +       source "package/fuse-overlayfs/Config.in"
>         source "package/fwup/Config.in"
>         source "package/genext2fs/Config.in"
>         source "package/genpart/Config.in"
> diff --git a/package/fuse-overlayfs/Config.in b/package/fuse-overlayfs/Config.in
> new file mode 100644
> index 0000000000..3ff268401b
> --- /dev/null
> +++ b/package/fuse-overlayfs/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_FUSE_OVERLAYFS
> +       bool "fuse-overlayfs"
> +       depends on !BR2_STATIC_LIBS # libfuse3
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse3
> +       depends on BR2_USE_MMU # libfuse3
> +       select BR2_PACKAGE_LIBFUSE3
> +       help
> +         FUSE-overlayfs is an implementation of overlay+shiftfs in FUSE, intended to
> +         be used as the backing filesystem for rootless containers.
> +
> +         http://github.com/containers/fuse-overlayfs
> +
> +comment "fuse-overlayfs needs a toolchain w/ threads, dynamic library"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> \ No newline at end of file

Please fix check-package warnings for this file (newline at the end of
the file and help text format:
http://nightly.buildroot.org/#writing-rules-config-in)

> diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
> new file mode 100644
> index 0000000000..ee1eb694c9
> --- /dev/null
> +++ b/package/fuse-overlayfs/fuse-overlayfs.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256 060168c2d5a8c6cc768b4542eba9953b7ff4a31f94bfb2e05b3d1051390838b1  fuse-overlayfs-1.1.0.tar.gz
> +# Locally computed
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
> new file mode 100644
> index 0000000000..9a67f0b75a
> --- /dev/null
> +++ b/package/fuse-overlayfs/fuse-overlayfs.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# fuse-overlayfs
> +#
> +################################################################################
> +
> +FUSE_OVERLAYFS_VERSION = 1.1.0
> +FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
> +FUSE_OVERLAYFS_LICENSE = GPL-3.0
> +FUSE_OVERLAYFS_LICENSE_FILES = COPYING
> +
> +FUSE_OVERLAYFS_AUTORECONF = YES
> +FUSE_OVERLAYFS_DEPENDENCIES = libfuse3 host-autoconf host-automake host-libtool host-pkgconf

Since you use the pkg-autotools infrastructure, you don't need to add
the autoconf, automake and libtool dependencies here.

> +
> +$(eval $(autotools-package))
> --
> 2.27.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards,
Asaf.
