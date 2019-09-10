From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Sep 2019 15:39:02 -0500
Subject: [Buildroot] [PATCH v2 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20190910203902.5852-1-matthew.weber@rockwellcollins.com>
References: <20190910203902.5852-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190910203902.5852-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Add new libsysfs dependency for rng available check
* Remove patch adding special return code when no RNG module is available
* Remove exit code corner case in systemd script
* Add new jitterentropy dependency which always provides a entropy source
* Change to a autotools build
* Switch to new site and add license file hash

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes v1 -> v2
[Thomas P
 - Added host automake/autotools dependencies and checked for no
   libtool dependency.

[Baruch
 - Removed cut paste error in comment for autoreconf
---
 package/rng-tools/0001-rngd-exit-code.patch | 22 ---------------------
 package/rng-tools/Config.in                 |  2 ++
 package/rng-tools/rng-tools.hash            |  6 +++---
 package/rng-tools/rng-tools.mk              | 17 ++++++++++++++--
 package/rng-tools/rngd.service              |  1 -
 5 files changed, 20 insertions(+), 28 deletions(-)
 delete mode 100644 package/rng-tools/0001-rngd-exit-code.patch

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
index b00477d336..18521bdd90 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_RNG_TOOLS
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# For rdrand ligcrypt is required and it's not obvious to users
 	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LIBSYSFS
+	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
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
index bbb1a64c15..02920cf53c 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,10 +4,23 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 5
-RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
+RNG_TOOLS_VERSION = 6.7
+RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
+RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-automake \
+			host-autoconf
+
+# configure is missing but pkg seems to not be compatible with our autoreconf
+# mechanism so we have to do it manually
+define RNG_TOOLS_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+RNG_TOOLS_PRE_CONFIGURE_HOOKS += RNG_TOOLS_RUN_AUTOGEN
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
-- 
2.17.1
