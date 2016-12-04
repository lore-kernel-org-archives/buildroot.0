From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Dec 2016 21:58:45 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
	additional variables for each build step
In-Reply-To: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480885126-517-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some waf packages may want to pass additional variables to waf script
in each build step. Add the possibility to do so by defining the
following variables:
  <pkg>_MAKE_OPTS for the build step
  <pkg>_INSTALL_STAGING_OPTS for the install to staging directory
  <pkg>_INSTALL_TARGET_OPTS for the install to target directory

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-waf.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 908ac03..97e2e6a 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -72,7 +72,8 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+		build -j $$(PARALLEL_JOBS) $$($(2)_MAKE_OPTS)
 endef
 endif
 
@@ -84,7 +85,8 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		install --destdir=$$(STAGING_DIR)
+		install --destdir=$$(STAGING_DIR) \
+		$$($(2)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -96,7 +98,8 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		install --destdir=$$(TARGET_DIR)
+		install --destdir=$$(TARGET_DIR) \
+		$$($(2)_INSTALL_TARGET_OPTS)
 endef
 endif
 
-- 
2.5.5
