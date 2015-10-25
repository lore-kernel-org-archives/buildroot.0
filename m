From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 25 Oct 2015 03:11:08 -0200
Subject: [Buildroot] [PATCH 1/2] chocolate-doom: new package
In-Reply-To: <1445656232-32093-1-git-send-email-rprebello@gmail.com>
References: <1445656232-32093-1-git-send-email-rprebello@gmail.com>
Message-ID: <CABLs7GVESDxBDTCy2=nmP0KjMLbxACwr_GfwOhnR7hxNxuoE+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series has been replaced with an improved version.

2015-10-24 1:10 GMT-02:00 Rodrigo Rebello <rprebello@gmail.com>:
> Chocolate Doom is a set of conservative source ports for Doom, Heretic,
> Hexen and Strife, with a philosophy of preserving the look, feel, and
> bugs of the vanilla versions of each.
>
> http://www.chocolate-doom.org
>
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  ...ruct-attribute-directive-ignored-warnings.patch | 50 ++++++++++++++++++++
>  ...2-configure-fix-with-PACKAGE-option-check.patch | 54 ++++++++++++++++++++++
>  package/chocolate-doom/Config.in                   | 12 +++++
>  package/chocolate-doom/chocolate-doom.hash         |  2 +
>  package/chocolate-doom/chocolate-doom.mk           | 43 +++++++++++++++++
>  6 files changed, 162 insertions(+)
>  create mode 100644 package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
>  create mode 100644 package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-check.patch
>  create mode 100644 package/chocolate-doom/Config.in
>  create mode 100644 package/chocolate-doom/chocolate-doom.hash
>  create mode 100644 package/chocolate-doom/chocolate-doom.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2f74439..3570af0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -205,6 +205,7 @@ comment "Themes"
>  endmenu
>
>  menu "Games"
> +       source "package/chocolate-doom/Config.in"
>         source "package/doom-wad/Config.in"
>         source "package/gnuchess/Config.in"
>         source "package/lbreakout2/Config.in"
> diff --git a/package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch b/package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
> new file mode 100644
> index 0000000..3e27a08
> --- /dev/null
> +++ b/package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
> @@ -0,0 +1,50 @@
> +From d542df1f75db9d6ecea3ac2bfa0e6ace74a9b73d Mon Sep 17 00:00:00 2001
> +From: Rodrigo Rebello <rprebello@gmail.com>
> +Date: Thu, 22 Oct 2015 11:29:55 -0200
> +Subject: [PATCH 1/2] Fix "`gcc_struct' attribute directive ignored" warnings
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Compilation for target architectures other than i386, x86_64 or PowerPC
> +(e.g. ARM) caused multiple warnings like the following to appear:
> +
> +  doomdata.h:75:1: warning: ?gcc_struct? attribute directive ignored
> +   } PACKEDATTR mapsidedef_t;
> +   ^
> +
> +This was due to 'gcc_struct' being undefined for these architectures.
> +Since that attribute was actually introduced by commit 87db726b9a9ae61ca
> +to address the fact that -mms-bitfields became the default for GCC on
> +Windows, limit it to that case.
> +
> +For further information on the topic, please see:
> +
> +https://ohse.de/uwe/articles/gcc-attributes.html#type-gcc_struct
> +
> +Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> +---
> + src/doomtype.h | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/doomtype.h b/src/doomtype.h
> +index bf0a40e..77c026c 100644
> +--- a/src/doomtype.h
> ++++ b/src/doomtype.h
> +@@ -52,10 +52,10 @@
> +
> + #ifdef __GNUC__
> +
> +-#ifdef __clang__
> +-#define PACKEDATTR __attribute__((packed))
> +-#else
> ++#if defined(_WIN32) && !defined(__clang__)
> + #define PACKEDATTR __attribute__((packed,gcc_struct))
> ++#else
> ++#define PACKEDATTR __attribute__((packed))
> + #endif
> +
> + #else
> +--
> +2.1.4
> +
> diff --git a/package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-check.patch b/package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-check.patch
> new file mode 100644
> index 0000000..3af8949
> --- /dev/null
> +++ b/package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-check.patch
> @@ -0,0 +1,54 @@
> +From 799c6681bcf3b6cada4668bdb39296e6cdadbddf Mon Sep 17 00:00:00 2001
> +From: Rodrigo Rebello <rprebello@gmail.com>
> +Date: Thu, 22 Oct 2015 15:28:11 -0200
> +Subject: [PATCH 2/2] configure: fix --with-PACKAGE option check
> +
> +When either --with-PACKAGE[=ARG] or --without-PACKAGE is passed to
> +configure, test the result of variable 'with_PACKAGE' and act
> +accordingly. The value "no" was being implicitly assumed.
> +
> +Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> +---
> + configure.ac | 18 ++++++++++++++++--
> + 1 file changed, 16 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index ee97fe2..7b03485 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -80,7 +80,14 @@ AC_SDL_MAIN_WORKAROUND([
> +         [Build without libsamplerate @<:@default=check@:>@]),
> +     [],
> +     [
> +-        AC_CHECK_LIB(samplerate, src_new)
> ++        [with_libsamplerate=check]
> ++    ])
> ++    AS_IF([test "x$with_libsamplerate" != xno], [
> ++        AC_CHECK_LIB(samplerate, src_new, [], [
> ++            AS_IF([test "x$with_libsamplerate" != xcheck], [AC_MSG_FAILURE(
> ++                [--with-libsamplerate was given, but test for libsamplerate failed])
> ++            ])
> ++        ])
> +     ])
> +     # Check for libpng.
> +     AC_ARG_WITH([libpng],
> +@@ -88,8 +95,15 @@ AC_SDL_MAIN_WORKAROUND([
> +         [Build without libpng @<:@default=check@:>@]),
> +     [],
> +     [
> ++        [with_libpng=check]
> ++    ])
> ++    AS_IF([test "x$with_libpng" != xno], [
> +         AC_CHECK_LIB(z, zlibVersion)
> +-        AC_CHECK_LIB(png, png_get_io_ptr)
> ++        AC_CHECK_LIB(png, png_get_io_ptr, [], [
> ++            AS_IF([test "x$with_libpng" != xcheck], [AC_MSG_FAILURE(
> ++                [--with-libpng was given, but test for libpng failed])
> ++            ])
> ++        ])
> +     ])
> +     AC_CHECK_LIB(m, log)
> +
> +--
> +2.1.4
> +
> diff --git a/package/chocolate-doom/Config.in b/package/chocolate-doom/Config.in
> new file mode 100644
> index 0000000..5e0d9c1
> --- /dev/null
> +++ b/package/chocolate-doom/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_CHOCOLATE_DOOM
> +       bool "chocolate-doom"
> +       depends on BR2_USE_MMU # fork()
> +       select BR2_PACKAGE_SDL
> +       select BR2_PACKAGE_SDL_MIXER
> +       select BR2_PACKAGE_SDL_NET
> +       help
> +         Chocolate Doom is a set of conservative source ports for Doom,
> +         Heretic, Hexen and Strife, with a philosophy of preserving the
> +         look, feel, and bugs of the vanilla versions of each.
> +
> +         http://www.chocolate-doom.org
> diff --git a/package/chocolate-doom/chocolate-doom.hash b/package/chocolate-doom/chocolate-doom.hash
> new file mode 100644
> index 0000000..bdf5698
> --- /dev/null
> +++ b/package/chocolate-doom/chocolate-doom.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 ad11e2871667c6fa0658abf2dcba0cd9b26fbd651ee8df55adfdc18ad8fd674a        chocolate-doom-2.2.1.tar.gz
> diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
> new file mode 100644
> index 0000000..78e6628
> --- /dev/null
> +++ b/package/chocolate-doom/chocolate-doom.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# chocolate-doom
> +#
> +################################################################################
> +
> +CHOCOLATE_DOOM_VERSION = 2.2.1
> +CHOCOLATE_DOOM_SOURCE = chocolate-doom-$(CHOCOLATE_DOOM_VERSION).tar.gz
> +CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
> +CHOCOLATE_DOOM_LICENSE = GPLv2+
> +CHOCOLATE_DOOM_LICENSE_FILES = COPYING
> +CHOCOLATE_DOOM_AUTORECONF = YES
> +CHOCOLATE_DOOM_DEPENDENCIES = sdl sdl_mixer sdl_net
> +
> +# Avoid installing desktop entries, icons, etc.
> +CHOCOLATE_DOOM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +# SDL_mixer uses symbols from SDL, but ends up after it on the link
> +# cmdline. Fix it by forcing the SDL libs at the very end.
> +CHOCOLATE_DOOM_CONF_ENV = LIBS="`$(STAGING_DIR)/usr/bin/sdl-config --static-libs`"
> +endif
> +
> +CHOCOLATE_DOOM_CONF_OPTS = \
> +       --disable-sdltest \
> +       --with-sdl-prefix=$(STAGING_DIR)/usr \
> +       --with-sdl-exec-prefix=$(STAGING_DIR)/usr
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +       CHOCOLATE_DOOM_DEPENDENCIES += libpng
> +       CHOCOLATE_DOOM_CONF_OPTS += --with-libpng
> +else
> +       CHOCOLATE_DOOM_CONF_OPTS += --without-libpng
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> +       CHOCOLATE_DOOM_DEPENDENCIES += libsamplerate
> +       CHOCOLATE_DOOM_CONF_OPTS += --with-libsamplerate
> +else
> +       CHOCOLATE_DOOM_CONF_OPTS += --without-libsamplerate
> +endif
> +
> +$(eval $(autotools-package))
> --
> 2.1.4
>
