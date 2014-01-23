From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Jan 2014 11:53:52 +0200
Subject: [Buildroot] [PATCH] sqlcipher: fix build for xtensa
Message-ID: <7bfe4579b836ff4734d77ddaca7caaeb80c050c3.1390470832.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sqlcipher package generates libraries that are too large for the xtensa
default placement of literals in a dedicated section. Use
-mtext-section-literal to place literals in the text section.

Fixes:
http://autobuild.buildroot.net/results/921/92116c2837e4c449919e7a0ab9aebd6abb1cbaf1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sqlcipher/sqlcipher.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 6130870bba1f..ace5ce8f55c8 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -32,6 +32,10 @@ ifeq ($(BR2_PACKAGE_SQLCIPHER_STAT3),y)
 SQLCIPHER_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
 
+ifeq ($(BR2_xtensa),y)
+SQLCIPHER_CFLAGS += -mtext-section-literals
+endif
+
 ifeq ($(BR2_PACKAGE_SQLCIPHER_READLINE),y)
 SQLCIPHER_DEPENDENCIES += ncurses readline
 SQLCIPHER_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
-- 
1.8.5.2
