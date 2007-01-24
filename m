From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jan 2007 18:23:46 +0100
Subject: [Buildroot] [PATCH] Add fbv (Framebuffer Viewer) and fbset
	utility
In-Reply-To: <1169652537.21018.6.camel@elrond.sweden.atmel.com>
References: <1169652537.21018.6.camel@elrond.sweden.atmel.com>
Message-ID: <20070124172346.GC13003@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 24, 2007 at 04:28:57PM +0100, Ulf Samuelsson wrote:
>Add support for:
>
>fbset:	Framebuffer configuration utiltiy
>fbv:	Framebuffer Viewer
>
>Best Regards,
>Ulf Samuelsson

>Author:	Ulf Samuelsson
>Date:	2007-01-24
>
>Log:
>Add fbset	- Framebuffer configuration utility
>Add fbv		- Framebuffer viewer
>
>Modified:
>	package/Config.in
>	package/fbset/Config.in
>	package/fbset/fbset.mk
>	package/fbv/Config.in
>	package/fbv/fbv.mk
>
>Changeset
>Modified: package/Config.in
>	  package/fbset/Config.in
>	  package/fbset/fbset.mk
>	  package/fbv/Config.in
>	  package/fbv/fbv.mk
>
>diff -urN buildroot-0rig/package/Config.in buildroot/package/Config.in
>--- buildroot-0rig/package/Config.in	2007-01-23 11:07:09.000000000 +0100
>+++ buildroot/package/Config.in	2007-01-24 16:18:34.000000000 +0100
>@@ -249,6 +249,10 @@
> comment "text rendering applications"
> source "package/dialog/Config.in"
> 
>+comment "Framebuffer Utilities"
>+source "package/fbset/Config.in"
>+source "package/fbv/Config.in"
>+
> comment "graphic libraries"
> source "package/directfb/Config.in"
> source "package/jpeg/Config.in"
>diff -urN buildroot-0rig/package/fbset/Config.in buildroot/package/fbset/Config.in
>--- buildroot-0rig/package/fbset/Config.in	1970-01-01 01:00:00.000000000 +0100
>+++ buildroot/package/fbset/Config.in	2007-01-24 16:13:16.000000000 +0100
>@@ -0,0 +1,5 @@
>+config BR2_PACKAGE_FBSET
>+	bool "fbset"
>+	default n
>+	help
>+	  Frame Buffer Set 

Please add a bit more description and an URL to the help-text.

>diff -urN buildroot-0rig/package/fbset/fbset.mk buildroot/package/fbset/fbset.mk
>--- buildroot-0rig/package/fbset/fbset.mk	1970-01-01 01:00:00.000000000 +0100
>+++ buildroot/package/fbset/fbset.mk	2007-01-24 16:12:42.000000000 +0100
>@@ -0,0 +1,102 @@
>+#############################################################
>+#
>+# fbset
>+#
>+#############################################################
>+FBSET_SOURCE:=fbset-2.1.tar.gz

Please use FBSET_VERSION:=2.1


>+FBSET_PATCH:=fbset-2.1-avr32.patch

FBSET_PATCH:=fbset-$(FBSET_VERSION)-avr32.patch

>+FBSET_SITE:=$(BR2_AVR32_MIRROR)/f/fbset

I can't seem to find a BR2_AVR32_MIRROR ?
Does the version at
http://ftp.debian.org/debian/pool/main/f/fbset
work for you?

Specifically
FBSET_SOURCE:=fbset_$(FBSET_VERSION).orig.tar.gz
FBSET_PATCH:=fbset_$(FBSET_VERSION)-19.diff.gz

>+FBSET_DIR:=$(BUILD_DIR)/fbset-2.1

likewise

>+FBSET_CAT:=bzcat

See helptext for 
$ grep ZCAT Config.in

