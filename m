From: Ben Shelton <benjamin.h.shelton@intel.com>
Date: Fri, 11 Sep 2015 17:08:11 -0500
Subject: [Buildroot] [PATCH 1/3] liburcu: Add support for aarch64 and bump
	version to 0.8.7
Message-ID: <1442009293-4289-1-git-send-email-benjamin.h.shelton@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bring over a patch from OpenEmbedded to treat aarch64 like arm in the build
process, which allows the build to succeed.

Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
---
 package/liburcu/0002-support-aarch64.patch | 21 +++++++++++++++++++++
 package/liburcu/Config.in                  |  4 ++--
 package/liburcu/liburcu.hash               |  6 +++---
 package/liburcu/liburcu.mk                 |  3 ++-
 4 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100644 package/liburcu/0002-support-aarch64.patch

diff --git a/package/liburcu/0002-support-aarch64.patch b/package/liburcu/0002-support-aarch64.patch
new file mode 100644
index 0000000..6830e25
--- /dev/null
+++ b/package/liburcu/0002-support-aarch64.patch
@@ -0,0 +1,21 @@
+libucru: recognize aarch64
+
+Make the same as "arm" internally.
+
+Upstream-Status: Pending
+
+Signed-off-by: joe.slater at windriver.com
+[moved to buildroot from openembedded-core]
+Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
+
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,6 +77,7 @@ AS_CASE([$host_cpu],
+ 	[alpha*], [ARCHTYPE="alpha"],
+ 	[ia64], [ARCHTYPE="gcc"],
+ 	[arm*], [ARCHTYPE="arm"],
++	[aarch64], [ARCHTYPE="arm"],
+ 	[mips*], [ARCHTYPE="mips"],
+ 	[tile*], [ARCHTYPE="gcc"],
+ 	[ARCHTYPE="unknown"]
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index e7cbe93..a4e8dc8 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBURCU
 	  http://lttng.org/urcu
 
 comment "liburcu needs a toolchain w/ threads"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 2b1693d..64ba901 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,4 +1,4 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.8.6.tar.bz2.sha1
-sha1  f10e9bf812557cd0c2a35a277e04010ec278d25d  userspace-rcu-0.8.6.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.8.7.tar.bz2.sha1
+sha1  5306999b8a3296f3dea91246d92e0a993d732898  userspace-rcu-0.8.7.tar.bz2
 # Locally generated
-sha256 b1a5d3bce014ba7a702759bc60b692c1cd46ff0e8a5b53f0d0a95e22db74ab21 userspace-rcu-0.8.6.tar.bz2
+sha256 b523f22c4726ca6bb77a77d258e76d8c33c89724433bd65313024b98e55c4295 userspace-rcu-0.8.7.tar.bz2
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 1582d07..c886a1c 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.8.6
+LIBURCU_VERSION = 0.8.7
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
+LIBURCU_AUTORECONF = YES
 LIBURCU_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.9.5
