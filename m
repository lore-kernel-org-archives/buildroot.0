From: =?UTF-8?Q?Vicen=C3=A7?= <vicencb@gmail.com>
Date: Wed, 9 Dec 2015 17:35:51 +0100
Subject: [Buildroot] [PATCH v8 06/33] package/efl/libefl: new package
In-Reply-To: <1449615756-19115-7-git-send-email-romain.naour@openwide.fr>
References: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
 <1449615756-19115-7-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAAMcf8CKxFT8=ddAreBmNsFZDjqtjCARwb534qymb-vJBsDk4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain

On Wed, Dec 9, 2015 at 12:02 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> Add the libefl package which contains an updated version of the following
> libraries:
> libecore, libedje, libeet, libfreet, libeina, libeio, libembryo, libthumb
> and libevas. It also contains eldbus, ephysics, and escape, see [1].
>
> For now, the bump to efl 1.15.x is not complete.
> This allows to build at least a default configuration without X11 support
> or graphics acceleration.
> This support will be added by a follow up patches in the series.
>
> Also, add BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG config option in order to
> select all recommended packages that allows to build libefl without the
> extra-long --enable-i-really-know-what-i-am-doing...
>
> Here is some notes about libefl dependencies:
>   - alsa:
>     At the end of the configure script, the summary tab will show that
>     alsa support is allways disabled even if alsa-utils has been build
>     before efl-core package.
>     "Ecore_Audio.....: yes (-alsa +pulseaudio +sndfile)"
>     This is intentional.
>
>   - util-linux:
>     libefl select util-linux libblkid since it's listed as an dependency
>     in the README [2].
>
>   - threads support:
>     Add a dependency on threads support since clearly efl libraries are
>     not even built without thread support [3].
>
>   - Curl:
>     Curl is listed as an dependency in the README because it's a runtime
>     dependency since efl 1.8 [4].
>
> We need to regenerate the configure script to workaround a build issue with
> eldbus-codegen:
>
>   CCLD     bin/eldbus/eldbus-codegen
>   CXXLD    bin/eolian_cxx/eolian_cxx
>   CCLD     lib/ecore_x/ecore_x_vsync
>   CCLD     lib/evas/common/libevas_op_blend_sse3.la
>   CCLD     lib/evas/common/libevas_convert_rgb_32.la
>   CCLD     lib/ecore_ipc/libecore_ipc.la
> [...]/i686-ctng-linux-gnu/bin/ld: warning: libefl.so.1, needed by lib/ecore/.libs/libecore.so, not found (try using -rpath or -rpath-link)
> lib/ecore/.libs/libecore.so: undefined reference to `efl_control_suspend_set'
> lib/ecore/.libs/libecore.so: undefined reference to `efl_control_interface_get'
> collect2: error: ld returned 1 exit status
> Makefile:19135: recipe for target 'bin/eldbus/eldbus-codegen' failed
> make[6]: *** [bin/eldbus/eldbus-codegen] Error 1
>
> A dependency on libefl seems to be missing for eldbus but by
> regenerating eldbus-codegen build correctly.
>
> Reported upstream [6].
>
> Also, gettextize is needed since *.po files were generated with
> an "old" gettext version (0.18):
>
> Making all in po
> *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.19
> Makefile:149: recipe for target 'check-macro-version' failed
>
> [1] See https://phab.enlightenment.org/phame/live/3/post/efl_1_8/
> [2] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n478
> [3] https://git.enlightenment.org/core/efl.git/tree/configure.ac#n5032
> [4] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n453
>     https://git.enlightenment.org/core/efl.git/commit/?id=2c1c6b9335e38c6e52b06829a95d9b58d780c99e
> [5] http://mailman.uclibc-ng.org/pipermail/devel/2015-August/000432.html
> [6] https://phab.enlightenment.org/T2718
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Tested-by: Vicente Bergas <vicencb@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vicente Bergas <vicencb@gmail.com>
> ---
> An initial runtime test has been done under Qemu with a glibc x86 toolchain.
>
> An additional runtime test has been done with a uClibc-ng 1.0.5 toolchain
> patched with [5] in order to add mkstemps() which is used by Eina library.
> This patch has been upstreamed in uClubc-ng 1.0.6 release.
>
> Another test has been done with a musl toolchain by Vicente Bergas (Thanks!).
> ---
> v8: move comments about the runtime test to post-commit note (Yann E.Morin)
>     remove comment about X11 XInput v2.2+ support.
>     Add the tested-by tag from Vicente Bergas
> v6: Changes from Yann E.Morin's review
>      - squash curl, autotools and libblkid patches
>      - use depends on Lua
>      - LIBEFL_RECOMMENDED_CONFIG depends on BR2_ARCH_HAS_ATOMICS
>      - rework Config.in help text (remove comments in .mk)
>      - add some option in LIBEFL_CONF_OPTS to disable some features
>        explicitely.
>     Split the dependency comment (Arnout)
>
> v4: rename to libefl
>     EFL needs a toolchain with threads support
> v3: fix same typo again
>     Add a note about multisense support
> v2: remove glibc only dependency
>     update commit log accordingly
>     fix typo in Config.in (Vicente Bergas)
>
> Vicente, can you test this new series and resend your Tested-By tag ? Thanks !

