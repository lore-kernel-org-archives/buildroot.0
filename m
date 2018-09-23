From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Mon, 24 Sep 2018 00:04:59 +0200
Subject: [Buildroot] [PATCH 1/1] Clean up remaining references to
 $(HOST_DIR)/usr
Message-ID: <20180923220459.7756-1-ferdinand@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
---
 package/asterisk/asterisk.mk           | 2 +-
 package/clang/clang.mk                 | 6 +++---
 package/libhttpparser/libhttpparser.mk | 2 +-
 package/libssh2/libssh2.mk             | 2 +-
 package/prosody/prosody.mk             | 2 +-
 package/xmlstarlet/xmlstarlet.mk       | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 430b122655..f31e2394f7 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -292,7 +292,7 @@ HOST_ASTERISK_CONF_ENV = CONFIG_LIBXML2=$(HOST_DIR)/bin/xml2-config
 HOST_ASTERISK_CONF_OPTS = \
 	--without-newt \
 	--without-curses \
-	--with-ncurses=$(HOST_DIR)/usr
+	--with-ncurses=$(HOST_DIR)
 
 # Not an automake package, so does not inherit LDFLAGS et al. from
 # the configure run.
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 230d0c6b73..b0fc3ab800 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -51,8 +51,8 @@ CLANG_CONF_OPTS += \
 
 HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config
 CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
-	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/usr/bin/clang-tblgen \
-	-DLLVM_TABLEGEN_EXE:FILEPATH=$(HOST_DIR)/usr/bin/llvm-tblgen
+	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/bin/clang-tblgen \
+	-DLLVM_TABLEGEN_EXE:FILEPATH=$(HOST_DIR)/bin/llvm-tblgen
 
 # Clang can't be used as compiler on the target since there are no
 # development files (headers) and other build tools. So remove clang
@@ -81,7 +81,7 @@ CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_CLEANUP_TARGET
 # for cross-compiling clang
 define HOST_CLANG_INSTALL_CLANG_TBLGEN
 	$(INSTALL) -D -m 0755 $(HOST_CLANG_BUILDDIR)/bin/clang-tblgen \
-		$(HOST_DIR)/usr/bin/clang-tblgen
+		$(HOST_DIR)/bin/clang-tblgen
 endef
 HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
 
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index c71e043cdc..502ab75b88 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -28,7 +28,7 @@ define HOST_LIBHTTPPARSER_BUILD_CMDS
 endef
 
 define HOST_LIBHTTPPARSER_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 0e13701b29..89cb733224 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -42,7 +42,7 @@ endif
 
 HOST_LIBSSH2_DEPENDENCIES += host-openssl
 HOST_LIBSSH2_CONF_OPTS += --with-openssl \
-	--with-libssl-prefix=$(HOST_DIR)/usr \
+	--with-libssl-prefix=$(HOST_DIR) \
 	--without-libgcrypt
 
 $(eval $(autotools-package))
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index d95578253d..5282a9af0f 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -14,7 +14,7 @@ PROSODY_CFLAGS = $(TARGET_CFLAGS) -fPIC -std=c99 \
 	$(if BR2_TOOLCHAIN_USES_MUSL,-DWITHOUT_MALLINFO)
 
 PROSODY_CONF_OPTS = \
-	--with-lua-bin=$(HOST_DIR)/usr/bin \
+	--with-lua-bin=$(HOST_DIR)/bin \
 	--with-lua=$(STAGING_DIR)/usr \
 	--lua-version=$(LUAINTERPRETER_ABIVER) \
 	--c-compiler=$(TARGET_CC) \
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 1d748dc594..b79c3f566d 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -27,8 +27,8 @@ endif
 HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
 
 HOST_XMLSTARLET_CONF_OPTS += \
-	--with-libxml-prefix=$(HOST_DIR)/usr \
-	--with-libxslt-prefix=$(HOST_DIR)/usr
+	--with-libxml-prefix=$(HOST_DIR) \
+	--with-libxslt-prefix=$(HOST_DIR)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.19.0
