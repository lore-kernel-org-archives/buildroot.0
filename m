From: Gabe Evans <gabe@hashrabbit.co>
Date: Mon,  8 Feb 2016 22:50:31 +0000
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix dbus activation
Message-ID: <1454971831-11139-1-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Various DBus activated services fail to start with errors similar to:

  Unit dbus-org.freedesktop.hostname1.service failed to load: File exists.

The message itself is rather vague and can be seen as a warning in
systemd-networkd logs. Meanwhile, tools like hostnamectl don't work
at all.

The post-install target hook SYSTEMD_SANITIZE_PATH_IN_UNITS was replacing
symlinks with duplicate files. The sed command could have used
--follow-symlinks to avoid this but I instead chose to remove the hook
since this fix doesn't seem to be needed anymore.

Some configure options are also removed:

 * --with-dbuspolicydir, --with-dbussessionservicedir, and
   --with-dbussystemservicedir are no longer needed since these are
   defaults in recent releases.

 * --disable-dbus has no effect when combined with --disable-tests. The
   option itself only applies to tests, not the runtime.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e432069..05121cf 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -32,14 +32,10 @@ SYSTEMD_CONF_OPTS += \
 	--disable-selinux \
 	--disable-pam \
 	--disable-libcryptsetup \
-	--with-dbuspolicydir=/etc/dbus-1/system.d \
-	--with-dbussessionservicedir=/usr/share/dbus-1/services \
-	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--disable-efi \
 	--disable-gnuefi \
 	--disable-ldconfig \
 	--disable-tests \
-	--disable-dbus \
 	--without-python
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
@@ -150,16 +146,10 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
-define SYSTEMD_SANITIZE_PATH_IN_UNITS
-	find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
-		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
-endef
-
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
-	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
-	SYSTEMD_SANITIZE_PATH_IN_UNITS
+	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
-- 
1.9.1
