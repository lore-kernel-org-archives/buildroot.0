From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon,  8 Apr 2019 03:10:21 +0300
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: Fix GETTEXTIZE is not
 defined in case of full gettext
Message-ID: <20190408001021.12249-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After introducing gettext-tiny in:

	5367a1b253 package/gettext-tiny: new package

GETTEXTIZE variable is defined separately by gettext-gnu or gettext-tiny
package depending on which of them is enabled. But it causes the issue when
BR2_TOOLCHAIN_HAS_FULL_GETTEXT=y, because in that case
BR2_PACKAGE_GETTEXT is not selected by BR2_SYSTEM_ENABLE_NLS config
and GETTEXTIZE is not defined, which causes build fail for packages
which uses gettextizing (e.g. host-flex).

Fix issue by defining GETTEXTIZE in package/gettext/gettext.mk, the
definition is almost same for gettext-gnu and gettext-tiny with only
difference in additional 'data_dir' variable for gettext-tiny case.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/gettext-gnu/gettext-gnu.mk   |  4 ----
 package/gettext-tiny/gettext-tiny.mk |  7 -------
 package/gettext/gettext.mk           | 10 ++++++++++
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 61adf72738..33a1cbed38 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -95,9 +95,5 @@ endef
 
 HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += HOST_GETTEXT_GNU_ADD_ABOUT_NLS
 
-ifeq ($(BR2_PACKAGE_GETTEXT_GNU),y)
-GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 4fa014e8dd..4d002aba4b 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -105,12 +105,5 @@ define GETTEXT_TINY_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(GETTEXT_TINY_PKGDIR)/gettext-wrapper $(TARGET_DIR)/usr/bin/gettext
 endef
 
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-GETTEXTIZE = $(HOST_CONFIGURE_OPTS) \
-	     AUTOM4TE=$(HOST_DIR)/bin/autom4te \
-	     gettext_datadir=$(HOST_DIR)/usr/share/gettext-tiny \
-	     $(HOST_DIR)/bin/gettextize -f
-endif
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index a86e26f69e..b836ebac57 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,5 +4,15 @@
 #
 ################################################################################
 
+GETTEXTIZE_ENV = $(HOST_CONFIGURE_OPTS) \
+	AUTOM4TE=$(HOST_DIR)/bin/autom4te
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+GETTEXTIZE_ENV += gettext_datadir=$(HOST_DIR)/usr/share/gettext-tiny
+endif
+
+GETTEXTIZE = $(GETTEXTIZE_ENV) \
+	$(HOST_DIR)/bin/gettextize -f
+
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
-- 
2.14.1
