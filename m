From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  8 Jan 2017 00:11:26 +0100
Subject: [Buildroot] [PATCH] libmad: disable ASO support for thumb-only ARM
	cores
Message-ID: <20170107231126.2321-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/8d4/8d4ea8613487297f2c33f3b9cbd8903cfb96e4c6/

The ARM specific optimizations enabled by LIBMAD_ASO needs classic ARM
instructions support, so disable for thumb-only cores.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmad/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index 7d66976c1..2f7543f74 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -37,7 +37,8 @@ config BR2_PACKAGE_LIBMAD_SSO
 
 config BR2_PACKAGE_LIBMAD_ASO
 	bool "Architecture-specific optimizations"
-	default y
+	# arm optimization needs classic arm instructions support
+	depends on !(BR2_arm && !BR2_ARM_CPU_HAS_ARM)
 	help
 	  Use certain architecture-specific optimizations.
 
-- 
2.11.0
