From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 23:59:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix static build
Message-ID: <20200713215943.2240412-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mysql needs -lz for static build

Fixes:
 - http://autobuild.buildroot.org/results/a5447c5105f15606ed562b39ca84c06e7e6b78c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb-mysql/libodb-mysql.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index 97cbcddf93..1a12220222 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -13,4 +13,9 @@ LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# mysql needs -lz, so we need to specify it for static builds
+LIBODB_MYSQL_CONF_ENV += LIBS=-lz
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0
