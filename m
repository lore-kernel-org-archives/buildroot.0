From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 12 Aug 2008 07:48:37 -0700 (PDT)
Subject: [Buildroot] Building Cairo using DirectFB
In-Reply-To: <1218548459.6402.6.camel@localhost.localdomain>
References: <1218467304.18656.19.camel@localhost.localdomain>
	<18940236.post@talk.nabble.com>
	<1218548459.6402.6.camel@localhost.localdomain>
Message-ID: <18945810.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have modified it to build for both versions of DirectFB 1.0.x and 1.2.x
(see bug/features in buildroot bugzilla - cant remember the number):

I have also added package/pixman as a package
See Files below:
#package/pixman/pixman.mk
#############################################################
#
# pixman-0.10.0
#
#############################################################
PIXMAN_VERSION = 0.10.0
PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
PIXMAN_SITE = http://www.cairographics.org/releases/
PIXMAN_AUTORECONF = NO
PIXMAN_INSTALL_STAGING = YES
PIXMAN_INSTALL_TARGET = YES
PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install 

ifeq ($(BR2_PREFER_STATIC_LIB),y)
	PIXMAN_CONF_OPT_STATIC = --enable-static
endif

PIXMAN_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) --prefix=/usr \
		--exec-prefix=/usr --bindir=/usr/bin \
		--sbindir=/usr/sbin --libdir=/usr/lib \
		--libexecdir=/usr/lib --sysconfdir=/etc \
		--datadir=/usr/share --localstatedir=/var \
		--includedir=/usr/include --mandir=/usr/man \
		--infodir=/usr/info --enable-shared \
		$(PIXMAN_CONF_OPT_STATIC)

PIXMAN_DEPENDENCIES = uclibc 

$(eval $(call AUTOTARGETS,package,pixman))

#package/pixman/Config.in
config BR2_PACKAGE_PIXMAN
	bool "pixman"
	default n
	depends on BR2_PACKAGE_CAIRO
	help
          pixman is a library that provides low-level pixel manipulation
          features such as image compositing and trapezoid rasterization.

#package/Config.in
source "package/pixman/Config.in"

Hope this helps, there is a pixman under XORG but this should be moved from
out of xorg as it is cairo dependent not XORG dependent.

Many thanks
Daniel Laird

-- 
View this message in context: http://www.nabble.com/Building-Cairo-using-DirectFB-tp18927643p18945810.html
Sent from the BuildRoot mailing list archive at Nabble.com.
