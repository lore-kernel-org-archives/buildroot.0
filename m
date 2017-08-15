From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:03:55 +0200
Subject: [Buildroot] [git commit] libspatialindex: fix build on Microblaze
Message-ID: <20170815160109.8A5667FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5299a7dd02a1ba74b6e089a428d0de720091e17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the build of libspatialindex on the Microblaze
architecture by working around a gcc bug, by passing -O0 as the
optimization level.

A patch to configure.ac is needed to not have -O2 be forced by the
libspatialindex build system, and therefore AUTORECONF=YES is now
needed.

Fixes:

  http://autobuild.buildroot.net/results/bbba2a2c97dbec21340c7fd07162a316a411cba4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-configure.ac-do-not-force-O2.patch        | 30 ++++++++++++++++++++++
 package/libspatialindex/libspatialindex.mk         | 12 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/package/libspatialindex/0001-configure.ac-do-not-force-O2.patch b/package/libspatialindex/0001-configure.ac-do-not-force-O2.patch
new file mode 100644
index 0000000..c078e71
--- /dev/null
+++ b/package/libspatialindex/0001-configure.ac-do-not-force-O2.patch
@@ -0,0 +1,30 @@
+From 7472764fe19cb3eea77f21cc2859859b8ac62085 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 14 Aug 2017 23:36:36 +0200
+Subject: [PATCH] configure.ac: do not force -O2
+
+The user may want to provide its own set of optimization flags, and
+therefore forcing -O2 should not be done.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Submitted-upstream: https://github.com/libspatialindex/libspatialindex/pull/101
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index dc5e49f..2e2aa68 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -53,7 +53,7 @@ if test "x$enable_debug" = "xyes"; then
+ 	CXXFLAGS="$CXXFLAGS -g -DDEBUG"
+ 	AC_MSG_RESULT(checking wether debug information is enabled... yes)
+ else
+-	CXXFLAGS="$CXXFLAGS -O2 -DNDEBUG"
++	CXXFLAGS="$CXXFLAGS -DNDEBUG"
+ 	AC_MSG_RESULT(checking wether debug information is enabled... no)
+ fi
+ 
+-- 
+2.9.4
+
diff --git a/package/libspatialindex/libspatialindex.mk b/package/libspatialindex/libspatialindex.mk
index d815364..3a558df 100644
--- a/package/libspatialindex/libspatialindex.mk
+++ b/package/libspatialindex/libspatialindex.mk
@@ -11,4 +11,16 @@ LIBSPATIALINDEX_INSTALL_STAGING = YES
 LIBSPATIALINDEX_LICENSE = MIT
 LIBSPATIALINDEX_LICENSE_FILES = COPYING
 
+# 0001-configure.ac-do-not-force-O2.patch
+LIBSPATIALINDEX_AUTORECONF = YES
+
+LIBSPATIALINDEX_CXXFLAGS = $(TARGET_CXXFLAGS)
+LIBSPATIALINDEX_CONF_ENV = CXXFLAGS="$(LIBSPATIALINDEX_CXXFLAGS)"
+
+# Workaround gcc ICE
+# (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485)
+ifeq ($(BR2_microblaze),y)
+LIBSPATIALINDEX_CXXFLAGS += -O0
+endif
+
 $(eval $(autotools-package))
