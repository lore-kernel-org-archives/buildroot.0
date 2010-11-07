From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 19:40:21 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: move target-{finalize,
	purgelocales} after bootloader/linux step
Message-ID: <20101107184106.10A618DC00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=64d8e9a0c1e6fffb0085c65b3879a2e327649d7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2731

Bootloader and Linux kernel steps can add content to the rootfs, so ensure
the cleanup / postprocess steps are moved after those.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    1 +
 Makefile |    7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1be748b..88e061c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -77,6 +77,7 @@
 	#2563: [PATCH] cairo: Expose the configure option to disable some...
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
 	#2707: Can't compile linux kernel using buildroot + crosstool-ng
+	#2731: Build order
 	#2767: Build for lsof broken in buildroot-2010.08
 
 2010.08: Released August 31th, 2010:
diff --git a/Makefile b/Makefile
index 18ca8b3..1469e7b 100644
--- a/Makefile
+++ b/Makefile
@@ -305,15 +305,16 @@ endif
 
 include package/*/*.mk
 
+include boot/common.mk
+include target/Makefile.in
+include linux/linux.mk
+
 TARGETS+=target-finalize
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
 
-include boot/common.mk
-include target/Makefile.in
-include linux/linux.mk
 include fs/common.mk
 
 TARGETS+=erase-fakeroots
-- 
1.7.1
