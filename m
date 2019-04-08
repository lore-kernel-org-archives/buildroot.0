From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon,  8 Apr 2019 23:31:32 +0300
Subject: [Buildroot] [PATCH v3 1/1] package/gettext: Fix GETTEXTIZE is not
 defined in case of full gettext
Message-ID: <20190408203132.7740-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After introducing gettext-tiny in:

	5367a1b253 package/gettext-tiny: new package

GETTEXTIZE variable is conditionally defined separately by gettext-gnu
or gettext-tiny package depending on which of them is enabled. But it
causes the issue when BR2_TOOLCHAIN_HAS_FULL_GETTEXT=y, because in that
case BR2_PACKAGE_GETTEXT is not selected by BR2_SYSTEM_ENABLE_NLS config
and GETTEXTIZE is not defined, which causes build fail for packages
which uses gettextizing (e.g. host-flex).

Fix issue by defining GETTEXTIZE unconditionally in
package/gettext/gettext.mk. It is not needed to define it in each
gettext-*.mk because the difference is only in passing 'data_dir'
parameter which points to ${PREFIX}/share/gettext-tiny (in case of
gettext-tiny provider), but simple linking:

	${PREFIX}/share/gettext -> ${PREFIX}/share/gettext-tiny

solves this issue.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
v3:
    Make commit message more descriptive and cleaner, also fix 'data_dir'
    explanation which was not updated in v2.

v2:
    Do not use ${PREFIX}/share/gettext-tiny as 'data_dir' param for
    gettextize, but instead create link ${PREFIX}/share/gettext -> ${PREFIX}/share/gettext-tiny.
    It allows to have common invovation of gettextize in package/gettext.mk

 package/gettext-gnu/gettext-gnu.mk   |  4 ----
 package/gettext-tiny/gettext-tiny.mk | 10 +++-------
 package/gettext/gettext.mk           |  2 ++
 3 files changed, 5 insertions(+), 11 deletions(-)

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
index 4fa014e8dd..b596cefce8 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -98,6 +98,9 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext-tiny/po/Makevars.template
 
 	$(Q)touch $(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
+
+	# for gettextize
+	ln -sf $(HOST_DIR)/usr/share/gettext-tiny $(HOST_DIR)/usr/share/gettext
 endef
 
 # Install simple echo wrapper for gettext tool
@@ -105,12 +108,5 @@ define GETTEXT_TINY_INSTALL_TARGET_CMDS
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
index a86e26f69e..146d40e13b 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,5 +4,7 @@
 #
 ################################################################################
 
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
+
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
-- 
2.14.1
