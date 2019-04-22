From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Apr 2019 11:16:51 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/neon: add NLS dependencies
Message-ID: <20190422091651.29540-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

neon checks for bind_textdomain_codeset
Helps neon to find lintl so it will correctly add -lintl to neon-config
en neon.pc. This will fix build of packages using neon such as nu

Fixes:
 - http://autobuild.buildroot.org/results/f7e6afce4b3335573f3cc62d282368b288e9a65a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Help neon finding TARGET_NLS_LIBS

 package/neon/neon.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 1b8eb368c2..2c00e6a8b4 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -11,7 +11,8 @@ NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
-NEON_DEPENDENCIES = host-pkgconf
+NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
 NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
-- 
2.20.1
