From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  2 Mar 2014 00:39:53 +0100
Subject: [Buildroot] [PATCH 6/6] liburcu: disable build with gcc-4.8.x on ARM
In-Reply-To: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
References: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1393717193-19774-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because of a gcc bug [1], liburcu checks for compiler version [2] and
stops the build prematurely if gcc-4.8.[0-2] is detected for ARM.

So, this patch tries to reflect this toolchain dependency on liburcu and
all its reverse dependency packages.

However, a limitation of this is when the user is using a custom
toolchain; that's why the bug details have been added in the liburcu
help message.

[1] http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
[2] http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=4b79310

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/liburcu/Config.in      | 11 +++++++++++
 package/lttng-libust/Config.in |  6 ++++++
 package/lttng-tools/Config.in  |  6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 15ad5bd..90e9199 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	# liburcu/gcc-4.8.x bug
+	depends on !((BR2_arm || BR2_armeb) && (BR2_GCC_VERSION_4_8_X || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11 || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10 || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09 || \
+		BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311))
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
@@ -8,6 +14,11 @@ config BR2_PACKAGE_LIBURCU
 	  the LTTng tracing infrastructure, but can be used for other
 	  purposes as well.
 
+	  On ARM, liburcu cannot be built using gcc 4.8.0, 4.8.1 or 4.8.2
+	  because of:
+	    http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
+	    http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=4b79310
+
 	  http://lttng.org/urcu
 
 comment "liburcu needs a toolchain w/ threads"
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 5e1a6d4..7ec5053 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_LTTNG_LIBUST
 	bool "lttng-libust"
+	# liburcu/gcc-4.8.x bug
+	depends on !((BR2_arm || BR2_armeb) && (BR2_GCC_VERSION_4_8_X || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11 || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10 || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09 || \
+		BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311))
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 1e9e0c3..0f31bee 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
+	# liburcu/gcc-4.8.x bug
+	depends on !((BR2_arm || BR2_armeb) && (BR2_GCC_VERSION_4_8_X || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11 || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10 || \
+		BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09 || \
+		BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311))
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_UTIL_LINUX
-- 
1.9.0
