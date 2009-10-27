From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Oct 2009 09:28:40 +0100
Subject: [Buildroot] [git commit master] libpcap,
	tcpdump: bump version and autotoolify
Message-ID: <20091027082901.7998277737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0575682552f5614d66cfa29deb70da0bba5e7d63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    4 +-
 package/libpcap/libpcap.mk                         |   92 ++++----------------
 package/libpcap/libpcap.patch                      |   13 ---
 .../tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch   |   21 +++++
 package/tcpdump/tcpdump.mk                         |   74 ++--------------
 5 files changed, 50 insertions(+), 154 deletions(-)
 delete mode 100644 package/libpcap/libpcap.patch
 create mode 100644 package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch

diff --git a/CHANGES b/CHANGES
index 2ec699b..5d0214e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,11 +6,11 @@
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
-	libelf, libevent, libglib2, liblockfile, libmad, libupnp,
+	libelf, libevent, libglib2, liblockfile, libmad, libpcap, libupnp,
 	libuuid, ltrace, lua, lzma, mdadm, ncftp, ncurses, netkittelnet,
 	netsnmp, ntfs-3g, openssl, php, python, quagga, radvd, rsync, samba,
 	sawman, shared-mime-info, speech-tools, sqlite, squashfs, syslinux,
-	u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 491f985..272d646 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -3,83 +3,25 @@
 # libpcap
 #
 #############################################################
-# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
 
-LIBPCAP_VERSION:=0.9.8
-LIBPCAP_DIR:=$(BUILD_DIR)/libpcap-$(LIBPCAP_VERSION)
+LIBPCAP_VERSION:=1.0.0
 LIBPCAP_SITE:=http://www.tcpdump.org/release
 LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VERSION).tar.gz
