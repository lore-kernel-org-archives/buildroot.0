From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Aug 2020 14:06:53 +0200
Subject: [Buildroot] [git commit] package/libfuse3: define
 fuse_session_loop_mt as a macro on uclibc
Message-ID: <20200809120224.92CDD82676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a05cda7f5cbe98da4f4bbfbbcb821839b396e57f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix a build failure with fuse-overlayfs

Fixes:
 - http://autobuild.buildroot.org/results/7186515526ee60488dac3bf9c4580ffd13a0ceac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: actually backport upstream commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...on_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch b/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch
new file mode 100644
index 0000000000..bd9181ac1d
--- /dev/null
+++ b/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch
@@ -0,0 +1,52 @@
+From 7b3e3899157566875280a8b860eb5ad5c73eadc1 Mon Sep 17 00:00:00 2001
+From: asafkahlon <35964924+asafkahlon@users.noreply.github.com>
+Date: Sun, 9 Aug 2020 14:37:26 +0300
+Subject: [PATCH] Define fuse_session_loop_mt as a macro on uclibc and MacOS
+ (#532)
+
+On uclibc and MacOS we don't use versioned symbols. Hence,
+there's no definition for fuse_session_loop_mt on those cases
+and the linker won't be able to resolve calls to fuse_session_loop_mt()
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+[Retrieved from: https://github.com/libfuse/libfuse/pull/532]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998 at free.fr: update to use upstream commit]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ include/fuse_lowlevel.h | 5 +++++
+ lib/fuse_versionscript  | 1 +
+ 2 files changed, 6 insertions(+)
+
+diff --git a/include/fuse_lowlevel.h b/include/fuse_lowlevel.h
+index e2b4617..f2ef622 100644
+--- a/include/fuse_lowlevel.h
++++ b/include/fuse_lowlevel.h
+@@ -1982,7 +1982,12 @@ int fuse_session_loop(struct fuse_session *se);
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
+index 235abf4..a06f768 100644
+--- a/lib/fuse_versionscript
++++ b/lib/fuse_versionscript
+@@ -146,6 +146,7 @@ FUSE_3.2 {
+ 	global:
+ 		fuse_session_loop_mt;
+ 		fuse_session_loop_mt_31;
++		fuse_session_loop_mt_32;
+ 		fuse_loop_mt;
+ 		fuse_loop_mt_31;
+ } FUSE_3.1;
+-- 
+2.20.1
+
