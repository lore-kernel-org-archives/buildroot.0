From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  6 Dec 2016 20:49:06 +0100
Subject: [Buildroot] [PATCH v3 1/4] core: waf-package infra: add missing
	additional variables for each install step
Message-ID: <1481053749-9315-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some waf packages may want to pass additional variables to waf script
in install step. Add the possibility to do so by defining the
following variables:
  <pkg>_INSTALL_STAGING_OPTS for the install to staging directory
  <pkg>_INSTALL_TARGET_OPTS for the install to target directory

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v3: revert to v1
v2: override <pkg>_INSTALL_*_OPTS (Yann)
---
 package/pkg-waf.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 908ac03..a82f45c 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -49,6 +49,9 @@ else
 $(2)_WAF = ./waf
 endif
 
+$(2)_INSTALL_STAGING_OPTS 		?=
+$(2)_INSTALL_TARGET_OPTS 		?=
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file.
@@ -84,7 +87,8 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		install --destdir=$$(STAGING_DIR)
+		install --destdir=$$(STAGING_DIR) \
+		$$($(2)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -96,7 +100,8 @@ ifndef $(2)_INSTALL_TARGET_CMDS
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
