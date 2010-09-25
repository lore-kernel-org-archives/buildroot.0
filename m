From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Sep 2010 23:13:09 +0200
Subject: [Buildroot] [git commit master 1/1] iproute: bump version and
	convert to gentargets
Message-ID: <20100925211656.26EBE8A4AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e07b26e0647dff3dca0a1b3a0a64cc00fb1933d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert iproute2 to gentargets and bump to version 2.6.35.

[Peter: Small fixes to uninstall]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/iproute2/Config.in   |    2 +-
 package/iproute2/iproute2.mk |   90 +++++++++++++++++-------------------------
 3 files changed, 38 insertions(+), 56 deletions(-)

diff --git a/CHANGES b/CHANGES
index 290af3a..c7be667 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,7 +20,7 @@
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
 	bmon, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
 	e2fsprogs, expat, freetype, gawk, gvfs, haserl, hostapd,
-	ifplugd, iptables, jpeg, kexec, kismet, less, libcurl,
+	ifplugd, iproute2, iptables, jpeg, kexec, kismet, less, libcurl,
 	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
 	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
 	libxslt, lighttpd, lite, m4, mdadm, metacity, mtd-utils,
diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index 0799e7c..2412d8e 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_IPROUTE2
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
 
-	  http://developer.osdl.org/dev/iproute2/
+	  http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
 
 comment "iproute2 requires a toolchain with IPv6 support"
 	depends on !BR2_INET_IPV6
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 4a713a8..0f99894 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -3,58 +3,40 @@
 # iproute2
 #
 #############################################################
-IPROUTE2_VERSION:=2.6.28
-IPROUTE2_SOURCE:=iproute2-$(IPROUTE2_VERSION).tar.bz2
-IPROUTE2_SITE:=http://developer.osdl.org/dev/iproute2/download/
-IPROUTE2_DIR:=$(BUILD_DIR)/iproute2-$(IPROUTE2_VERSION)
-IPROUTE2_CAT:=$(BZCAT)
-IPROUTE2_BINARY:=tc/tc
-IPROUTE2_TARGET_BINARY:=sbin/tc
 
-$(DL_DIR)/$(IPROUTE2_SOURCE):
-	$(call DOWNLOAD,$(IPROUTE2_SITE),$(IPROUTE2_SOURCE))
-
-iproute2-source: $(DL_DIR)/$(IPROUTE2_SOURCE)
-
-$(IPROUTE2_DIR)/.unpacked: $(DL_DIR)/$(IPROUTE2_SOURCE)
-	$(IPROUTE2_CAT) $(DL_DIR)/$(IPROUTE2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(IPROUTE2_DIR)/.configured: $(IPROUTE2_DIR)/.unpacked
-	(cd $(IPROUTE2_DIR); \
-		./configure; \
-		$(SED) '/TC_CONFIG_ATM/s:=.*:=n:' Config; \
-		$(SED) '/^CCOPTS/s:-O2.*:$(TARGET_CFLAGS):' Makefile)
-	touch $@
-
-$(IPROUTE2_DIR)/$(IPROUTE2_BINARY): $(IPROUTE2_DIR)/.configured
-	$(MAKE) \
-		-C $(IPROUTE2_DIR) \
-		KERNEL_INCLUDE=$(LINUX_SOURCE_DIR)/include \
-		CC="$(TARGET_CC)" \
-		AR=$(TARGET_CROSS)ar \
-		NETEM_DIST="" \
-		SUBDIRS="lib ip tc"
-
-$(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY): $(IPROUTE2_DIR)/$(IPROUTE2_BINARY)
-	$(INSTALL) -m 0755 $(IPROUTE2_DIR)/ip/ip $(TARGET_DIR)/sbin/ip
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/sbin/ip
-	$(INSTALL) -m 0755 $(IPROUTE2_DIR)/$(IPROUTE2_BINARY) $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-iproute2: $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
-
-iproute2-clean:
-	rm -f $(TARGET_DIR)/sbin/ip $(TARGET_DIR)/$(IPROUTE2_TARGET_BINARY)
-	-$(MAKE) -C $(IPROUTE2_DIR) clean
-
-iproute2-dirclean:
-	rm -rf $(IPROUTE2_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_IPROUTE2),y)
-TARGETS+=iproute2
-endif
+IPROUTE2_VERSION = 2.6.35
+IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
+IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
+IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
+
+define IPROUTE2_CONFIGURE_CMDS
+	# Use kernel headers
+	rm -r $(IPROUTE2_DIR)/include/netinet
+	# arpd needs berkeleydb
+	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
+	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(IPROUTE2_DIR)/Makefile
+	( cd $(@D); ./configure )
+	echo "IPT_LIB_DIR=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
+endef
+
+define IPROUTE2_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define IPROUTE2_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" SBINDIR=/sbin \
+		DOCDIR=/usr/share/doc/iproute2-$(IPROUTE2_VERSION) \
+		MANDIR=/usr/share/man install
+	# Wants bash
+	rm -f $(TARGET_DIR)/sbin/ifcfg
+endef
+
+define IPROUTE2_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/lib/tc
+	rm -rf $(TARGET_DIR)/usr/lib/tc
+	rm -rf $(TARGET_DIR)/etc/iproute2
+	rm -rf $(TARGET_DIR)/var/lib/arpd
+	rm -f $(addprefix $(TARGET_DIR)/sbin/, $(IPROUTE2_TARGET_SBINS))
+endef
+
+$(eval $(call GENTARGETS,package,iproute2))
-- 
1.7.1
