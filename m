From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 23:17:56 +0100
Subject: [Buildroot] [git commit] liburcu: disable build with gcc-4.8.x on
	ARM
Message-ID: <20140323221922.215FF9BF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1a86ebfbad1bcce471376ae74e42304553e725e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because of a gcc bug [1], liburcu checks for compiler version [2] and
stops the build prematurely if gcc-4.8.[0-2] is detected for ARM.

However a bug fix exists [3] and may be backported by ARM toolchain
providers; that's what is done in Buildroot [4] or Linaro [5].

So, this change:
- add a patch in liburcu to allow build with ARM gcc-4.8.2;
- adds a new hidden symbol to reflect the toolchain status with regard
  to this bug [1];
- and controls liburcu visibility.

However, a limitation of this is when the user is using a custom
toolchain; that's why the bug details have been added in the liburcu
help message.

[1] http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
[2] http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=4b79310
[3] http://gcc.gnu.org/viewcvs/gcc?view=revision&revision=204665
[4] http://git.buildroot.net/buildroot/commit/?id=c443c2be1768ebbdcb76c55d0a08fd7c983488c8
[5] http://bazaar.launchpad.net/~linaro-toolchain-dev/gcc-linaro/4.8/revision/122147

[Peter: hide normal toolchain comment if bug, add comment explaining issue if bug]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburcu/Config.in                          |   11 +++++
 ...01-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch |   40 ++++++++++++++++++++
 package/lttng-libust/Config.in                     |    5 ++
 package/lttng-tools/Config.in                      |    5 ++
 toolchain/toolchain-common.in                      |    3 +
 toolchain/toolchain-external/Config.in             |    4 ++
 6 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 15ad5bd..e7cbe93 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
@@ -8,8 +9,18 @@ config BR2_PACKAGE_LIBURCU
 	  the LTTng tracing infrastructure, but can be used for other
 	  purposes as well.
 
+	  On ARM, because of bug:
+	    http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
+	  liburcu cannot be built using gcc 4.8.0, 4.8.1 or 4.8.2 without the
+	  following bug fix:
+	    http://gcc.gnu.org/viewcvs/gcc?view=revision&revision=204665
+
 	  http://lttng.org/urcu
 
 comment "liburcu needs a toolchain w/ threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "liburcu needs a toolchain not affected by GCC bug 58854"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/package/liburcu/liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch b/package/liburcu/liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
new file mode 100644
index 0000000..585abc0
--- /dev/null
+++ b/package/liburcu/liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
@@ -0,0 +1,40 @@
+From 54d8fe7ae40902d6d38e670f4024092f53c14e1f Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 8 Mar 2014 13:19:14 +0100
+Subject: [PATCH] Only blacklist ARM gcc 4.8.0 and 4.8.1
+
+Since many ARM toolchain providers include the bug fix for PR58854 in
+their latest releases based on gcc-4.8.2, then only blacklist gcc 4.8.0
+and 4.8.1.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ urcu/compiler.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/urcu/compiler.h b/urcu/compiler.h
+index 1e30903..56115f1 100644
+--- a/urcu/compiler.h
++++ b/urcu/compiler.h
+@@ -118,10 +118,17 @@
+ 				+ __GNUC_PATCHLEVEL__)
+ 
+ /*
++ * Official gcc releases from 4.8.0 to 4.8.2 have the following bug,
++ * however, many arm toolchain providers have the included the fix for
++ * their latest 4.8.2 releases.
++ * So, we only blacklist gcc 4.8.0 and 4.8.1.
++ * Unfortunately, this bug is not easy to test, so we rely on the
++ * knowledge of the user on its compiler.
++ *
+  * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
+  */
+ # ifdef __ARMEL__
+-#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
++#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40801
+ #   error Your gcc version produces clobbered frame accesses
+ #  endif
+ # endif
+-- 
+1.9.0
+
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 5e1a6d4..4583380 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on BR2_LARGEFILE
 	# liburcu only works on some architectures and requires threads support"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace tracing library for the Lttng tracing
@@ -20,3 +21,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 comment "lttng-libust needs a toolchain w/ wchar, largefile, threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
+
+comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 1e9e0c3..f0d45d9 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	# liburcu only works on some architectures and requires thread support
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -31,3 +32,7 @@ comment "lttng-tools needs a toolchain w/ largefile, threads, wchar"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
+
+comment "lttng-tools needs a toolchain not affected by GCC bug 58854"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 8927bf7..9dd2f5d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -11,6 +11,9 @@ config BR2_LARGEFILE
 config BR2_INET_IPV6
 	bool
 
+config BR2_TOOLCHAIN_HAS_GCC_BUG_58854
+	bool
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7ad46c3..3990336 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -13,6 +13,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # toolchain generated before fix backport
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -36,6 +37,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # toolchain generated before fix backport
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -59,6 +61,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # toolchain generated before fix backport
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -86,6 +89,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # based-on gcc-4.8.1
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
