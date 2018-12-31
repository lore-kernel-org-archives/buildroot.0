From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:32:44 +0100
Subject: [Buildroot] [git commit] skeleton: use BR2_SYSTEM_DEFAULT_PATH as
 default PATH
Message-ID: <20181231132916.5623781522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df20a836c14ca50ea2fd761046144b93f9551224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We substitute the path specified in system/skeleton/etc/profile with
the path specified in the configuration variable
$(BR2_SYSTEM_DEFAULT_PATH).

$(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string, so it is already
double quoted. This means that export PATH=value will now be export
PATH="value" in /etc/profile, which is perfectly fine.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: rework commit log about the double quoting]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/skeleton-init-common/skeleton-init-common.mk | 1 +
 system/skeleton/etc/profile                          | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index e8a0522052..7d2c68ada3 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -20,6 +20,7 @@ define SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_INIT_COMMON_PATH),$(TARGET_DIR))
 	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
+	$(SED) 's, at PATH@,$(BR2_SYSTEM_DEFAULT_PATH),' $(TARGET_DIR)/etc/profile
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
 endef
diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 1255d23ff4..db29e44920 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -1,4 +1,4 @@
-export PATH=/bin:/sbin:/usr/bin:/usr/sbin
+export PATH=@PATH@
 
 if [ "$PS1" ]; then
 	if [ "`id -u`" -eq 0 ]; then
