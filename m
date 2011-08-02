From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Tue, 2 Aug 2011 16:01:16 +0200
Subject: [Buildroot] Fluxbox window manager
Message-ID: <20110802160116.324b7ba8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody

Maybe Fluxbox could be included in Buildroot?

it is actively maintained (unlike Blackbox)

http://www.fluxbox.org/news/

and adding it to Buildroot is very easy :


--- file : package/fluxbox/Config.in

config BR2_PACKAGE_FLUXBOX
        bool "fluxbox"
        depends on BR2_PACKAGE_XORG7
        depends on BR2_INSTALL_LIBSTDCPP
        select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
        select BR2_PACKAGE_XLIB_LIBX11
        help
          The Fluxbox lightweight window manager for X

          http://fluxbox.org

comment "fluxbox requires a toolchain with C++ support enabled"
        depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP

# EOF


---- file : package/fluxbox/fluxbox.mk

#############################################################
#
# FLUXBOX
#
#############################################################

FLUXBOX_VERSION:=1.3.1
FLUXBOX_SOURCE:=fluxbox-$(FLUXBOX_VERSION).tar.bz2
FLUXBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/
FLUXBOX_AUTORECONF:=NO
FLUXBOX_INSTALL_STAGING:=NO
FLUXBOX_INSTALL_TARGET:=YES

FLUXBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
                --x-libraries=$(STAGING_DIR)/usr/lib

FLUXBOX_DEPENDENCIES = xlib_libX11

ifneq ($(BR2_ENABLE_LOCALE),y)
FLUXBOX_DEPENDENCIES += libiconv
endif

$(eval $(call AUTOTARGETS,package,fluxbox))

# EOF



(Sorry I'm not used to patches!)
