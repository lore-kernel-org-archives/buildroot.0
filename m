From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 23 Sep 2018 02:53:32 +0300
Subject: [Buildroot] [PATCH 4/5] webkitgtk: enable JIT support on 32-bit MIPS
In-Reply-To: <20180922235333.85642-1-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
Message-ID: <20180922235333.85642-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WebKitGTK+ is known to work on all 32-bit MIPS R2 or newer,
in little-endian mode.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in    | 9 +++++++++
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index ac6f57e2ad..3a12b7c0ec 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -12,6 +12,15 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
+config BR2_PACKAGE_WEBKITGTK_MIPS_JIT_SUPPORTED
+	bool
+	# JIT is known to not work on MIPS64.
+	# Plain MIPS32 (pre R2) is not well tested and likely broken.
+	default y if BR2_MIPS_CPU_MIPS32R2
+	default y if BR2_MIPS_CPU_MIPS32R5
+	default y if BR2_MIPS_CPU_MIPS32R6
+	depends on BR2_mipsel
+
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index f0293fc225..028208cb62 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -30,7 +30,7 @@ WEBKITGTK_CONF_OPTS = \
 # 32-bit ARM needs NEON for JIT, AArch64 is supported but not well tested
 # on big endian hence the missing $(BR2_aarch64_be).
 # i386 & x86_64 don't seem to have any special requirements
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64)$(BR2_aarch64),y)
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64)$(BR2_aarch64)$(BR2_PACKAGE_WEBKITGTK_MIPS_JIT_SUPPORTED),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
-- 
2.19.0
