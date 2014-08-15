From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 12:01:06 +0200
Subject: [Buildroot] [git commit] libebml: properly support static only
	builds
Message-ID: <20140815100618.77E789D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cef35b68f33ac1f332784fdfef61d3904c7db41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adjusts the libebml package to not build a shared library
when BR2_PREFER_STATIC_LIB=y.

Fixes:

  http://autobuild.buildroot.org/results/262/26279f72b6c5708f363b3cce2102afa0eccc3a72/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libebml/libebml.mk |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index e555922..618ef1a 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -11,16 +11,27 @@ LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPLv2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBEBML_MAKE_TARGETS = staticlib
+LIBEBML_MAKE_INSTALL_TARGETS = install_staticlib install_headers
+else
+LIBEBML_MAKE_TARGETS = staticlib sharedlib
+LIBEBML_MAKE_INSTALL_TARGETS = install_staticlib install_sharedlib install_headers
+endif
+
 define LIBEBML_BUILD_CMDS
-	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)"
+	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)" \
+		$(LIBEBML_MAKE_TARGETS)
 endef
 
 define LIBEBML_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr install
+	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr \
+		$(LIBEBML_MAKE_INSTALL_TARGETS)
 endef
 
 define LIBEBML_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr install
+	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr \
+		$(LIBEBML_MAKE_INSTALL_TARGETS)
 endef
 
 $(eval $(generic-package))
