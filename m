From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 12 Aug 2013 15:50:09 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: fix static build
Message-ID: <1376315409-12258-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When static build and sqlite3 support are enabled together,
link flags needs to be defined in the right order.

Fixes http://autobuild.buildroot.org/results/a74/a74ced69052c1d0a91dbe32483fd0612d1bf24a

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/aircrack-ng/aircrack-ng.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index fbefd74..00f4bac 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -13,7 +13,8 @@ AIRCRACK_NG_DEPENDENCIES = openssl
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	AIRCRACK_NG_MAKE_OPTS = sqlite=true
-	AIRCRACK_NG_MAKE_OPTS += LIBSQL="-lsqlite3"
+	AIRCRACK_NG_MAKE_OPTS += \
+		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -ldl -lpthread)"
 
 	AIRCRACK_NG_DEPENDENCIES += sqlite
 else
-- 
1.8.3.4
