From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:33 +0100
Subject: [Buildroot] [PATCH 10/10] package/systemd: invoke systemd-tmpfilesd
 on final image
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-11-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Especially for read-only filesystems it is helpfull to
pre-create all folders for non-volatile paths.

This needs to run under fakeroot to allow setting uids/gids/perms

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4d6ff0be45..69e2e1bf41 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -518,6 +518,12 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_UPDATE_CATALOGS
 
+define SYSTEMD_CREATE_TMPFILES_HOOK
+	$(HOST_DIR)/bin/systemd-tmpfiles --root=$(TARGET_DIR) --create --boot \
+		$(addprefix --exclude-prefix=/,dev mnt proc run sys tmp) || :
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK
+
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
@@ -559,7 +565,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dvconsole=false \
 	-Dquotacheck=false \
 	-Dsysusers=false \
-	-Dtmpfiles=false \
+	-Dtmpfiles=true \
 	-Dimportd=false \
 	-Dhwdb=false \
 	-Drfkill=false \
@@ -598,6 +604,7 @@ HOST_SYSTEMD_HOST_TOOLS = \
 	journalctl \
 	systemd-analyze \
 	systemd-mount \
+	systemd-tmpfiles \
 	systemctl \
 	udevadm
 
-- 
2.24.1
