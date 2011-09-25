From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Sep 2011 20:46:04 +0200
Subject: [Buildroot] [PATCH] taglib: bump to 1.7
In-Reply-To: <1316767809-5856-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Fri, 23 Sep 2011 10:50:09 +0200")
References: <1316767809-5856-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87d3eozcib.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Bump the version of taglib to 1.7. This version does not any longer
 Sven> ship with a configure script so convert the package from autotargets
 Sven> to cmaketargets.

 Sven> The 1.7 version offers optional support for MP4 and WMA files.
 Sven> Expose these options in buildroot.

Committed with some fixes, thanks (see below). Please take care for the
future.


 Sven> +++ b/package/multimedia/taglib/Config.in
 Sven> @@ -11,3 +11,11 @@ config BR2_PACKAGE_TAGLIB
 
 Sven>  comment "taglib requires a toolchain with C++ support enabled"
 Sven>  	depends on !BR2_INSTALL_LIBSTDCPP
 Sven> +
 Sven> +config BR2_PACKAGE_TAGLIB_MP4
 Sven> +	depends on BR2_PACKAGE_TAGLIB
 Sven> +	bool "taglib mp4 support"
 Sven> +
 Sven> +config BR2_PACKAGE_TAGLIB_ASF
 Sven> +	depends on BR2_PACKAGE_TAGLIB
 Sven> +	bool "taglib wma support"

These options needs to go right after BR2_PACKAGE_TAGLIB (E.G. before
the comment), otherwise they don't get indented.


 Sven> +++ b/package/multimedia/taglib/taglib.mk
 Sven> @@ -3,25 +3,26 @@
 Sven>  # taglib
 Sven>  #
 Sven>  #############################################################
 Sven> -TAGLIB_VERSION = 1.5
 Sven> +TAGLIB_VERSION = 1.7
 Sven>  TAGLIB_SOURCE = taglib-$(TAGLIB_VERSION).tar.gz
 Sven>  TAGLIB_SITE = http://developer.kde.org/~wheeler/files/src
 Sven> -TAGLIB_LIBTOOL_PATCH = NO
 Sven>  TAGLIB_INSTALL_STAGING = YES
 Sven> +TAGLIB_DEPENDENCIES = host-pkg-config libglib2

This is wrong. I don't see any references to either pkg-config or
libglib2 in the sources. If libglib2 was needed, then you should have
selected it in Config.in as well.

 
 Sven> -TAGLIB_CONF_ENV = \
 Sven> -	DO_NOT_COMPILE='bindings tests examples' \
 Sven> -	ac_cv_header_cppunit_extensions_HelperMacros_h=no \
 Sven> -	ac_cv_header_zlib_h=$(if $(BR2_PACKAGE_ZLIB),yes,no)
 Sven> +ifeq ($(BR2_PACKAGE_TAGLIB_ASF),y)
 Sven> +TAGLIB_CONF_OPT += -DWITH_ASF=ON
 Sven> +endif
 
 Sven> -TAGLIB_CONF_OPT = --disable-libsuffix
 Sven> +ifeq ($(BR2_PACKAGE_TAGLIB_MP4),y)
 Sven> +TAGLIB_CONF_OPT += -DWITH_MP4=ON
 Sven> +endif
 
 Sven> -define TAGLIB_REMOVE_DEVFILE
 Sven> -	rm -f $(TARGET_DIR)/usr/bin/taglib-config
 Sven> +define TAGLIB_INSTALL_TARGET_CMDS
 Sven> +	cp -a $(STAGING_DIR)/usr/lib/libtag.so* $(TARGET_DIR)/usr/lib
 Sven>  endef

This is wrong. The existing install support was fine. With this you
broke BR2_HAVE_DEVFILES / BR2_HAVE_DOCUMENTATION / BR2_PREFER_STATIC_LIB
configurations.

-- 
Bye, Peter Korsgaard
