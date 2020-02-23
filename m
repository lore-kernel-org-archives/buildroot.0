From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 08:48:01 +0100
Subject: [Buildroot] [git commit] package/libsvgtiny: fix parallel build
Message-ID: <20200223073624.3917E8E771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f36c045e7b6e1ba9b07aed6b10fc2bf24462f073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix previous commit[1] which purpose was to fix parallel build. It
didn't work since it assigned $(MAKE1) to LIBSVGTINY_MAKE, but this is a
generic-package and building is done using $(MAKE), then LIBSVGTINY_MAKE
was ignored. Let's substitute instead $(MAKE) with $(MAKE1) in
LIBSVGTINY_BUILD_CMDS.

[1]:
https://git.buildroot.net/buildroot/commit/?id=26d67a2599d6c88facd5178de853fa355244e7c2

Fixes:
http://autobuild.buildroot.net/results/67d/67d341c0cc272323d6e231a20796a6848c21d760/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998 at free.fr:
  - use $(MAKE1) in all three step
  - move comment out of the define
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsvgtiny/libsvgtiny.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index fe7dc0a6d2..55ce4327fe 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -12,8 +12,6 @@ LIBSVGTINY_DEPENDENCIES = \
 	libxml2 host-gperf host-pkgconf host-netsurf-buildsystem
 LIBSVGTINY_LICENSE = MIT
 LIBSVGTINY_LICENSE_FILES = README
-# Package does not build in parallel due to improper make rules
-LIBSVGTINY_MAKE = $(MAKE1)
 
 # The libsvgtiny build system cannot build both the shared and static
 # libraries. So when the Buildroot configuration requests to build
@@ -28,20 +26,21 @@ define LIBSVGTINY_CONFIGURE_CMDS
 	ln -sf $(HOST_DIR)/share/netsurf-buildsystem $(@D)/build
 endef
 
+# Use $(MAKE1) since parallel build fails
 define LIBSVGTINY_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) PREFIX=/usr \
 		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE)
 endef
 
 define LIBSVGTINY_INSTALL_STAGING_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) \
+		$(MAKE1) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) \
 		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
 endef
 
 define LIBSVGTINY_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) \
+		$(MAKE1) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) \
 		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
 endef
 
