From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 4 Dec 2014 16:59:59 +0000
Subject: [Buildroot] [PATCH v2] qt: split script and webkit supported arches
	in two different variables
Message-ID: <1417712399-6394-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently in Buildroot we have a BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
variable indicating which architectures support Qt Webkit. We also make
Qt Script depending on that variable, so we are assuming that Qt Script
is supported for exactly the same architectures which support Qt Webkit,
and that's not true.

For instance, Qt Webkit is not supported for MIPS64 when
using the n32 ABI, but Qt Script is actually supported. So, if we make
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT depending on !BR2_MIPS_NABI32 we
will also disable Qt Script, because as I said before, Qt Script depends
on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT, and we don't want that because
Qt Script works.

We fix this by creating another variable called
BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT to state which architectures support
Qt Script, so now we can differentiate them from the ones supporting Qt
Webkit.

Related:
  http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2 : Fix grantlee dependency

 package/grantlee/Config.in |    4 ++--
 package/qt/Config.in       |   23 +++++++++++++++++------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 900c39e..6227d7f 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
-	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT && BR2_PACKAGE_QT) || BR2_PACKAGE_QT5
+	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
@@ -14,4 +14,4 @@ config BR2_PACKAGE_GRANTLEE
 
 comment "grantlee needs a toolchain with NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT || BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT || BR2_PACKAGE_QT5
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 665725e..9fa5a7a 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -364,10 +364,12 @@ config BR2_PACKAGE_QT_NETWORK
 config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	bool
 	# see src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
-	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-		BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb || \
-		BR2_sparc || BR2_x86_64
+	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
+	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazeel || \
+		BR2_microblazebe || BR2_mips || BR2_mipsel || \
+		(BR2_mips64 || BR2_mips64el) && !BR2_MIPS_NABI32 || BR2_powerpc || \
+		BR2_powerpc64 || BR2_powerpc64el || BR2_sh4 || BR2_sh4eb || \
+		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
@@ -401,9 +403,18 @@ config BR2_PACKAGE_QT_OPENSSL
 	  target.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
+	bool
+	# see http://lists.busybox.net/pipermail/buildroot/2014-November/112605.html
+	default y if BR2_arm || BR2_armeb || aarch64 || BR2_i386 || \
+		BR2_microblazeel || BR2_microblazebe || BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el || BR2_nios2 || BR2_powerpc || \
+		BR2_powerpc64 || BR2_powerpc64el || BR2_sh4 || BR2_sh4eb || \
+		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64
+
 config BR2_PACKAGE_QT_SCRIPT
 	bool "Script Module"
-	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
 	default y
 	help
@@ -412,7 +423,7 @@ config BR2_PACKAGE_QT_SCRIPT
 
 comment "Script Module needs a toolchain with NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT
 
 config BR2_PACKAGE_QT_SCRIPTTOOLS
 	bool "Script Tools Module"
-- 
1.7.1
