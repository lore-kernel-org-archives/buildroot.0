From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 17 Apr 2020 23:25:00 +0200
Subject: [Buildroot] [PATCH 1/9 v5] package/libapparmor: new package
In-Reply-To: <0f52dcea9f6d9eae4286a6e2220a33034f302685.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
 <0f52dcea9f6d9eae4286a6e2220a33034f302685.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <CA+_SqVYtQCrSVXswPyjPharn43L8_w+6c4MrWywerKYueKZN6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2020 at 4:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> From: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> The layout of the package is not amenable to building both the library
> and the utilities at once, so this package will only install the
> libarary.
>
> The other apparmor-related tools however will almost all want to always
> link with the static library (it's hard-coded in their Makefiles, like:
> AALIB = -Wl,-Bstatic -lapparmor -Wl,-Bdynamic -lpthread), so we also
> force the build of the static library.
>
> The kernel headers 3.16 at least are required, for CAP_AUDIT_READ.
>
> We need to force the C standard to gnu99, otherwise:
>
>   - autoconf uses wchar_t in C99 test, so considers it to be missing
>     on toolchains without wchar, but wchar is not otherwise needed for
>     libapparmor;
>
>   - c99 is not enough, otherwise the build fails with errors like:
>         kernel.c:503:15: error: expected declaration specifiers or ?...? before ?(? token
>          extern typeof((__change_hat)) __old_change_hat __attribute__((alias ("__change_hat")));
>                        ^
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> [yann.morin.1998 at free.fr: strip down the patch to only build the lib]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/libapparmor/Config.in        | 16 ++++++++++++++++
>  package/libapparmor/libapparmor.hash |  4 ++++
>  package/libapparmor/libapparmor.mk   | 27 +++++++++++++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 package/libapparmor/Config.in
>  create mode 100644 package/libapparmor/libapparmor.hash
>  create mode 100644 package/libapparmor/libapparmor.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f67ef86e6c..142f3b406d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -196,6 +196,7 @@ N:  Angelo Compagnucci <angelo.compagnucci@gmail.com>
>  F:     package/corkscrew/
>  F:     package/fail2ban/
>  F:     package/i2c-tools/
> +F:     package/libapparmor/
>  F:     package/mender/
>  F:     package/mender-artifact/
>  F:     package/mono/
> diff --git a/package/Config.in b/package/Config.in
> index 7b73198d50..ae1bc2294d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1882,6 +1882,7 @@ endif
>  endmenu
>
>  menu "Security"
> +       source "package/libapparmor/Config.in"
>         source "package/libselinux/Config.in"
>         source "package/libsemanage/Config.in"
>         source "package/libsepol/Config.in"
> diff --git a/package/libapparmor/Config.in b/package/libapparmor/Config.in
> new file mode 100644
> index 0000000000..a444a5708b
> --- /dev/null
> +++ b/package/libapparmor/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_LIBAPPARMOR
> +       bool "libapparmor"
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> +       help
> +         AppArmor is an effective and easy-to-use Linux application
> +         security system. AppArmor proactively protects the operating
> +         system and applications from external or internal threats,
> +         even zero-day attacks, by enforcing good behavior and
> +         preventing even unknown application flaws from being
> +         exploited.
> +
> +         This package installs only the library.
> +
> +         http://wiki.apparmor.net
> diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
> new file mode 100644
> index 0000000000..3bff2bc853
> --- /dev/null
> +++ b/package/libapparmor/libapparmor.hash
> @@ -0,0 +1,4 @@
> +# locally computed
> +sha256  267053234c68cdb122c5294d7c276b6e2f5fa7e75c6c2d23e3ce69f95d9a7639  apparmor-2.13.3.tar.gz
> +sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
> +sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libraries/libapparmor/COPYING.LGPL
> diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
> new file mode 100644
> index 0000000000..12efd4335a
> --- /dev/null
> +++ b/package/libapparmor/libapparmor.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# libapparmor
> +#
> +################################################################################
> +
> +LIBAPPARMOR_VERSION_MAJOR = 2.13
> +LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).3
> +LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
> +LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
> +LIBAPPARMOR_LICENSE = LGPL-2.1
> +LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
> +
> +LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
> +LIBAPPARMOR_SUBDIR = libraries/libapparmor
> +LIBAPPARMOR_INSTALL_STAGING = YES
> +
> +# Most AppArmor tools will want to link to the static lib.
> +# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
> +# provided by autoconf relies on wchar_t.
> +LIBAPPARMOR_CONF_OPTS = \
> +       ac_cv_prog_cc_c99=-std=gnu99 \
> +       --enable-static \
> +       --enable-man-pages=no \
> +       --without-python
> +
> +$(eval $(autotools-package))
> --
> 2.20.1
>
