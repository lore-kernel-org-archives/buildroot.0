From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 11 Nov 2016 23:25:13 +0100
Subject: [Buildroot] [PATCH for-master] package/quota: disable for musl
	toolchains
Message-ID: <1478903113-15617-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quota doesn't build with musl toolchains without fixing several usual
musl issues like:
  - missing headers
  - replacing all variables type like __uint64_t all over the code
  - removing __P()

These changes are easy to fix but requires a lot of change in the code.
Upstream started to fix some of them, so it would be possible to build
Quota with musl with the next version bump.

Fixes:
http://autobuild.buildroot.net/results/f45/f4595538f4b627fcf07912baac230744c037f842

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/quota/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index c8ab0d7..85df753 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	# Usual Musl issues:
+	# missing headers, variable type like __uint64_t all over the code, __P().
+	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
@@ -10,7 +13,8 @@ config BR2_PACKAGE_QUOTA
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota needs a toolchain w/ wchar, threads"
+comment "quota needs a glibc or uClibc toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || \
-		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+		!(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC) || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
-- 
2.5.5
