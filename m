From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 18 Oct 2019 11:05:08 -0300
Subject: [Buildroot] [PATCH] package/util-linux: Add option for enabling
 wipefs
In-Reply-To: <20191018033047.370820-1-sam.voss@gmail.com>
References: <20191018033047.370820-1-sam.voss@gmail.com>
Message-ID: <CAJ4jsafxpqVQFeqNXDfwYAeteY6bpG_xOayTbKRFfAE9rQwCbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 18, 2019 at 12:31 AM <sam.voss@gmail.com> wrote:
>
> From: Sam Voss <sam.voss@gmail.com>
>
> Add option to enable wipefs as a standalone app, so that it may be
> enabled when the flag --disable-all-packages is set.
>
> Signed-off-by: Sam Voss <sam.voss@gmail.com>
> ---
>  ...w-explicit-wipefs-enable-disablement.patch | 33 +++++++++++++++++++
>  package/util-linux/Config.in                  | 11 +++++++
>  package/util-linux/util-linux.mk              |  1 +
>  3 files changed, 45 insertions(+)
>  create mode 100644 package/util-linux/0001-Allow-explicit-wipefs-enable-disablement.patch
>
> diff --git a/package/util-linux/0001-Allow-explicit-wipefs-enable-disablement.patch b/package/util-linux/0001-Allow-explicit-wipefs-enable-disablement.patch
> new file mode 100644
> index 0000000000..85021e2978
> --- /dev/null
> +++ b/package/util-linux/0001-Allow-explicit-wipefs-enable-disablement.patch
> @@ -0,0 +1,33 @@
> +From a76cd5f6abace269b60ef6f1b95526a2d09fd331 Mon Sep 17 00:00:00 2001
> +From: Sam Voss <sam.voss@gmail.com>
> +Date: Mon, 14 Oct 2019 21:19:16 -0500
> +Subject: [PATCH] wipefs: Allow explicitly enable/disablement
> +
> +Currently if `--disable-all-packages` is set, there is no configure
> +option for re-enabling `wipefs`.
> +
> +As the current default for `wipefs` is "enabled", add `--disable-` flag
> +to maintain backward compatibility.
> +
> +Signed-off-by: Sam Voss <sam.voss@gmail.com>
> +---
> + configure.ac | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fc8a9507f..f70f8d1ee 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1286,7 +1286,11 @@ UL_BUILD_INIT([findfs], [check])
> + UL_REQUIRES_BUILD([findfs], [libblkid])
> + AM_CONDITIONAL([BUILD_FINDFS], [test "x$build_findfs" = xyes])
> +
> +-UL_BUILD_INIT([wipefs], [check])
> ++AC_ARG_ENABLE([wipefs],
> ++  AS_HELP_STRING([--disable-wipefs], [do not build wipefs]),
> ++  [], [UL_DEFAULT_ENABLE([wipefs], [check])]
> ++)
> ++UL_BUILD_INIT([wipefs])
> + UL_REQUIRES_BUILD([wipefs], [libblkid])
> + UL_REQUIRES_BUILD([wipefs], [libsmartcols])
> + AM_CONDITIONAL([BUILD_WIPEFS], [test "x$build_wipefs" = xyes])
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 39eb2c03a0..3c64a19d84 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -407,6 +407,17 @@ config BR2_PACKAGE_UTIL_LINUX_WALL
>         help
>           Send a message to everybody's terminal
>
> +config BR2_PACKAGE_UTIL_LINUX_WIPEFS
> +       bool "wipefs"
> +       select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +       select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
> +       help
> +         wipefs can erase filesystem, raid or partition-table
> +         signatures (magic strings) from the specified device
> +         to make the signatures invisible for libblkid. wipefs
> +         does not erase the filesystem itself nor any other data
> +         from the device.
> +
>  config BR2_PACKAGE_UTIL_LINUX_WDCTL
>         bool "wdctl"
>         depends on BR2_USE_MMU # libsmartcols
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index ecc3ab62de..0374420b58 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -153,6 +153,7 @@ UTIL_LINUX_CONF_OPTS += \
>         $(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
> +       $(if $(BR2_PACKAGE_UTIL_LINUX_WIPEFS),--enable-wipefs,--disable-wipefs) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
>
> --
> 2.23.0
>

Tested-by: Carlos Santos <unixmania@gmail.com>
