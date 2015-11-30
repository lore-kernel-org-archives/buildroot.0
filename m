From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:15:57 +0100
Subject: [Buildroot] [git commit] libsigsegv: fix sparc64 compile
Message-ID: <20151130164029.0487E81E79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbc93033b589b8b3e2a14a0bffe549584943df53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compile tested for sparc/glibc and sparc64/glibc.
Fixes following autobuilder problem:
http://autobuild.buildroot.net/results/1d8e0c22594aef53f7a4de3491454aa78311c815/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libsigsegv/0005-fix-sparc64-stackpointer.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/0005-fix-sparc64-stackpointer.patch b/package/libsigsegv/0005-fix-sparc64-stackpointer.patch
new file mode 100644
index 0000000..62de35f
--- /dev/null
+++ b/package/libsigsegv/0005-fix-sparc64-stackpointer.patch
@@ -0,0 +1,16 @@
+Fix sparc64 build.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur libsigsegv-2.10.orig/src/fault-linux-sparc.h libsigsegv-2.10/src/fault-linux-sparc.h
+--- libsigsegv-2.10.orig/src/fault-linux-sparc.h	2009-08-01 17:06:49.000000000 +0200
++++ libsigsegv-2.10/src/fault-linux-sparc.h	2015-11-29 11:55:29.000000000 +0100
+@@ -27,4 +27,8 @@
+    (see also <asm/sigcontext.h>)
+    are quite different types.  */
+ 
++#if __WORDSIZE == 64
++#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.mc_gregs[REG_O6]
++#else
+ #define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gregs[REG_O6]
++#endif
