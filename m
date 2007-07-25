From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 26 Jul 2007 01:15:20 +0200
Subject: [Buildroot] [RFC] openswan 2.4.9 patch
Message-ID: <1185405320.5580.13.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package/openswan directory is quite large.
The way the makefile is designed, each kernel has
to have its own set of patches.
If several kernels are to be supported, then 
there will be multiple copies of the patches.

There are two key patches needed, the "klips" and the "natt" patch.
The "klips" patch is about 1,8 MB and the "natt" patch is a few kB.
The "natt" patch seems to be broken for new/ipvr/udp.c.

I think that it would be good to be able to select the 
real openswan version, and download the "klips" patch
instead of storing it in the buildroot tree.

The change would allow all (patchable) kernels to be supported
and would reduce the buildroot tree by about 5.4MB.

Comments?

A real patch would also remove the
"linux-*-openswan-*.kernel-2.6-klips.patch" files from 
package/openswan/

Other "linux-*-openswan-$(VERSION).kernel-2.6-XXX.patch" would 
be moved to "$(VERSION)/linux-openswan-$(VERSION).kernel-2.6-XXX.patch"

There are some test targets which maybe should be removed

Index: package/openswan/openswan.mk
===================================================================
--- package/openswan/openswan.mk	(revision 19263)
+++ package/openswan/openswan.mk	(arbetskopia)
@@ -6,14 +6,21 @@
 # to enable that within busybox
 #
 #############################################################
