From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 13 Jan 2016 16:05:59 +0000
Subject: [Buildroot] [PATCH] procps-ng: install binaries in /bin and /sbin
Message-ID: <1452701159-22362-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This way the busybox counterparts are overwritten and we will not end up
with procps-ng binaries in /usr/bin and /usr/sbin, and busybox symlinks
for the same tools in /bin and /sbin.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/procps-ng/procps-ng.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 07e98b9..62c7534 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -19,6 +19,18 @@ PROCPS_NG_GETTEXTIZE = YES
 # wins the fight over who gets to have their utils actually installed.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PROCPS_NG_DEPENDENCIES += busybox
+# Also overwrite the remaining busybox symlinks for tools which are now
+# provided by procps-ng and got installed in /usr/bin instead of /bin.
+# Currently these tools are only pidof and watch. We only need to do
+# this if the /usr/bin and /bin directories are not merged.
+ifeq ($(BR2_ROOTFS_MERGED_USR),)
+define PROCPS_NG_MOVE_BINARIES
+	for i in pidof watch; do \
+		mv $(TARGET_DIR)/usr/bin/$$i $(TARGET_DIR)/bin/; \
+	done
+endef
+PROCPS_NG_POST_INSTALL_TARGET_HOOKS += PROCPS_NG_MOVE_BINARIES
+endif
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
@@ -40,8 +52,8 @@ PROCPS_NG_CONF_OPTS += \
 	--exec-prefix=/ \
 	--sysconfdir=/etc \
 	--libdir=/usr/lib \
-	--bindir=/usr/bin \
-	--sbindir=/usr/sbin
+	--bindir=/bin \
+	--sbindir=/sbin
 
 # Allows unicode characters to show in 'watch'
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-- 
2.4.10
