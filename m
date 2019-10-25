From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 25 Oct 2019 03:39:34 -0500
Subject: [Buildroot] [PATCH] package/rng-tools: needs threads
Message-ID: <20191025083934.32234-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 6.7 there has been a new dependency on threads.
https://github.com/nhorman/rng-tools/commit/6952b8ae4736a9b8f58fd2ff330a423ea76cf515#diff-c949f93d03f44a4217d7a138f9e2e54a

Fixes:
http://autobuild.buildroot.net/results/fff63dd9a53eafe0234ad19f715f050527afedc8/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rng-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index bbcf4db843..b5cce7e39d 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64) # libgcrypt
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
 	# For rdrand ligcrypt is required and it's not obvious to users
@@ -10,3 +11,6 @@ config BR2_PACKAGE_RNG_TOOLS
 	  Daemon to use hardware random number generators.
 
 	  http://sourceforge.net/projects/gkernel/
+
+comment "rng-tools needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.17.1
