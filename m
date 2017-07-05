From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed,  5 Jul 2017 09:56:20 +0200
Subject: [Buildroot] [PATCH v2] libzip: depend on !BR2_STATIC_LIBS
Message-ID: <1499241380-1707-1-git-send-email-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.2.0 libzip requires dynamic library capabilities. Add
it to Config.in and propagate this dependency to packages selecting
libzip.

Fixes: http://autobuild.buildroot.net/results/c50/c50ffa5bf565e75333192edc89e2d39044d07f26/
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
v1->v2:
- added comments explaining the !BR2_STATIC_LIBS dependency
- propagated the dependency to packages selecting libzip

 package/libsigrok/Config.in  | 6 ++++--
 package/libzip/Config.in     | 4 ++++
 package/pulseview/Config.in  | 6 ++++--
 package/sigrok-cli/Config.in | 7 +++++--
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index d2d022ebf..658d029e7 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSIGROK
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS # libzip
 	# std=c11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	select BR2_PACKAGE_LIBZIP
@@ -34,6 +35,7 @@ comment "C++ bindings need a toolchain w/ C++, gcc >= 4.8"
 
 endif
 
-comment "libsigrok needs a toolchain w/ wchar, threads, gcc >= 4.7"
+comment "libsigrok needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS
diff --git a/package/libzip/Config.in b/package/libzip/Config.in
index 54de9e5af..6c952ac46 100644
--- a/package/libzip/Config.in
+++ b/package/libzip/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBZIP
 	bool "libzip"
+	depends on !BR2_STATIC_LIBS # dlsym()
 	select BR2_PACKAGE_ZLIB
 	help
 	  C library for reading, creating, and modifying zip archives. This
 	  package also contains zipcmp, ziptorrent and zipmerge utilities.
 
 	  http://www.nih.at/libzip/
+
+comment "libzip needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 81c73e352..926376e78 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_PULSEVIEW
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
+	# libsigrok->libzip
+	depends on !BR2_STATIC_LIBS
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_LIBSIGROK
@@ -24,8 +26,8 @@ config BR2_PACKAGE_PULSEVIEW
 
 	  http://sigrok.org/wiki/PulseView
 
-comment "pulseview needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "pulseview needs a toolchain w/ wchar, threads, dynamic library, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/sigrok-cli/Config.in b/package/sigrok-cli/Config.in
index 236166595..75bd8c6d5 100644
--- a/package/sigrok-cli/Config.in
+++ b/package/sigrok-cli/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_SIGROK_CLI
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	# libsigrok->libzip
+	depends on !BR2_STATIC_LIBS
 	# libsigrok
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	select BR2_PACKAGE_LIBSIGROK
@@ -13,6 +15,7 @@ config BR2_PACKAGE_SIGROK_CLI
 
 	  http://sigrok.org/wiki/Sigrok-cli
 
-comment "sigrok-cli needs a toolchain w/ wchar, threads, gcc >= 4.7"
+comment "sigrok-cli needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.7"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS
-- 
2.13.2
