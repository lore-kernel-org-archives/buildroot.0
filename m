From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Nov 2014 21:16:34 +0200
Subject: [Buildroot] [PATCH] sqlcipher: fix openssl configure test when
	building statically
Message-ID: <f5e24794fa6adb5d60d830b44b0aafc1e81e875b.1416942994.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When testing link with openssl the configure script adds another -lcrypto
after LDFLAGS. This -lcrypto also needs -lz. Move libraries list to LIBS to
make -lz appear at the proper place.

Fixes:
http://autobuild.buildroot.net/results/59d/59d8d7c7f3e0a205503121c1288187471c0ce80f/
http://autobuild.buildroot.net/results/2ed/2ed2026bc5502807588a9335bd4c78e0a26c1cd3/
http://autobuild.buildroot.net/results/cd3/cd35b24422cf7f8697e81ca7f0dd2f06dfc55997/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sqlcipher/sqlcipher.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 86eebb5c4c68..664e0f39ab08 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -11,14 +11,14 @@ SQLCIPHER_INSTALL_STAGING = YES
 
 SQLCIPHER_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) $(SQLCIPHER_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS) $(SQLCIPHER_LDFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(SQLCIPHER_LIBS)" \
 	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPTS = \
 	--enable-threadsafe
 
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
-SQLCIPHER_LDFLAGS += -lcrypto -lz
+SQLCIPHER_LIBS += -lcrypto -lz
 
 ifneq ($(BR2_LARGEFILE),y)
 # the sqlite configure script fails to define SQLITE_DISABLE_LFS when
-- 
2.1.3
