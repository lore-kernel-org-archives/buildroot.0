From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 21:52:07 +0200
Subject: [Buildroot] [git commit] package/oracle-mysql: don't use bundled
 zlib
Message-ID: <20200714194835.324F87FD9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fed83a03047535d4a9c849352f8c21b30177fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As spotted by Thomas Petazzoni during review of
https://patchwork.ozlabs.org/project/buildroot/patch/20200713215943.2240412-1-fontaine.fabrice at gmail.com,
oracle-mysql uses its bundled version of zlib if it is not found on the
system

So explictly disable zlib if needed and add a patch fixing build
failures without it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../oracle-mysql/0010-fix-build-without-zlib.patch | 52 ++++++++++++++++++++++
 package/oracle-mysql/oracle-mysql.mk               |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/package/oracle-mysql/0010-fix-build-without-zlib.patch b/package/oracle-mysql/0010-fix-build-without-zlib.patch
new file mode 100644
index 0000000000..b6e64e6bdd
--- /dev/null
+++ b/package/oracle-mysql/0010-fix-build-without-zlib.patch
@@ -0,0 +1,52 @@
+Fix build without zlib
+
+Don't include unconditionally zlib.h, and compile out code that
+requires zlib support.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -durN mysql-5.1.73.orig/mysys/checksum.c mysql-5.1.73/mysys/checksum.c
+--- mysql-5.1.73.orig/mysys/checksum.c	2020-07-14 17:34:38.212304432 +0200
++++ mysql-5.1.73/mysys/checksum.c	2020-07-14 18:06:45.076342493 +0200
+@@ -16,7 +16,9 @@
+ 
+ #include <my_global.h>
+ #include <my_sys.h>
++#ifdef HAVE_COMPRESS
+ #include <zlib.h>
++#endif
+ 
+ /*
+   Calculate a long checksum for a memoryblock.
+diff -durN mysql-5.1.73.orig/sql/item_strfunc.cc mysql-5.1.73/sql/item_strfunc.cc
+--- mysql-5.1.73.orig/sql/item_strfunc.cc	2020-07-14 17:34:38.160304431 +0200
++++ mysql-5.1.73/sql/item_strfunc.cc	2020-07-14 18:04:36.956339962 +0200
+@@ -35,7 +35,9 @@
+ #include "my_md5.h"
+ #include "sha1.h"
+ #include "my_aes.h"
++#ifdef HAVE_COMPRESS
+ #include <zlib.h>
++#endif
+ C_MODE_START
+ #include "../mysys/my_static.h"			// For soundex_map
+ C_MODE_END
+diff -durN mysql-5.1.73.orig/sql/sql_table.cc mysql-5.1.73/sql/sql_table.cc
+--- mysql-5.1.73.orig/sql/sql_table.cc	2020-07-14 17:34:38.156304431 +0200
++++ mysql-5.1.73/sql/sql_table.cc	2020-07-14 18:14:48.628352044 +0200
+@@ -1681,6 +1681,7 @@
+       goto end;
+     }
+   }
++#ifdef HAVE_COMPRESS
+   if (flags & WFRM_PACK_FRM)
+   {
+     /*
+@@ -1702,6 +1703,7 @@
+     }
+     error= my_delete(shadow_frm_name, MYF(MY_WME));
+   }
++#endif
+   if (flags & WFRM_INSTALL_SHADOW)
+   {
+ #ifdef WITH_PARTITION_STORAGE_ENGINE
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 8a8613a3d1..1449c58e41 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -68,6 +68,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ORACLE_MYSQL_DEPENDENCIES += zlib
+ORACLE_MYSQL_CONF_OPTS += --with-zlib-dir=$(STAGING_DIR)/usr
+else
+ORACLE_MYSQL_CONF_OPTS += --without-zlib-dir
 endif
 
 ifeq ($(BR2_PACKAGE_ORACLE_MYSQL_SERVER),y)
