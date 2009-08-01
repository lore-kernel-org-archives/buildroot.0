From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 1 Aug 2009 23:17:48 +0200
Subject: [Buildroot] [git commit] ntfsprogs: new package
Message-ID: <20090801211931.A2A99777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb14fc40195ec41824f9a17c537e3b5d2fa7a3ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #247

wide collection of NTFS utilities from http://www.linux-ntfs.org/

[Peter: misc Config.in cleanups/fixes]

Signed-off-by: Olaf Rempel <razzor@kopf-tisch.de>
Tested-By: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    1 +
 package/Config.in              |    1 +
 package/ntfsprogs/Config.in    |   10 ++++++++++
 package/ntfsprogs/ntfsprogs.mk |   40 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/ntfsprogs/Config.in
 create mode 100644 package/ntfsprogs/ntfsprogs.mk

diff --git a/CHANGES b/CHANGES
index 527383c..73b3c3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,6 +19,7 @@
 	#171: xorg-server / kernel headers 2.6.26 - vm86.c compilation issue
 	#241: device mapper + lvm2: build together
 	#243: ctorrent: new package
+	#247: ntfsprogs: new package
 	#271: Library 'libgcc_s.so.1' not installed in search path
 	#287: New package libnl
 	#331: Update MPlayer to version 1.0rc2
diff --git a/package/Config.in b/package/Config.in
index bd15b62..cb5e9e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -262,6 +262,7 @@ source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
+source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/setserial/Config.in"
diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
new file mode 100644
index 0000000..38b955e
--- /dev/null
+++ b/package/ntfsprogs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NTFSPROGS
+	bool "ntfsprogs"
+	depends on BR2_USE_WCHAR
+	help
+	  wide collection of NTFS utilities
+
+	  http://www.linux-ntfs.org/
+
+comment "ntfsprogs requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
new file mode 100644
index 0000000..b34fe7a
--- /dev/null
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# ntfsprogs
+#
+#############################################################
+NTFSPROGS_VERSION:=2.0.0
+NTFSPROGS_SOURCE:=ntfsprogs-$(NTFSPROGS_VERSION).tar.gz
+NTFSPROGS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-ntfs/
+NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --program-prefix=""
+NTFSPROGS_INSTALL_STAGING:=yes
+
+NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
+NTFSPROGS_SBIN:=ntfsclone ntfscp ntfslabel ntfsresize ntfsundelete mkntfs
+
+$(eval $(call AUTOTARGETS,package,ntfsprogs))
+
+$(NTFSPROGS_TARGET_INSTALL_TARGET): $(NTFSPROGS_TARGET_INSTALL_STAGING)
+	$(call MESSAGE,"Installing to target")
+	cp -dpf $(STAGING_DIR)/usr/lib/libntfs.so* $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 0755 $(addprefix $(STAGING_DIR)/usr/bin/,$(NTFSPROGS_BIN)) $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(addprefix $(STAGING_DIR)/usr/sbin/,$(NTFSPROGS_SBIN)) $(TARGET_DIR)/usr/sbin
+	ln -s /usr/sbin/mkntfs $(TARGET_DIR)/sbin/mkfs.ntfs
+	touch $@
+
+ifeq ($(BR2_ENABLE_DEBUG),)
+$(NTFSPROGS_HOOK_POST_INSTALL): $(NTFSPROGS_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/lib/libntfs.so*
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/,$(NTFSPROGS_BIN))
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/sbin/,$(NTFSPROGS_SBIN))
+	touch $@
+endif
+
+$(NTFSPROGS_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(NTFSPROGS_DIR) uninstall
+	rm -f $(TARGET_DIR)/usr/lib/libntfs.so*
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTFSPROGS_BIN))
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(NTFSPROGS_SBIN))
+	-unlink $(TARGET_DIR)/sbin/mkfs.ntfs
+	rm -f $(NTFSPROGS_TARGET_INSTALL_STAGING) $(NTFSPROGS_TARGET_INSTALL_TARGET) $(NTFSPROGS_HOOK_POST_INSTALL)
-- 
1.6.3.3
