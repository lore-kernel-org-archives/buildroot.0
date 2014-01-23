From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jan 2014 12:45:33 +0100
Subject: [Buildroot] [git commit] sqlcipher: fix build for xtensa
Message-ID: <20140123114929.AEBED9C5F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43d8dc3a392dcb769075cf1b076376a280c15c99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sqlcipher package generates libraries that are too large for the xtensa
default placement of literals in a dedicated section. Use
-mtext-section-literal to place literals in the text section.

Fixes:
http://autobuild.buildroot.net/results/921/92116c2837e4c449919e7a0ab9aebd6abb1cbaf1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 6130870..ace5ce8 100644
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
