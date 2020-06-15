From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:50 +0200
Subject: [Buildroot] [PATCH v2 10/14] package/systemd: invoke
 systemd-tmpfilesd on final image
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-11-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Especially for read-only filesystems it is helpfull to
pre-create all folders for non-volatile paths.

This needs to run under fakeroot to allow setting
uids/gids/perms for the target fs.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e117e3a082..cb0278f3b7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -599,6 +599,12 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += PURGE_LOCALES
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
 
@@ -652,7 +658,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dvconsole=false \
 	-Dquotacheck=false \
 	-Dsysusers=false \
-	-Dtmpfiles=false \
+	-Dtmpfiles=true \
 	-Dimportd=false \
 	-Dhwdb=false \
 	-Drfkill=false \
-- 
2.27.0
