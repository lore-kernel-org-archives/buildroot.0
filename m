From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 22:16:30 +0200
Subject: [Buildroot] [git commit] libmatroska: properly support static-only
	build
Message-ID: <20140906202005.3E3859D5CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c11ced46aed9ad42c32397b653e2a4cebd22d2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is similar to commit 9cef35b68f33ac1f332784fdfef61d3904c7db41 on
libebml, since libmatroska uses the same Makefile logic as libebml. It
makes sure BR2_PREFER_STATIC_LIB=y succeed by not building the shared
library in this case.

Fixes:

  http://autobuild.buildroot.org/results/12e/12e752330b30adb5078acd72a548cc172fa9ecb8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmatroska/libmatroska.mk |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 868eff2..fe49275 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -12,16 +12,27 @@ LIBMATROSKA_LICENSE = LGPLv2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
 LIBMATROSKA_DEPENDENCIES = libebml
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBMATROSKA_MAKE_TARGETS = staticlib
+LIBMATROSKA_MAKE_INSTALL_TARGETS = install_staticlib install_headers
+else
+LIBMATROSKA_MAKE_TARGETS = staticlib sharedlib
+LIBMATROSKA_MAKE_INSTALL_TARGETS = install_staticlib install_sharedlib install_headers
+endif
+
 define LIBMATROSKA_BUILD_CMDS
-	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)"
+	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)" \
+		$(LIBMATROSKA_MAKE_TARGETS)
 endef
 
 define LIBMATROSKA_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr install
+	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr \
+		$(LIBMATROSKA_MAKE_INSTALL_TARGETS)
 endef
 
 define LIBMATROSKA_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr install
+	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr \
+		$(LIBMATROSKA_MAKE_INSTALL_TARGETS)
 endef
 
 $(eval $(generic-package))
