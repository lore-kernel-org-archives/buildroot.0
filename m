From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 23:35:06 +0100
Subject: [Buildroot] [PATCH v2 4/5] package: use <pkg>_CONFIG_SCRIPTS in
	packages that used special handling
In-Reply-To: <1360276507-17272-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360276507-17272-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360276507-17272-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The packages changed by this commit were not only changing prefix= and
exec_prefix= during their <foo>-config fixups, they were also changing
includedir= and/or libdir=. So, they could not be directly converted
to the new <pkg>_CONFIG_SCRIPTS infrastructure.

However, a careful analysis of their default <foo>-config shows that
includedir= and libdir= is defined relatively to either ${prefix} and
${exec_prefix}. Therefore, the manual fixing of includedir= and
libdir= is useless, and fixing prefix= and exec_prefix=, as done by
the <pkg>_CONFIG_SCRIPTS mechanism is sufficient.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
---
Changelog v1 -> v2:
 * Add Acked-by from Samuel Martin
---
 package/freetype/freetype.mk |   19 +------------------
 package/libpng/libpng.mk     |   20 +-------------------
 package/libxslt/libxslt.mk   |   18 +-----------------
 3 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index be0f1a7..b08bbf7 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -14,26 +14,9 @@ FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2)
+FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 
-define FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/freetype-config
-endef
-
-FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
-
-define FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
-	rm -f $(TARGET_DIR)/usr/bin/freetype-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-FREETYPE_POST_INSTALL_TARGET_HOOKS += FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index d834876..2c18fde 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -12,25 +12,7 @@ LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
-
-define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng$(LIBPNG_SERIES)\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config
-endef
-
-LIBPNG_POST_INSTALL_STAGING_HOOKS += LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
-
-define LIBPNG_REMOVE_CONFIG_SCRIPTS
-	$(RM) -f $(TARGET_DIR)/usr/bin/libpng$(LIBPNG_SERIES)-config \
-		 $(TARGET_DIR)/usr/bin/libpng-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
-endif
+LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index a35b955..b6c6aad 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -12,7 +12,7 @@ LIBXSLT_LICENSE_FILES = COPYING
 
 LIBXSLT_CONF_OPT = --with-gnu-ld --without-debug \
 		--without-python --with-libxml-prefix=$(STAGING_DIR)/usr/
-
+LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = libxml2
 
 # If we have enabled libgcrypt then use it, else disable crypto support.
@@ -27,21 +27,5 @@ HOST_LIBXSLT_CONF_OPT = --without-debug --without-python --without-crypto
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
 
-define LIBXSLT_XSLT_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
-	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/xslt-config
-endef
-
-LIBXSLT_POST_INSTALL_STAGING_HOOKS += LIBXSLT_XSLT_CONFIG_FIXUP
-
-define LIBXSLT_REMOVE_CONFIG_SCRIPTS
-	$(RM) -f $(TARGET_DIR)/usr/bin/xslt-config
-endef
-
-ifneq ($(BR2_HAVE_DEVFILES),y)
-LIBXSLT_POST_INSTALL_TARGET_HOOKS += LIBXSLT_REMOVE_CONFIG_SCRIPTS
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
