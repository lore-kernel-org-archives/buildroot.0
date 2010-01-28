From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] webkit: convert to newstyle
	autotools infrastructure
Message-ID: <20100128150633.9A9D577719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c8bafd26692cc3182be8ac8032c1dd75a04f2672
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
