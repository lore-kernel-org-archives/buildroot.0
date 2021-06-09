From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 Jun 2021 23:41:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpsl: needs wchar
Message-ID: <20210609214130.1593145-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a dependency on wchar as both icu and libunistring needs wchar

Fixes:
 - http://autobuild.buildroot.org/results/704d8e6f8b78015180e5b12c132495425637430a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpsl/Config.in  | 4 ++++
 package/libsoup/Config.in | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libpsl/Config.in b/package/libpsl/Config.in
index dd484799e7..de77ff8d10 100644
--- a/package/libpsl/Config.in
+++ b/package/libpsl/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBPSL
 	bool "libpsl"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBIDN2 if !BR2_PACKAGE_ICU && !BR2_PACKAGE_LIBIDN
 	select BR2_PACKAGE_LIBUNISTRING if !BR2_PACKAGE_ICU
 	help
 	  C library to handle the Public Suffix List of TLDs.
 
 	  https://github.com/rockdaboot/libpsl
+
+comment "libpsl needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 47adfb33f2..0c0454c7c2 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
-	depends on BR2_USE_WCHAR # glib2 and gnutls
+	depends on BR2_USE_WCHAR # glib2, gnutls and libpsl
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBXML2
-- 
2.30.2
