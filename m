From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Oct 2019 06:58:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: needs NPTL
Message-ID: <20191030055850.6069-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e18/e1815b96997fb7def688e0aeb5d342fc64dbb64d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rng-tools/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 7218aeac97..71514260e6 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64 || BR2_powerpc64le) # libgcrypt
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# pthread_setaffinity_np
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
 	# For rdrand & darn ligcrypt is required and it's not obvious to users
@@ -12,5 +13,5 @@ config BR2_PACKAGE_RNG_TOOLS
 
 	  http://sourceforge.net/projects/gkernel/
 
-comment "rng-tools needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "rng-tools needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.20.1
