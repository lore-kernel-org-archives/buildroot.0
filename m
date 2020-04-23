From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:15:15 +0200
Subject: [Buildroot] [git commit] package/libtasn1: bump to version 4.16.0
Message-ID: <20200423200056.66B428FC79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e1fde98e4deda8506e694c6d3ffba3fbd4d1d0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add patch to fix build
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-fuzz-Makefile.am-do-not-force-static.patch | 35 ++++++++++++++++++++++
 package/libtasn1/libtasn1.hash                     | 10 +++----
 package/libtasn1/libtasn1.mk                       |  2 +-
 3 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch b/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch
new file mode 100644
index 0000000000..1f1abc7d9d
--- /dev/null
+++ b/package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch
@@ -0,0 +1,35 @@
+From cf1b20f3d881a1cfbf8cae1f615f45a5a4fbb3b4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Apr 2020 18:35:55 +0200
+Subject: [PATCH] fuzz/Makefile.am: do not force static
+
+Don't force static when linking corpus2arry to libtasn1 otherwise the
+build will fail if libtasn1 has been built only as a shared library:
+
+  CCLD     corpus2array
+/home/fabrice/buildroot/output/host/lib/gcc/arm-buildroot-linux-musleabihf/8.4.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: attempted static link of dynamic object `../lib/.libs/libtasn1.so'
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/gnutls/libtasn1/-/merge_requests/61]
+---
+ fuzz/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fuzz/Makefile.am b/fuzz/Makefile.am
+index c6310d1..1fb7152 100644
+--- a/fuzz/Makefile.am
++++ b/fuzz/Makefile.am
+@@ -26,7 +26,7 @@ AM_CFLAGS = $(WERROR_CFLAGS) $(WARN_CFLAGS) $(CODE_COVERAGE_CFLAGS)
+ AM_CPPFLAGS = -I$(top_builddir)/lib/includes -I$(top_srcdir)/lib/includes -I$(srcdir) \
+  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl -DSRCDIR=\"$(abs_srcdir)\" \
+  $(CODE_COVERAGE_CPPFLAGS)
+-AM_LDFLAGS = -no-install -static
++AM_LDFLAGS = -no-install
+ 
+ LDADD = ../lib/gl/libgnu.la ../lib/libtasn1.la $(FUZZ_LIBS) $(CODE_COVERAGE_LIBS)
+ 
+-- 
+2.25.1
+
diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index e25e18abf8..93cfa1a68b 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.14.tar.gz.sig
-sha256	9e604ba5c5c8ea403487695c2e407405820d98540d9de884d6e844f9a9c5ba08	libtasn1-4.14.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.16.0.tar.gz.sig
+sha256  0e0fb0903839117cb6e3b56e68222771bebf22ad7fc2295a0ed7d576e8d4329d  libtasn1-4.16.0.tar.gz
 # Locally calculated
-sha256	7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6	LICENSE
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	doc/COPYING.LESSER
+sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  LICENSE
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  doc/COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 50afc4cdf9..d721e79a6a 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.14
+LIBTASN1_VERSION = 4.16.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
