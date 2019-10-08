From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:47:47 +0200
Subject: [Buildroot] [git commit] package/lttng-tools: bump to version 2.10.8
Message-ID: <20191008204454.0E5CC8B821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=857bc483449567642dad4d9f96f7bac225e89bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-namespace-our-gettid-wrapper.patch    | 66 ----------------------
 package/lttng-tools/lttng-tools.hash               |  4 +-
 package/lttng-tools/lttng-tools.mk                 |  2 +-
 3 files changed, 3 insertions(+), 69 deletions(-)

diff --git a/package/lttng-tools/0001-Fix-namespace-our-gettid-wrapper.patch b/package/lttng-tools/0001-Fix-namespace-our-gettid-wrapper.patch
deleted file mode 100644
index 218fad50c1..0000000000
--- a/package/lttng-tools/0001-Fix-namespace-our-gettid-wrapper.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 96415c0a3036b2764fcfb7e31e62246d9abd137f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 5 Sep 2019 15:08:59 +0200
-Subject: [PATCH] Fix: namespace our gettid wrapper
-
-Since glibc 2.30, a gettid wrapper was added that conflicts with the
-static declaration. Namespace the wrapper so there is no conflict.
-
-Fixes:
- - http://autobuild.buildroot.org/results/8680c5a355b226cf978397615cbe5df1c5f8c656
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/lttng/lttng-tools/pull/154]
----
- src/common/compat/tid.h | 8 +++-----
- src/common/error.h      | 4 ++--
- 2 files changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/src/common/compat/tid.h b/src/common/compat/tid.h
-index 40f562f9..abb63843 100644
---- a/src/common/compat/tid.h
-+++ b/src/common/compat/tid.h
-@@ -29,11 +29,9 @@
- #include <syscall.h>
- #endif
- 
--#if defined(_syscall0)
--_syscall0(pid_t, gettid)
--#elif defined(__NR_gettid)
-+#if defined(__NR_gettid)
- #include <unistd.h>
--static inline pid_t gettid(void)
-+static inline pid_t lttng_gettid(void)
- {
- 	return syscall(__NR_gettid);
- }
-@@ -42,7 +40,7 @@ static inline pid_t gettid(void)
- #include <unistd.h>
- 
- /* Fall-back on getpid for tid if not available. */
--static inline pid_t gettid(void)
-+static inline pid_t lttng_gettid(void)
- {
- 	return getpid();
- }
-diff --git a/src/common/error.h b/src/common/error.h
-index c90c4ae0..3fe742c0 100644
---- a/src/common/error.h
-+++ b/src/common/error.h
-@@ -151,11 +151,11 @@ static inline void __lttng_print_check_abort(enum lttng_error_level type)
- /* Three level of debug. Use -v, -vv or -vvv for the levels */
- #define _ERRMSG(msg, type, fmt, args...) __lttng_print(type, msg \
- 		" - %s [%ld/%ld]: " fmt " (in %s() at " __FILE__ ":" XSTR(__LINE__) ")\n", \
--			log_add_time(), (long) getpid(), (long) gettid(), ## args, __func__)
-+			log_add_time(), (long) getpid(), (long) lttng_gettid(), ## args, __func__)
- 
- #define _ERRMSG_NO_LOC(msg, type, fmt, args...) __lttng_print(type, msg	\
- 		" - %s [%ld/%ld]: " fmt "\n", \
--			log_add_time(), (long) getpid(), (long) gettid(), ## args)
-+			log_add_time(), (long) getpid(), (long) lttng_gettid(), ## args)
- 
- #define MSG(fmt, args...) \
- 	__lttng_print(PRINT_MSG, fmt "\n", ## args)
--- 
-2.23.0.rc1
-
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 5db2e71501..bc6695c88e 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.10.7.tar.bz2.sha256
-sha256 ed71ebe00c5d985c74f30e97b614e909573cbd9276c85e05d9557a0b817a1312  lttng-tools-2.10.7.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.10.8.tar.bz2.sha256
+sha256 664a1145f9fd7a574da18aa3dfbbe97983985a471ca2992d6b272f1cebe6b30d  lttng-tools-2.10.8.tar.bz2
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
 sha256 051be1f11b508ef7bb839994f6b58be19a827c56bd9bddfe36d77d3d4be55abe  lgpl-2.1.txt
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 295eb3c9fb..9bffcf6888 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.10.7
+LTTNG_TOOLS_VERSION = 2.10.8
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
