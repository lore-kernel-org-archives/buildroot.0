From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 23:18:13 +0200
Subject: [Buildroot] [PATCH v2] harfbuzz: New package
In-Reply-To: <1376926609-11561-1-git-send-email-markos.chandras@imgtec.com>
References: <1376926609-11561-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <52152E95.2080206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/08/13 17:36, Markos Chandras wrote:
> HarfBuzz is an OpenType text shaping engine
>
> http://www.freedesktop.org/wiki/Software/HarfBuzz/
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> http://lists.busybox.net/pipermail/buildroot/2013-August/076645.html
> Changes since v1:
> - Fix alphabetical order in package/Config.in
> - Rename 'LIBSTDCPP support' to 'C++ support'
> ---
>   package/Config.in            |  1 +
>   package/harfbuzz/Config.in   | 34 ++++++++++++++++++++++++++++++++++
>   package/harfbuzz/harfbuzz.mk | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 79 insertions(+)
>   create mode 100644 package/harfbuzz/Config.in
>   create mode 100644 package/harfbuzz/harfbuzz.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7069d77..1b06755 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -130,6 +130,7 @@ endif
>   source "package/fbterm/Config.in"
>   source "package/fbv/Config.in"
>   source "package/fb-test-app/Config.in"
> +source "package/harfbuzz/Config.in"
>   source "package/imagemagick/Config.in"
>   source "package/linux-fusion/Config.in"
>   source "package/lite/Config.in"
> diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
> new file mode 100644
> index 0000000..1b1bad3
> --- /dev/null
> +++ b/package/harfbuzz/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_HARFBUZZ
> +	bool "harfbuzz"
> +	help
> +	  HarfBuzz is an OpenType text shaping engine
> +
> +	  http://www.freedesktop.org/wiki/Software/HarfBuzz/
> +
> +if BR2_PACKAGE_HARFBUZZ
> +
> +config BR2_PACKAGE_HARFBUZZ_CAIRO
> +	bool "Use cairo"
> +	select BR2_PACKAGE_CAIRO

  We normally don't add options like this, but instead use automatic 
selection (see below).

  You may want to add some help text to say that it can make use of 
cairo, freetype, glib2 and icu if these packages are selected.

> +
> +config BR2_PACKAGE_HARFBUZZ_FREETYPE
> +	bool "Use the FreeType library"
> +	select BR2_PACKAGE_FREETYPE
> +
> +config BR2_PACKAGE_HARFBUZZ_GLIB
> +	bool "Use glib"
> +	select BR2_PACKAGE_LIBGLIB2
> +	depends on BR2_USE_WCHAR # gettext dep in libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +comment "glib support requires a toolchain with WCHAR and threading support."
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +config BR2_PACKAGE_HARFBUZZ_ICU
> +	bool "Use ICU"
> +	select BR2_PACKAGE_ICU
> +	depends on BR2_USE_WCHAR # icu
> +	depends on BR2_INSTALL_LIBSTDCPP # icu
> +
> +comment "icu support requires a toolchain with WCHAR and C++ support."
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
> +endif
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> new file mode 100644
> index 0000000..9aee90f
> --- /dev/null
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# harfbuzz
> +#
> +################################################################################
> +
> +HARFBUZZ_VERSION = 0.9.19
> +HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
> +HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
> +HARFBUZZ_LICENSE = Old-MIT ISC ICU

  What is Old-MIT?

  We still haven't had the final word on how the LICENSE string should be 
formatted, but I think it is something like this:

  MIT, ISC (ucdn library), ICU License (icu support library)

  Luca, can you confirm?

> +HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING src/hb-icu-le/COPYING
> +HARFBUZZ_INSTALL_STAGING = YES
> +
> +HARFBUZZ_CONF_OPT = --without-coretext --without-uniscribe --without-graphite2
> +
> +ifeq ($(BR2_PACKAGE_HARFBUZZ_CAIRO),y)

  To make it an automatic dependency, replace this condition with

ifeq ($(BR2_PACKAGE_CAIRO),y)

  Same for the stuff below.

> +	HARFBUZZ_DEPENDENCIES += cairo
> +	HARFBUZZ_CONF_OPT += --with-cairo=yes
> +else
> +	HARFBUZZ_CONF_OPT += --with-cairo=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HARFBUZZ_FREETYPE),y)
> +	HARFBUZZ_DEPENDENCIES += freetype
> +	HARFBUZZ_CONF_OPT += --with-freetype=yes

  Does harfbuzz use pkg-config for freetype? If not, you'll need

--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config"

> +else
> +	HARFBUZZ_CONF_OPT += --with-freetype=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HARFBUZZ_GLIB),y)
> +	HARFBUZZ_DEPENDENCIES += libglib2
> +	HARFBUZZ_CONF_OPT += --with-glib=yes
> +else
> +	HARFBUZZ_CONF_OPT += --with-glib=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HARFBUZZ_ICU),y)
> +	HARFBUZZ_DEPENDENCIES += icu
> +	HARFBUZZ_CONF_OPT += --with-icu=yes

  icu also has a custom config script so check if you need to pass it.


  Regards,
  Arnout


> +else
> +	HARFBUZZ_CONF_OPT += --with-icu=no
> +endif
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
