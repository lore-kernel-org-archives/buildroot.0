From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 May 2010 10:42:17 +0200
Subject: [Buildroot] [git commit master] Revert "Add -rpath option for host
	package compilation"
Message-ID: <20100530084318.C8A0EC03A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e1a7d916e9eeaa215551740de40c055130d6c073
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1789

This reverts commit 6b939d40f6a29a43277566adc9d4312d49cb3abf.

The problem this commit tries to fix is valid, but the fix unfortunately
seems to cause worse problems on certain distributions/setups, so revert
for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES             |    1 +
 package/Makefile.in |    5 -----
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index c6b64c0..26dab3c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,6 +7,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#1789: binutils fails to build for i386
 	#1843: Fix libcap build failure
 
 2010.05-rc3, Released May 27th, 2010:
diff --git a/package/Makefile.in b/package/Makefile.in
index 7ac429c..eeb9450 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -77,11 +77,6 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
-# Host packages are sometimes linked against host libraries installed
-# in $(HOST_DIR)/usr/lib. As we cannot add $(HOST_DIR)/usr/lib to
-# LD_LIBRARY_PATH when building target packages because it causes
-# libtool breakage, we force a rpath to be added to host binaries.
-HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
 
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-- 
1.6.3.3
