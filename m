From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 18 Mar 2018 13:28:06 +0100
Subject: [Buildroot] [Resend V4 1/3] prosody: bump to version 0.10.0
Message-ID: <20180318122808.4291-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this version is not restricted to Lua 5.1

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/Config.in    |  4 ++--
 package/prosody/prosody.hash |  8 ++++----
 package/prosody/prosody.mk   | 20 +++++++++-----------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 77eeb85ab..1bc79b7f2 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PROSODY
 	bool "prosody"
-	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
@@ -15,4 +15,4 @@ config BR2_PACKAGE_PROSODY
 	  https://prosody.im
 
 comment "prosody needs the lua interpreter"
-	depends on !BR2_PACKAGE_LUA_5_1 && !BR2_PACKAGE_LUAJIT
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 38942ea7f..d56099456 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS
-md5    d743adea6cfbaacc3a24cc0c3928bb1b  prosody-0.9.12.tar.gz
-sha1   1ee224263a5b3d67960e12edbbe6b2f16b95d147  prosody-0.9.12.tar.gz
-sha256 1a59a322b71928a21985522aa00d0eab3552208d7bf9ecb318542a1b2fee3e8d  prosody-0.9.12.tar.gz
-sha512 e87b5f3b3e327722cec9d8d0470684e2ec2788a1c5ae623c4f505a00572ef21f65afe84cd5b7de47d6a65fe8872506fe34e5e8886e20979ff84710669857ca76  prosody-0.9.12.tar.gz
+md5    0eebf7a18ce1fc7dd9954c94ebd85f54  prosody-0.10.0.tar.gz
+sha1   57c1c5a665e6453bdde06727ef398cd69accd9d7  prosody-0.10.0.tar.gz
+sha256 7414e447256c60b2645578c4a5913113cd74b419ca5a032b54db90d98a978498  prosody-0.10.0.tar.gz
+sha512 ee66e240afba6a8cb286623da48d9b535798153fb65e32070cec93aafe360e91f7087eeb49dec0f7d145e24f04339ed0878e50835b52f682130b204e22990ce9  prosody-0.10.0.tar.gz
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index d19653503..3ff891909 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,29 +4,27 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.9.12
+PROSODY_VERSION = 0.10.0
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-PROSODY_DEPENDENCIES = openssl libidn
-
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
-PROSODY_DEPENDENCIES += lua
-endif
-
-ifeq ($(BR2_PACKAGE_LUAJIT),y)
-PROSODY_DEPENDENCIES += luajit
-endif
+PROSODY_DEPENDENCIES = host-luainterpreter luainterpreter libidn openssl
 
 PROSODY_CONF_OPTS = \
+	--with-lua-bin=$(HOST_DIR)/usr/bin \
 	--with-lua=$(STAGING_DIR)/usr \
+	--lua-version=$(LUAINTERPRETER_ABIVER) \
 	--c-compiler=$(TARGET_CC) \
-	--cflags="$(TARGET_CFLAGS) -fPIC" \
+	--cflags="$(TARGET_CFLAGS) -fPIC -std=c99" \
 	--linker=$(TARGET_CC) \
 	--ldflags="$(TARGET_LDFLAGS) -shared" \
 	--sysconfdir=/etc/prosody \
 	--prefix=/usr
 
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+PROSODY_CONF_OPTS += --runwith=luajit
+endif
+
 define PROSODY_CONFIGURE_CMDS
 	cd $(@D) && \
 		$(TARGET_CONFIGURE_OPTS) \
-- 
2.11.0
