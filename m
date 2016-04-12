From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Tue, 12 Apr 2016 14:25:19 -0400
Subject: [Buildroot] Cannot build Custom Kernel Module
Message-ID: <CAN34foz3HvhgeBsPKEc6vjsrzUWK-gsHoAVsvPSR7Def1gMKyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
  After 2 days, I'm still stuck trying to build a kernel module in
Buildroot.  I have an "out of tree" setup, that builds applications and
libraries just fine.  I get a bootable image.  I even added another "test"
module yesterday and verified the steps I'm using worked, and that built
just fine.  But I'm unable to build a kernel module.  I've searched the
mailing lists and googled the web to no avail.  I've not seen any example
that is similar.
   Buildroot version is 2015.08.01 - and yes, I verified it has the patch
for the pkg-kernel-module.mk in the packages directory.

   My kernel module is "local" - in that it's a custom module I'm adding to
the system to handle specific HW on the board.  So the setup is:
GPIO_MODULE_VERSION = 0.1.0
GPIO_MODULE_LICENSE = Public Domain
GPIO_MODULE_SITE = $(BR2_EXTERNAL)/modules/gpio_module
GPIO_MODULE_SITE_METHOD = local

The directory exists and there is a very simple Config.in to select the
module (from the top level .config file)
#
# HWDD Required Kernel Modules
#
BR2_PACKAGE_GPIO_MODULE=y

Some questions:
1)  Can the module be setup like this?  Locally (to be rsync'd)??
2)  The gpio_module.mk file:  this still contains BUILD_CMDS ??
3)   Do I also need to have a "makefile" present in the directory as well?
 (some examples seem to indicate yes)
4)   Can I do the same <pkg> - build commands to build this?  (like I would
for the apps/libraries)

My gpio_modules.mk file:
################################################################################
#
# gpio_module
#
################################################################################
GPIO_MODULE_VERSION = 0.1.0
GPIO_MODULE_LICENSE = Public Domain
GPIO_MODULE_SITE = $(BR2_EXTERNAL)/modules/gpio_module
GPIO_MODULE_SITE_METHOD = local

# Global Includes here
GBL_INCLUDES = $(BR2_EXTERNAL)/incs/include
KNL_INCLUDES = $(BR2_EXTERNAL)/incs/include/kernel

GPIO_MODULE_OPTS += -C$(LINUX_DIR)
GPIO_MODULE_OPTS += M=$(@D)
CFLAGS += -Wall -Os -DCONFIG_HWDD -I$(GBL_INCLUDES) -I$(KNL_INCLUDES)

define GPIO_MODULE_BUILD_CMDS
$(MAKE) $(GPIO_MODULE_OPTS) $(CFLAGS)
endef

$(eval $(generic-kernel))
$(eval $(generic-package))

When I try to do a "-build" on the module (like I do for the apps), I get
this (from the output directory)
[sbeckwith at sdb-mbp-vm output]$ make gpio_module-build
umask 0022 && make -C /home/sbeckwith/HBE-1/buildroot-2015.08.1
O=/home/sbeckwith/HBE-1/hwdd/output/. gpio_module-build
make[1]: *** No rule to make target 'gpio_module-build'.  Stop.
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2
[sbeckwith at sdb-mbp-vm output]$

Which tells me somewhere it can't find the makefile or somehow bolt this up
to the Buildroot build system. . .  I suspect it's because of the
SITE_METHOD=local that maybe causing this issue, am I correct?
The "rsync" I would normally see is not done, so there's nothing in the
output/build directory (no gpio_modules directory).

Some pointers/assistance would be greatly appreciated.

Regards,
Stephen
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160412/169ada05/attachment.html>
