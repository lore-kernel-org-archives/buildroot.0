From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Nov 2015 14:55:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: Always link with libpthread
	for static builds
Message-ID: <1448805351-17846-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c9f/c9fb2b4a25817d6455472767819018a62281d5f9/
http://autobuild.buildroot.net/results/a75/a757edcfce00d3e52c6787f28dc31cbaf8d2d2ab/
http://autobuild.buildroot.net/results/8df/8df836b6c241954449544c7b4c74a1cb19e7ff7b/
http://autobuild.buildroot.net/results/1b6/1b6e571e307c2b190116601bade382c43e8d3858/
http://autobuild.buildroot.net/results/aa3/aa34b2326a0702093162eb1f9d7bdf9c7cf45311/
http://autobuild.buildroot.net/results/74a/74ae21d78f7ea9d71407accd3e43900af6766e68/
http://autobuild.buildroot.net/results/7ec/7ec28c23b3f12e5b7e2376c7913329d2a38dd232/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 76e3d62..8e28089 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -29,6 +29,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 PHP_CONF_ENV += LIBS="$(PHP_STATIC_LIBS)"
 endif
 
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+PHP_STATIC_LIBS += -lpthread
+endif
+
 ifeq ($(BR2_TARGET_LOCALTIME),)
 PHP_LOCALTIME = UTC
 else
@@ -209,9 +213,6 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC),y)
 PHP_CONF_OPTS += --with-pdo-odbc=unixODBC,$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += unixodbc
-ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-PHP_STATIC_LIBS += -lpthread
-endif
 endif
 endif
 
-- 
2.6.2
