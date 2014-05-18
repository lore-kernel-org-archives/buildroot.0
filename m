From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 May 2014 23:32:43 +0200
Subject: [Buildroot] [git commit] fbgrab: fix static linking
Message-ID: <20140518213731.7B7EE9CC00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8242149e48d78a5b62f2d9743dfa421bc1b8c65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/9e0/9e079632a6c0556c96ec8ed7564286aa84044bf7/
  http://autobuild.buildroot.org/results/401/401105b5e120176e78c2e5fcabe54ab0bde1bf40/
  and more

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbgrab/fbgrab-01-fix-static-build.patch |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/fbgrab/fbgrab-01-fix-static-build.patch b/package/fbgrab/fbgrab-01-fix-static-build.patch
new file mode 100644
index 0000000..fe5ae2c
--- /dev/null
+++ b/package/fbgrab/fbgrab-01-fix-static-build.patch
@@ -0,0 +1,21 @@
+Fix static build
+
+fbgrab links against libpng, which depends on libm. For shared library
+builds, there is nothing special to do about this, but for static
+library builds, it is necessary to pass -lm when linking fbgrab.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -12,7 +12,7 @@
+ all: fbgrab fbgrab.1.gz
+ 
+ fbgrab: fbgrab.c
+-	$(CC) -g -Wall $(CFLAGS) $(LDFLAGS) $< -lpng -lz -o $@
++	$(CC) -g -Wall $(CFLAGS) $(LDFLAGS) $< -lpng -lz -lm -o $@
+ 
+ fbgrab.1.gz: fbgrab.1.man
+ 	$(GZIP) $(GZIPFLAGS) $< > $@
