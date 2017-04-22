From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:06 -0400
Subject: [Buildroot] [PATCH v2 20/25] fix ordering on configs starting with
	't'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-20-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter t in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter t.
  
 package/tekui/Config.in     | 6 +++---
 package/tiff/Config.in      | 6 +++---
 package/tinc/Config.in      | 4 ++--
 package/tpm-tools/Config.in | 6 +++---
 package/trousers/Config.in  | 4 ++--
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/tekui/Config.in b/package/tekui/Config.in
index 1203667..b0f86bf 100644
--- a/package/tekui/Config.in
+++ b/package/tekui/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_TEKUI
 	bool "tekui"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LUAFILESYSTEM	# runtime only
 	select BR2_PACKAGE_LUAEXPAT		# runtime only
 	select BR2_PACKAGE_LUASOCKET		# runtime only
 	select BR2_PACKAGE_LUAPOSIX		# runtime only
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  TekUI is a small, freestanding and portable graphical user interface
 	  (GUI) toolkit written in Lua and C. It was initially developed for
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index 092a7f3..f842c2e 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -37,8 +37,8 @@ config BR2_PACKAGE_TIFF_MDI
 
 config BR2_PACKAGE_TIFF_ZLIB
 	bool "Zlib usage (required for Deflate compression)"
-	select BR2_PACKAGE_ZLIB
 	default y
+	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_TIFF_XZ
 	bool "XZ compression"
@@ -46,13 +46,13 @@ config BR2_PACKAGE_TIFF_XZ
 
 config BR2_PACKAGE_TIFF_PIXARLOG
 	bool "Pixar log-format algorithm (requires Zlib)"
-	select BR2_PACKAGE_TIFF_ZLIB
 	default y
+	select BR2_PACKAGE_TIFF_ZLIB
 
 config BR2_PACKAGE_TIFF_JPEG
 	bool "JPEG compression"
-	select BR2_PACKAGE_JPEG
 	default y
+	select BR2_PACKAGE_JPEG
 
 config BR2_PACKAGE_TIFF_OLD_JPEG
 	bool "Old JPEG decompression"
diff --git a/package/tinc/Config.in b/package/tinc/Config.in
index 1d8e2c4..837f556 100644
--- a/package/tinc/Config.in
+++ b/package/tinc/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_TINC
 	bool "tinc"
+	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
-	depends on BR2_USE_MMU # fork()
 	help
 	  tinc is a Virtual Private Network (VPN) daemon that uses
 	  tunnelling and encryption to create a secure private network
diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index 83b65f3..091f424 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_TPM_TOOLS
 	bool "tpm-tools"
-	select BR2_PACKAGE_TROUSERS
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # trousers
 	depends on !BR2_STATIC_LIBS # trousers
 	depends on !BR2_arc # trousers
+	select BR2_PACKAGE_TROUSERS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Tools to manage and diagnose a TPM
 
diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index de3b951..eb791d1 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_TROUSERS
 	bool "trousers"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# doesn't build properly in static only configurations
 	depends on !BR2_STATIC_LIBS
 	# ARC toolchain issue
 	depends on !BR2_arc
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The open-source TCG Software Stack (TSS).
 
-- 
2.9.3
