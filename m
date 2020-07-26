From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jul 2020 09:10:18 +0200
Subject: [Buildroot] [git commit] package/libwebsockets: remove dependency
 on mmu
Message-ID: <20200726070607.B6FE388430@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad953b0149abf13715d7bcfbe8eac1a1b6e6c2c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Six years ago, commit b6b5bb518d28850e024b90db1129b7f86e9d416c added the MMU
dependency for the libwebsockets package. However, according to the git
history of the CMakeLists.txt file, libwebsockets has supported the vfork
function for at least the last five years.

After testing with the qemu_arm_versatile_nommu_defconfig and the
br-arm-cortex-m4-full.config file, no errors occurred when building
libwebsockets without MMU support.

Remove the dependency; it is no longer necessary. Update the reverse
dependencies as needed.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janus-gateway/Config.in | 1 -
 package/libwebsockets/Config.in | 1 -
 package/ttyd/Config.in          | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 136e6f0b20..434ea30152 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -84,7 +84,6 @@ config BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS
 
 config BR2_PACKAGE_JANUS_GATEWAY_WEBSOCKETS
 	bool "WebSockets"
-	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBWEBSOCKETS
 
 endif
diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 2b350bf389..1d927bb4ea 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
-	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
diff --git a/package/ttyd/Config.in b/package/ttyd/Config.in
index 23d188e650..df710fbac3 100644
--- a/package/ttyd/Config.in
+++ b/package/ttyd/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TTYD
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv, json-c
-	depends on BR2_USE_MMU # libuv, libwebsockets
+	depends on BR2_USE_MMU # libuv
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBWEBSOCKETS
