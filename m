From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:21 +0100
Subject: [Buildroot] [PATCH 03/10] package/libsvgtiny: enable shared library
	build
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libsvgtiny/libsvgtiny.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index a2d494e..6cb666f 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -11,18 +11,28 @@ LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
 LIBSVGTINY_LICENSE = MIT
 LIBSVGTINY_LICENSE_FILES = README
 
+# Prefer shared libraries if available
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBSVGTINY_COMPONENT_TYPE = lib-shared
+else
+LIBSVGTINY_COMPONENT_TYPE = lib-static
+endif
+
 define LIBSVGTINY_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr \
+		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE)
 endef
 
 define LIBSVGTINY_INSTALL_STAGING_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
+		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) \
+		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
 endef
 
 define LIBSVGTINY_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) \
+		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
 endef
 
 $(eval $(generic-package))
-- 
1.9.3
