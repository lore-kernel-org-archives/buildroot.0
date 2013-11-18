From: Nils Koehler <nils.koehler@ibt-interfaces.de>
Date: Mon, 18 Nov 2013 17:00:24 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
	helloworld module be compiled and added to the tartget with a
	local external source
Message-ID: <E5B506F1A019418BB170B8E07A87655B@NKDELL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I have goggled a lot the last three days to find out how to implement a own
program and device driver, which is compiled and added to the target due
buildroot make command, but I did not had success to solve it.

 

Actually my problems is that:

 

HELLOWORLD_SOURCE_DIR = /home/koehler/Desktop/Kernel/ldt/

seems not to be computed.

 

In helloworld.c I have added a typo to force an error message if buildroot
try to compile helloworld.c but until now I did not see it

 

 

I found hints at:

http://buildroot.uclibc.org/downloads/manual/manual.html#customize-store-pac
kage-config

 

And openWRT:

http://www.ccs.neu.edu/home/noubir/Courses/CS6710/S12/material/OpenWrt_Dev_T
utorial.pdf

 

but the used Keywords are very different and no of the approaches helped me
right now.

So I think I need some help from outside...

 

The outgoing situation is I have a helloworld.c program and a Hello world
module. 

Located in /home/koehler/ldt/

 

I can compile them from outside buildroot for Kernel 3.10.17 

 

To be able to make it cinfigurable I have added in
/buildroot-2013.08/package/Config.in     :

 

menu "Hardware handling"

menu "Misc devices firmwares"

source "package/helloworld/Config.in"

endmenu

 

And in /buildroot-2013.08/package/helloworld/Config.in     :

config BR2_PACKAGE_HELLOWORLD

        bool "helloworld"

        help

    This is a comment that explains what libfoo is.

 

 

This is the in /buildroot-2013.08/package/helloworld/heloworld.mk     

Based on the example of builroot manual:

 

############################################################################
####

#

# helloworld

#

############################################################################
####

 

HELLOWORLD_VERSION = 1.0

HELLOWORLD_SOURCE_DIR = /home/koehler/Desktop/Kernel/ldt/

#HELLOWORLD_SITE = http://www.foosoftware.org/download

HELLOWORLD_LICENSE = GPLv3+

HELLOWORLD_LICENSE_FILES = COPYING

HELLOWORLD_INSTALL_STAGING = YES

#HELLOWORLD_CONFIG_SCRIPTS = helloworld-config

#HELLOWORLD_DEPENDENCIES = host-libaaa libbbb

 

define HELLOWORLD_BUILD_CMDS

    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

endef

 

define HELLOWORLD_INSTALL_STAGING_CMDS

#    $(INSTALL) -D -m 0755 $(@D)/helloworld.a
$(STAGING_DIR)/usr/lib/helloworld.a

#    $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h

#    $(INSTALL) -D -m 0755 $(@D)/helloworld.so* $(STAGING_DIR)/usr/lib

endef

 

define HELLOWORLD_INSTALL_TARGET_CMDS

#    $(INSTALL) -D -m 0755 $(@D)/helloworld.so* $(TARGET_DIR)/usr/lib

#    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d

endef

 

define HELLOWORLD_DEVICES

#    /dev/foo  c  666  0  0  42  0  -  -  -

endef

 

define HELLOWORLD_PERMISSIONS

#    /bin/foo  f  4755  0  0  -  -  -  -  -

endef

 

define HELLOWORLD_USERS

#    foo -1 helloworld -1 * - - - LibFoo daemon

endef

 

$(eval $(generic-package))

 

 

 

 

 

Regards

 

Nils

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131118/693dd02b/attachment-0001.html>
