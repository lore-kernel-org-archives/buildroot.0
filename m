From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Oct 2009 10:19:23 +0200
Subject: [Buildroot] [git commit master] libnl: handle all installed
	libraries
Message-ID: <20091021082035.4DB3A7777B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61901bd74a622450139358ea0c0f37d4568ad570
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnl does not only install libnl.so, but also libnl-nf.so,
libnl-genl.so and libnl-route.so. Change the post-install
and uninstall hooks to handle these libraries as well.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |   10 +++++-----
 package/libnl/libnl.mk |    4 ++++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 20290dd..b1f4135 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,11 +6,11 @@
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
-	libevent, libglib2, liblockfile, libmad, libupnp, libuuid, ltrace,
-	lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl, php,
-	python, quagga, radvd, rsync, samba, shared-mime-info, speech-tools,
-	squashfs, syslinux, u-boot, util-linux, valgrind, vsftpd, wipe,
-	wpa-supplicant, xdata_xcursor-themes, zlib
+	libevent, libglib2, liblockfile, libmad, libnl, libupnp, libuuid,
+	ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl,
+	php, python, quagga, radvd, rsync, samba, shared-mime-info,
+	speech-tools, squashfs, syslinux, u-boot, util-linux, valgrind,
+	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol
 
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 1a66746..04bac2d 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,10 +13,14 @@ LIBNL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 $(eval $(call AUTOTARGETS,package,libnl))
 
 $(LIBNL_HOOK_POST_INSTALL): $(LIBNL_TARGET_INSTALL_TARGET)
+ifneq ($(BR2_ENABLE_DEBUG),y)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl.so*
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl-*.so*
+endif
 	touch $@
 
 $(LIBNL_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
+	rm -f $(TARGET_DIR)/usr/lib/libnl-*.so*
 	rm -f $(LIBNL_TARGET_INSTALL_TARGET) $(LIBNL_HOOK_POST_INSTALL)
-- 
1.6.3.3
