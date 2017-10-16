From: Ismael Luceno <ismael@iodev.co.uk>
Date: Mon, 16 Oct 2017 17:12:21 -0300
Subject: [Buildroot] [PATCH v3] axel: bump to version 2.15
Message-ID: <20171016201221.17376-1-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Change upstream URL.
- Add optional dependency on libressl/openssl.
- Switch to autotools-package.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

---
changes from v2:
- comments on ac_cv_prog_cc_c99 and _POSIX_C_SOURCE

changes from v1:
- added missing AXEL_SOURCE
- added ac_cv_prog_cc_c99 to override C99 test
- added _POSIX_C_SOURCE to compile against uclibc

 package/axel/Config.in |  2 +-
 package/axel/axel.hash |  3 +--
 package/axel/axel.mk   | 43 +++++++++++++++++++------------------------
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/package/axel/Config.in b/package/axel/Config.in
index 6e709cfb1351..4507855ff8e7 100644
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
index 895767011892..a49de66b9497 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1 @@
-# Locally calculated
-sha256	359a57ab4e354bcb6075430d977c59d33eb3e2f1415a811948fa8ae657ca8036  axel-2.4.tar.gz
+sha256 70daa27abca5a3f1abe4be833d8f64205ac422416f5bcf396856eb6dd0fe9194  axel-2.15.tar.xz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 60bf5e4a61df..9b0c77b4d504 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,33 +4,28 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.4
-AXEL_SITE = http://sources.buildroot.net
+AXEL_VERSION = 2.15
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
+AXEL_CFLAGS = -D_POSIX_C_SOURCE=200112L
+# _POSIX_C_SOURCE required to compile against uClibc
+AXEL_CONF_OPTS = \
+	ac_cv_prog_cc_c99=-std=c99 \
+	CFLAGS="$(TARGET_CFLAGS) $(AXEL_CFLAGS)"
+# ac_cv_prog_cc_c99 is required because the C99 test relies on wchar_t
 
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
-- 
2.14.2
