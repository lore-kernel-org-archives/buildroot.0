From: Dushara Jayasinghe <nidujay@gmail.com>
Date: Sat,  9 Sep 2017 08:18:28 +1000
Subject: [Buildroot] [PATCH] Add package Prosody
In-Reply-To: <[Buildroot] Add package Prosody>
References: <[Buildroot] Add package Prosody>
Message-ID: <1504909108-18547-2-git-send-email-nidujay@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Description from website:

  Prosody is a modern XMPP communication server. It aims to be
  easy to set up and configure, and efficient with system
  resources.

This installs the base system with certificates for two domains:
localhost and example.com
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/prosody/Config.in    | 19 +++++++++++++++++
 package/prosody/prosody.hash |  5 +++++
 package/prosody/prosody.mk   | 51 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 79 insertions(+)
 create mode 100644 package/prosody/Config.in
 create mode 100644 package/prosody/prosody.hash
 create mode 100644 package/prosody/prosody.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f3944e2..c415ef9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -485,6 +485,9 @@ F:	package/nss-pam-ldapd/
 F:	package/sp-oops-extract/
 F:	package/unscd/
 
+N:	Dushara Jayasinghe <nidujay@gmail.com>
+F:	package/prosody/
+
 N:	Ed Swierk <eswierk@skyportsystems.com>
 F:	package/xxhash/
 
diff --git a/package/Config.in b/package/Config.in
index a21c5f0..4291d97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1716,6 +1716,7 @@ endif
 	source "package/pptp-linux/Config.in"
 	source "package/privoxy/Config.in"
 	source "package/proftpd/Config.in"
+	source "package/prosody/Config.in"
 	source "package/proxychains-ng/Config.in"
 	source "package/ptpd/Config.in"
 	source "package/ptpd2/Config.in"
diff --git a/package/prosody/Config.in b/package/prosody/Config.in
new file mode 100644
index 0000000..21dc037
--- /dev/null
+++ b/package/prosody/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PROSODY
+	bool "prosody"
+	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LUAEXPAT # runtime
+	select BR2_PACKAGE_LUASEC # runtime
+	select BR2_PACKAGE_LUASOCKET # runtime
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBIDN
+	select BR2_PACKAGE_LUAFILESYSTEM # runtime
+
+	help
+	  Prosody is a modern XMPP communication server. It aims to be
+	   easy to set up and configure, and efficient with system
+	   resources.
+
+	  https://prosody.im
+
+comment "prosody needs the lua interpreter"
+	depends on !BR2_PACKAGE_LUA_5_1 && !BR2_PACKAGE_LUAJIT
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
new file mode 100644
index 0000000..38942ea
--- /dev/null
+++ b/package/prosody/prosody.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS
+md5    d743adea6cfbaacc3a24cc0c3928bb1b  prosody-0.9.12.tar.gz
+sha1   1ee224263a5b3d67960e12edbbe6b2f16b95d147  prosody-0.9.12.tar.gz
+sha256 1a59a322b71928a21985522aa00d0eab3552208d7bf9ecb318542a1b2fee3e8d  prosody-0.9.12.tar.gz
+sha512 e87b5f3b3e327722cec9d8d0470684e2ec2788a1c5ae623c4f505a00572ef21f65afe84cd5b7de47d6a65fe8872506fe34e5e8886e20979ff84710669857ca76  prosody-0.9.12.tar.gz
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
new file mode 100644
index 0000000..5eea40c
--- /dev/null
+++ b/package/prosody/prosody.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# prosody
+#
+################################################################################
+
+PROSODY_VERSION = 0.9.12
+PROSODY_SOURCE = prosody-$(PROSODY_VERSION).tar.gz
+PROSODY_SITE = https://prosody.im/downloads/source
+PROSODY_LICENSE = MIT
+PROSODY_LICENSE_FILES = COPYING
+PROSODY_DEPENDENCIES = openssl libidn
+
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+	PROSODY_DEPENDENCIES += lua
+endif
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+	PROSODY_DEPENDENCIES += luajit
+endif
+
+define PROSODY_CONFIGURE_CMDS
+	(cd $(@D) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure --prefix=/usr \
+		--c-compiler=$(TARGET_CC) \
+		--cflags="$(TARGET_CFLAGS)" \
+		--linker=$(TARGET_CC) \
+		--ldflags="$(TARGET_LDFLAGS) -shared" \
+		--sysconfdir=/etc/prosody \
+		--with-lua=$(STAGING_DIR)/usr \
+	)
+endef
+
+define PROSODY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define PROSODY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+# make install installs a Makefile and meta data to generate certs
+define PROSODY_REMOVE_CERT_GENERATOR
+	rm -f $(TARGET_DIR)/etc/prosody/certs/Makefile
+	rm -f $(TARGET_DIR)/etc/prosody/certs/*.cnf
+endef
+
+PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_REMOVE_CERT_GENERATOR
+
+$(eval $(generic-package))
-- 
2.1.4
