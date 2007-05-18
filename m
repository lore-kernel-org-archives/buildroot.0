From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 18 May 2007 09:52:32 +0200
Subject: [Buildroot] PATCH against 18643 to add unzip (info-zip),
	the standard Linux unzip
In-Reply-To: <131426.20830.qm@web62011.mail.re1.yahoo.com>
References: <131426.20830.qm@web62011.mail.re1.yahoo.com>
Message-ID: <20070518075232.GB25167@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 17, 2007 at 11:17:46PM -0700, Doug the RockRat wrote:
>This has encrypted support, which the busy box one
>does not, and pulls from source forge.
>
>As this is the first package I've added, I would
>appreciate feedback on if it's done correctly or not.
>
>Thanks,
>Doug
>
>Index: buildroot-2007-05-17/package/Config.in
>===================================================================
>--- buildroot-2007-05-17/package/Config.in     
>(revision 18643)
>+++ buildroot-2007-05-17/package/Config.in     
>(working copy)
>@@ -311,6 +311,7 @@ endif
> source "package/lzo/Config.in"
> source "package/lzma/Config.in"
> source "package/zlib/Config.in"
>+source "package/unzip/Config.in"
> endif
>
> menuconfig BR2_SCRIPTING_SUPPORT
>Index: buildroot-2007-05-17/package/unzip/Config.in
>===================================================================
>--- buildroot-2007-05-17/package/unzip/Config.in      
> (revision 0)
>+++ buildroot-2007-05-17/package/unzip/Config.in      
> (revision 0)
>@@ -0,0 +1,14 @@
>+config BR2_PACKAGE_UNZIP
>+       bool "unzip"
>+       default n
>+       help
>+         list, test and extract compressed files in a
>ZIP archive
>+         unzip is the standard unzip utility used on
>Linux.
>+
>+config BR2_PACKAGE_UNZIP_STATIC
>+       bool "Static Compile of unzip"
>+       default n
>+       depends on BR2_PACKAGE_UNZIP
>+       help
>+         Set this to statically compile unzip
>+
>Index:
>buildroot-2007-05-17/package/unzip/unzip-5.52.patch
>===================================================================
>---
>buildroot-2007-05-17/package/unzip/unzip-5.52.patch
>(revision 0)
>+++
>buildroot-2007-05-17/package/unzip/unzip-5.52.patch
>(revision 0)
>@@ -0,0 +1,22 @@
>+--- unzip-5.52/unix/Makefile   2005-02-26
>12:58:34.000000000 -0700
>++++ unzip-5.52.mipsel/unix/Makefile    2007-05-17
>14:12:29.000000000 -0600
>+@@ -42,13 +42,15 @@
>+ # such as -DDOSWILD).
>+
>+ # UnZip flags
>+-CC = cc#      try using "gcc" target rather than
>changing this (CC and LD
>++ # use mipsel-linux- form for below
>++TARGET_PREFIX?=
>++STATIC?=
>++CC = $(TARGET_PREFIX)gcc#     try using "gcc" target
>rather than changing this (CC and LD
>+ LD = $(CC)#   must match, else "unresolved symbol: 
>___main" is possible)
>+-AS = as
>++AS = $(TARGET_PREFIX)as
>+ LOC = $(LOCAL_UNZIP)
>+ AF = $(LOC)
>+ CF = -O -I. -DUNIX $(LOC)
>+-LF = -o unzip
>++LF = $(STATIC) -o unzip
>+ LF2 = -s

Is this patch really needed?
It may not be; consider to build unzip with
$(UNZIP_DIR)/unzip: .../.configured
	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" etc

if configure doesn't write CC and CFLAGS properly.
>+
>+ # UnZipSFX flags
>Index: buildroot-2007-05-17/package/unzip/unzip.mk
>===================================================================
>--- buildroot-2007-05-17/package/unzip/unzip.mk
>(revision 0)
>+++ buildroot-2007-05-17/package/unzip/unzip.mk
>(revision 0)
>@@ -0,0 +1,58 @@
>+#############################################################
>+#
>+# unzip
>+#
>http://easynews.dl.sourceforge.net/sourceforge/infozip/unzip552.tar.gz
>+# http://www.info-zip.org/UnZip.html
>+#############################################################
>+# come on, folks, please name the file the same as
>the dir!
>+UNZIP_VTAR=552
>+UNZIP_VDIR=5.52
>+UNZIP_SOURCE:=unzip$(UNZIP_VTAR).tar.gz
>+UNZIP_PATCH:=unzip-$(UNZIP_VDIR).patch
>+UNZIP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/infozip

IIRC unzip is one of the packages that often has security issues, so i'd
prefer using the debian version instead of unfixed upstream sources.

UNZIP_VERSION:=5.52
UNZIP_SOURCE:=unzip_$(UNZIP_VERSION).orig.tar.gz
UNZIP_PATCH:=unzip_$(UNZIP_VERSION)-9.diff.gz
UNZIP_SIZE:=http://ftp.debian.org/debian/pool/main/u/unzip/

>+UNZIP_CAT:=$(ZCAT)
>+UNZIP_DIR:=$(BUILD_DIR)/unzip-$(UNZIP_VDIR)
>+UNZIP_BINARY:=unzip
>+UNZIP_TARGET_BINARY:=bin/unzip
>+
>+$(DL_DIR)/$(UNZIP_SOURCE):
>+        $(WGET) -P $(DL_DIR)
>$(UNZIP_SITE)/$(UNZIP_SOURCE)
>+
>+unzip-source: $(DL_DIR)/$(UNZIP_SOURCE)
>+
>+$(UNZIP_DIR)/.unpacked: $(DL_DIR)/$(UNZIP_SOURCE)
>+       $(UNZIP_CAT) $(DL_DIR)/$(UNZIP_SOURCE) | tar
>-C $(BUILD_DIR) $(TAR_OPTIONS) -
>+       toolchain/patch-kernel.sh $(UNZIP_DIR)
>package/unzip/ unzip\*.patch
>+       touch $(UNZIP_DIR)/.unpacked

Please use touch $@. Easier to avoid typos and easier to read, imo.
>+
>+$(UNZIP_DIR)/.configured: $(UNZIP_DIR)/.unpacked
>+       cp $(UNZIP_DIR)/unix/Makefile $(UNZIP_DIR)
>+       touch  $(UNZIP_DIR)/.configured
>+
>+$(UNZIP_DIR)/$(UNZIP_BINARY):
>$(UNZIP_DIR)/.configured
>+ifeq ($(strip $(BR2_PACKAGE_UNZIP_STATIC)),y)
>+       $(MAKE) STATIC=-static
>TARGET_PREFIX=$(GNU_TARGET_NAME)- -C $(UNZIP_DIR) 

IIRC we have a CROSS_COMPILE_PREFIX (or the like) you can use as
TARGET_PREFIX (perhaps TARGET_PREFIX is correctly set, even now? You
should check that)
>generic
>+else
>+       $(MAKE) TARGET_PREFIX=$(GNU_TARGET_NAME)- -C
>$(UNZIP_DIR)  generic
>+endif
>+
>+$(TARGET_DIR)/$(UNZIP_TARGET_BINARY):
>$(UNZIP_DIR)/$(UNZIP_BINARY)
>+       cp -a $(UNZIP_DIR)/$(UNZIP_BINARY)

"cp -a" doesn't work on a variety of host OS (apple). Either use
$(INSTALL) -D $@ TARGET_DIR/... or plain cp -dpf.
Check the MacOS bug which cp flags are working.

>$(TARGET_DIR)/$(UNZIP_TARGET_BINARY)
>+
>+unzip: uclibc $(TARGET_DIR)/$(UNZIP_TARGET_BINARY)
>+
>+unzip-clean:
>+       #$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC)
>-C $(UNZIP_DIR) uninstall
>+       -$(MAKE) -C $(UNZIP_DIR) clean

IIRC -clean is supposed to uninstall/remove the package from the
target_dir, so the uninstall line is needed. If uninstall does not work
for this package, rm the files from the target_dir here.

>+
>+unzip-dirclean:
>+       rm -rf $(UNZIP_DIR)
