From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Nov 2020 21:26:31 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/rhash: bump version to 1.4.0
Message-ID: <20201106202632.2424688-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Project switched license to BSD Zero Clause License:
https://github.com/rhash/RHash/commit/007a303dacb1ad27fb64e2133dfb8b4e28428af2

Add RHASH_CONFIGURE_CMDS after upstream added a configure script:
https://github.com/rhash/RHash/commit/cdaf43862229fb0f10d2b6b7448bcded2ef8edde

Make target install-headers was renamed to install-lib-headers:
https://github.com/rhash/RHash/commit/5184f57ed8c8a3d3ad66d789429bd8d1afc012ff

Make target install-shared was removed, use build-install-binary
instead:
https://github.com/rhash/RHash/commit/cdaf43862229fb0f10d2b6b7448bcded2ef8edde

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rhash/rhash.hash |  9 ++++-----
 package/rhash/rhash.mk   | 32 +++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index 9a29b988a6..29df4daa12 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,6 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.3.5/
-md5 f586644019c10c83c6b6835de4b99e74  rhash-1.3.5-src.tar.gz
-sha1 990c9a0135afe48dee4ce1dbf83578e44735f302  rhash-1.3.5-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.0/
+sha1  3db1e87a31c77ca2fa5507db7932ef92e9eb5148  rhash-1.4.0-src.tar.gz
 # Locally calculated
-sha256 98e0688acae29e68c298ffbcdbb0f838864105f9b2bd8857980664435b1f1f2e  rhash-1.3.5-src.tar.gz
-sha256 8cf876d3406a2eed6c17ae804c8958bd78d3a0f63c30d6e2e789ab575e9fde40  COPYING
+sha256  2ea39540f5c580da0e655f7b483c19e0d31506aed4202d88e8459fa7aeeb8861  rhash-1.4.0-src.tar.gz
+sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 28fffe4528..55fb08ecea 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,26 +4,36 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.3.5
+RHASH_VERSION = 1.4.0
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
-RHASH_LICENSE = MIT
+RHASH_LICENSE = 0BSD
 RHASH_LICENSE_FILES = COPYING
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
-RHASH_ADDCFLAGS = $(if $(BR2_SYSTEM_ENABLE_NLS),-DUSE_GETTEXT)
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+RHASH_CONF_OPTS += --disable-gettext
+else
+RHASH_CONF_OPTS += --enable-gettext
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+RHASH_CONF_OPTS += --enable-openssl
 RHASH_DEPENDENCIES += openssl
-RHASH_ADDCFLAGS += -DOPENSSL_RUNTIME -rdynamic
-RHASH_ADDLDFLAGS += -ldl
+else
+RHASH_CONF_OPTS += --disable-openssl
 endif
 
-RHASH_MAKE_OPTS = \
-	ADDCFLAGS="$(RHASH_ADDCFLAGS)" \
-	ADDLDFLAGS="$(RHASH_ADDLDFLAGS)" \
-	PREFIX="/usr"
+define RHASH_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure \
+		--prefix=/usr \
+		--cc=$(TARGET_CC) \
+		--target=$(GNU_TARGET_NAME) \
+		$(RHASH_CONF_OPTS) \
+	)
+endef
 
 ifeq ($(BR2_SHARED_LIBS),y)
 RHASH_BUILD_TARGETS = lib-shared build-shared
@@ -44,13 +54,13 @@ endef
 define RHASH_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
 		DESTDIR="$(STAGING_DIR)" $(RHASH_MAKE_OPTS) $(RHASH_INSTALL_TARGETS) \
-		install-headers
+		install-lib-headers
 endef
 
 ifeq ($(BR2_PACKAGE_RHASH_BIN),y)
 define RHASH_INSTALL_TARGET_RHASH_BIN
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) install-shared
+		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) build-install-binary
 endef
 endif
 
-- 
2.27.0
