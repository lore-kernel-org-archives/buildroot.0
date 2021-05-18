From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 May 2021 22:39:45 +0200
Subject: [Buildroot] [git commit branch/next] package/numactl: add -latomic
 to numa.pc
Message-ID: <20210518201526.CA31F87944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a699a667bd64a52ad3c30210c4756953232cc9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of passing -latomic through LDFLAGS as done in commit
4ed540ddf59bec4b389be44d7f42820d2466904f, properly check for it in
configure.ac and add it to numa.pc or numactl users won't be able to get
it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../numactl/0002-link-with-latomic-if-needed.patch | 52 ++++++++++++++++++++++
 package/numactl/numactl.mk                         |  4 --
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/package/numactl/0002-link-with-latomic-if-needed.patch b/package/numactl/0002-link-with-latomic-if-needed.patch
new file mode 100644
index 0000000000..6dff0cb233
--- /dev/null
+++ b/package/numactl/0002-link-with-latomic-if-needed.patch
@@ -0,0 +1,52 @@
+From e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 6 May 2021 23:08:36 +0200
+Subject: [PATCH] link with -latomic if needed
+
+numactl unconditionally uses __atomic_fetch_and but some architectures
+(e.g. sparc) needs to link with -latomic to be able to use it. So check
+if -latomic is needed and update numa.pc accordingly
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/numactl/numactl/commit/e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9]
+---
+ Makefile.am  | 1 +
+ configure.ac | 2 ++
+ numa.pc.in   | 1 +
+ 3 files changed, 4 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 44d0d76..34f6815 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -151,6 +151,7 @@ SED_PROCESS = \
+         -e 's, at exec_prefix\@,$(exec_prefix),g' \
+         -e 's, at libdir\@,$(libdir),g' \
+         -e 's, at includedir\@,$(includedir),g' \
++        -e 's, at LIBS\@,$(LIBS),g' \
+         < $< > $@ || rm $@
+ 
+ %.pc: %.pc.in Makefile
+diff --git a/configure.ac b/configure.ac
+index 659a765..e3b0eb3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -24,6 +24,8 @@ AM_CONDITIONAL([HAVE_TREE_VECTORIZE], [test x"${tree_vectorize}" = x"true"])
+ 
+ AC_CONFIG_FILES([Makefile])
+ 
++AC_SEARCH_LIBS([__atomic_fetch_and_1], [atomic])
++
+ # GCC tries to be "helpful" and only issue a warning for unrecognized
+ # attributes.  So we compile the test with Werror, so that if the
+ # attribute is not recognized the compilation fails
+diff --git a/numa.pc.in b/numa.pc.in
+index 8a0f202..cc04d50 100644
+--- a/numa.pc.in
++++ b/numa.pc.in
+@@ -8,3 +8,4 @@ Description: NUMA policy library
+ Version: @VERSION@
+ Cflags: -I${includedir}
+ Libs: -L${libdir} -lnuma
++Libs.Private: @LIBS@
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 3364f6c5c3..cf9c759693 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -12,8 +12,4 @@ NUMACTL_INSTALL_STAGING = YES
 NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-NUMACTL_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
-endif
-
 $(eval $(autotools-package))