-LIBPCAP_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(LIBPCAP_SOURCE):
-	 $(call DOWNLOAD,$(LIBPCAP_SITE),$(LIBPCAP_SOURCE))
-
-libpcap-source: $(DL_DIR)/$(LIBPCAP_SOURCE)
-
-$(LIBPCAP_DIR)/.unpacked: $(DL_DIR)/$(LIBPCAP_SOURCE)
-	$(LIBPCAP_CAT) $(DL_DIR)/$(LIBPCAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	rm -f $(LIBPCAP_DIR)/gencode.c.rej
-	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ \*.patch
-	$(CONFIG_UPDATE) $(LIBPCAP_DIR)
-	touch $@
-
-$(LIBPCAP_DIR)/.configured: $(LIBPCAP_DIR)/.unpacked
-	(cd $(LIBPCAP_DIR); rm -rf config.cache; \
-		ac_cv_linux_vers=$(BR2_DEFAULT_KERNEL_HEADERS) \
-		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--localstatedir=/var \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--disable-yydebug \
-		--with-pcap=linux \
-		$(DISABLE_IPV6) \
-	)
+LIBPCAP_INSTALL_STAGING:=YES
+# doesn't have an install-strip
+LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
+	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
+LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" \
+	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
+LIBPCAP_DEPENDENCIES:=zlib
+LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
+LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
+
+$(eval $(call AUTOTARGETS,package,libpcap))
+
+$(LIBPCAP_HOOK_POST_INSTALL): $(LIBPCAP_TARGET_INSTALL_TARGET)
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(wildcard $(TARGET_DIR)/usr/lib/libpcap.so*)
+endif
 	touch $@
 
-$(LIBPCAP_DIR)/libpcap.a: $(LIBPCAP_DIR)/.configured
-	$(MAKE) AR=$(TARGET_CROSS)ar -C $(LIBPCAP_DIR)
-
-$(STAGING_DIR)/usr/lib/libpcap.a: $(LIBPCAP_DIR)/libpcap.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPCAP_DIR) install
-
-libpcap: zlib $(STAGING_DIR)/usr/lib/libpcap.a
-
-libpcap-clean:
-	rm -f $(addprefix $(STAGING_DIR)/usr/,include/pcap*.h \
-					      lib/libpcap.a \
-					      share/man/man?/pcap.*)
-	-$(MAKE) -C $(LIBPCAP_DIR) clean
-
-libpcap-dirclean:
-	rm -rf $(LIBPCAP_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-TARGETS+=libpcap
-endif
diff --git a/package/libpcap/libpcap.patch b/package/libpcap/libpcap.patch
deleted file mode 100644
index 9320694..0000000
--- a/package/libpcap/libpcap.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: libpcap-0.9.8/Makefile.in
-===================================================================
---- libpcap-0.9.8.orig/Makefile.in	2007-07-24 04:35:15.000000000 +0200
-+++ libpcap-0.9.8/Makefile.in	2008-10-07 09:23:01.000000000 +0200
-@@ -103,7 +103,7 @@
- 
- libpcap.a: $(OBJ)
- 	@rm -f $@
--	ar rc $@ $(OBJ) $(LIBS)
-+	$(AR) rc $@ $(OBJ) $(LIBS)
- 	$(RANLIB) $@
- 
- shared: libpcap.$(DYEXT)
diff --git a/package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch b/package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch
new file mode 100644
index 0000000..0df50cb
--- /dev/null
+++ b/package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch
@@ -0,0 +1,21 @@
+diff -rdup tcpdump-4.0.0.oorig/print-enc.c tcpdump-4.0.0/print-enc.c
+--- tcpdump-4.0.0.oorig/print-enc.c	2008-09-01 04:44:22.000000000 +0200
++++ tcpdump-4.0.0/print-enc.c	2009-10-07 21:21:41.000000000 +0200
+@@ -72,14 +72,16 @@ enc_if_print(const struct pcap_pkthdr *h
+ 	length -= ENC_HDRLEN;
+ 	caplen -= ENC_HDRLEN;
+ 	p += ENC_HDRLEN;
+-	
++
+ 	switch (hdr->af) {
+ 	case AF_INET:
+ 		ip_print(gndo, p, length);
+ 		break;
++#ifdef INET6
+ 	case AF_INET6:
+ 		ip6_print(p, length);
+ 		break;
++#endif /*INET6*/
+ 	}
+ 
+ out:
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 2976779..183df94 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -6,73 +6,19 @@
 # Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
 
-TCPDUMP_VERSION:=3.9.5
-TCPDUMP_DIR:=$(BUILD_DIR)/tcpdump-$(TCPDUMP_VERSION)
+TCPDUMP_VERSION:=4.0.0
 TCPDUMP_SITE:=http://www.tcpdump.org/release
 TCPDUMP_SOURCE:=tcpdump-$(TCPDUMP_VERSION).tar.gz
-TCPDUMP_CAT:=$(ZCAT)
+# no install-strip/install-exec
+TCPDUMP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" install
+TCPDUMP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
+TCPDUMP_CONF_OPT:=--without-crypto \
+		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
+TCPDUMP_DEPENDENCIES:=zlib libpcap
 
-ifneq ($(BR2_PACKAGE_TCPDUMP_SMB),y)
-TCPDUMP_ENABLE_SMB:=--disable-smb
-else
-TCPDUMP_ENABLE_SMB:=--enable-smb
-endif
+$(eval $(call AUTOTARGETS,package,tcpdump))
 
-$(DL_DIR)/$(TCPDUMP_SOURCE):
-	 $(call DOWNLOAD,$(TCPDUMP_SITE),$(TCPDUMP_SOURCE))
-
-tcpdump-source: $(DL_DIR)/$(TCPDUMP_SOURCE)
-
-$(TCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(TCPDUMP_SOURCE)
-	$(TCPDUMP_CAT) $(DL_DIR)/$(TCPDUMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TCPDUMP_DIR) package/tcpdump tcpdump\*.patch
-	$(CONFIG_UPDATE) $(TCPDUMP_DIR)
-	touch $@
-
-$(TCPDUMP_DIR)/.configured: $(TCPDUMP_DIR)/.unpacked
-	(cd $(TCPDUMP_DIR); rm -f config.cache; \
-		ac_cv_linux_vers=$(BR2_DEFAULT_KERNEL_HEADERS) \
-		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		--without-crypto \
-		$(TCPDUMP_ENABLE_SMB) \
-		$(DISABLE_IPV6) \
-	)
-	$(SED) '/HAVE_PCAP_DEBUG/d' $(TCPDUMP_DIR)/config.h
+$(TCPDUMP_HOOK_POST_INSTALL): $(TCPDUMP_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/tcpdump
 	touch $@
 
-$(TCPDUMP_DIR)/tcpdump: $(TCPDUMP_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" \
-		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
-		LIBS="-lpcap" \
-		INCLS="-I. -I$(STAGING_DIR)/usr/include" \
-		-C $(TCPDUMP_DIR)
-
-$(TARGET_DIR)/usr/sbin/tcpdump: $(TCPDUMP_DIR)/tcpdump
-	cp -f $< $@
-	$(STRIPCMD) $@
-
-tcpdump: zlib libpcap $(TARGET_DIR)/usr/sbin/tcpdump
-
-tcpdump-clean:
-	rm -f $(TARGET_DIR)/usr/sbin/tcpdump
-	-$(MAKE) -C $(TCPDUMP_DIR) clean
-
-tcpdump-dirclean:
-	rm -rf $(TCPDUMP_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TCPDUMP),y)
-TARGETS+=tcpdump
-endif
-- 
1.6.3.3
