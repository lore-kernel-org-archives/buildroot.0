From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jul 2013 00:04:48 +0200
Subject: [Buildroot] [PATCH 1/2] lttng-tools: add missing dependency on
	util-linux for libuuid
Message-ID: <1372889089-3139-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/76a/76a91bd139a93f63e17732c9a933664e8e5d3fe1/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/Config.in      | 9 ++++++---
 package/lttng-tools/lttng-tools.mk | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 6773475..c196e4b 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -2,9 +2,12 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	# liburcu only works on some architectures and requires thread support
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace utilities for the LTTng 2.0 tracing
@@ -24,6 +27,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs LARGEFILE and threads support"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-
+comment "lttng-tools needs LARGEFILE, threads and wchar support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 2e9f936..d48bc0a 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -18,7 +18,7 @@ LTTNG_TOOLS_LICENSE_FILES = LICENSE
 # Since the 2.1.0 release, lttng-tools depends on flex and bison,
 # but they are not added to the dependency list since they are
 # already Buildroot dependencies.
-LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace
+LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace util-linux
 
 LTTNG_AUTORECONF = YES
 
-- 
1.8.1.2
