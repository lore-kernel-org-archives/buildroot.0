From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 11:39:09 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libwebsockets:
 remove dependency on mmu
Message-ID: <20200813093503.D1E5C852FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=043391091006c93d2b15efc67b297c1ea4e7e27c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit ad953b0149abf13715d7bcfbe8eac1a1b6e6c2c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/Config.in | 1 -
 package/libwebsockets/Config.in | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 9b70fa0cad..6b0f62d374 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -89,7 +89,6 @@ config BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS
 
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
