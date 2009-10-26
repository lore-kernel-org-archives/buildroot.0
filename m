From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 19:15:11 +0100
Subject: [Buildroot] [git commit master] Revert "libnl: handle all installed
	libraries"
Message-ID: <20091026181616.11356777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ebc5683545678736b1940243968394ae892b258
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 61901bd74a622450139358ea0c0f37d4568ad570.

Turns out the libnl splitup is only needed for the not-released-yet v2.0.

Conflicts:

	CHANGES
---
 CHANGES                |    2 +-
 package/libnl/libnl.mk |    4 ----
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index b35a121..2ec699b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
-	libelf, libevent, libglib2, liblockfile, libmad, libnl, libupnp,
+	libelf, libevent, libglib2, liblockfile, libmad, libupnp,
 	libuuid, ltrace, lua, lzma, mdadm, ncftp, ncurses, netkittelnet,
 	netsnmp, ntfs-3g, openssl, php, python, quagga, radvd, rsync, samba,
 	sawman, shared-mime-info, speech-tools, sqlite, squashfs, syslinux,
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 04bac2d..1a66746 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,14 +13,10 @@ LIBNL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 $(eval $(call AUTOTARGETS,package,libnl))
 
 $(LIBNL_HOOK_POST_INSTALL): $(LIBNL_TARGET_INSTALL_TARGET)
-ifneq ($(BR2_ENABLE_DEBUG),y)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl.so*
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl-*.so*
-endif
 	touch $@
 
 $(LIBNL_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
-	rm -f $(TARGET_DIR)/usr/lib/libnl-*.so*
 	rm -f $(LIBNL_TARGET_INSTALL_TARGET) $(LIBNL_HOOK_POST_INSTALL)
-- 
1.6.3.3
