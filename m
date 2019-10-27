From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:56:52 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain: set
 TOOLCHAIN_INSTALL_STAGING only once
Message-ID: <20191027135045.37E878A272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=212adf32f31f751ba104bc70de7344b2f2714289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we set TOOLCHAIN_INSTALL_STAGING three times: once
(conditionally) in toolchain.mk, and once each (unconditionally) in
pkg-cmake.mk and pkg-meson.mk.

This is a little bit messy... Set it just once, unconditionally, in
toolchain.mk where it belongs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cmake.mk             | 1 -
 package/pkg-meson.mk             | 1 -
 toolchain/toolchain/toolchain.mk | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index b9ce8ff622..57bfea9be5 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -272,4 +272,3 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
 endef
 
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_CMAKE_INSTALL_FILES
-TOOLCHAIN_INSTALL_STAGING = YES
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 2189565440..b11bc3a7c0 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -206,4 +206,3 @@ define PKG_MESON_INSTALL_CROSS_CONF
 endef
 
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
-TOOLCHAIN_INSTALL_STAGING = YES
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 17fb62147e..0afb12c036 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -11,6 +11,7 @@ TOOLCHAIN_DEPENDENCIES += toolchain-external
 endif
 
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
+TOOLCHAIN_INSTALL_STAGING = YES
 
 # Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
 # headers and kernel headers. This is needed for kernel headers older than
@@ -34,7 +35,6 @@ define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
 		$(STAGING_DIR)/usr/include/linux/libc-compat.h
 endef
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
-TOOLCHAIN_INSTALL_STAGING = YES
 endif
 
 # Install default nsswitch.conf file if the skeleton doesn't provide it