>+FBSET_BINARY:=fbset
>+FBSET_TARGET_BINARY:=usr/sbin/fbset
>+
>+$(DL_DIR)/$(FBSET_SOURCE):
>+	 $(WGET) -P $(DL_DIR) $(FBSET_SITE)/$(FBSET_SOURCE)
>+
>+$(DL_DIR)/$(FBSET_PATCH):
>+	 $(WGET) -P $(DL_DIR) $(FBSET_SITE)/$(FBSET_PATCH)
>+
>+fbset-source: $(DL_DIR)/$(FBSET_SOURCE) $(DL_DIR)/$(FBSET_PATCH)
>+
>+$(FBSET_DIR)/.unpacked: $(DL_DIR)/$(FBSET_SOURCE) $(DL_DIR)/$(FBSET_PATCH)
>+	$(FBSET_CAT) $(DL_DIR)/$(FBSET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
->+	#toolchain/patch-kernel.sh $(FBSET_DIR) $(DL_DIR) $(FBSET_PATCH)

	toolchain/patch-kernel.sh $(FBSET_DIR) $(DL_DIR) $(FBSET_PATCH)
	toolchain/patch-kernel.sh $(FBSET_DIR) $(FBSET_DIR)/debian/patches \*.patch

>+	touch $(FBSET_DIR)/.unpacked

I prefer $@ instead here and also below
>+
>+$(FBSET_DIR)/.configured: $(FBSET_DIR)/.unpacked
>+	(cd $(FBSET_DIR); autoconf; rm -rf config.cache; \

Remove that autoconf.
I want to remove all users of 

>+		$(TARGET_CONFIGURE_OPTS) \
>+		CFLAGS="$(TARGET_CFLAGS)" \
>+		./configure \
>+		--target=$(GNU_TARGET_NAME) \
>+		--host=$(GNU_TARGET_NAME) \
>+		--build=$(GNU_HOST_NAME) \
>+		--prefix=/usr \
>+		--exec-prefix=/usr \
>+		--bindir=/usr/bin \
>+		--sbindir=/usr/sbin \
>+		--libexecdir=/usr/lib \
>+		--sysconfdir=/etc \
>+		--datadir=/usr/share \
>+		--localstatedir=/var \
>+		--mandir=/usr/man \
>+		--infodir=/usr/info \
>+		$(DISABLE_NLS) \
>+		$(DISABLE_LARGEFILE) \
>+	);
>+	touch $(FBSET_DIR)/.configured
>+
>+$(FBSET_DIR)/$(FBSET_BINARY): $(FBSET_DIR)/.configured
>+	$(MAKE) -C $(FBSET_DIR)
>+
>+$(TARGET_DIR)/$(FBSET_TARGET_BINARY): $(FBSET_DIR)/$(FBSET_BINARY)
>+	$(MAKE1) \
>+	    prefix=$(TARGET_DIR)/usr \
>+	    exec_prefix=$(TARGET_DIR)/usr \
>+	    bindir=$(TARGET_DIR)/usr/bin \
>+	    sbindir=$(TARGET_DIR)/usr/sbin \
>+	    libexecdir=$(TARGET_DIR)/usr/lib \
>+	    datadir=$(TARGET_DIR)/usr/share \
>+	    sysconfdir=$(TARGET_DIR)/etc \
>+	    sharedstatedir=$(TARGET_DIR)/usr/com \
>+	    localstatedir=$(TARGET_DIR)/var \
>+	    libdir=$(TARGET_DIR)/usr/lib \
>+	    infodir=$(TARGET_DIR)/usr/info \
>+	    mandir=$(TARGET_DIR)/usr/man \
>+	    includedir=$(TARGET_DIR)/usr/include \
>+	    -C $(FBSET_DIR) install
>+	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
>+		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc

May i suggest to just copy and strip the binary/binaries?

>+
>+fbset: uclibc $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
>+
>+fbset-clean:
>+	$(MAKE) \
>+	    prefix=$(TARGET_DIR)/usr \
>+	    exec_prefix=$(TARGET_DIR)/usr \
>+	    bindir=$(TARGET_DIR)/usr/bin \
>+	    sbindir=$(TARGET_DIR)/usr/sbin \
>+	    libexecdir=$(TARGET_DIR)/usr/lib \
>+	    datadir=$(TARGET_DIR)/usr/share \
>+	    sysconfdir=$(TARGET_DIR)/etc \
>+	    sharedstatedir=$(TARGET_DIR)/usr/com \
>+	    localstatedir=$(TARGET_DIR)/var \
>+	    libdir=$(TARGET_DIR)/usr/lib \
>+	    infodir=$(TARGET_DIR)/usr/info \
>+	    mandir=$(TARGET_DIR)/usr/man \
>+	    includedir=$(TARGET_DIR)/usr/include \
>+		-C $(FBSET_DIR) uninstall
>+	-$(MAKE) -C $(FBSET_DIR) clean
>+
>+fbset-dirclean:
>+	rm -rf $(FBSET_DIR)
>+
>+#############################################################
>+#
>+# Toplevel Makefile options
>+#
>+#############################################################
>+ifeq ($(strip $(BR2_PACKAGE_FBSET)),y)
>+TARGETS+=fbset
>+endif
[snip]
