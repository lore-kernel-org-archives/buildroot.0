From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 09:58:45 +0200
Subject: [Buildroot] [git commit master 1/1] thttpd: don't use parallel make
Message-ID: <20100927080008.600088B6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fa0d2d142ce827736881ba52ba1bfa0c6bce9122
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The thttpd build system isn't safe for parallel makes, as sometimes
match.o isn't built by the time it is referenced.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    4 ++--
 package/thttpd/thttpd.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4fa011f..ddace92 100644
--- a/CHANGES
+++ b/CHANGES
@@ -32,8 +32,8 @@
 	ntfsprogs, ntp, openntpd, openssh, openvpn, oprofile, pango,
 	pcre, php, prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
 	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
-	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
-	which, xlib_libX11, zlib
+	tcpdump, thttpd, tiff, tn5250, udev, udpcast, usbmount,
+	usbutils, which, xlib_libX11, zlib
 
 	Deprecated packages: hotplug, lzma
 
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index ca72fae..d32462e 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -35,7 +35,7 @@ $(THTTPD_DIR)/.configured: $(THTTPD_DIR)/.unpacked
 	touch $(THTTPD_DIR)/.configured
 
 $(THTTPD_DIR)/$(THTTPD_BINARY): $(THTTPD_DIR)/.configured
-	$(MAKE) -C $(THTTPD_DIR)
+	$(MAKE1) -C $(THTTPD_DIR)
 
 $(TARGET_DIR)/$(THTTPD_TARGET_BINARY): $(THTTPD_DIR)/$(THTTPD_BINARY)
 	install -D $(THTTPD_DIR)/$(THTTPD_BINARY) $(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
-- 
1.7.1
