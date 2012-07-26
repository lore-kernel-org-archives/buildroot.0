From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2012 18:57:45 +0200
Subject: [Buildroot] [PATCH] sconeserver: new package
In-Reply-To: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
References: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
Message-ID: <50117709.8060209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/23/12 15:49, spdawson at gmail.com wrote:
[snip]
> diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
> new file mode 100644
> index 0000000..7290ec0
> --- /dev/null
> +++ b/package/sconeserver/Config.in
> @@ -0,0 +1,100 @@
> +config BR2_PACKAGE_SCONESERVER
> +	bool "sconeserver"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_PCRE
> +	help
> +	  Sconeserver is a modular, object-orientated and extremely versatile
> +	  network server framework for GNU/Linux and UNIX-like platforms.
> +
> +	  http://www.sconemad.com/sconeserver/
> +
> +comment "sconeserver requires a toolchain with C++ support enabled"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +menu "Modules"

  I think a menuconfig is nicer in this case.  Cfr. OpenCV.

> +	depends on BR2_PACKAGE_SCONESERVER
> +
> +config BR2_PACKAGE_SCONESERVER_EXAMPLES
> +	bool "examples"
> +	default n

  n is the default, so this statement is redundant.

> +	help
> +	  Example modules for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_SSL
> +	bool "ssl"
> +	default y

  Why does this default to y?

  Maybe you want
default y if BR2_PACKAGE_OPENSSL

  however, I think that conflicts with the select statement below...

> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  SSL module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
> +	bool "http::sconesite"
> +	default y
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  http::sconesite module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
> +	bool "http::sconesite::image"
> +	default n
> +	depends on BR2_PACKAGE_IMAGEMAGICK
> +	select BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE

  Shouldn't this be
depends on BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
select BR2_PACKAGE_IMAGEMAGICK

> +	help
> +	  http::sconesite::image module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_MYSQL
> +	bool "mysql"
> +	default n
> +	depends on BR2_PACKAGE_MYSQL_CLIENT

  Why depends on rather than select?

  Same for all the following...

> +	help
> +	  MySQL module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_BLUETOOTH
> +	bool "bluetooth"
> +	default n
> +	depends on BR2_PACKAGE_BLUEZ_UTILS
> +	help
> +	  Bluetooth module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_RSS
> +	bool "rss"
> +	default y
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  RSS module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_LOCATION
> +	bool "location"
> +	default n
> +	depends on BR2_PACKAGE_GPSD
> +	help
> +	  Location module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_LETTUCE
> +	bool "lettuce"
> +	default n
> +	help
> +	  Lettuce module for SconeServer

  This one could use some explanation of what lettuce is...

> +
> +config BR2_PACKAGE_SCONESERVER_MATHS
> +	bool "maths"
> +	default n
> +	depends on BR2_PACKAGE_GMP
> +	depends on BR2_PACKAGE_MPFR
> +	help
> +	  Maths module for SconeServer

  Maybe this one as well.

> +
> +config BR2_PACKAGE_SCONESERVER_TESTBUILDER
> +	bool "testbuilder"
> +	default n
> +	help
> +	  Testbuilder module for SconeServer
> +
> +config BR2_PACKAGE_SCONESERVER_UI
> +	bool "ui"
> +	default n
> +	depends on BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  UI module for SconeServer
> +
> +endmenu
> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> new file mode 100644
> index 0000000..dba5fe6
> --- /dev/null
> +++ b/package/sconeserver/sconeserver.mk
> @@ -0,0 +1,49 @@
> +#############################################################
> +#
> +# sconeserver
> +#
> +#############################################################
> +# Release tarball doesn't build cleanly, so use a recent
> +# Subversion trunk snapshot.

  Mention which is the release that doesn't build cleanly, this will
help version bumpers.

> +SCONESERVER_VERSION = 177
> +SCONESERVER_SITE = \
> +	https://sconeserver.svn.sourceforge.net/svnroot/sconeserver/trunk
> +SCONESERVER_SITE_METHOD = svn
> +
> +SCONESERVER_LICENSE = GPLv2+
> +SCONESERVER_LICENSE_FILES = COPYING
> +
> +SCONESERVER_CONF_OPT += \
> +	--with-ip \
> +	--with-local \
> +	$(if $(BR2_INET_IPV6),--with-ip6,--without-ip6) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_EXAMPLES),--with-examples,--without-examples) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_LETTUCE),--with-lettuce,--without-lettuce) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_TESTBUILDER),--with-testbuilder,--without-testbuilder) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_SSL),--with-ssl,--without-ssl) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),--with-sconesite,--without-sconesite) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),--with-sconesite-image,--without-sconesite-image) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_MYSQL),--with-mysql,--without-mysql) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_BLUETOOTH),--with-bluetooth,--without-bluetooth) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_RSS),--with-rss,--without-rss) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_LOCATION),--with-location,--without-location) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_MATHS),--with-maths,--without-maths) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_UI),--with-ui,--without-ui)
> +
> +# Help SconeServer to find the libxml2 headers.
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +	SCONESERVER_CONF_OPT += CPPFLAGS="-I$(STAGING_DIR)/usr/include/libxml2"

  Why doesn't pkg-config find this path?  Are they missing a check for
libxml-2.0 maybe?

> +endif
> +
> +SCONESERVER_DEPENDENCIES = \
> +	pcre \
> +	$(if $(BR2_PACKAGE_SCONESERVER_SSL),openssl) \
> +	$(if $(or $(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),$(BR2_PACKAGE_SCONESERVER_RSS)),libxml2) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),imagemagick) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_MYSQL),mysql_client) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_BLUETOOTH),bluez_utils) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_LOCATION),gpsd) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_MATHS),gmp mpfr) \
> +	$(if $(BR2_PACKAGE_SCONESERVER_UI),xlib_libX11)
> +
> +$(eval $(autotools-package))


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
