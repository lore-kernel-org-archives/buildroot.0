From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 May 2017 21:11:47 -0500
Subject: [Buildroot] [PATCH next 2/2] parted: bump version to 3.2
In-Reply-To: <20170522134015.54040-2-Vincent.Riera@imgtec.com>
References: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
 <20170522134015.54040-2-Vincent.Riera@imgtec.com>
Message-ID: <CANQCQpaimZEr4HFnup8DzNDW8BSYn-+3rx9fHa7aso6TYLgvFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Mon, May 22, 2017 at 8:40 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Patch 0001 already included in this release:
>   http://git.savannah.gnu.org/cgit/parted.git/commit/?id=cc382c3753e1b430c00df46f0937b74db36ccb8a
>
> LVM2 dependency is necessary otherwise it will fail. See:
>   https://lists.gnu.org/archive/html/bug-parted/2014-08/msg00001.html
>
> Due to the LVM2 dependency, the --enable-device-mapper option is
> automatically enabled so there is no need to add it explicitly to the
> LVM2_CONF_OPTS.
>
> --disable-device-mapper has been removed from HOST_LVM2_CONF_OPTS to
> avoid a build failure.
>

Thanks for sending the bump.  Do you happen to know if this version is
more compatible with never kernel headers?  We noticed a limitation
where the toolchain kernel headers had to be older then ~3.13 for it
to build correctly.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/parted/0001-readline-deprecated.patch | 19 -------------------
>  package/parted/Config.in                      | 11 +++++++++--
>  package/parted/parted.hash                    |  2 +-
>  package/parted/parted.mk                      | 17 ++++-------------
>  4 files changed, 14 insertions(+), 35 deletions(-)
>  delete mode 100644 package/parted/0001-readline-deprecated.patch
>
> diff --git a/package/parted/0001-readline-deprecated.patch b/package/parted/0001-readline-deprecated.patch
> deleted file mode 100644
> index a3f40c8df..000000000
> --- a/package/parted/0001-readline-deprecated.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -The CPPFunction typedef (among others) have been deprecated in favour of
> -specific prototyped typedefs since readline 4.2.
> -It's been working since because compatibility typedefs have been
> -in place until they were removed in readline 6.3.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -diff -Nura parted-3.1.orig/parted/ui.c parted-3.1/parted/ui.c
> ---- parted-3.1.orig/parted/ui.c        2014-03-01 16:11:41.970827134 -0300
> -+++ parted-3.1/parted/ui.c     2014-03-01 16:11:55.540259786 -0300
> -@@ -1474,7 +1474,7 @@
> - #ifdef HAVE_LIBREADLINE
> -   if (!opt_script_mode) {
> -     rl_initialize ();
> --    rl_attempted_completion_function = (CPPFunction*) complete_function;
> -+    rl_attempted_completion_function = (rl_completion_func_t *) complete_function;
> -     readline_state.in_readline = 0;
> -   }
> - #endif
> diff --git a/package/parted/Config.in b/package/parted/Config.in
> index 9d78f0f1f..692659443 100644
> --- a/package/parted/Config.in
> +++ b/package/parted/Config.in
> @@ -1,12 +1,19 @@
>  config BR2_PACKAGE_PARTED
>         bool "parted"
>         depends on BR2_USE_WCHAR
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
> +       depends on BR2_USE_MMU # lvm2
> +       depends on !BR2_STATIC_LIBS # lvm2
> +       depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +       select BR2_PACKAGE_LVM2
>         help
>           parted, the GNU partition resizing program
>
>           http://www.gnu.org/software/parted/
>
> -comment "parted needs a toolchain w/ wchar"
> -       depends on !BR2_USE_WCHAR
> +comment "parted needs a glibc/uClibc toolchain w/ threads, dynamic library, wchar"
> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HAS_THREADS || \
> +               BR2_STATIC_LIBS || !BR2_USE_WCHAR
> diff --git a/package/parted/parted.hash b/package/parted/parted.hash
> index 297b5d7bb..25cd604a5 100644
> --- a/package/parted/parted.hash
> +++ b/package/parted/parted.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256 5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15        parted-3.1.tar.xz
> +sha256 858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4  parted-3.2.tar.xz
> diff --git a/package/parted/parted.mk b/package/parted/parted.mk
> index fb4987fd5..e8eac8213 100644
> --- a/package/parted/parted.mk
> +++ b/package/parted/parted.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>
> -PARTED_VERSION = 3.1
> +PARTED_VERSION = 3.2
>  PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
>  PARTED_SITE = $(BR2_GNU_MIRROR)/parted
> -PARTED_DEPENDENCIES = host-pkgconf util-linux
> +PARTED_DEPENDENCIES = host-pkgconf lvm2 util-linux
>  PARTED_INSTALL_STAGING = YES
>  # For uclinux patch
>  PARTED_AUTORECONF = YES
> @@ -22,21 +22,12 @@ else
>  PARTED_CONF_OPTS += --without-readline
>  endif
>
> -ifeq ($(BR2_PACKAGE_LVM2),y)
> -PARTED_DEPENDENCIES += lvm2
> -PARTED_CONF_OPTS += --enable-device-mapper
> -else
> -PARTED_CONF_OPTS += --disable-device-mapper
> -endif
> -
>  ifeq ($(BR2_STATIC_LIBS),y)
>  PARTED_CONF_OPTS += --disable-dynamic-loading
>  endif
>
> -HOST_PARTED_DEPENDENCIES = host-pkgconf host-util-linux
> -HOST_PARTED_CONF_OPTS += \
> -       --without-readline \
> -       --disable-device-mapper
> +HOST_PARTED_DEPENDENCIES = host-lvm2 host-pkgconf host-util-linux
> +HOST_PARTED_CONF_OPTS += --without-readline
>
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> --
> 2.13.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
