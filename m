From: Ossy <ossy1980@gmx.net>
Date: Sat, 24 Jul 2010 19:02:22 +0200
Subject: [Buildroot] xfsprogs 3.0.3 without libxfs in rootfs
In-Reply-To: <20100721085822.5d2a34ae@surf>
References: <4C4613A2.90006@gmx.net> <20100721085822.5d2a34ae@surf>
Message-ID: <4C4B1C9E.8010600@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.07.2010 08:58, schrieb Thomas Petazzoni:
> But clearly the correct fix is to switch to AUTOTARGETS.
>
>

I searched some autotargets patch mails in the mailinglist. Nearly all 
of them just modified the package/<pkg-name>/<pkg-name>.mk file.
I was wondering, that there were no other modifications in the other 
converted packages like some global pkg index file which marks the new 
package as "use autotargets now and not the old infrastructure anymore".

I tried the same and converted the util-linux-ng into this:
#############################################################
UTIL-LINUX-NG_VERSION:=2.17
UTIL-LINUX-NG_PATCHLEVEL:=2
UTIL-LINUX-NG_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL-LINUX-NG_VERSION)
ifneq ($(UTIL-LINUX-NG_PATCHLEVEL),'')
 
UTIL-LINUX-NG_SOURCE:=util-linux-ng-$(UTIL-LINUX-NG_VERSION).$(UTIL-LINUX-NG_PATCHLEVEL).tar.bz2
else
   UTIL-LINUX-NG_SOURCE:=util-linux-ng-$(UTIL-LINUX-NG_VERSION).tar.bz2
endif
UTIL-LINUX-NG_DIR:=$(BUILD_DIR)/util-linux-ng-$(UTIL-LINUX-NG_VERSION)
UTIL-LINUX-NG_CAT:=$(BZCAT)
UTIL-LINUX-NG_BINARY:=$(UTIL-LINUX-NG_DIR)/misc-utils/chkdupexe
UTIL-LINUX-NG_TARGET_BINARY:=$(TARGET_DIR)/usr/bin/chkdupexe
UTIL-LINUX-NG_CONF_OPT:=--disable-use-tty-group
UTIL-LINUX-NG_DEPENDENCIES:=

ifeq ($(BR2_PACKAGE_NCURSES),y)
   ifeq ($(BR2_USE_WCHAR),n)
     UTIL-LINUX-NG_CONF_OPT+=--with-ncurses
   endif # BR2_USE_WCHAR
else
   UTIL-LINUX-NG_CONF_OPT+=--without-ncurses
endif # BR2_PACKAGE_NCURSES

ifeq ($(BR2_PACKAGE_ZLIB),n)
   UTIL-LINUX-NG_CONF_OPT:=--disable-cramfs
endif

$(eval $(call AUTOTARGETS,package,util-linux-ng))

I took the original mk file and tried to save the options and 
dependencies. I was able to activate the util-linux-ng box in the 
menuconfig and ran make. Unfortunatly the util-linux-ng package isn't 
touched in any way.
Do I have to remove more declarations in the new mk file?
Do I need to run some "make ulng known to be autotargetted now by 
removing old config caches" ?

Regards,
Marcus
