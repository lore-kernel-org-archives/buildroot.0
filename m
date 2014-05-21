From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 21 May 2014 13:47:44 +0200
Subject: [Buildroot] [PATCH 1/1] python2: Fix disabling module bsddb
Message-ID: <1400672864-30941-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using this minimal defconfig

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_BERKELEYDB=y

the current code does not prevent the build of

output/build/python-2.7.6/Modules/_bsddb.o

because the module is really called _bsddb,
see python-2.7.6/Modules/_bsddb.c, line 9604.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python/python-110-optional-db.patch |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python/python-110-optional-db.patch b/package/python/python-110-optional-db.patch
index ea756da..a3e5fe8 100644
--- a/package/python/python-110-optional-db.patch
+++ b/package/python/python-110-optional-db.patch
@@ -70,7 +70,7 @@ Index: b/configure.ac
 +	AS_HELP_STRING([--disable-bsddb], [disable BerkeyleyDB]),
 +	[ if test "$enableval" = "no"; then
 +    	     BSDDB=no
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bsddb"
++    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bsddb"
 +  	  else
 +	     BSDDB=yes
 +  	  fi], [ BSDDB=yes ])
-- 
1.7.10.4
