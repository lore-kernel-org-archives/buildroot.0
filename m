From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:27:52 +0200
Subject: [Buildroot] [git commit] lynx: add patch to fix static link issue
Message-ID: <20180513202746.82EC08B601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9113c0cbbaa9da796fef744700425eeff34f77b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lynx package incorrectly uses target LDFLAGS to build a host tool,
which causes a problem when we do a statically link build for the
target, on a host machine that doesn't support static linking.

A simple patch fixes the problematic makefile, and it has been
submitted upstream on the project mailing list.

Fixes:

  http://autobuild.buildroot.net/results/38ba2531eeeb4a7985eddd2df8bfaf0b56e6a687/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-don-t-build-host-tools-with-target-LDFL.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch b/package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch
new file mode 100644
index 0000000000..cc057cee13
--- /dev/null
+++ b/package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch
@@ -0,0 +1,41 @@
+From bb47abe9e7996147f6b7b325f5c9b2143abf8f13 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 7 May 2018 22:00:52 +0200
+Subject: [PATCH] src/chrtrans: don't build host tools with target LDFLAGS
+
+In a cross-compilation context, the LDFLAGS variable contains linker
+flags used when building things for the target. However, the makeuctb
+tool is built for the host machine, and therefore should not use the
+same LDFLAGS as the target, which is why BUILD_LDFLAGS exist.
+
+Using LDFLAGS when building a tool for the host can cause problems
+when some flags in LDFLAGS are not supported by the host machine. For
+example, if you're linking statically lynx for the target, but the
+build machine does not support static linking:
+
+gcc -I../.. -I../../src -I../../src/chrtrans -I../../WWW/Library/Implementation -I../../     -static  -o makeuctb makeuctb.o
+/usr/bin/ld: cannot find -lc
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: submitted on the mailing list
+---
+ src/chrtrans/makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/chrtrans/makefile.in b/src/chrtrans/makefile.in
+index aab358f..6e0ef03 100644
+--- a/src/chrtrans/makefile.in
++++ b/src/chrtrans/makefile.in
+@@ -123,7 +123,7 @@ OBJS		= makeuctb$o
+ C_SRC		= $(OBJS:$o=.c)
+ 
+ $(MAKEUCTB) : $(OBJS)
+-	$(BUILD_CC) $(CC_OPTS) $(LDFLAGS) $(BUILD_LDFLAGS) -o $@ $(OBJS) $(INTLLIB) $(BUILD_LIBS)
++	$(BUILD_CC) $(CC_OPTS) $(BUILD_LDFLAGS) -o $@ $(OBJS) $(INTLLIB) $(BUILD_LIBS)
+ 
+ makeuctb$o : $(srcdir)/UCkd.h $(srcdir)/makeuctb.c
+ 
+-- 
+2.14.3
+
