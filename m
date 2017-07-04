From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 17:23:21 +0200
Subject: [Buildroot] [PATCH 012/100] alsa-utils: use new gettext logic
In-Reply-To: <20170704144920.12318-13-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
 <20170704144920.12318-13-thomas.petazzoni@free-electrons.com>
Message-ID: <70e0e52e-5162-837f-7b39-16c2aafb3422@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:47, Thomas Petazzoni wrote:
> This commit switches to use the new gettext logic, which involves:
> 
>  - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
>    on gettext/host-gettext
> 
>  - using TARGET_NLS_LIBS to force linking against libintl
> 
>  - dropping BR2_PACKAGE_GETTEXT selection
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/alsa-utils/Config.in     |  1 -
>  package/alsa-utils/alsa-utils.mk | 13 +++++--------
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
> index 1d42f2e..d3fd18d 100644
> --- a/package/alsa-utils/Config.in
> +++ b/package/alsa-utils/Config.in
> @@ -8,7 +8,6 @@ menuconfig BR2_PACKAGE_ALSA_UTILS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
>  	depends on !BR2_STATIC_LIBS # uses dlfcn.h
>  	select BR2_PACKAGE_ALSA_LIB
> -	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
>  	help
>  	  This package contains the command line utilities for the ALSA
>  	  project.
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index f0b964a..e9fd942 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -10,27 +10,24 @@ ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
>  ALSA_UTILS_LICENSE = GPL-2.0
>  ALSA_UTILS_LICENSE_FILES = COPYING
>  ALSA_UTILS_INSTALL_STAGING = YES
> -ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
> +ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
>  	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
> -	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate)
> +	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
> +	$(TARGET_NLS_DEPENDENCIES)
>  # Regenerate aclocal.m4 to pick the patched
>  # version of alsa.m4 from alsa-lib
>  ALSA_UTILS_AUTORECONF = YES
>  ALSA_UTILS_GETTEXTIZE = YES
>  
>  ALSA_UTILS_CONF_ENV = \
> -	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
> +	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS) \
> +	LIBS=$(TARGET_NLS_LIBS)
>  
>  ALSA_UTILS_CONF_OPTS = \
>  	--disable-xmlto \
>  	--disable-rst2man \
>  	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
>  
> -ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> -ALSA_UTILS_DEPENDENCIES += gettext
> -ALSA_UTILS_CONF_ENV += LIBS=-lintl
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSALOOP),y)
>  ALSA_UTILS_CONF_OPTS += --enable-alsaloop
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
