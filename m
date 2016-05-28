From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 May 2016 14:47:29 +0200
Subject: [Buildroot] [PATCH] package/ipsec-tools: disable for musl toolchains
Message-ID: <1464439649-27918-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

__P() is used for compatibility with old K&R C compilers. With
ANSI C this macro has no effect.

Unlike for util-linux and ipkg packages where it was easy to remove
each __P() macro, ipsec-tools use it all over the tree and require a
"big" patch to enable musl support.

Since upstream seems not verry active (last release 2014-02-27)

So, disable ipsec-tools with musl based toolchains.

This fixes a compilation error with musl libc because of undeclared
__P.

Fixes:
http://autobuild.buildroot.net/results/42242e3f4485b9e77a916e6fe480c83f70e024e4

While at it, reorder "depends on" and "select" lines in Config.in

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ipsec-tools/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 4af4095..36c5a65 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
-	depends on BR2_USE_MMU # fork()
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
-- 
2.5.5
