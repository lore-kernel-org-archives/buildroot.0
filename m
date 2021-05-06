From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  6 May 2021 22:52:29 +0200
Subject: [Buildroot] [PATCH v3] package/libtomcrypt: use makefile.unix
 (gains pkgconfig support)
Message-ID: <20210506205229.3228-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change from makefile to makefile.unix:
  - gains pkgconfig support (libtomcrypt.pc will be installed)
  - remove NODOCS (legacy, not used anymore)
  - remove INSTALL_USER/INSTALL_GROUP (not needed for makefile.unix)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - change from custom libtomcrypt.pc install/sed to makefile.unix
    (suggested by Arnout Vandecappelle)
  - no need for GIT_VERSION define (only used by - not compiled - tests)

Changes v1 -> v2:
  - use libtomcrypt provided libtomcrypt.pc.in template file
---
 package/libtomcrypt/libtomcrypt.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 35886057d4..fa2a585047 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -24,13 +24,12 @@ LIBTOMCRYPT_CFLAGS += -fPIC
 endif
 
 define LIBTOMCRYPT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f makefile.unix $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
 endef
 
 define LIBTOMCRYPT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" \
-		PREFIX=/usr NODOCS=1 INSTALL_USER=$(shell id -u) \
-		INSTALL_GROUP=$(shell id -g) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f makefile.unix \
+		DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
 endef
 
 $(eval $(generic-package))
-- 
2.31.1
