From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 17 Dec 2012 12:32:02 +0100
Subject: [Buildroot] [PATCH] package/liburcu: Requires threads support
Message-ID: <1355743922-26299-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/eeb6a81588a12e5b572a4e5d27e001b3ae5eac49/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/liburcu/Config.in      |    5 +++++
 package/lttng-libust/Config.in |    6 ++++--
 package/lttng-tools/Config.in  |    7 ++++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 69878b1..f21541f 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
 	  synchronization mechanism. This library is mainly used by
@@ -8,3 +9,7 @@ config BR2_PACKAGE_LIBURCU
 	  purposes as well.
 
 	  http://lttng.org/urcu
+
+comment "liburcu needs threads support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index ab12963..45e0ede 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -6,8 +6,9 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	# util-linux needs wchar and largefile
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
-	# liburcu only works on some architectures
+	# liburcu only works on some architectures and requires threads support
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace tracing library for the Lttng tracing
 	  infrastructure. It allows userspace programs to create
@@ -16,5 +17,6 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs WCHAR and LARGEFILE support"
+comment "lttng-libust needs WCHAR, LARGEFILE and threads support"
 	depends on !(BR2_USE_WCHAR || BR2_LARGEFILE)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index b854757..3d95eeb 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -3,8 +3,9 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LTTNG_MODULES
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
-	# liburcu only works on some architectures
+	# liburcu only works on some architectures and requires thread support
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace utilities for the LTTng 2.0 tracing
 	  infrastructure.
@@ -22,3 +23,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  lttng-libust.
 
 	  http://lttng.org
+
+comment "lttng-tools needs threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
-- 
1.7.9.5
