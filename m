From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 17:52:04 +0100
Subject: [Buildroot] [PATCH] wireless_tools: don't call ldconfig
Message-ID: <1358700724-9418-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The wireless_tools installation process calls ldconfig to update the
ld.so cache, but in a cross-compilation situation, it doesn't make
sense, and simply takes time for nothing. To avoid this, we pass
LDCONFIG=/bin/true during the wireless_tools installation steps.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireless_tools/wireless_tools.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index f355689..4dd4084 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 	WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
 
 define WIRELESS_TOOLS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" install-dynamic
+	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" LDCONFIG=/bin/true install-dynamic
 	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)/usr" install-hdr
 endef
 
@@ -36,7 +36,7 @@ define WIRELESS_TOOLS_CLEAN_CMDS
 endef
 
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" $(WIRELESS_TOOLS_INSTALL_TARGETS)
+	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS)
 	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
 endef
 
-- 
1.7.9.5
