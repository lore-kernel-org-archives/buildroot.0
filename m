From: Gabe Evans <gabe@hashrabbit.co>
Date: Tue,  3 Nov 2015 22:24:30 +0000
Subject: [Buildroot] [PATCH 1/1] systemd: disable ldconfig through configure
	option
Message-ID: <1446589470-10304-1-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd v216+ includes a configure option to disable ldconfig.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 414dc0d..35dac83 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -37,6 +37,7 @@ SYSTEMD_CONF_OPTS += \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--disable-efi \
 	--disable-gnuefi \
+	--disable-ldconfig \
 	--disable-tests \
 	--disable-dbus \
 	--without-python
@@ -154,17 +155,10 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
 		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
 endef
 
-# Disable ldconfig.service, as /sbin/ldconfig is not available when the
-# target is built with a glibc-based toolchain.
-define SYSTEMD_DISABLE_LDCONFIG_SERVICE_HOOK
-	rm -f $(TARGET_DIR)/lib/systemd/system/sysinit.target.wants/ldconfig.service
-endef
-
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
-	SYSTEMD_DISABLE_LDCONFIG_SERVICE_HOOK \
 	SYSTEMD_SANITIZE_PATH_IN_UNITS
 
 define SYSTEMD_USERS
-- 
1.9.1
