From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:09:45 +0200
Subject: [Buildroot] [git commit] openssl: always build apps
Message-ID: <20150706150958.C271F807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7bc0b96233900a4f36cbb333c12ad64b03f8db9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that building the openssl binary without MMU is supported, the only
reason left for not building apps if the openssl binary is disabled is
to save build time. Moreover, the commit
720893b62510438237b9923d744dd079ddb4f67d "openssl: disable apps for
NOMMU", which added this behavior, had a side effect: the scripts from
apps (CA.pl, CA.sh and tsget) and the default configuration file
(openssl.cnf) were no longer installed, which is not advertized by the
BR2_PACKAGE_OPENSSL_BIN option. CA.pl and CA.sh use the openssl binary,
so not installing them without the latter makes sense. But tsget does
not use the openssl binary, and openssl.cnf can be used by libcrypto, so
it is preferable to handle BR2_PACKAGE_OPENSSL_BIN like before the
commit mentioned above, i.e. to always build and install apps and to
just remove the openssl binary afterwards if needed.

This is what the current commit does, but installing only the helper
scripts having their dependencies (perl or the openssl binary)
satisfied. The help text is updated accordingly.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/Config.in  |    7 +++++--
 package/openssl/openssl.mk |   23 +++++++++++++++--------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d147c07..0785253 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -9,14 +9,17 @@ config BR2_PACKAGE_OPENSSL
 
 	  http://www.openssl.org/
 
+	  Note: Some helper scripts need perl.
+
 if BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Install the openssl binary to the target file system. This is a
-	  command line tool for doing various crypthographic stuff.
+	  Install the openssl binary and the associated helper scripts to the
+	  target file system. This is a command line tool for doing various
+	  cryptographic stuff.
 
 comment "openssl binary needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 34a9830..4068cf1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -14,14 +14,6 @@ HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
-define OPENSSL_DISABLE_APPS
-	$(SED) '/^build_apps/! s/build_apps//' $(@D)/Makefile.org
-	$(SED) '/^DIRS=/ s/apps//' $(@D)/Makefile.org
-endef
-OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
-endif
-
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
 endif
@@ -140,6 +132,21 @@ endef
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS_SHARED
 endif
 
+ifeq ($(BR2_PACKAGE_PERL),)
+define OPENSSL_REMOVE_PERL_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.pl,tsget}
+endef
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_PERL_SCRIPTS
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
+define OPENSSL_REMOVE_BIN
+	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
+	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.*,c_*}
+endef
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_BIN
+endif
+
 ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 define OPENSSL_REMOVE_OPENSSL_ENGINES
 	rm -rf $(TARGET_DIR)/usr/lib/engines
