From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 13 Feb 2019 20:54:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: Use echo-dummy
 gettext script if NLS is not enabled
Message-ID: <1550084055-9176-1-git-send-email-email@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

gettext is used only as external tool in ecryptfs utils which can easy
be replaced by 'echo' if NLS is not required. So changed a bit semantic
of Config file - select gettext package only if NLS is enabled,
otherwise a dummy-echo script is generated as 'gettext' replacement.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/ecryptfs-utils/Config.in         |  2 +-
 package/ecryptfs-utils/ecryptfs-utils.mk | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 6652d33..1438c17 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	select BR2_PACKAGE_LIBNSS
 	# runtime dependency only, some scripts are using the
 	# 'gettext' program to get translations
-	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_SYSTEM_ENABLE_NLS
 	# runtime dependency only
 	select BR2_PACKAGE_GETENT
 	help
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index eb3194b..a2a0af6 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -25,4 +25,14 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
 
+ifneq ($(BR2_SYSTEM_ENABLE_NLS),y)
+define ECRYPTFS_UTILS_GETTEXT_DUMMY_INSTALL
+	echo '#! /bin/sh' > $(@D)/gettext
+	echo 'echo $$@' >> $(@D)/gettext
+
+	$(INSTALL) -m 0755 -D $(@D)/gettext $(TARGET_DIR)/usr/bin/gettext
+endef
+ECRYPTFS_UTILS_POST_INSTALL_TARGET_HOOKS += ECRYPTFS_UTILS_GETTEXT_DUMMY_INSTALL
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
