From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 17:32:03 -0400
Subject: [Buildroot] [PATCH 1/7] audit: bump to version 2.5.2
Message-ID: <1466803929-5513-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added the ability to compile audit against host as well, this is needed as the host version of libsemanage requires libaudit.h

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/audit/audit.hash |  2 +-
 package/audit/audit.mk   | 24 +++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index f234fdb..ad7f09a 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	25f57f465f3230d7b1166b615ffd6748818a3dc225d0e8b396c5b2e951674e23	audit-2.4.4.tar.gz
+sha256	f7c35a8c27d98255303f0e828d1045df43f968957bc733338335c64f2ede024d audit-2.5.2.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 1fbc623..f705483 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.4.4
+AUDIT_VERSION = 2.5.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
@@ -46,6 +46,7 @@ define AUDIT_INSTALL_INIT_SYSTEMD
 	ln -fs ../../../../usr/lib/systemd/system/auditd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/auditd.service
 
+	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
 	$(INSTALL) -D -m 644 package/audit/audit_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
 endef
@@ -56,4 +57,25 @@ define AUDIT_INSTALL_CLEANUP
 endef
 AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
 
+HOST_AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote --with-libcap-ng=no
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+HOST_AUDIT_DEPENDENCIES += libcap-ng
+HOST_AUDIT_CONF_OPTS += --with-libcap-ng=yes
+else
+HOST_AUDIT_CONF_OPTS += --with-libcap-ng=no
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+HOST_AUDIT_CONF_OPTS += --enable-systemd
+else
+HOST_AUDIT_CONF_OPTS += --disable-systemd
+endif
+
+define AUDIT_INSTALL_CLEANUP
+	$(RM) -rf $(HOST_DIR)/etc/rc.d
+	$(RM) -rf $(HOST_DIR)/etc/sysconfig
+endef
+
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
