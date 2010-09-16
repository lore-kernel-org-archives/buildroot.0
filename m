From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] dropbear: convert old-style
	hook and commands to new-style
Message-ID: <20100916113825.94AC38AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dbcec2b28e0ac732e81569f7d0237a9b866dfed8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/dropbear.mk |   40 ++++++++++++++++++++--------------------
 1 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index ec678d7..0b0d4c7 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -17,34 +17,34 @@ DROPBEAR_CONF_ENV = ac_cv_type_struct_sockaddr_storage=yes
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
-$(eval $(call AUTOTARGETS,package,dropbear))
+define DROPBEAR_DISABLE_XAUTH
+	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(@D)/options.h
+endef
+
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ADJUST_OPTIONS
+
+define DROPBEAR_DISABLE_REVERSE_DNS
+	$(SED) 's,^#define DO_HOST_LOOKUP.*,/* #define DO_HOST_LOOKUP */,' $(@D)/options.h
+endef
 
-$(DROPBEAR_HOOK_POST_EXTRACT):
-	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(DROPBEAR_DIR)/options.h
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
-	$(SED) 's,^#define DO_HOST_LOOKUP.*,/* #define DO_HOST_LOOKUP */,' \
-		$(DROPBEAR_DIR)/options.h
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_REVERSE_DNS
 endif
-	touch $@
-
-$(DROPBEAR_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
-	$(INSTALL) -m 755 $(DROPBEAR_DIR)/dropbearmulti \
-		$(TARGET_DIR)/usr/sbin/dropbear
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dbclient
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearkey
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearconvert
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
-	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
+
+define DROPBEAR_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
+	for f in $(DROPBEAR_TARGET_BINS); do \
+		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
+	done
 	if [ ! -f $(TARGET_DIR)/etc/init.d/S50dropbear ]; then \
 		$(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d/S50dropbear; \
 	fi
-	touch $@
+endef
 
-$(DROPBEAR_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define DROPBEAR_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/dropbear
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(DROPBEAR_TARGET_BINS))
 	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
-	rm -f $(DROPBEAR_TARGET_INSTALL_TARGET) $(DROPBEAR_HOOK_POST_INSTALL)
+endef
 
+$(eval $(call AUTOTARGETS,package,dropbear))
-- 
1.7.1
