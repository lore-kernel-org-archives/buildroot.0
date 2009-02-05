From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 5 Feb 2009 00:33:10 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <873aeue676.fsf@macbook.be.48ers.dk>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> To me the sane thing would just be for the files to be named whatever
> the kernel names them (uImage/zImage/bzImage/..), but even if we don't
> do that we should atleast make the 2 Linux types use the same style.
>

Unless someone oposes, I will commit the patch below tomorrow night.
It will use the rootfs suffix if one is specified for the kernel, but
if none is supplied, we get default kernel names. Then you can get
both rootfs and kernel with your board names, dates, etc. And both
rootfs and kernel names will always match.

It would be even better if /boot in the rootfs had a soft link to the
long kernel name if it's suffixed with something.

Index: target/linux/Makefile.in.advanced
===================================================================
--- target/linux/Makefile.in.advanced   (revision 25243)
+++ target/linux/Makefile.in.advanced   (working copy)
@@ -138,7 +138,6 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=$(LINUX26_FORMAT)
 endif
-KERNEL_EXT:=
 endif

 # --------------
@@ -149,7 +148,6 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
-KERNEL_EXT:=.gz
 endif

 # --------------
@@ -158,7 +156,6 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
-KERNEL_EXT:=.z
 endif

 # --------------
@@ -167,14 +164,13 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
 endif
-KERNEL_EXT:=.bz
 endif

 ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
 #"))
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)$(ROOTFS_STRIPPED_SUFFIX)$(KERNEL_EXT)
+LINUX26_KERNEL_NAME:=$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)


 ifeq ($(BOARD_NAME),)
@@ -182,7 +178,7 @@
 endif

 ifndef LINUX26_KERNEL
-LINUX26_KERNEL:=$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
+LINUX26_KERNEL:=$(BINARIES_DIR)/$(LINUX26_KERNEL_NAME)
 endif

 # for packages that need it
