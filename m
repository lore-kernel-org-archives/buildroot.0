From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 23:51:00 +0100
Subject: [Buildroot] [git commit] webkit: fix compilation without X11
Message-ID: <20130114225131.3EB169A12B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fce375dfc7d2040d10925e78286708576334f93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 http://autobuild.buildroot.net/results/86534588d192fe1515ce520c109e884864871d94/
and others.

Webkit includes X11 headers even when configuerd for DirecfFB, because
the test within GNUmakefile.in does not work properly. Autoreconfigure
fails because of incompatibility with buildroot's autotools version.

For now a patch for GNUmakefile.in fixes this problem.

Since webkit release is quite old it doesn't seem to be worth doing more,
on the long run we should bump the version.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../webkit-fix-compilation-on-DirectFB-2.patch     |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/webkit/webkit-fix-compilation-on-DirectFB-2.patch b/package/webkit/webkit-fix-compilation-on-DirectFB-2.patch
new file mode 100644
index 0000000..a15226e
--- /dev/null
+++ b/package/webkit/webkit-fix-compilation-on-DirectFB-2.patch
@@ -0,0 +1,33 @@
+From ef45c7ce5325d85ca924502b1b0a929fecd6581d Mon Sep 17 00:00:00 2001
+From: Stephan Hoffmann <sho@relinux.de>
+Date: Thu, 27 Dec 2012 18:08:29 +0100
+Subject: [PATCH] Fix test for presence of X11
+
+The test in GNUmakefile.in checking for presence of X11 and
+enabling the XP_UNIX define succeeds even when X11 is not
+present and Webkit is built for DirectFB.
+
+Because of this X11-headers are included and the build fails.
+
+Signed-off-by: Stephan Hoffmann <sho@relinux.de>
+---
+ GNUmakefile.in |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/GNUmakefile.in b/GNUmakefile.in
+index f14f27b..3ac811f 100644
+--- a/GNUmakefile.in
++++ b/GNUmakefile.in
+@@ -88,7 +88,8 @@ noinst_PROGRAMS = Programs/minidom$(EXEEXT) \
+ 	$(am__EXEEXT_1)
+ 
+ # For the Gtk port we want to use XP_UNIX both in X11 and Mac
+- at TARGET_WIN32_FALSE@am__append_1 = -DXP_UNIX
++ at TARGET_X11_TRUE@am__append_1 = -DXP_UNIX
++ at TARGET_QUARTZ_TRUE@am__append_1 = -DXP_UNIX
+ @USE_ICU_UNICODE_TRUE at am__append_2 = \
+ @USE_ICU_UNICODE_TRUE@	-DWTF_USE_ICU_UNICODE=1
+ 
+-- 
+1.7.0.4
+