-OPENSWAN_VERSION:=2.4.8
+OPENSWAN_VERSION:=$(strip $(subst ",,$(BR2_PACKAGE_OPENSWAN_VERSION)))
+#"))
+ifeq ($(OPENSWAN_VERSION),)
+OPENSWAN_VERSION:=2.4.9
+endif
 OPENSWAN_SOURCE:=openswan-$(OPENSWAN_VERSION).tar.gz
-OPENSWAN_SITE:=http://www.openswan.org/download/
+OPENSWAN_SITE:=http://www.openswan.org/download
 OPENSWAN_DIR:=$(BUILD_DIR)/openswan-$(OPENSWAN_VERSION)
 OPENSWAN_CAT:=$(ZCAT)
 OPENSWAN_BINARY:=programs/pluto/pluto
 OPENSWAN_TARGET_BINARY:=usr/sbin/ipsec
 
+OPENSWAN_NATT_PATCH:=openswan-$(OPENSWAN_VERSION).kernel-2.6-natt.patch.gz
+OPENSWAN_KLIPS_PATCH:=openswan-$(OPENSWAN_VERSION).kernel-2.6-klips.patch.gz
+
 ifneq ($(BR2_PACKAGE_OPENSWAN_DEBUGGING),y)
 OPENSWAN_CFLAGS=-UDEBUG -DNO_DEBUG -ULEAK_DETECTIVE
 endif
@@ -21,11 +28,21 @@
 $(DL_DIR)/$(OPENSWAN_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(OPENSWAN_SITE)/$(OPENSWAN_SOURCE)
 
-openswan-source: $(DL_DIR)/$(OPENSWAN_SOURCE)
+$(DL_DIR)/$(OPENSWAN_NATT_PATCH):
+	 $(WGET) -P $(DL_DIR) $(OPENSWAN_SITE)/$(OPENSWAN_NATT_PATCH)
 
+$(DL_DIR)/$(OPENSWAN_KLIPS_PATCH):
+	 $(WGET) -P $(DL_DIR) $(OPENSWAN_SITE)/$(OPENSWAN_KLIPS_PATCH)
+
+openswan-source: $(DL_DIR)/$(OPENSWAN_SOURCE)		\
+		$(DL_DIR)/$(OPENSWAN_NATT_PATCH)	\
+		$(DL_DIR)/$(OPENSWAN_KLIPS_PATCH)
+
 $(OPENSWAN_DIR)/.unpacked: $(DL_DIR)/$(OPENSWAN_SOURCE)
 	$(OPENSWAN_CAT) $(DL_DIR)/$(OPENSWAN_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(OPENSWAN_DIR) package/openswan/ openswan
\*.patch
+	toolchain/patch-kernel.sh $(OPENSWAN_DIR) \
+		package/openswan/$(OPENSWAN_VERSION)/ \
+		openswan-$(OPENSWAN_VERSION)\*.patch
 	touch $(OPENSWAN_DIR)/.unpacked
 
 $(OPENSWAN_DIR)/$(OPENSWAN_BINARY): $(OPENSWAN_DIR)/.unpacked
@@ -54,6 +71,11 @@
 openswan-dirclean:
 	rm -rf $(OPENSWAN_DIR)
 
+.PHONY:	openswan-test
+
+openswan-test: $(OPENSWAN_DIR)/.unpacked
+
+
 #############################################################
 #
 # Toplevel Makefile options
Index: package/openswan/Config.in
===================================================================
--- package/openswan/Config.in	(revision 19263)
+++ package/openswan/Config.in	(arbetskopia)
@@ -7,6 +7,35 @@
 	  Openswan is an implementation of IPsec for Linux.
           http://openswan.org/
 
+choice
+	prompt "Openswan version"
+	depends on BR2_PACKAGE_OPENSWAN
+	default BR2_PACKAGE_OPENSWAN_2_4_9
+
+config BR2_PACKAGE_OPENSWAN_2_4_9
+	bool "Openswan version 2.4.9"
+	help
+	  Use patch for linux-2.6.21 and later
+
+config BR2_PACKAGE_OPENSWAN_2_4_8
+	bool "Openswan version 2.4.8"
+	help
+	  Use patch for linux-2.6.21 and later
+
+config BR2_PACKAGE_OPENSWAN_2_4_7
+	bool "Openswan version 2.4.7"
+	help
+	  Use patch for linux-2.6.20 and earlier
+
+endchoice
+
+config	BR2_PACKAGE_OPENSWAN_VERSION
+	string
+	default	""		if	!BR2_PACKAGE_OPENSWAN
+	default	"2.4.7"		if	BR2_PACKAGE_OPENSWAN_2_4_7
+	default	"2.4.8"		if	BR2_PACKAGE_OPENSWAN_2_4_8
+	default	"2.4.9"		if	BR2_PACKAGE_OPENSWAN_2_4_9
+
 config BR2_PACKAGE_OPENSWAN_DEBUGGING
 	bool "debugging support"
 	default n
Index: toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- toolchain/kernel-headers/kernel-headers-new.makefile	(revision
19263)
+++ toolchain/kernel-headers/kernel-headers-new.makefile	(arbetskopia)
@@ -33,6 +33,10 @@
 LINUX_HEADERS_IS_KERNEL=y
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSWAN),y)
+OPENSWAN_PATCH:=$(LINUX_HEADERS_UNPACK_DIR)/.openswan
+endif
+
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked:
$(DL_DIR)/$(LINUX_HEADERS_SOURCE)
@@ -44,13 +48,22 @@
 $(LINUX_HEADERS_UNPACK_DIR)/.patched:
$(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-ifeq ($(BR2_PACKAGE_OPENSWAN),y)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan
\
-		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-endif
 	touch $@
 
-$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
+$(LINUX_HEADERS_UNPACK_DIR)/.openswan:
$(LINUX_HEADERS_UNPACK_DIR)/.patched	openswan-source
+	(cd $(LINUX_HEADERS_UNPACK_DIR); \
+	 @echo "*** Patching headers with $(OPENSWAN_KLIPS_PATCH)";		\
+	 $(OPENSWAN_CAT) $(DL_DIR)/$(OPENSWAN_KLIPS_PATCH)	| patch -p1;	\
+	)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
package/openswan/$(OPENSWAN_VERSION) \
+		linux-openswan-$(OPENSWAN_VERSION)\*.patch{,.gz,.bz2}
+	touch $@
+
+#	 @echo "*** Patching headers with $(OPENSWAN_NATT_PATCH)";		\
+#	 $(OPENSWAN_CAT) $(DL_DIR)/$(OPENSWAN_NATT_PATCH)	| patch -p1;	\
+
+
+$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
$(OPENSWAN_PATCH)
 	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
 	 $(MAKE) ARCH=$(KERNEL_ARCH) CC="$(HOSTCC)" \
 		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install ; \
@@ -58,3 +71,5 @@
 	touch $@
 
 endif
+
+headers:	$(LINUX_HEADERS_UNPACK_DIR)/.openswan


Best Regards
Ulf Samuelsson
