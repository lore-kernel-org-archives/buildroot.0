From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Sep 2015 18:23:01 -0300
Subject: [Buildroot] [PATCH 1/2] libnetfilter_conntrack: bump to version
	1.0.5
Message-ID: <1442006582-20537-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches upstream so drop them along with autoreconf.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnetfilter_conntrack/0001-uclinux.patch  | 26 ---------------------
 .../0002-src-Makefile.am-drop-hardcoded-ldl.patch  | 27 ----------------------
 .../libnetfilter_conntrack.hash                    |  6 ++---
 .../libnetfilter_conntrack.mk                      |  4 +---
 4 files changed, 4 insertions(+), 59 deletions(-)
 delete mode 100644 package/libnetfilter_conntrack/0001-uclinux.patch
 delete mode 100644 package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch

diff --git a/package/libnetfilter_conntrack/0001-uclinux.patch b/package/libnetfilter_conntrack/0001-uclinux.patch
deleted file mode 100644
index ef79a80..0000000
--- a/package/libnetfilter_conntrack/0001-uclinux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From bdf4afdcb68f62fcd05536b8cb68478d3ea31c68 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 15:46:19 -0300
-Subject: [PATCH] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 12e1d16..1edfd66 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -19,7 +19,7 @@ AC_PROG_INSTALL
- AC_PROG_LN_S
- 
- case "$host" in 
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-1.8.1.5
-
diff --git a/package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch b/package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch
deleted file mode 100644
index e5ad3ba..0000000
--- a/package/libnetfilter_conntrack/0002-src-Makefile.am-drop-hardcoded-ldl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b8d32eff8dbfff5a93b6ea6ee9f5747e16cb32c4 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 14 Jan 2015 10:53:20 -0300
-Subject: [PATCH] src/Makefile.am: drop hardcoded -ldl
-
-This breaks static builds where the toolchain completely lacks libdl.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 7d6c905..374598a 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -11,6 +11,6 @@ lib_LTLIBRARIES = libnetfilter_conntrack.la
- libnetfilter_conntrack_la_LIBADD = conntrack/libnfconntrack.la \
- 				   expect/libnfexpect.la \
- 				   ${LIBNFNETLINK_LIBS} ${LIBMNL_LIBS}
--libnetfilter_conntrack_la_LDFLAGS = -Wc,-nostartfiles -lnfnetlink -ldl 	\
-+libnetfilter_conntrack_la_LDFLAGS = -Wc,-nostartfiles -lnfnetlink \
- 				    -version-info $(LIBVERSION)
- libnetfilter_conntrack_la_SOURCES = main.c callback.c
--- 
-2.0.5
-
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
index 13fde40..67d1e40 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.4.tar.bz2.{md5sum,sha1sum}
-md5	18cf80c4b339a3285e78822dbd4f08d7 	libnetfilter_conntrack-1.0.4.tar.bz2
-sha1	34fae1a30cbd51d46945e9f35790118c3462b0c6	libnetfilter_conntrack-1.0.4.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.5.tar.bz2.{md5sum,sha1sum}
+md5	6aa1bd3c1d0723235ac897087b4cd4e5	libnetfilter_conntrack-1.0.5.tar.bz2
+sha1	9aed8733d98af39d57fffd929c2bea70f1dcba06	libnetfilter_conntrack-1.0.5.tar.bz2
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index 7841f27..33f1294 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.4
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.5
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
 LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
-# For 0001-uclinux.patch & 0002-src-Makefile.am-drop-hardcoded-ldl.patch
-LIBNETFILTER_CONNTRACK_AUTORECONF = YES
 LIBNETFILTER_CONNTRACK_LICENSE = GPLv2+
 LIBNETFILTER_CONNTRACK_LICENSE_FILES = COPYING
 
-- 
2.4.6
