From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 10 Oct 2018 16:44:12 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-waf: add support for <pkg>_SUBDIR
Message-ID: <20181010144412.3408-1-lionel.orry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the Buildroot manual, it is specified that the Waf-based
infrastructure supports the <pkg>_SUBDIR variable, which was not true.

This patch makes use of this variable by changing to the given
sub-directory before executing waf commands.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
---
 package/pkg-waf.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index e5b606f063..826b73291b 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -54,13 +54,15 @@ $(2)_INSTALL_STAGING_OPTS		?=
 $(2)_INSTALL_TARGET_OPTS		?=
 $(2)_WAF_OPTS				?=
 
+$(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file.
 #
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$($(2)_CONF_ENV) \
 	$$(HOST_DIR)/bin/python2 $$($(2)_WAF) configure \
@@ -77,7 +79,7 @@ endif
 #
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -90,7 +92,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
@@ -104,7 +106,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
-- 
2.19.0
