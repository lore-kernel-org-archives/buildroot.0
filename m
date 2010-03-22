From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Mar 2010 15:19:42 +0100
Subject: [Buildroot] [git commit master] memstat: bump to 0.8 and migrate to
	Makefile.package.in
Message-ID: <20100322145738.1DD1E77716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3b90d69843ffc38f20db7c864a47072dcd5a845c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1129

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    4 ++-
 package/memstat/memstat.mk |   66 ++++++++++++++------------------------------
 2 files changed, 24 insertions(+), 46 deletions(-)

diff --git a/CHANGES b/CHANGES
index efc1136..9b1c1af 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,11 +6,13 @@
 	X.org updated to 7.5.
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	libglib2, libpng, mtd-utils, pppd, setserial, squashfs, wget
+	libglib2, libpng, memstat, mtd-utils, pppd, setserial,
+	squashfs, wget
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
+	#1129: Bump memstat to 0.8 and migrate to Makefile.package.in
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index a54509a..75c7875 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -4,48 +4,24 @@
 #
 #############################################################
 
-MEMSTAT_VERSION:=0.5
-MEMSTAT_SOURCE:=memstat_$(MEMSTAT_VERSION).tar.gz
-MEMSTAT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/memstat
-MEMSTAT_DIR:=$(BUILD_DIR)/memstat-$(MEMSTAT_VERSION)
-
-$(DL_DIR)/$(MEMSTAT_SOURCE):
-	$(call DOWNLOAD,$(MEMSTAT_SITE),$(MEMSTAT_SOURCE))
-
-$(MEMSTAT_DIR)/.unpacked: $(DL_DIR)/$(MEMSTAT_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MEMSTAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MEMSTAT_DIR) package/memstat/ memstat-$(MEMSTAT_VERSION)\*.patch
-	touch $@
-
-$(MEMSTAT_DIR)/.configured: $(MEMSTAT_DIR)/.unpacked
-	touch $@
-
-$(MEMSTAT_DIR)/memstat: $(MEMSTAT_DIR)/.configured
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-		$(CFLAGS_WHOLE_PROGRAM) $(@D)/memstat.c -o $@
-
-$(TARGET_DIR)/usr/bin/memstat: $(MEMSTAT_DIR)/memstat
-	[ -e $(TARGET_DIR)/etc/memstat.conf ] || \
-		$(INSTALL) -m 0644 -D $(^D)/memstat.conf \
-			$(TARGET_DIR)/etc/memstat.conf
-	$(INSTALL) -m 0755 -D $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-memstat: $(TARGET_DIR)/usr/bin/memstat
-
-memstat-source: $(DL_DIR)/$(MEMSTAT_SOURCE)
-
-memstat-clean:
-	rm -f $(MEMSTAT_DIR)/memstat \
-		$(TARGET_DIR)/etc/memstat.conf $(TARGET_DIR)/usr/bin/memstat
-
-memstat-dirclean:
-	rm -rf $(MEMSTAT_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MEMSTAT),y)
-TARGETS+=memstat
-endif
+MEMSTAT_VERSION = 0.8
+MEMSTAT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/memstat
+MEMSTAT_SOURCE = memstat_$(MEMSTAT_VERSION).tar.gz
+
+define MEMSTAT_BUILD_CMDS
+	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) CFLAGS="$(TARGET_CFLAGS)" \
+		-C $(@D) memstat
+endef
+
+define MEMSTAT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/memstat.conf -m 0644 \
+		$(TARGET_DIR)/etc/memstat.conf
+	$(INSTALL) -D $(@D)/memstat $(TARGET_DIR)/usr/bin/memstat
+endef
+
+define MEMSTAT_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/etc/memstat.conf
+	rm -f $(TARGET_DIR)/usr/bin/memstat
+endef
+
+$(eval $(call GENTARGETS,package,memstat))
-- 
1.6.3.3