I've just tested this series (v8) as posted in the mailing list,
although the patch did not apply cleanly because there is an email
address obfuscation in patch #23.
The EFL and elementary libraries have been tested with the Terminology
application on a BeagleBoneBlack, as before.
The relevant configuration items used for testing are:
BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_NEON=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_EFL=y
# BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG is not set
BR2_PACKAGE_LIBEFL_FB=y
BR2_PACKAGE_LIBEFL_PNG=y
BR2_PACKAGE_LIBELEMENTARY=y
BR2_PACKAGE_LUA=y
BR2_PACKAGE_TERMINOLOGY=y

The test result has been satisfactory, that is, terminology appeared
on the framebuffer and was usable. Everything worked fine
out-of-the-box.
Thanks!!
  Vicente.

Tested-by: Vicente Bergas <vicencb@gmail.com>

> ---
>  package/efl/Config.in        |  23 +++++--
>  package/efl/libefl/Config.in | 114 ++++++++++++++++++++++++++++++++
>  package/efl/libefl/libefl.mk | 150 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 282 insertions(+), 5 deletions(-)
>  create mode 100644 package/efl/libefl/Config.in
>
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 7ce5a36..1c6f9e5 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -1,8 +1,13 @@
>  menuconfig BR2_PACKAGE_EFL
>         bool "Enlightenment Foundation Libraries"
> -       depends on BR2_USE_WCHAR
> -       # libeina uses madvise(). To revisit when bumping EFL to 1.8
> -       depends on BR2_USE_MMU
> +       depends on BR2_INSTALL_LIBSTDCPP # libefl
> +       depends on BR2_PACKAGE_HAS_UDEV # libefl -> libudev
> +       depends on BR2_PACKAGE_LUA # lua 5.1 or better
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libefl
> +       depends on BR2_USE_MMU # libefl
> +       depends on BR2_USE_WCHAR # libefl
> +       depends on !BR2_STATIC_LIBS # libefl
> +       select BR2_PACKAGE_LIBEFL
>         help
>           Enlightenment Foundation Libraries
>
> @@ -13,6 +18,7 @@ if BR2_PACKAGE_EFL
>  source "package/efl/libeina/Config.in"
>  source "package/efl/libecore/Config.in"
>  source "package/efl/libeet/Config.in"
> +source "package/efl/libefl/Config.in"
>  source "package/efl/libefreet/Config.in"
>  source "package/efl/libeio/Config.in"
>  source "package/efl/libevas/Config.in"
> @@ -24,5 +30,12 @@ source "package/efl/libedbus/Config.in"
>
>  endif # BR2_PACKAGE_EFL
>
> -comment "EFL needs a toolchain w/ wchar"
> -       depends on !BR2_USE_WCHAR
> +comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
> +       depends on !BR2_PACKAGE_LUA || !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> +               || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +       depends on BR2_USE_MMU
> +
> +comment "EFL needs lua"
> +       depends on !BR2_PACKAGE_LUA || !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> +               || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +       depends on BR2_USE_MMU
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> new file mode 100644
> index 0000000..ac871bf
> --- /dev/null
> +++ b/package/efl/libefl/Config.in
> @@ -0,0 +1,114 @@
> +config BR2_PACKAGE_LIBEFL
> +       bool "libefl"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_PACKAGE_HAS_UDEV # libudev
> +       depends on BR2_PACKAGE_LUA # lua 5.1 or better
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
> +       depends on BR2_USE_MMU
> +       depends on BR2_USE_WCHAR # use wchar_t
> +       depends on !BR2_STATIC_LIBS # dlfcn.h
> +       select BR2_PACKAGE_DBUS
> +       select BR2_PACKAGE_FREETYPE
> +       select BR2_PACKAGE_JPEG # Emile needs libjpeg
> +       select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
> +       select BR2_PACKAGE_UTIL_LINUX
> +       # libblkid is part of required tools, see EFL's README.
> +       select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +       help
> +         Enlightenment Foundation Libraries
> +
> +         https://enlightenment.org
> +
> +if BR2_PACKAGE_LIBEFL
> +
> +config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
> +       bool "Use recommended and tested configurations"
> +       depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
> +       select BR2_PACKAGE_BULLET
> +       select BR2_PACKAGE_FONTCONFIG
> +       select BR2_PACKAGE_GSTREAMER1
> +       select BR2_PACKAGE_GST1_PLUGINS_BASE
> +       select BR2_PACKAGE_LIBFRIBIDI
> +       select BR2_PACKAGE_LIBSNDFILE
> +       select BR2_PACKAGE_PULSEAUDIO
> +       select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +       default y
> +       help
> +         Enable the basic set of recommended features.
> +
> +         Without that, the EFL developpers consider the build to be
> +         potentially broken and won't provide any support for it.
> +
> +         This turns on the following features:
> +
> +         - bullet: If you have chosen to disable physics support, this
> +           disables lots of core functionality and is effectively never
> +           tested. You are going to find features that suddenly don't work
> +           and as a result cause a series of breakages. This is simply not
> +           tested so you are on your own in terms of ensuring everything
> +           works if you do this
> +
> +         - fontconfig: If fontconfig is disabled, this is going to make
> +           general font searching not work, and only some very direct
> +           'load /path/file.ttf' will work alongside some old-school ttf
> +           file path searching. This is very likely not what you want, so
> +           highly reconsider turning fontconfig off. Having it off will
> +           lead to visual problems like missing text in many UI areas
> +           etc...
> +
> +         - gstreamer 1.x: If Gstreamer 1.x support is disabled, it will
> +           heavily limit your media support options and render some
> +           functionality as useless, leading to visible application bugs.
> +
> +         - libfribidi: Fribidi is used for handling right-to-left text
> +           (like Arabic, Hebrew, Farsi, Persian etc.) and is very likely
> +           not a feature you want to disable unless you know for absolute
> +           certain you will never encounter and have to display such
> +           scripts. Also note that we don't test with fribidi disabled so
> +           you may also trigger code paths with bugs that are never
> +           normally used.
> +
> +         - libsndfile: If you disabled audio support in Ecore, this is not
> +           tested and may create bugs for you due to it creating untested
> +           code paths. Reconsider disabling audio.
> +
> +         - pulseaudio: The only audio output method supported by Ecore
> +           right now is via Pulseaudio. You have disabled that and likely
> +           have broken a whole bunch of things in the process. Reconsider
> +           your configure options.
> +           NOTE: multisense support is automatically enabled with
> +           pulseaudio.
> +
> +         - util-linux' libmount: Libmount is used heavily inside Eeze for
> +           support of removable devices etc... and disabling this will
> +           hurt support for Enlightenment and its filemanager.
> +
> +comment "libevas loaders"
> +
> +config BR2_PACKAGE_LIBEFL_PNG
> +       bool "libevas png loader"
> +       select BR2_PACKAGE_LIBPNG
> +       help
> +         This enables the loader code that loads png files using
> +         libpng.
> +
> +config BR2_PACKAGE_LIBEFL_JPEG
> +       bool "libevas jpeg loader"
> +       help
> +         This enables the loader code that loads jpeg files using
> +         libjpeg.
> +
> +config BR2_PACKAGE_LIBEFL_GIF
> +       bool "libevas gif loader"
> +       select BR2_PACKAGE_GIFLIB
> +       help
> +         This enables the loader code that loads gif files using
> +         libungif.
> +
> +config BR2_PACKAGE_LIBEFL_TIFF
> +       bool "libevas tiff loader"
> +       select BR2_PACKAGE_TIFF
> +       help
> +         This enables the loader code that loads tiff files.
> +
> +endif # BR2_PACKAGE_LIBEFL
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index d070131..dad5e40 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -18,6 +18,156 @@ LIBEFL_LICENSE_FILES = \
>         licenses/COPYING.LGPL \
>         licenses/COPYING.SMALL
>
> +LIBEFL_INSTALL_STAGING = YES
> +
> +LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg lua udev \
> +       util-linux zlib
> +
> +# regenerate the configure script:
> +# https://phab.enlightenment.org/T2718
> +LIBEFL_AUTORECONF = YES
> +LIBEFL_GETTEXTIZE = YES
> +
> +# Configure options:
> +# --disable-cxx-bindings: disable C++11 bindings.
> +# --disable-fb: disable frame buffer support.
> +# --disable-harfbuzz: disable harfbuzz support.
> +# --disable-image-loader-jp2k: disable JPEG 2000 support.
> +# --disable-image-loader-webp: disable webp support.
> +# --disable-sdl: disable sdl2 support.
> +# --disable-systemd: disable systemd support.
> +# --disable-wayland: disable wayland support.
> +# --enable-lua-old: disable Elua and remove luajit dependency.
> +# --with-opengl=none: disable opengl support.
> +# --with-x11=none: remove dependency on X.org.
> +LIBEFL_CONF_OPTS = \
> +       --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
> +       --with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
> +       --disable-cxx-bindings \
> +       --disable-fb \
> +       --disable-harfbuzz \
> +       --disable-image-loader-jp2k \
> +       --disable-image-loader-webp \
> +       --disable-sdl \
> +       --disable-systemd \
> +       --disable-wayland \
> +       --enable-lua-old \
> +       --with-opengl=none \
> +       --with-x11=none
> +
> +# Disable untested configuration warning.
> +ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
> +LIBEFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> +LIBEFL_DEPENDENCIES += util-linux
> +LIBEFL_CONF_OPTS += --enable-libmount
> +else
> +LIBEFL_CONF_OPTS += --disable-libmount
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
> +LIBEFL_CONF_OPTS += --enable-fontconfig
> +LIBEFL_DEPENDENCIES += fontconfig
> +else
> +LIBEFL_CONF_OPTS += --disable-fontconfig
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
> +LIBEFL_CONF_OPTS += --enable-fribidi
> +LIBEFL_DEPENDENCIES += libfribidi
> +else
> +LIBEFL_CONF_OPTS += --disable-fribidi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
> +LIBEFL_CONF_OPTS += --enable-gstreamer1
> +LIBEFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
> +else
> +LIBEFL_CONF_OPTS += --disable-gstreamer1
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BULLET),y)
> +LIBEFL_CONF_OPTS += --enable-physics
> +LIBEFL_DEPENDENCIES += bullet
> +else
> +LIBEFL_CONF_OPTS += --disable-physics
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
> +LIBEFL_CONF_OPTS += --enable-audio
> +LIBEFL_DEPENDENCIES += libsndfile
> +else
> +LIBEFL_CONF_OPTS += --disable-audio
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +LIBEFL_CONF_OPTS += --enable-pulseaudio
> +LIBEFL_DEPENDENCIES += pulseaudio
> +else
> +LIBEFL_CONF_OPTS += --disable-pulseaudio
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TSLIB),y)
> +LIBEFL_DEPENDENCIES += tslib
> +LIBEFL_CONF_OPTS += --enable-tslib
> +else
> +LIBEFL_CONF_OPTS += --disable-tslib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +LIBEFL_DEPENDENCIES += libglib2
> +LIBEFL_CONF_OPTS += --with-glib=yes
> +else
> +LIBEFL_CONF_OPTS += --with-glib=no
> +endif
> +
> +# Prefer openssl (the default) over gnutls.
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBEFL_DEPENDENCIES += openssl
> +LIBEFL_CONF_OPTS += --with-crypto=openssl
> +else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
> +LIBEFL_DEPENDENCIES += gnutls libgcrypt
> +LIBEFL_CONF_OPTS += --with-crypto=gnutls \
> +       --with-libgcrypt-prefix=$(STAGING_DIR)/usr
> +else
> +LIBEFL_CONF_OPTS += --with-crypto=none
> +endif # BR2_PACKAGE_OPENSSL
> +
> +# Loaders that need external dependencies needs to be --enable-XXX=yes
> +# otherwise the default is '=static'.
> +# All other loaders are statically built-in
> +ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
> +LIBEFL_CONF_OPTS += --enable-image-loader-png=yes
> +LIBEFL_DEPENDENCIES += libpng
> +else
> +LIBEFL_CONF_OPTS += --disable-image-loader-png
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_JPEG),y)
> +LIBEFL_CONF_OPTS += --enable-image-loader-jpeg=yes
> +# libefl already depends on jpeg.
> +else
> +LIBEFL_CONF_OPTS += --disable-image-loader-jpeg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_GIF),y)
> +LIBEFL_CONF_OPTS += --enable-image-loader-gif=yes
> +LIBEFL_DEPENDENCIES += giflib
> +else
> +LIBEFL_CONF_OPTS += --disable-image-loader-gif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBEFL_TIFF),y)
> +LIBEFL_CONF_OPTS += --enable-image-loader-tiff=yes
> +LIBEFL_DEPENDENCIES += tiff
> +else
> +LIBEFL_CONF_OPTS += --disable-image-loader-tiff
> +endif
> +
> +$(eval $(autotools-package))
> +
>  ################################################################################
>  #
>  # host-libefl
> --
> 2.4.3
>
