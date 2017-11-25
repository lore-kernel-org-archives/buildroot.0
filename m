From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:21:27 +0100
Subject: [Buildroot] [git commit] axel: bump to version 2.16
Message-ID: <20171201205337.68E7B7FB0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=921014df873fbdeac63eb72164d40316721bb417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Change upstream URL.
- Add optional dependency on libressl/openssl.
- Switch to autotools-package.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/axel/Config.in |  2 +-
 package/axel/axel.hash |  3 +--
 package/axel/axel.mk   | 42 ++++++++++++++++++------------------------
 3 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/package/axel/Config.in b/package/axel/Config.in
index 6e709cf..4507855 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_AXEL
 	help
 	  HTTP/FTP download accelerator.
 
-	  http://axel.alioth.debian.org/
+	  https://github.com/axel-download-accelerator/axel/
 
 comment "axel needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 8957670..1fc1c55 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1 @@
-# Locally calculated
-sha256	359a57ab4e354bcb6075430d977c59d33eb3e2f1415a811948fa8ae657ca8036  axel-2.4.tar.gz
+sha256 bd65f8d8add34ab61ce1fb9e1c7b1c3449b1cfd981ce48aeee218e755ba0d6fb  axel-2.16.tar.xz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 60bf5e4..dcc8afd 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,33 +4,27 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.4
-AXEL_SITE = http://sources.buildroot.net
+AXEL_VERSION = 2.16
+AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
+AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
 AXEL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-AXEL_LDFLAGS = -lpthread $(TARGET_NLS_LIBS)
 
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-AXEL_DISABLE_I18N = --i18n=0
-endif
-
-define AXEL_CONFIGURE_CMDS
-	(cd $(@D); \
-		./configure \
-			--prefix=/usr \
-			--debug=1 \
-			$(AXEL_DISABLE_I18N) \
-	)
-endef
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+AXEL_CONF_OPTS = \
+	ac_cv_prog_cc_c99=-std=c99 \
+	CFLAGS="$(TARGET_CFLAGS)"
 
-define AXEL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-	LFLAGS="$(TARGET_LDFLAGS) $(AXEL_LDFLAGS)" -C $(@D)
-endef
-
-define AXEL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
-endef
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+AXEL_CONF_OPTS += --with-ssl
+AXEL_DEPENDENCIES += libressl
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+AXEL_CONF_OPTS += --with-ssl
+AXEL_DEPENDENCIES += openssl
+else
+AXEL_CONF_OPTS += --without-ssl
+endif
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
