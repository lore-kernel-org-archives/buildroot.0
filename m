From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 25 Jan 2019 21:50:52 +0100
Subject: [Buildroot] [PATCH] jemalloc: allow on MIPS64
Message-ID: <20190125205052.31200-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

jemalloc uses architecture #ifdefs to determine LG_QUANTUM and gives an
error when an unsupported architecture is used.
For this reason, Buildroot commit 3baf996c6a2b57ffaaa4627c1e04ff67c30e9754
introduced BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS.

In the jemalloc sources, 'mips' is checked via '__mips__' which is set both
for 32-bit as 64-bit MIPS (including MIPS64 n32).
However, the Buildroot arch selection only includes 32-bit MIPS via BR2_mips
and BR2_mipsel.

Update the arch selection to support MIPS64.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/jemalloc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index c3fd8e34b8..edb582d203 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_mips || BR2_mipsel
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_sparc64
 	default y if BR2_powerpc
 	default y if BR2_sh4 || BR2sh4eb || BR2_sh4a || BR2_sh4aeb
-- 
2.19.2
