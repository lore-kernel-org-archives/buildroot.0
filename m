From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 14:20:27 +0100
Subject: [Buildroot] [git commit] libatasmart: fix host/build flags
	confusion with strpool
Message-ID: <20130206132922.CFD9A9A977@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c4cee35dcf445b0d653fadc597b38849e9d6554
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/3fbdcd1db0272232231a2a5546925ef30e93bf9a

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libatasmart-strpool-cross-flags.patch          |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/libatasmart/libatasmart-strpool-cross-flags.patch b/package/libatasmart/libatasmart-strpool-cross-flags.patch
new file mode 100644
index 0000000..89b91cc
--- /dev/null
+++ b/package/libatasmart/libatasmart-strpool-cross-flags.patch
@@ -0,0 +1,42 @@
+From 730158700ea7a554c37f24bfbf5f4985f7280f3e Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Wed, 6 Feb 2013 14:07:02 +0100
+Subject: [PATCH] strpool: don't mix up host/build flags when cross compiling
+
+Submitted upstream as https://bugs.freedesktop.org/show_bug.cgi?id=60364
+
+Commit b71035ce89 (build-sys: modernize build system) changed the strpool
+(which needs to be built for the build machine) compilation to use
+AM_CFLAGS / AM_LDFLAGS rather than CFLAGS / LDFLAGS. This is wrong, as
+The AM_ version is used TOGETHER with (the user supplied) CFLAGS/LDFLAGS,
+causing strpool to use both CFLAGS (for host) and CCFLAGS_FOR_BUILD (for
+build) flags, breaking cross compilation with errors like:
+
+cc1: error: unrecognized command line option "-mabi=spe"
+
+Instead overwrite the (user supplied) CFLAGS with the (user supplied)
+CFLAGS_FOR_BUILD (and similar for LDFLAGS) like we used to do.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ strpool/Makefile.am |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/strpool/Makefile.am b/strpool/Makefile.am
+index b041cea..5b335a5 100644
+--- a/strpool/Makefile.am
++++ b/strpool/Makefile.am
+@@ -17,8 +17,8 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ CC = @CC_FOR_BUILD@
+-AM_CFLAGS = @BUILD_CFLAGS@
+-AM_LDFLAGS = @BUILD_LDFLAGS@
++CFLAGS = @BUILD_CFLAGS@
++LDFLAGS = @BUILD_LDFLAGS@
+ 
+ noinst_PROGRAMS = \
+ 	strpool
+-- 
+1.7.10.4
+
