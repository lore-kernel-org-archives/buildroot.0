From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Jan 2017 09:27:08 +0100
Subject: [Buildroot] [git commit] libmad: disable ASO support for thumb-only
	ARM cores
Message-ID: <20170108082828.3BC4F8035D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c614db3550d549c0a75d5d425019cd397d913550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8d4/8d4ea8613487297f2c33f3b9cbd8903cfb96e4c6/

The ARM specific optimizations enabled by LIBMAD_ASO needs classic ARM
instructions support, so disable for thumb-only cores.

[Peter: don't drop default y as pointed out by Baruch Siach]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmad/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index 7d66976..f93f54a 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -37,6 +37,8 @@ config BR2_PACKAGE_LIBMAD_SSO
 
 config BR2_PACKAGE_LIBMAD_ASO
 	bool "Architecture-specific optimizations"
+	# arm optimization needs classic arm instructions support
+	depends on !(BR2_arm && !BR2_ARM_CPU_HAS_ARM)
 	default y
 	help
 	  Use certain architecture-specific optimizations.
