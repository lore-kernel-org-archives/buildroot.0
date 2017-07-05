From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:35:51 +0200
Subject: [Buildroot] [git commit] libzip: depend on !BR2_STATIC_LIBS
Message-ID: <20170705093251.34D407F96B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d9d40683260e6c74faaabb76715dfc77b9edd60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.2.0 libzip requires dynamic library capabilities. Add
it to Config.in and propagate this dependency to packages selecting
libzip.

Fixes:

  http://autobuild.buildroot.net/results/c50ffa5bf565e75333192edc89e2d39044d07f26/

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/Config.in  | 6 ++++--
 package/libzip/Config.in     | 4 ++++
 package/pulseview/Config.in  | 6 ++++--
 package/sigrok-cli/Config.in | 7 +++++--
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index d2d022e..658d029 100644
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
index 54de9e5..6c952ac 100644
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
index 81c73e3..926376e 100644
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
index 2361665..75bd8c6 100644
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
