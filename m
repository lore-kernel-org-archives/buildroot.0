From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 17 Feb 2017 21:24:03 +0100
Subject: [Buildroot] [PATCH] samba4: requires NPTL
Message-ID: <20170217202403.GA13945@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With OpenRISC there is a uClibc-ng based toolchain for an
architecture with MMU support, but with only Linuxthreads
and no NPTL. Samba4 uses pthread_mutexattr_setrobust which
is not implemented in uClibc-ng Linuxthreads.

Fixes:
  http://autobuild.buildroot.net/results/ec8f078046c92ae23dc973c88ac0fef136ad1535

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/samba4/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index ce97bea..4474185 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,7 +1,7 @@
-comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, threads"
+comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, NPTL"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_SAMBA4
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_TOOLCHAIN_HAS_THREADS # python -> libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # python -> libffi
 	depends on !BR2_STATIC_LIBS # python
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.1.4
