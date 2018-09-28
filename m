From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:44:26 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] screen: fix rare build
 failure on T_N undeclared
Message-ID: <20180928124350.624248A37D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=517c70cc6dee5ed1e5c38c154b0427893a0e5e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/arm-none-linux-gnueabi-gcc -c -I. -I.  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DETCSCREENRC='"/usr/etc/screenrc"' -DSCREENENCODINGS='"/usr/share/screen/utf8encodings"' -DHAVE_CONFIG_H -DGIT_REV=\"\" \
     -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_GNU_SOURCE list_display.c
In file included from screen.h:150:0,
                 from list_display.c:36:
display.h:154:19: error: 'T_N' undeclared here (not in a function)
   union tcu d_tcs[T_N];  /* terminal capabilities */

Macro T_N is defined in header file term.h but it may not be created
then fails. Backport patch to make sure term.h is created before compile
other source codes.

Fixes:
 - http://autobuild.buildroot.org/results/a62bea1fd32246526d59f029df3dca60f1cd710f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d496329a19c1989856cd5cef80f0d05255a27445)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../screen/0010-comm-h-now-depends-on-term-h.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/screen/0010-comm-h-now-depends-on-term-h.patch b/package/screen/0010-comm-h-now-depends-on-term-h.patch
new file mode 100644
index 0000000000..6ff6f3da0b
--- /dev/null
+++ b/package/screen/0010-comm-h-now-depends-on-term-h.patch
@@ -0,0 +1,28 @@
+From 39c5f1c76f1fcef4b5958bf828a63f53426b6984 Mon Sep 17 00:00:00 2001
+From: Mike Gerwitz <mike@mikegerwitz.com>
+Date: Tue, 24 Dec 2013 22:16:31 -0500
+Subject: comm.h now depends on term.h
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Patch retrieved and updated from:
+http://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c]
+---
+ src/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e791e79..d4f7c0b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -113,7 +113,7 @@ term.h: term.c term.sh
+ 
+ kmapdef.c: term.h
+ 
+-comm.h: comm.c comm.sh config.h
++comm.h: comm.c comm.sh config.h term.h
+ 	AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh $(srcdir)/comm.sh
+ 
+ docs:
+-- 
+cgit v1.0-41-gc330
+
