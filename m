From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Fri, 10 Feb 2017 12:24:40 +0530
Subject: [Buildroot] [PATCH] wget: add upstream patch to fix build failure
Message-ID: <1486709680-22035-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/c86/c8657563e63e1012a3ae3c0c47663a951e280022

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 ...ve-skipping-libunistring-with-disable-iri.patch | 34 ++++++++++++++++++++++
 package/wget/wget.mk                               |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 package/wget/0002-Remove-skipping-libunistring-with-disable-iri.patch

diff --git a/package/wget/0002-Remove-skipping-libunistring-with-disable-iri.patch b/package/wget/0002-Remove-skipping-libunistring-with-disable-iri.patch
new file mode 100644
index 0000000..4ccc46a
--- /dev/null
+++ b/package/wget/0002-Remove-skipping-libunistring-with-disable-iri.patch
@@ -0,0 +1,34 @@
+From 990f3d67d340d226bbd4187f5d310a4d2bf2bfe4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 6 Feb 2017 11:25:48 +0100
+Subject: [PATCH] Remove skipping libunistring with --disable-iri
+
+* configure.ac: Remove checking for IRI=no
+
+On certain systems, gnulib falls back to libunistring
+for mbtowc() and wcwidth() (used in src/progress.c).
+
+Reported-by: Zhiming Wang
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8786e00..686f040 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -663,11 +663,6 @@ if test "X$iri" != "Xno"; then
+ #    ])
+   ])
+ fi
+-if test "X$iri" = "Xno"; then
+-  # we don't need libunistring - clear settings from gnulib module
+-  LIBUNISTRING=""
+-  LTLIBUNISTRING=""
+-fi
+ 
+ dnl
+ dnl Check for UUID
+-- 
+2.6.2
+
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index e0f680b..8698cdf 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -11,6 +11,9 @@ WGET_DEPENDENCIES = host-pkgconf
 WGET_LICENSE = GPLv3+
 WGET_LICENSE_FILES = COPYING
 
+# For 0002-Remove-skipping-libunistring-with-disable-iri.patch
+WGET_AUTORECONF = YES
+
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 WGET_DEPENDENCIES += busybox
-- 
2.6.2
