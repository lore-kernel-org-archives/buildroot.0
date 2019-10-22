From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 20:38:10 +0200
Subject: [Buildroot] [git commit] package/rng-tools: bump to 6.7
Message-ID: <20191022183149.39FBB83AF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9e9c6349afe05fc5d87b9fea375195ab59b4c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Switch to new site and add license file hash
* Add new libsysfs dependency for rng available check
* Remove patch adding special return code when no RNG module is available.
  This has been replaced by using the jitter library to always have a
  source (new jitterentropy dependency)
* Change to a autotools build and add patch to allow README file to not be
  found during autoreconfig

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-fix-autoreconf.patch         | 34 ++++++++++++++++++++++
 package/rng-tools/0001-rngd-exit-code.patch        | 22 --------------
 package/rng-tools/Config.in                        |  2 ++
 package/rng-tools/rng-tools.hash                   |  6 ++--
 package/rng-tools/rng-tools.mk                     | 11 +++++--
 package/rng-tools/rngd.service                     |  1 -
 6 files changed, 48 insertions(+), 28 deletions(-)

diff --git a/package/rng-tools/0001-configure.ac-fix-autoreconf.patch b/package/rng-tools/0001-configure.ac-fix-autoreconf.patch
new file mode 100644
index 0000000000..567a7a2891
--- /dev/null
+++ b/package/rng-tools/0001-configure.ac-fix-autoreconf.patch
@@ -0,0 +1,34 @@
+From 1af1b4aab717a58da1dff8888c36c741b0f6ac03 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Apr 2019 19:22:22 +0200
+Subject: [PATCH] configure.ac: fix autoreconf
+
+Use foreign instead of gnu in AM_INIT_AUTOMAKE otherwise autoreconf will
+fail on:
+Makefile.am: error: required file './README' not found
+
+Upstream:
+https://github.com/nhorman/rng-tools/commit/1af1b4aab717a58da1dff8888c36c741b0f6ac03
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d00a6f1..26b4806 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -21,7 +21,7 @@ AC_INIT(rng-tools, 6.7, [Neil Horman <nhorman@tuxdriver.com>])
+ AC_PREREQ(2.52)
+ AC_CONFIG_SRCDIR([rngd.c])
+ AC_CANONICAL_TARGET
+-AM_INIT_AUTOMAKE([gnu])
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADERS([rng-tools-config.h])
+ AC_CONFIG_MACRO_DIRS([m4])
+ 
+-- 
+2.17.1
+
diff --git a/package/rng-tools/0001-rngd-exit-code.patch b/package/rng-tools/0001-rngd-exit-code.patch
deleted file mode 100644
index 709e20c70d..0000000000
--- a/package/rng-tools/0001-rngd-exit-code.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Exit with a special value when RNG modules are not available
-
-Instead of returning with an error, exit with a special value when the
-RNG kernel modules are not present in the kernel. This is not really a
-hard failure.
-
-Patch borrowed from Fedora, at
-http://pkgs.fedoraproject.org/cgit/rng-tools.git/tree/rngd-exit-code.patch.
-
-Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
-
---- a/rngd.c
-+++ b/rngd.c
-@@ -319,7 +319,7 @@ int main(int argc, char **argv)
- 			message(LOG_DAEMON|LOG_ERR,
- 				"Maybe RNG device modules are not loaded\n");
- 		}
--		return 1;
-+		return 66;
- 	}
- 
- 	if (arguments->verbose) {
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index b00477d336..bbcf4db843 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -2,8 +2,10 @@ config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64) # libgcrypt
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
 	# For rdrand ligcrypt is required and it's not obvious to users
 	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LIBSYSFS
 	help
 	  Daemon to use hardware random number generators.
 
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 09769e4622..a0771034fe 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/gkernel/files/rng-tools/5/
-md5	6726cdc6fae1f5122463f24ae980dd68	rng-tools-5.tar.gz
-sha1	3092768ac45315a5dcc0170d05566d1d00dbad96	rng-tools-5.tar.gz
+# Locally computed
+sha256	b85e3530dbf943b6da03ebecaf64d0a4febfcc4f562fc7f8d886483906b15f08  rng-tools-6.7.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index bbb1a64c15..fa23b3316f 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,10 +4,17 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 5
-RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
+RNG_TOOLS_VERSION = 6.7
+RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
+RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf
+
+RNG_TOOLS_AUTORECONF = YES
+
+RNG_TOOLS_CONF_OPTS = \
+	--without-nistbeacon \
+	--without-pkcs11
 
 # Work around for uClibc or musl toolchains which lack argp_*()
 # functions.
diff --git a/package/rng-tools/rngd.service b/package/rng-tools/rngd.service
index c0bcffe59e..11386d1e5d 100644
--- a/package/rng-tools/rngd.service
+++ b/package/rng-tools/rngd.service
@@ -3,7 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
 
 [Service]
 ExecStart=/usr/sbin/rngd -f $DAEMON_ARGS
-SuccessExitStatus=66
 EnvironmentFile=-/etc/default/rngd
 
 [Install]
