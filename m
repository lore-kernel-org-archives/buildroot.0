From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:21:46 +0200
Subject: [Buildroot] [git commit] webkitgtk: move JSC JIT selection logic to
 kconfig
Message-ID: <20181010192124.EECD18271F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9c80c1818e8b9860692719dd0aa3ca7c0fc817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is done in preparation to enable the JavaScriptCore JIT support
for more platforms. Having the logic in Config.in scales better than
checking in the .mk file.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in    | 8 ++++++++
 package/webkitgtk/webkitgtk.mk | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 96a7ab0c94..6933248bd6 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -11,6 +11,14 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
+config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
+	bool
+	# ARM needs NEON for JIT.
+	default y if BR2_ARM_CPU_HAS_NEON
+	# i386 & x86_64 don't have any special requirements.
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f28417ac73..39d681b1d4 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -27,9 +27,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF
 
-# ARM needs NEON for JIT
-# i386 & x86_64 don't seem to have any special requirements
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
