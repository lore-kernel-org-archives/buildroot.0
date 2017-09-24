From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 16:09:13 +0200
Subject: [Buildroot] [PATCH] axel: bump to version 2.14.1
In-Reply-To: <20170922044545.18813-1-ismael@iodev.co.uk>
References: <20170922044545.18813-1-ismael@iodev.co.uk>
Message-ID: <cf484d3b-ef26-1829-3a09-e98a4253cc16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ismael,

On 22-09-17 06:45, Ismael Luceno wrote:
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

 Please make a longer commit message that explains a bit what changes you make:
- change upstream URL;
- add optional support for OpenSSL/LibreSSL;
...

> ---
>  package/axel/Config.in | 14 +++++++++++++-
>  package/axel/axel.hash |  3 +--
>  package/axel/axel.mk   | 17 ++++++++---------
>  3 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/package/axel/Config.in b/package/axel/Config.in
> index 6e709cfb1351..c7dcbe71c179 100644
> --- a/package/axel/Config.in
> +++ b/package/axel/Config.in
> @@ -4,7 +4,19 @@ config BR2_PACKAGE_AXEL
>  	help
>  	  HTTP/FTP download accelerator.
>  
> -	  http://axel.alioth.debian.org/
> +	  https://github.com/axel-download-accelerator/

 Better refer to axel itself, that has a nice README.md:

https://github.com/axel-download-accelerator/axel

> +
> +if BR2_PACKAGE_AXEL
> +
> +config BR2_PACKAGE_AXEL_SSL
> +	bool "SSL/TLS support"
> +	default y
> +	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_LIBRESSL
> +
> +comment "SSL/TLS support requires openssl or libressl"
> +	depends on !(BR2_PACKAGE_OPENSSL || BR2_PACKAGE_LIBRESSL)

 Unless if there is a very good reason for it, we make this kind of dependency
automatic, i.e. don't add a Config.in option. Instead, add conditions to the .mk
file.

[snip]
>  
> -AXEL_VERSION = 2.4
> -AXEL_SITE = http://sources.buildroot.net
> +AXEL_VERSION = 2.14.1
> +AXEL_SITE = $(call github,axel-download-accelerator,axel,v$(AXEL_VERSION))

 If upstream has a v in their version, you should also have it. So

AXEL_VERSION = v2.14.1

 Note that as of today, the github helper no longer requires the third argument.

>  AXEL_LICENSE = GPL-2.0+
>  AXEL_LICENSE_FILES = COPYING
> -AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> +AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) \
> +	$(if $(BR2_PACKAGE_AXEL_SSL),\
> +		$(if $(BR2_PACKAGE_LIBRESSL),libressl,openssl))

 Remove this part. Instead, add something like this:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
AXEL_CONF_OPTS += --with-ssl
AXEL_DEPENDENCIES += openssl
else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
AXEL_CONF_OPTS += --with-ssl
AXEL_DEPENDENCIES += libressl
else
AXEL_CONF_OPTS += --without-ssl
endif

 It's more lines, but it is easier to understand and therefore easier to maintain.

>  AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)
>  
> -ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> -AXEL_DISABLE_I18N = --i18n=0
> -endif
> -
>  define AXEL_CONFIGURE_CMDS
>  	(cd $(@D); \
> +		./autogen.sh; \
>  		./configure \
>  			--prefix=/usr \
> -			--debug=1 \
> -			$(AXEL_DISABLE_I18N) \
> +			$(if $(BR2_PACKAGE_AXEL_SSL),,--without-ssl) \
> +			$(if $(BR2_SYSTEM_ENABLE_NLS),,--disable-nls) \

 While you're at it, perhaps you can switch to the autotools infrastructure.
You'll have to set AXEL_AUTORECONF = YES because there is no configure script
included. But then the configure, build and install commands can just be removed.

 Regards,
 Arnout

>  	)
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
