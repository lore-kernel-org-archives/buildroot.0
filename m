From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 18:58:23 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/linux	toolchain/uClibc
In-Reply-To: <20070928161816.E75B7A6889@busybox.net>
References: <20070928161816.E75B7A6889@busybox.net>
Message-ID: <20070928165823.GN20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 09:18:16AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-09-28 09:18:16 -0700 (Fri, 28 Sep 2007)
>New Revision: 20085
>
>Log:
>Add administration for linux,uclibc and main
>
>Modified:
>   trunk/buildroot/Makefile
>   trunk/buildroot/target/linux/Makefile.in
>   trunk/buildroot/toolchain/uClibc/uclibc.mk
>
>
> 	cp $(shell find ./target/ -name $@) .config
> 	-@$(MAKE) oldconfig
> 
>+configured: dirs host-sed kernel-headers uclibc-configured busybox-config linux26-config

This is not adequate (external binary toolchains). Please be careful

>--- trunk/buildroot/target/linux/Makefile.in	2007-09-28 13:41:41 UTC (rev 20084)
>+++ trunk/buildroot/target/linux/Makefile.in	2007-09-28 16:18:16 UTC (rev 20085)
>@@ -168,6 +168,8 @@
> 		$(LINUX26_DIR)/.config
> 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
> 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
>+else
>+	echo "CONFIG_INITRAMFS_SOURCE=\"\"" >> $(LINUX26_DIR)/.config
> endif
> ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
> 	# precedence for a small initramfs
>@@ -225,7 +227,7 @@
> 
> linux26-unpacked: $(LINUX26_DIR)/.patched
> 
>-linux26-config:	$(LINUX26_DIR)/.configured
>+linux26-config:	host-sed $(LINUX26_DIR)/.configured

Would have been nice if you had repaired that whitespace damage while
you touched that file..

>Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
>===================================================================
>--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 13:41:41 UTC (rev 20084)
>+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 16:18:16 UTC (rev 20085)
>@@ -108,8 +108,7 @@
> UCLIBC_LOCALE_DATA=
> endif
> 
>-uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
>-$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
>+$(UCLIBC_DIR)/.unpacked: dirs kernel-headers host-sed $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
> 	mkdir -p $(TOOL_BUILD_DIR)
> 	rm -rf $(UCLIBC_DIR)
> 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
>@@ -442,14 +441,16 @@
> 
> uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
> 
>-uclibc-config: host-sed $(UCLIBC_DIR)/.config
>+uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
> 
>-uclibc-oldconfig: host-sed $(UCLIBC_DIR)/.oldconfig
>+uclibc-config: $(UCLIBC_DIR)/.config

This whole block is suspicious. Previously, you could do a fresh
checkout and make uclibc-menuconfig and all was well, no superfluous
directories were made and all was clean, bright and shiny.

Please rethink this patch. A short glance leads me to believe that it's
not conceptually clean.
> 
>-uclibc-update:
>+uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
>+
>+uclibc-update: uclibc-config
> 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
> 
>-uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
>+uclibc-configured: $(UCLIBC_DIR)/.configured
> 
> uclibc-configured-source: uclibc-source
