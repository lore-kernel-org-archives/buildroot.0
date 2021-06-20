From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Jun 2021 15:53:54 +0200
Subject: [Buildroot] [git commit] package/libpsl: needs wchar
Message-ID: <20210620132458.6629083F5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc128b2d50e2c16ad9b50bb8712956308e6173b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependency on wchar as both icu and libunistring needs wchar

Fixes:
 - http://autobuild.buildroot.org/results/704d8e6f8b78015180e5b12c132495425637430a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libpsl/Config.in  | 4 ++++
 package/libsoup/Config.in | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libpsl/Config.in b/package/libpsl/Config.in
index dd484799e7..a4cbce6b43 100644
--- a/package/libpsl/Config.in
+++ b/package/libpsl/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBPSL
 	bool "libpsl"
+	depends on BR2_USE_WCHAR # libunistring, icu
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
