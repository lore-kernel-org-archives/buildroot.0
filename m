From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:31:58 +0100
Subject: [Buildroot] [git commit] xfsprogs: fix build with libunistring
Message-ID: <20180323153303.1C68B81360@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a81601589ef87c4ebb69517455f0fef8df7dd6ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest xfsprogs bump to version 4.15.1 added an optional dependency
on libunistring. Make sure we build libunistring before xfsprogs.

xfsprogs also added -lunistring to its make dependency. This does not
work very well with cross compilation because make does not know about
sysroot. Add a patch to remove this dependency.

To make shared only link with libunistring work, we also need to extend
the -static-libtool-libs patch to cover xfs_scrub as well.

Fixes:
http://autobuild.buildroot.net/results/66e/66e425b00a06f928be0951ac4196190fe88b0f62/
http://autobuild.buildroot.net/results/1cd/1cde87d1daf3c6009220ff47512794cef6a2938f/
http://autobuild.buildroot.net/results/8ba/8ba4e94cfbb8a5cbb166423a671bdbcdf535f86b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...o-not-do-dynamic-linking-of-libtool-libra.patch | 25 ++++++++++++---
 ...scrub-fix-cross-compile-with-libunistring.patch | 37 ++++++++++++++++++++++
 package/xfsprogs/xfsprogs.mk                       |  4 +++
 3 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
index 4eb43480c0..74636c2ebb 100644
--- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
+++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
@@ -1,7 +1,8 @@
-From 770902a0a29fb4ac62358f7eacb3a83d0d9af1c7 Mon Sep 17 00:00:00 2001
+From d5cbb4f43cc9c30100fbf18a3e0d1fb95e1c1b0a Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Wed, 25 Nov 2015 10:50:00 +0000
-Subject: [PATCH] mdrestore: do not do dynamic linking of libtool libraries
+Subject: [PATCH] mdrestore, scrub: do not do dynamic linking of libtool
+ libraries
 
 As explained in commit ece49daeff1a3cad765e106d678c608925c9d768, use
 -static-libtool-libs instead of -static to allow fallback to the dynamic
@@ -11,11 +12,12 @@ ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
-[baruch: update for v4.15.1]
+[baruch: update for v4.15.1; extend to include scrub]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  mdrestore/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ scrub/Makefile     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/mdrestore/Makefile b/mdrestore/Makefile
 index 136ae716d691..75ff1bad78e9 100644
@@ -30,6 +32,19 @@ index 136ae716d691..75ff1bad78e9 100644
  
  default: depend $(LTCOMMAND)
  
+diff --git a/scrub/Makefile b/scrub/Makefile
+index 063279400262..949f6fd8ba94 100644
+--- a/scrub/Makefile
++++ b/scrub/Makefile
+@@ -70,7 +70,7 @@ xfs_scrub.c
+ 
+ LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
+ LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ 
+ ifeq ($(HAVE_MALLINFO),yes)
+ LCFLAGS += -DHAVE_MALLINFO
 -- 
-2.16.1
+2.16.2
 
diff --git a/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch b/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
new file mode 100644
index 0000000000..dfb66c6630
--- /dev/null
+++ b/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
@@ -0,0 +1,37 @@
+From 45d9ba0f01cceb75f72d157a9e4d9aaeb753a9c4 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 20 Mar 2018 14:13:28 +0200
+Subject: [PATCH] xfs_scrub: fix cross compile with libunistring
+
+Commit 4bbed4ecc2a (xfs_scrub: warn about normalized Unicode name collisions)
+added -lunistring to the list of the xfs_scrub dependencies. When cross
+compiling make fails to find the library on the target sysroot:
+
+make[3]: *** No rule to make target `-lunistring', needed by `xfs_scrub'.  Stop.
+
+Remove -lunistring from make dependencies of xfs_scrub to fix that.
+
+Cc: Darrick J. Wong <darrick.wong@oracle.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://patchwork.kernel.org/patch/10296957/
+
+ scrub/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scrub/Makefile b/scrub/Makefile
+index 949f6fd8ba94..979603f524ff 100644
+--- a/scrub/Makefile
++++ b/scrub/Makefile
+@@ -69,7 +69,7 @@ vfs.c \
+ xfs_scrub.c
+ 
+ LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
+-LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
++LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBRT)
+ LLDFLAGS = -static-libtool-libs
+ 
+ ifeq ($(HAVE_MALLINFO),yes)
+-- 
+2.16.2
+
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 7f49e2312f..dffcc28ab7 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -20,6 +20,10 @@ XFSPROGS_CONF_OPTS = \
 	INSTALL_GROUP=root \
 	--enable-static
 
+ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
+XFSPROGS_DEPENDENCIES += libunistring
+endif
+
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
