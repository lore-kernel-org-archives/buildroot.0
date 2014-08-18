From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:04:58 +0200
Subject: [Buildroot] [git commit] package/gutenprint: replaces -static with
	-static-libtool-libs
Message-ID: <20140818090640.8A8AF9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f67e7ba06f5f00dc9153ad364932092692458704
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gutenprint rely on the original behaviour of -static, but since commit
in buildroot "support/libtool: make -static behave like -all-static" [1],
the build of genppd is broken.

genppd need to be build statically otherwise the following warning appears:
***WARNING: Use of --disable-static-genppd or --disable-static
            when building CUPS is very dangerous.  The build may
            fail when building the PPD files, or may *SILENTLY*
            build incorrect PPD files or cause other problems.
            Please review the README and release notes carefully!

[1] http://git.buildroot.net/buildroot/commit/?id=97703978ac870ce2b14ad144f8e082de82aa2c64

Fixes:
http://autobuild.buildroot.net/results/55f/55f78104d7a5d11baf5650ac12aaa1b23c2b7743/build-end.log
http://autobuild.buildroot.net/results/fc8/fc8cfe3f27ceaca70c7471c44305317c66cb0eea/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-replaces-static-with-static-libtool-lib.patch |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/gutenprint/gutenprint-001-cups-support-replaces-static-with-static-libtool-lib.patch b/package/gutenprint/gutenprint-001-cups-support-replaces-static-with-static-libtool-lib.patch
new file mode 100644
index 0000000..d8cfb7d
--- /dev/null
+++ b/package/gutenprint/gutenprint-001-cups-support-replaces-static-with-static-libtool-lib.patch
@@ -0,0 +1,39 @@
+From 08a5d355160eb2ac8346ae1b94591418343217f9 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 17 Aug 2014 23:43:20 +0200
+Subject: [PATCH 1/1] cups support: replaces -static with -static-libtool-libs
+
+gutenprint rely on the original behaviour of -static, but since commit
+in buildroot "support/libtool: make -static behave like -all-static" [1],
+the build of genppd is broken.
+
+genppd need to be build statically otherwise the following warning appears:
+***WARNING: Use of --disable-static-genppd or --disable-static
+            when building CUPS is very dangerous.  The build may
+            fail when building the PPD files, or may *SILENTLY*
+            build incorrect PPD files or cause other problems.
+            Please review the README and release notes carefully!
+
+[1] http://git.buildroot.net/buildroot/commit/?id=97703978ac870ce2b14ad144f8e082de82aa2c64
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/cups/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cups/Makefile.am b/src/cups/Makefile.am
+index 1e27ae0..d711b70 100644
+--- a/src/cups/Makefile.am
++++ b/src/cups/Makefile.am
+@@ -84,7 +84,7 @@ noinst_SCRIPTS=test-rastertogutenprint
+ endif
+ 
+ if BUILD_GENPPD_STATIC
+-STATIC_LDOPTS=-static -export-dynamic
++STATIC_LDOPTS=-static-libtool-libs -export-dynamic
+ endif
+ 
+ cups_calibrate_SOURCES = cups-calibrate.c
+-- 
+1.9.3
+
