From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 14 Jan 2018 17:34:12 +0100
Subject: [Buildroot] [PATCH v2] augeas: bump to version 1.9.0
Message-ID: <20180114163412.16548-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two patches from upstream to fix a build issue when building an
example. Ideally, the examples should not be build at all. However,
upstream disliked the idea of adding configure options like
`--disable-examples` [1]. So we'll make do with the patches and force a
autoreconf.

Additionaly, the signature was checked and a hash for the license file
is added.

[1] https://github.com/hercules-team/augeas/issues/535

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
v2 (suggested by Thomas):
 * Add missing reference and SoB to upstream patches
 * Improve comment for AUTORECONF=YES
---
 ...missing-trailing-backslash-for-dump-LDADD.patch | 25 ++++++++++++++++
 ...efile-do-not-force-static-linking-of-dump.patch | 33 ++++++++++++++++++++++
 package/augeas/augeas.hash                         |  6 ++--
 package/augeas/augeas.mk                           |  5 +++-
 4 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
 create mode 100644 package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch

diff --git a/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch b/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
new file mode 100644
index 0000000000..82d7c892be
--- /dev/null
+++ b/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
@@ -0,0 +1,25 @@
+From d506cf6c1567cbb0a762c04d9354ab1694a5ac05 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 11 Dec 2017 23:33:08 +0100
+Subject: [PATCH] Update Makefile.am
+
+Add missing trailing backslash for `dump_LDADD`.
+
+Backported from: d506cf6c1567cbb0a762c04d9354ab1694a5ac05
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ examples/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index 66ebcdf2..a19597bf 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -13,5 +13,5 @@ fadot_LDADD = $(top_builddir)/src/libfa.la $(GNULIB)
+ 
+ dump_sources = dump.c
+ dump_LDFLAGS = -static
+-dump_LDADD =  $(top_builddir)/src/libaugeas.la $(top_builddir)/src/libfa.la
++dump_LDADD =  $(top_builddir)/src/libaugeas.la $(top_builddir)/src/libfa.la \
+ 	          $(GNULIB)
diff --git a/package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch b/package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch
new file mode 100644
index 0000000000..fe83fa7af6
--- /dev/null
+++ b/package/augeas/0002-examples-Makefile-do-not-force-static-linking-of-dump.patch
@@ -0,0 +1,33 @@
+From c50b793f6ab17c192e048b4a06421be7c6381998 Mon Sep 17 00:00:00 2001
+From: David Lutterkort <lutter@watzmann.net>
+Date: Fri, 5 Jan 2018 14:48:15 -0800
+Subject: [PATCH] * examples/Makefile.am: do not force static linking of dump
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Forcing static linking of 'dump' was accidentally left in from some
+testing; there is no reason to force that specifically for dump.
+
+Thanks to J?rg Krause for reporting the issue and verifying the fix.
+
+Fixes https://github.com/hercules-team/augeas/issues/535
+
+Backported from: c50b793f6ab17c192e048b4a06421be7c6381998
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ examples/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index a19597bf..928eb517 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -12,6 +12,5 @@ fadot_SOURCES = fadot.c
+ fadot_LDADD = $(top_builddir)/src/libfa.la $(GNULIB)
+ 
+ dump_sources = dump.c
+-dump_LDFLAGS = -static
+ dump_LDADD =  $(top_builddir)/src/libaugeas.la $(top_builddir)/src/libfa.la \
+ 	          $(GNULIB)
diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index e044ff42a7..a256686983 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,2 +1,4 @@
-# Locally calculated
-sha256  65cf75b5a573fee2a5c6c6e3c95cad05f0101e70d3f9db10d53f6cc5b11bc9f9  augeas-1.8.1.tar.gz
+# Locally calculated after checking pgp signature from
+# http://download.augeas.net/augeas-1.9.0.tar.gz.sig
+sha256  2b463d398cabc9b42747aa61d3e83ed6a93ce03d9074cf8e7a7bd3107a668343  augeas-1.9.0.tar.gz
+sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index 20d09eb390..8a7f38ede4 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.8.1
+AUGEAS_VERSION = 1.9.0
 AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
 AUGEAS_LICENSE_FILES = COPYING
 AUGEAS_DEPENDENCIES = host-pkgconf readline libxml2
 
+# patching examples/Makefile.am, can be removed when updating from version 1.9.0
+AUGEAS_AUTORECONF = YES
+
 AUGEAS_CONF_OPTS = --disable-gnulib-tests
 
 # Remove the test lenses which occupy about 1.4 MB on the target
-- 
2.15.1
