From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 25 Jan 2007 00:18:35 +0100
Subject: [Buildroot] [PATCH] New options for JFFS2 to support Dataflash
In-Reply-To: <1169592015.5361.10.camel@elrond.sweden.atmel.com>
References: <1169592015.5361.10.camel@elrond.sweden.atmel.com>
Message-ID: <20070124231835.GE28221@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 23, 2007 at 11:40:15PM +0100, Ulf Samuelsson wrote:
>AT45 SPI Dataflash need special options for mkfs.jffs2,
>due to their nonstandard page size (528/1056 byte pages)
>
>This allows these options to be configured.
>
>Best Regards
>Ulf Samuelsson
>

>Author:	Ulf Samuelsson
>Date:	2007-01-23
>
>Log:
>Additionals JFFS2 options to support Dataflash 

typo: Additional without trailing 's'
>
>Modified:
>	target/jffs2/Config.in
>	target/jffs2/jffs2root.mk
>Changeset
>Modified: target/jffs2/Config.in
>	  target/jffs2/jffs2root.mk
>
>diff -urN buildroot-0rig/target/jffs2/Config.in buildroot-20070116-RC2/target/jffs2/Config.in
>--- buildroot-0rig/target/jffs2/Config.in	2007-01-16 18:29:39.000000000 +0100
>+++ buildroot-20070116-RC2/target/jffs2/Config.in	2007-01-16 23:42:40.000000000 +0100
>@@ -5,6 +5,26 @@
> 	help
> 	  Build a jffs2 root filesystem
> 
>+config BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
>+	bool "Use default 4 kB pagesize"
>+	depends on BR2_TARGET_ROOTFS_JFFS2
>+	default y			
>+
>+config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
>+	hex "Page Size (0x0 = Use default 4 kB)"
>+	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
>+	default 0x420
>+	help
>+		Set to pagesize of memory (Dataflash is 0x210 or 0x420)

We use \t\ \ The helptext.
and not \t\t
fixed.

>+
>+config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
>+	bool	"Do not use Cleanmarker"
>+	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
>+	default y
>+	help
>+		Do not use cleanmarkers if using NAND flash or Dataflash where
>+		the pagesize is not a power of 2

ditto
>+
> config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
> 	hex "Erase block size"
> 	depends on BR2_TARGET_ROOTFS_JFFS2
>diff -urN buildroot-0rig/target/jffs2/jffs2root.mk buildroot-20070116-RC2/target/jffs2/jffs2root.mk
>--- buildroot-0rig/target/jffs2/jffs2root.mk	2007-01-16 18:29:39.000000000 +0100
>+++ buildroot-20070116-RC2/target/jffs2/jffs2root.mk	2007-01-16 23:42:40.000000000 +0100
>@@ -4,7 +4,7 @@
> #
> #############################################################
> 
>-JFFS2_OPTS := -e $(strip $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE))
>+JFFS2_OPTS:= -e $(strip $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE))

unrelated whitespace. Dropped
> 
> ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PAD)),y)
> ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE)),0x0)
>@@ -26,8 +26,15 @@
> JFFS2_OPTS += -b
> endif
> 
>-JFFS2_TARGET := $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT))
>-JFFS2_DEVFILE = $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_DEVFILE)))
>+ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE)),y)
>+JFFS2_OPTS += -s $(strip $(BR2_TARGET_ROOTFS_JFFS2_PAGESIZE))
>+ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER)),y)
>+JFFS2_OPTS += -n
>+endif
>+endif
>+
>+JFFS2_TARGET:= $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT))
>+JFFS2_DEVFILE= $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_DEVFILE)))
> ifneq ($(JFFS2_DEVFILE),)
> JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
> endif
>@@ -68,6 +75,9 @@
> ifneq ($(JFFS2_COPYTO),)
> 	@cp -f $(JFFS2_TARGET) $(JFFS2_COPYTO)
> endif
>+	@mkdir -p binaries/$(BOARDNAME)
>+	@cp -f $(JFFS2_TARGET) binaries/$(BOARDNAME)

Set JFFS2_COPYTO in your .config instead
>+
> 
> jffs2root-source: mtd-host-source
> 

Applied with some additional cleanups while at it.
Thanks,
