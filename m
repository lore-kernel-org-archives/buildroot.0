From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:48:10 +0200
Subject: [Buildroot] [git commit] liburcu: Add support for aarch64
Message-ID: <20150915215730.BEA3E7FEBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ae594247be21ce2836b774123eac68419e8e8e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bring over a patch from OpenEmbedded to treat aarch64 like arm in the build
process, which allows the build to succeed.

Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liburcu/0002-support-aarch64.patch |   21 +++++++++++++++++++++
 package/liburcu/Config.in                  |    4 ++--
 package/liburcu/liburcu.mk                 |    1 +
 3 files changed, 24 insertions(+), 2 deletions(-)

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
 
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 8d06966..c886a1c 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -10,6 +10,7 @@ LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
+LIBURCU_AUTORECONF = YES
 LIBURCU_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
