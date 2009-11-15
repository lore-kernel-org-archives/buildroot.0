From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 11:12:56 +0100
Subject: [Buildroot] [PATCH 7/8] webkit: convert to autotools infrastructure
In-Reply-To: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258279977-1482-8-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/webkit/webkit.mk |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index bc7d062..01baa27 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -9,7 +9,6 @@ WEBKIT_SITE = http://nightly.webkit.org/files/trunk/src/
 
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_INSTALL_TARGET = YES
-WEBKIT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 WEBKIT_LIBTOOL_PATCH = NO
 
 WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite enchant \
@@ -25,11 +24,13 @@ endif
 
 WEBKIT_CONF_OPT += --disable-video
 
-$(eval $(call AUTOTARGETS,package,webkit))
+define WEBKIT_AUTOGEN_PATCH
+$(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/' $(WEBKIT_DIR)/autogen.sh
+$(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/' $(WEBKIT_DIR)/autogen.sh
+# Don't run the configure step yet
+cd $(WEBKIT_DIR); AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
+endef
+
+WEBKIT_POST_EXTRACT_HOOKS += WEBKIT_AUTOGEN_PATCH
 
-$(WEBKIT_HOOK_POST_EXTRACT):
-	$(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/' $(WEBKIT_DIR)/autogen.sh
-	$(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/' $(WEBKIT_DIR)/autogen.sh
-	# Don't run the configure step yet
-	cd $(WEBKIT_DIR); AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
-	touch $@
+$(eval $(call AUTOTARGETS,package,webkit))
-- 
1.6.5.2
