From: Ismael Luceno <ismael@iodev.co.uk>
Date: Mon, 25 Sep 2017 12:17:42 -0300
Subject: [Buildroot] [PATCH v2] axel: bump to version 2.14.1
In-Reply-To: <20170925143614.16887-1-ismael@iodev.co.uk>
References: <cf484d3b-ef26-1829-3a09-e98a4253cc16@mind.be>
 <20170925143614.16887-1-ismael@iodev.co.uk>
Message-ID: <20170925151741.GB25135@pirotess.bf.iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops, sent it accidentally, too early, I didn't meant to, there's an
issue with the autoreconf step.

On 25/Sep/2017 11:36, Ismael Luceno wrote:
> - Change upstream URL.
> - Add optional dependency on libressl/openssl.
> - Switch to autotools-package.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---
>  package/axel/Config.in |  2 +-
>  package/axel/axel.hash |  3 +--
>  package/axel/axel.mk   | 35 +++++++++++++----------------------
>  3 files changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/package/axel/Config.in b/package/axel/Config.in
> index 6e709cfb1351..4507855ff8e7 100644
> --- a/package/axel/Config.in
> +++ b/package/axel/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_AXEL
>  	help
>  	  HTTP/FTP download accelerator.
>  
> -	  http://axel.alioth.debian.org/
> +	  https://github.com/axel-download-accelerator/axel/
>  
>  comment "axel needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/axel/axel.hash b/package/axel/axel.hash
> index 895767011892..d9b610f7e3c2 100644
> --- a/package/axel/axel.hash
> +++ b/package/axel/axel.hash
> @@ -1,2 +1 @@
> -# Locally calculated
> -sha256	359a57ab4e354bcb6075430d977c59d33eb3e2f1415a811948fa8ae657ca8036  axel-2.4.tar.gz
> +sha256	acf6820d98a792faf309fc9acf22f7caf4b8a4b7001072c8f546b3c4fc755e39  axel-2.14.1.tar.gz
> diff --git a/package/axel/axel.mk b/package/axel/axel.mk
> index 60bf5e4a61df..37fe022fca71 100644
> --- a/package/axel/axel.mk
> +++ b/package/axel/axel.mk
> @@ -4,33 +4,24 @@
>  #
>  ################################################################################
>  
> -AXEL_VERSION = 2.4
> -AXEL_SITE = http://sources.buildroot.net
> +AXEL_VERSION = 2.14.1
> +AXEL_SITE = $(call github,axel-download-accelerator,axel,v$(AXEL_VERSION))
>  AXEL_LICENSE = GPL-2.0+
>  AXEL_LICENSE_FILES = COPYING
>  AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> -AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)
>  
> -ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> -AXEL_DISABLE_I18N = --i18n=0
> +ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +AXEL_CONF_OPTS += --with-ssl
> +AXEL_DEPENDENCIES += libressl
> +else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +AXEL_CONF_OPTS += --with-ssl
> +AXEL_DEPENDENCIES += openssl
> +else
> +AXEL_CONF_OPTS += --without-ssl
>  endif
>  
> -define AXEL_CONFIGURE_CMDS
> -	(cd $(@D); \
> -		./configure \
> -			--prefix=/usr \
> -			--debug=1 \
> -			$(AXEL_DISABLE_I18N) \
> -	)
> -endef
> -
> -define AXEL_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> -	LFLAGS="$(TARGET_LDFLAGS) $(AXEL_LDFLAGS)" -C $(@D)
> -endef
> +AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)
>  
> -define AXEL_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> -endef
> +AXEL_AUTORECONF = YES
>  
> -$(eval $(generic-package))
> +$(eval $(autotools-package))
> -- 
> 2.13.3
