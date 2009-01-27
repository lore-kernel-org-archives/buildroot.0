From: Amand Tihon <amand.tihon@alrj.org>
Date: Tue, 27 Jan 2009 17:57:19 +0100
Subject: [Buildroot] [PATCH] Add radvd to the list of packages
Message-ID: <200901271757.28001.amand.tihon@alrj.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add radvd, the IPv6 router advertisement daemon.

Signed-off-by: Amand Tihon <amand.tihon@alrj.org>
---

Note that it has only been tested on avr32 (ngw100) using Atmel's latest 
stable buildroot (v2.3.0). A basic init script is included.

On a side note, if anywone knows why the binaries are installed as 
"/usr/sbin/avr32-linux-radvd*" instead of simply "/usr/sbin/radvd-*", I'd
be happy to be know how to correct that behaviour.

Thanks in advance, and please bear with me if there's anything wrong. I'm 
fairly new to Builroot.

 package/Config.in                   |    1 +
 package/radvd/Config.in             |    9 +++++
 package/radvd/S50radvd              |   18 ++++++++++
 package/radvd/radvd-1.2-avr32.patch |   21 +++++++++++
 package/radvd/radvd.mk              |   64 +++++++++++++++++++++++++++++++++++
 5 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 package/radvd/Config.in
 create mode 100644 package/radvd/S50radvd
 create mode 100644 package/radvd/radvd-1.2-avr32.patch
 create mode 100644 package/radvd/radvd.mk

diff --git a/package/Config.in b/package/Config.in
index 29190b2..bb16015 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ source "package/openvpn/Config.in"
 source "package/openswan/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
+source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
new file mode 100644
index 0000000..12ad762
--- /dev/null
+++ b/package/radvd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RADVD
+	bool "radvd"
+	default n
+	select BR2_PACKAGE_FLEX
+	depends on BR2_PACKAGE_KMOD_IPV6
+	help
+	  IPv6 Router Advertisement Daemon.
+	
+	  http://www.litech.org/radvd/
diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
new file mode 100644
index 0000000..d3e2cd1
--- /dev/null
+++ b/package/radvd/S50radvd
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+RADVD=/usr/sbin/radvd
+
+echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+
+echo -n "Starting radvd: "
+if [ ! -x "${RADVD}" ]; then
+	echo "missing"
+	exit 1
+fi
+
+if ${RADVD} ; then
+	echo "done"
+else
+	echo "failed"
+	exit 1
+fi
diff --git a/package/radvd/radvd-1.2-avr32.patch b/package/radvd/radvd-1.2-avr32.patch
new file mode 100644
index 0000000..4e7b4ce
--- /dev/null
+++ b/package/radvd/radvd-1.2-avr32.patch
@@ -0,0 +1,21 @@
+diff -ru radvd-1.2_vanilla/config.sub radvd-1.2/config.sub
+--- radvd-1.2_vanilla/config.sub	2003-11-21 15:53:23.000000000 +0100
++++ radvd-1.2/config.sub	2009-01-25 14:40:12.000000000 +0100
+@@ -228,7 +228,7 @@
+ 	| a29k \
+ 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
+ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
+-	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr \
++	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
+ 	| c4x | clipper \
+ 	| d10v | d30v | dsp16xx \
+ 	| fr30 \
+@@ -282,7 +282,7 @@
+ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
+ 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
+ 	| arm-*  | armbe-* | armle-* | armv*-* \
+-	| avr-* \
++	| avr-* | avr32-* \
+ 	| bs2000-* \
+ 	| c[123]* | c30-* | [cjt]90-* | c54x-* \
+ 	| clipper-* | cray2-* | cydra-* \
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
new file mode 100644
index 0000000..29f4d8d
--- /dev/null
+++ b/package/radvd/radvd.mk
@@ -0,0 +1,64 @@
+#############################################################
+#
+# radvd
+#
+#############################################################
+
+RADVD_VERSION=1.2
+RADVD_SOURCE=radvd-$(RADVD_VERSION).tar.gz
+RADVD_SITE=http://www.litech.org/radvd/dist/
+RADVD_DIR=$(BUILD_DIR)/radvd-$(RADVD_VERSION)
+RADVD_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(RADVD_SOURCE):
+	$(WGET) -P $(DL_DIR) $(RADVD_SITE)/$(RADVD_SOURCE)
+
+$(RADVD_DIR)/.unpacked: $(DL_DIR)/$(RADVD_SOURCE)
+	$(RADVD_CAT) $(DL_DIR)/$(RADVD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(RADVD_DIR) package/radvd/ \*.patch*
+	touch $(RADVD_DIR)/.unpacked
+
+$(RADVD_DIR)/.configured: $(RADVD_DIR)/.unpacked
+	(cd $(RADVD_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--with-configfile=/etc/radvd.conf \
+	)
+	touch $(RADVD_DIR)/.configured
+
+$(RADVD_DIR)/radvd: $(RADVD_DIR)/.configured
+	$(MAKE1) CC=$(TARGET_CC) -C $(RADVD_DIR)
+
+$(TARGET_DIR)/usr/sbin/radvd: $(RADVD_DIR)/radvd
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(RADVD_DIR) install-strip
+	mv $(TARGET_DIR)/usr/sbin/$(ARCH)-linux-radvd \
+		$(TARGET_DIR)/usr/sbin/radvd
+	mv $(TARGET_DIR)/usr/sbin/$(ARCH)-linux-radvdump \
+		$(TARGET_DIR)/usr/sbin/radvdump
+	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
+
+radvd: flex uclibc $(TARGET_DIR)/usr/sbin/radvd
+
+radvd-source: $(DL_DIR)/$(RADVD_SOURCE)
+
+radvd-clean:
+	-$(MAKE) -C $(RADVD_DIR) clean
+	rm -f $(TARGET_DIR)/usr/sbin/radvd
+	rm -f $(TARGET_DIR)/etc/radvd.conf.example
+
+radvd-dirclean:
+	rm -rf $(RADVD_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_RADVD),y)
+TARGETS+=radvd
+endif


-- 
Amand Tihon
Rue du Ruchaux, 1 - 1490 Court-St-Etienne, Belgique
+32 479 207 743
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part.
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090127/e0d749d9/attachment.pgp 
