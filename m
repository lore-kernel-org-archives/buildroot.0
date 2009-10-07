From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Oct 2009 10:16:31 +0200
Subject: [Buildroot] [git commit master] ntfs-3g: get rid of special target
	install handling
Message-ID: <20091007081651.8EFD3777A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e90302ae2b7f9e9f54099b102dd23e63fe056398
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile.autotools.in defaults are sufficient.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/ntfs-3g/ntfs-3g.mk |   22 ----------------------
 2 files changed, 1 insertions(+), 23 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5479361..3415011 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	festival, imagemagick, iptables, kernel-headers, kismet,
 	libevent, libglib2, liblockfile, libmad, libupnp, libuuid, ltrace,
-	lua, mdadm, ncftp, ncurses, netkittelnet, openssl, python,
+	lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl, python,
 	quagga, radvd, samba, shared-mime-info, speech-tools,
 	squashfs, syslinux, u-boot, util-linux, valgrind, vsftpd, wipe,
 	wpa-supplicant, xdata_xcursor-themes, zlib
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index efe15fa..a372d42 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -10,25 +10,3 @@ NTFS_3G_CONF_OPT:=--disable-ldconfig --program-prefix=""
 NTFS_3G_INSTALL_STAGING:=yes
 
 $(eval $(call AUTOTARGETS,package,ntfs-3g))
-
-$(NTFS_3G_TARGET_INSTALL_TARGET): $(NTFS_3G_TARGET_INSTALL_STAGING)
-	$(call MESSAGE,"Installing to target")
-	cp -dpf $(STAGING_DIR)/usr/lib/libntfs-3g.so* $(TARGET_DIR)/lib/
-	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/bin/ntfs-3g $(TARGET_DIR)/bin/
-	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/bin/ntfs-3g.probe $(TARGET_DIR)/bin/
-	touch $@
-
-ifeq ($(BR2_ENABLE_DEBUG),)
-$(NTFS_3G_HOOK_POST_INSTALL): $(NTFS_3G_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/bin/ntfs-3g
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/bin/ntfs-3g.probe
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/lib/libntfs-3g.so*
-	touch $@
-endif
-
-$(NTFS_3G_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(NTFS_3G_DIR) uninstall
-	rm -f $(TARGET_DIR)/lib/libntfs-3g*
-	rm -f $(TARGET_DIR)/bin/ntfs-3g $(TARGET_DIR)/bin/ntfs-3g.probe
-	rm -f $(NTFS_3G_TARGET_INSTALL_STAGING) $(NTFS_3G_TARGET_INSTALL_TARGET) $(NTFS_3G_HOOK_POST_INSTALL)
-- 
1.6.3.3
