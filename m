From: Ossy <ossy1980@gmx.net>
Date: Sun, 25 Jul 2010 21:47:55 +0200
Subject: [Buildroot] converting util-linux-ng to autotargets
Message-ID: <4C4C94EB.8010105@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglsit,

I tried to update to a newer version util-linux. As proposed by Thomas 
Pettazonni I like to use the new autotargets infrastructure.

I searched the mailinglist archives and applied the pattern for 
converting to autotargets to util-linux-ng.mk

For a simple roundtrip my config looks like this:
#############################################################
UTIL-LINUX-NG_VERSION=2.17
UTIL-LINUX-NG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL-LINUX-NG_VERSION)
   UTIL-LINUX-NG_SOURCE=util-linux-ng-$(UTIL-LINUX-NG_VERSION).tar.bz2
UTIL-LINUX-NG_CONF_OPT=--disable-use-tty-group
UTIL-LINUX-NG_DEPENDENCIES=

define UTIL-LINUX-NG_INSTALL_TARGET_CMDS
         $(INSTALL) -D $(@D)/usr/bin/chkdupexe 
$(TARGET_DIR)/usr/sbin/chkdupexe
/init.d/
endef

$(eval $(call AUTOTARGETS,package,util-linux-ng))


My br-config includes the util-linux-ng package:
ossy at debian-virtual:~/buildroot/buildroot-dev$ cat .config|grep 
UTIL-LINUX-NG
BR2_PACKAGE_UTIL-LINUX-NG=y


The packae isn't touched in any way. The output/build directory includes 
ALL other packages. But BR never tried to create a util-linux-ng 
directory. All other conversion-patches to autotarget only modifed the 
*mk files. Nothing more.

Where can I find a log or something else where br tried to include 
util-linux-ng but run over it (because of some silly typos etc.)?

Thanks for your help.

Regards,
Marcus
