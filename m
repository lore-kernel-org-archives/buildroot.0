From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:33:46 -0500
Subject: [Buildroot] [PATCH] package/rng-tools: powerpc64le requires
 libgcrypt
Message-ID: <20191027063346.13992-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the libgcrypt dependency for rngd_darn support
when building for the specific BR2_powerpc64le archtecture.
This entropy source is only enabled when powerpc64le is selected.

Fixes:
http://autobuild.buildroot.net/results/a41/a412ccef864e8279dcc917e106b5f7b515ed95da/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rng-tools/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index b5cce7e39d..7218aeac97 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64) # libgcrypt
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64 || BR2_powerpc64le) # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
-	# For rdrand ligcrypt is required and it's not obvious to users
-	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
+	# For rdrand & darn ligcrypt is required and it's not obvious to users
+	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64 || BR2_powerpc64le
 	select BR2_PACKAGE_LIBSYSFS
 	help
 	  Daemon to use hardware random number generators.
-- 
2.17.1
