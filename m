From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:36:07 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/minicom: fix
 build with lintl
Message-ID: <20190426130222.F018C838A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b606e353b6fa9f8d6d94633b92a822be18f12bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/e64cdcf648764be53a3e951304bb89dc9410db23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7d348c671b7c99176aa16553f7462c73e9fed527)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Makefile.am-fix-ascii-xfr-link-with-lintl.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch b/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch
new file mode 100644
index 0000000000..efc880d2e7
--- /dev/null
+++ b/package/minicom/0002-src-Makefile.am-fix-ascii-xfr-link-with-lintl.patch
@@ -0,0 +1,44 @@
+From 6fe734c5a1d51e2d4a3c1cd4d7a61cc246faa3f2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Apr 2019 13:34:23 +0200
+Subject: [PATCH] src/Makefile.am: fix ascii-xfr link with lintl
+
+ascii-xfr needs to link with lintl if needed:
+
+/home/dawncrow/buildroot-test/scripts/instance-0/output/host/bin/m68k-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -W -Wall -Wextra -std=gnu99 -Wno-format-truncation   -o ascii-xfr ascii-xfr.o ../lib/libport.a -lncurses
+ascii-xfr.o: In function `stats':
+ascii-xfr.c:(.text+0x4c): undefined reference to `libintl_gettext'
+ascii-xfr.c:(.text+0xb2): undefined reference to `libintl_gettext'
+ascii-xfr.o: In function `usage':
+ascii-xfr.c:(.text+0x10e): undefined reference to `libintl_gettext'
+ascii-xfr.o: In function `asend':
+ascii-xfr.c:(.text+0x534): undefined reference to `libintl_gettext'
+ascii-xfr.o: In function `main':
+ascii-xfr.c:(.text.startup+0xc8): undefined reference to `libintl_gettext'
+ascii-xfr.o:ascii-xfr.c:(.text.startup+0x1a8): more undefined references to `libintl_gettext' follow
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e64cdcf648764be53a3e951304bb89dc9410db23
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://salsa.debian.org/minicom-team/minicom/merge_requests/7]
+---
+ src/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 19b1888..ba92f71 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -29,6 +29,7 @@ confdir = @MINICOM_CONFDIR@
+ AM_CPPFLAGS = @CPPFLAGS@ -I$(top_srcdir)/lib -DCONFDIR=\"$(confdir)\" \
+               -DLOCALEDIR=\"$(datadir)/locale\"
+ 
++ascii_xfr_LDADD = @LIBINTL@
+ minicom_LDADD = @LIBINTL@ $(LIBICONV) $(MINICOM_LIBPORT) $(LOCKDEV_LIBS)
+ minicom_keyserv_LDADD = @LIBINTL@ $(MINICOM_LIBPORT)
+ runscript_LDADD = @LIBINTL@ $(MINICOM_LIBPORT)
+-- 
+2.20.1
+
