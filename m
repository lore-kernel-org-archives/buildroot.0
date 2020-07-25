From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jul 2020 19:12:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: define
 fuse_session_loop_mt as a macro on uclibc
Message-ID: <20200725171241.470533-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a build failure with fuse-overlayfs

Fixes:
 - http://autobuild.buildroot.org/results/7186515526ee60488dac3bf9c4580ffd13a0ceac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...op_mt-as-a-macro-on-uclibc-and-MacOS.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch

diff --git a/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch b/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch
new file mode 100644
index 0000000000..53f31bc071
--- /dev/null
+++ b/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch
@@ -0,0 +1,63 @@
+From c27a9172af352ab36aeeb425fb1ab86888368961 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Sat, 11 Jul 2020 12:51:17 +0300
+Subject: [PATCH] Define fuse_session_loop_mt as a macro on uclibc and MacOS
+
+On uclibc and MacOS we don't use versioned symbols. Hence,
+there's no definition for fuse_session_loop_mt on those cases
+and the linker won't be able to resolve calls to fuse_session_loop_mt()
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+[Retrieved from: https://github.com/libfuse/libfuse/pull/532]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/fuse_lowlevel.h | 9 +++++++--
+ lib/fuse_versionscript  | 1 +
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/include/fuse_lowlevel.h b/include/fuse_lowlevel.h
+index e2b4617b..57995547 100644
+--- a/include/fuse_lowlevel.h
++++ b/include/fuse_lowlevel.h
+@@ -471,7 +471,7 @@ struct fuse_lowlevel_ops {
+ 	 *  - When writeback caching is disabled, the filesystem is
+ 	 *    expected to properly handle the O_APPEND flag and ensure
+ 	 *    that each write is appending to the end of the file.
+-	 * 
++	 *
+          *  - When writeback caching is enabled, the kernel will
+ 	 *    handle O_APPEND. However, unless all changes to the file
+ 	 *    come through the kernel this will not work reliably. The
+@@ -1975,14 +1975,19 @@ int fuse_session_loop(struct fuse_session *se);
+  * fuse_session_loop().
+  *
+  * @param se the session
+- * @param config session loop configuration 
++ * @param config session loop configuration
+  * @return see fuse_session_loop()
+  */
+ #if FUSE_USE_VERSION < 32
+ int fuse_session_loop_mt_31(struct fuse_session *se, int clone_fd);
+ #define fuse_session_loop_mt(se, clone_fd) fuse_session_loop_mt_31(se, clone_fd)
+ #else
++#if (!defined(__UCLIBC__) && !defined(__APPLE__))
+ int fuse_session_loop_mt(struct fuse_session *se, struct fuse_loop_config *config);
++#else
++int fuse_session_loop_mt_32(struct fuse_session *se, struct fuse_loop_config *config);
++#define fuse_session_loop_mt(se, config) fuse_session_loop_mt_32(se, config)
++#endif
+ #endif
+ 
+ /**
+diff --git a/lib/fuse_versionscript b/lib/fuse_versionscript
+index 235abf41..95ea149c 100644
+--- a/lib/fuse_versionscript
++++ b/lib/fuse_versionscript
+@@ -146,6 +146,7 @@ FUSE_3.2 {
+ 	global:
+ 		fuse_session_loop_mt;
+ 		fuse_session_loop_mt_31;
++                fuse_session_loop_mt_32;
+ 		fuse_loop_mt;
+ 		fuse_loop_mt_31;
+ } FUSE_3.1;
-- 
2.27.0
