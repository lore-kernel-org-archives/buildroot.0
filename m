From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Jun 2015 00:04:02 +0200
Subject: [Buildroot] [git commit] samba4: propagate python dependencies
Message-ID: <20150607221446.7E1B280824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51221041a398e39932586bbc4b923ee32c29a53e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the toolchain dependencies comment condition while at it.

Fixes:
http://autobuild.buildroot.net/results/e32/e32b85728a84bfea741709eabcc6d4a7af0b41a1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/Config.in |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index db8c91d..1411b08 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,6 +1,7 @@
-comment "samba4 needs an (e)glibc or uClibc-ng toolchain w/ RPC, wchar"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_UCLIBC_VERSION_NG
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "samba4 needs an (e)glibc or uClibc-ng toolchain w/ RPC, wchar, dynamic library, threads"
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC && !BR2_UCLIBC_VERSION_NG) \
+		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_SAMBA4
@@ -9,6 +10,8 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # e2fsprogs
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python -> libffi
+	depends on !BR2_STATIC_LIBS # python
 	# needs $ORIGIN support
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_UCLIBC_VERSION_NG
 	depends on !BR2_nios2 # binary too large, relocations don't fit
