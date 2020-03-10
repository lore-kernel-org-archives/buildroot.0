From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 09:19:00 +0100
Subject: [Buildroot] [PATCH v1 2/4] package/qt5: enable for xtensa
In-Reply-To: <20200310081902.3488-1-ps.report@gmx.net>
References: <20200310081902.3488-1-ps.report@gmx.net>
Message-ID: <20200310081902.3488-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix double-conversion compile for xtensa
and drop dependency on !BR_xtensa.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in                         |  4 +--
 ...-double-conversion-enable-for-xtensa.patch | 27 +++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 package/qt5/qt5base/0004-double-conversion-enable-for-xtensa.patch

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b2cbf336bd..b59c38aa7c 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 
 comment "Qt5 needs a toolchain w/ gcc >= 4.8, wchar, NPTL, C++, dynamic library"
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_arc && !BR2_xtensa
+	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -26,7 +26,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
-	depends on !BR2_arc && !BR2_xtensa
+	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5BASE
 	help
diff --git a/package/qt5/qt5base/0004-double-conversion-enable-for-xtensa.patch b/package/qt5/qt5base/0004-double-conversion-enable-for-xtensa.patch
new file mode 100644
index 0000000000..769a34da24
--- /dev/null
+++ b/package/qt5/qt5base/0004-double-conversion-enable-for-xtensa.patch
@@ -0,0 +1,27 @@
+From cfac9a39658906b06f28208ee1d129f042760416 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 10 Mar 2020 09:01:31 +0100
+Subject: [PATCH] double-conversion: enable for xtensa
+
+[Upstream: https://github.com/google/double-conversion/commit/a54561be5588ac9b16d3c20760b9b554168bb8aa]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../double-conversion/include/double-conversion/utils.h         | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index 55ca5bf5..95b08a4e 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -96,7 +96,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || defined(__EMSCRIPTEN__) || \
+     defined(__or1k__)  || \
+-    defined(__microblaze__)
++    defined(__microblaze__) || defined(__XTENSA__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
+-- 
+2.25.1
+
-- 
2.25.1
