From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Thu, 8 Oct 2015 13:23:19 -0400
Subject: [Buildroot] External Driver Package Difficulties
Message-ID: <CAK7rcp9_DH4Qpgdh950Lzs+gK4m1sdajvqqWs8cBBaos+nbp8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've read over the documentation at
http://buildroot.org/downloads/manual/manual.html, from the start all the
way up to and including 17.5 where it describes adding a package to build a
kernel module. I've set BR2_EXTERNAL appropriately and buildroot finds my
config.in and external.mk, and I can select my package in menuconfig. The
problem is, though when I go to build my package with make DRVR-rebuild, it
doesn't generate even a single .ko file. Here's my code layout structure
and their contents, which is very brief:


driver
  +  Config.in
  +  external.mk
  +  package/
        +  DRVR/
               +  Config.in
               +  DRVR.mk
  +  src/
        +  drvr.c


From top to bottom, the contents of the respective Config and mk files is:

*Config.in*

source "$BR2_EXTERNAL/package/DRVR/Config.in"

*external.mk <http://external.mk>*

include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))

*Config.in*

################################################################################
#
# UIO driver to facilitate mapping memory into userland.
#
################################################################################
config BR2_PACKAGE_DRVR
       bool "DRVR"
       help
         This is a package that facilitates mapping memory into userland


*DRVR.mk*

UIOMEMD_VERSION = .1
UIOMEMD_SOURCE =
UIOMEMD_INSTALL_TARGET = YES
UIOMEMD_LICENSE = GPLv2
UIOMEMD_LICENSE_FILES = COPYING

$(eval $(kernel-module))
$(eval $(generic-package))


So, I went to several open source external driver examples, and there was
one that had some build commands in define statements in their DRVR.mk
equivalent. So tried those out, and I managed to get the commands to
execute, but once I got the make commands right, it was just as though
building manually.

Here's what happens when I build without the define statements specifying
build commands:

rm -f /workspace/buildroot/output/build/DRVR-.1/.stamp_staging_installed
rm -f /workspace/buildroot/output/build/DRVR-.1/.stamp_target_installed
rm -f /workspace/buildroot/output/build/DRVR-.1/.stamp_images_installed
rm -f /workspace/buildroot/output/build/DRVR-.1/.stamp_host_installed
rm -f /workspace/buildroot/output/build/DRVR-.1/.stamp_built
>>> DRVR .1 Building
>>> DRVR .1 Installing to target

Here's what happens when I add:

define DRVR_BUILD_CMDS
$(MAKE) CC="$(TARGET_CC)" -C $(LINUX_DIR) M=/workspace/DRVR/src modules
endef

make[1]: Entering directory `/workspace/buildroot/output/build/linux-4.0.1'
  Building modules, stage 2.
  MODPOST 0 modules
make[1]: Leaving directory `/workspace/buildroot/output/build/linux-4.0.1

Which is the exact same as if I were in the directory locally and I typed:

make -C /workspace/buildroot/output/build/linux-4.0.1/ M=/workspace/DRVR/src

Why can't I build my driver against my target kernel version? How do I fix
it?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151008/e90280f3/attachment.html>
