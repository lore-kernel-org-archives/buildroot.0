From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Dec 2019 10:47:01 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/dante: bump to version 1.4.2
Message-ID: <20191224094701.612213-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Drop second patch (not needed anymore as the sed expression s/-g//g
  has been replaced by s/-g //g)
- This bump fixes the build failure with latest libminiupnpc

Fixes:
 - http://autobuild.buildroot.org/results/8a92d5257ba3e6fd0ad56ddb0afad8b6edd40ae3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop second patch (not needed anymore)
 - Drop third patch (issue is not reproduced by Thomas)

 ...002-compiler.m4-do-not-remove-g-flag.patch | 42 -------------------
 package/dante/dante.hash                      |  7 +++-
 package/dante/dante.mk                        |  4 +-
 3 files changed, 7 insertions(+), 46 deletions(-)
 delete mode 100644 package/dante/0002-compiler.m4-do-not-remove-g-flag.patch

diff --git a/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch b/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch
deleted file mode 100644
index 0b41de6192..0000000000
--- a/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c00e284dd2baa5ecdb0c9586044399cd7cacce3e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 8 Aug 2016 12:31:40 +0200
-Subject: [PATCH] compiler.m4: do not remove -g flag
-
-A sed expression such as 's/-g//' not only removes the -g
-debugging-related flag, but also turns more specific flags such as
--mfloat-gprs=double into -mfloatprs=double, which is no longer a valid
-flag.
-
-However, it turns out that removing -g is not necessary: having -g0
-after -g negates the -g, and having -ggdb after -g is enough to produce
-debugging information for GDB.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- compiler.m4 | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/compiler.m4 b/compiler.m4
-index 3a23406..621372c 100644
---- a/compiler.m4
-+++ b/compiler.m4
-@@ -378,15 +378,9 @@ else
- 	gcc)
- 	    if test x"$aixldbug" != x; then
- 	        #disable debug info
--		if echo $CFLAGS | grep -- "-g" >/dev/null; then
--		    CFLAGS="`echo $CFLAGS | sed -e 's/-g//g'`"
--		fi
- 		CFLAGS="$CFLAGS${CFLAGS:+ }-g0"
- 	    else
- 		#use -ggdb also when not debugging
--		if echo $CFLAGS | grep -- "-g" >/dev/null; then
--		    CFLAGS="`echo $CFLAGS | sed -e 's/-g//g'`"
--		fi
- 		CFLAGS="$CFLAGS${CFLAGS:+ }-ggdb"
- 	    fi
- 	    ;;
--- 
-2.7.4
-
diff --git a/package/dante/dante.hash b/package/dante/dante.hash
index 38dea61b0a..cb87cdc04a 100644
--- a/package/dante/dante.hash
+++ b/package/dante/dante.hash
@@ -1,2 +1,5 @@
-# Locally computed
-sha256	b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53	dante-1.4.1.tar.gz
+# From https://www.inet.no/dante/download.html
+sha256	4c97cff23e5c9b00ca1ec8a95ab22972813921d7fbf60fc453e3e06382fc38a7	dante-1.4.2.tar.gz
+
+# Hash for license file
+sha256	954ab6dbcf994711e28e603d8657d6eceef333cd6f9ca6705f0e9d118ab7d69a	LICENSE
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 35b785dc70..6e950b119e 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-DANTE_VERSION = 1.4.1
+DANTE_VERSION = 1.4.2
 DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
 
-# 0002-compiler.m4-do-not-remove-g-flag.patch touches a m4 file
+# Needed so that our libtool patch applies properly
 DANTE_AUTORECONF = YES
 
 DANTE_CONF_OPTS += --disable-client --disable-preload
-- 
2.24.0
