From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Dec 2019 23:27:46 +0100
Subject: [Buildroot] [PATCH 3/3] package/dante: bump to version 1.4.2
In-Reply-To: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
References: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
Message-ID: <20191209222746.3440986-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Refresh second patch
- Add third patch
- This bump fixes the build failure with latest libminiupnpc

Fixes:
 - http://autobuild.buildroot.org/results/8a92d5257ba3e6fd0ad56ddb0afad8b6edd40ae3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-compiler.m4-do-not-remove-g-flag.patch | 12 ++++---
 ...m4-Remove-getaddrinfo-too-low-checks.patch | 35 +++++++++++++++++++
 package/dante/dante.hash                      |  7 ++--
 package/dante/dante.mk                        |  2 +-
 4 files changed, 48 insertions(+), 8 deletions(-)
 create mode 100644 package/dante/0003-osdep-m4-Remove-getaddrinfo-too-low-checks.patch

diff --git a/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch b/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch
index 0b41de6192..a56fe297cb 100644
--- a/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch
+++ b/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch
@@ -13,6 +13,8 @@ after -g negates the -g, and having -ggdb after -g is enough to produce
 debugging information for GDB.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Fabrice: update for 1.4.2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  compiler.m4 | 6 ------
  1 file changed, 6 deletions(-)
@@ -21,18 +23,18 @@ diff --git a/compiler.m4 b/compiler.m4
 index 3a23406..621372c 100644
 --- a/compiler.m4
 +++ b/compiler.m4
-@@ -378,15 +378,9 @@ else
+@@ -443,15 +443,9 @@ else
  	gcc)
  	    if test x"$aixldbug" != x; then
  	        #disable debug info
--		if echo $CFLAGS | grep -- "-g" >/dev/null; then
--		    CFLAGS="`echo $CFLAGS | sed -e 's/-g//g'`"
+-		if echo $CFLAGS | grep -- "-g " >/dev/null; then
+-		    CFLAGS="`echo $CFLAGS | sed -e 's/-g //g'`"
 -		fi
  		CFLAGS="$CFLAGS${CFLAGS:+ }-g0"
  	    else
  		#use -ggdb also when not debugging
--		if echo $CFLAGS | grep -- "-g" >/dev/null; then
--		    CFLAGS="`echo $CFLAGS | sed -e 's/-g//g'`"
+-		if echo $CFLAGS | grep -- "-g " >/dev/null; then
+-		    CFLAGS="`echo $CFLAGS | sed -e 's/-g //g'`"
 -		fi
  		CFLAGS="$CFLAGS${CFLAGS:+ }-ggdb"
  	    fi
diff --git a/package/dante/0003-osdep-m4-Remove-getaddrinfo-too-low-checks.patch b/package/dante/0003-osdep-m4-Remove-getaddrinfo-too-low-checks.patch
new file mode 100644
index 0000000000..af23d46d11
--- /dev/null
+++ b/package/dante/0003-osdep-m4-Remove-getaddrinfo-too-low-checks.patch
@@ -0,0 +1,35 @@
+osdep.m4: Remove getaddrinfo() too low checks
+
+dante runs AC_PREPROC_IFELSE then it fills $ERRVALFILE by running the
+following command:
+
+cat conftest.i | grep gaierrval: >>$2
+
+As a result, $ERRVALFILE does not contain the expected values because
+the expected value is not on the same line than gaierrval:
+
+ gaierrval: 
+ # 130 "conftest.c" 3 4
+           -3
+
+So drop these checks
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nuar dante-1.4.2-orig/osdep.m4 dante-1.4.2/osdep.m4
+--- dante-1.4.2-orig/osdep.m4	2019-12-09 21:28:38.936003218 +0100
++++ dante-1.4.2/osdep.m4	2019-12-09 21:49:48.764019371 +0100
+@@ -956,13 +956,7 @@
+ unset UNIQUEVALS UNIQUESYMBOLS
+ if test -s $ERRVALFILE; then
+     UNIQUEVALS=`sort $ERRVALFILE | uniq | wc -l | awk '{ print $1 }'`
+-    if test $UNIQUEVALS -le 1; then
+-        AC_MSG_FAILURE([error: getaddrinfo() error value count too low])
+-    fi
+     UNIQUESYMBOLS=`cat $ERRVALFILE | wc -l | awk '{ print $1 }'`
+-    if test $UNIQUESYMBOLS -le 1; then
+-        AC_MSG_FAILURE([error: getaddrinfo() error symbol count too low])
+-    fi
+ 
+     if test $ERRNOCNT -ne $UNIQUESYMBOLS; then
+ 	AC_MSG_FAILURE([internal error: errno symbol count mismatch])
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
index 35b785dc70..14b21b13bf 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DANTE_VERSION = 1.4.1
+DANTE_VERSION = 1.4.2
 DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
-- 
2.24.0
