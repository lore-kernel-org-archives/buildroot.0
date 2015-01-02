From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 12:23:25 +0100
Subject: [Buildroot] [git commit] package/libsvgtiny: enable shared library
	build
Message-ID: <20150102112332.9020A80825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c24f7cdd11a2045e4d018103fa36e61e556bbde6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: clarify the comment explaining why we only build/install the
shared library when BR2_STATIC_SHARED_LIBS=y.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsvgtiny/libsvgtiny.mk |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index a2d494e..3fc759f 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -11,18 +11,30 @@ LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
 LIBSVGTINY_LICENSE = MIT
 LIBSVGTINY_LICENSE_FILES = README
 
+# The libsvgtiny build system cannot build both the shared and static
+# libraries. So when the Buildroot configuration requests to build
+# both the shared and static variants, we build only the shared one.
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
