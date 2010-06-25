From: cmchao <cmchao@gmail.com>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] links : convert to autotools
	infrastructure & bump to 1.01pre1-no-ssl
Message-ID: <20100625103240.4983D81DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2406251d701a0be48d9e52bb0bf809586e62b920
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default behaviour
 * No installation to staging is the default behaviour
 * Stripping is done globally
 * Remove incorrect cleaning rules

Signed-off-by: cmchao <cmchao@gmail.com>
---
 .../links/links-1.01pre1-no-ssl-largefile.patch    |   22 +++++++
 package/links/links.mk                             |   62 ++------------------
 2 files changed, 28 insertions(+), 56 deletions(-)
 create mode 100644 package/links/links-1.01pre1-no-ssl-largefile.patch

diff --git a/package/links/links-1.01pre1-no-ssl-largefile.patch b/package/links/links-1.01pre1-no-ssl-largefile.patch
new file mode 100644
index 0000000..f3143cb
--- /dev/null
+++ b/package/links/links-1.01pre1-no-ssl-largefile.patch
@@ -0,0 +1,22 @@
+Index: links-1.01pre1-no-ssl/links.h
+===================================================================
+--- links-1.01pre1-no-ssl.orig/links.h	2010-06-21 00:39:10.000000000 +0200
++++ links-1.01pre1-no-ssl/links.h	2010-06-21 00:39:52.000000000 +0200
+@@ -2,6 +2,9 @@
+ #define __EXTENSIONS__
+ #endif
+ 
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE	1
+ #endif
+@@ -9,6 +12,7 @@
+ #ifndef _FILE_OFFSET_BITS
+ #define _FILE_OFFSET_BITS	64
+ #endif
++#endif
+ 
+ #ifdef HAVE_CONFIG_H
+ #include "config.h"
diff --git a/package/links/links.mk b/package/links/links.mk
index 298c165..2e17066 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -3,64 +3,14 @@
 # links (text based web browser)
 #
 #############################################################
-LINKS_VERSION:=0.99pre9-no-ssl
+LINKS_VERSION:=1.01pre1-no-ssl
 LINKS_SITE:=http://artax.karlin.mff.cuni.cz/~mikulas/vyplody/links/download/no-ssl
 LINKS_SOURCE:=links-$(LINKS_VERSION).tar.gz
-LINKS_DIR:=$(BUILD_DIR)/links-$(LINKS_VERSION)
 
-$(DL_DIR)/$(LINKS_SOURCE):
-	$(call DOWNLOAD,$(LINKS_SITE),$(LINKS_SOURCE))
+LINKS_CONF_OPT = --localstatedir=/tmp
 
-links-source: $(DL_DIR)/$(LINKS_SOURCE)
+define LINKS_INSTALL_TARGET_CMDS
+	install -c $(@D)/links $(TARGET_DIR)/usr/bin/links
+endef
 
-$(LINKS_DIR)/.unpacked: $(DL_DIR)/$(LINKS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LINKS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LINKS_DIR)/.unpacked
-
-$(LINKS_DIR)/.configured: $(LINKS_DIR)/.unpacked
-	(cd $(LINKS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/tmp \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-	)
-	touch $(LINKS_DIR)/.configured
-
-$(LINKS_DIR)/links: $(LINKS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LINKS_DIR)
-	$(STRIPCMD) $(LINKS_DIR)/links
-
-$(TARGET_DIR)/usr/bin/links: $(LINKS_DIR)/links
-	install -c $(LINKS_DIR)/links $(TARGET_DIR)/usr/bin/links
-
-links-clean:
-	-$(MAKE) -C $(LINKS_DIR) clean
-	rm -f $(TARGET_DIR)/usr/bin/links
-
-links-dirclean:
-	rm -rf $(LINKS_DIR)
-
-links: $(TARGET_DIR)/usr/bin/links
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LINKS),y)
-TARGETS+=links
-endif
+$(eval $(call AUTOTARGETS,package,links))
-- 
1.7.1
