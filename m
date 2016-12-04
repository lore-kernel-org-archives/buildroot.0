From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Dec 2016 23:18:56 +0100
Subject: [Buildroot] [PATCH v2 1/3] core: waf-package infra: allow to
	override <pkg>_INSTALL_*_OPTS
Message-ID: <1480889938-11075-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some waf packages may want to pass additional variables to waf script
in install step.
Allow to override <pkg>_INSTALL_*_OPTS like it's done in other package
infra.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v2: override <pkg>_INSTALL_*_OPTS (Yann)
---
 package/pkg-waf.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 908ac03..74f70b6 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -49,6 +49,9 @@ else
 $(2)_WAF = ./waf
 endif
 
+$(2)_INSTALL_STAGING_OPTS 		?= install --destdir=$$(STAGING_DIR)
+$(2)_INSTALL_TARGET_OPTS 		?= install --destdir=$$(TARGET_DIR)
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file.
@@ -84,7 +87,7 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		install --destdir=$$(STAGING_DIR)
+		$$($(2)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -96,7 +99,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		install --destdir=$$(TARGET_DIR)
+		$$($(2)_INSTALL_TARGET_OPTS)
 endef
 endif
 
-- 
2.5.5
