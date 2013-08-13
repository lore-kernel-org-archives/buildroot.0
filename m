From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 10:19:04 +0200
Subject: [Buildroot] [git commit] aircrack-ng: fix static build
Message-ID: <20130813082128.98B8D9B2B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1141d99aae9e1b139509ad71c969e6705417a48b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When static build and sqlite3 support are enabled together,
link flags needs to be defined in the right order.

Fixes http://autobuild.buildroot.org/results/a74/a74ced69052c1d0a91dbe32483fd0612d1bf24a

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aircrack-ng/aircrack-ng.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
