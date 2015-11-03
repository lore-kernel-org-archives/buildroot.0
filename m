From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:46:39 +0100
Subject: [Buildroot] [git commit] systemd: disable ldconfig through
	configure option
Message-ID: <20151103224939.6CC657FDC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a566520ef6c73f113584082749505c5dea16ccfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd v216+ includes a configure option to disable ldconfig.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

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
