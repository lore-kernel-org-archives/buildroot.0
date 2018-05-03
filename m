From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:12:19 +0200
Subject: [Buildroot] [git commit] package/skeleton-init-common: add /bin/sh
 to /etc/shells
Message-ID: <20180503212454.898AB8B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c493b2a5fae505cc96c3859d47d37891e997d3ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the default shell /bin/sh to /etc/shells only if BR2_SYSTEM_BIN_SH_NONE
is not selected.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>o
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/skeleton-init-common/skeleton-init-common.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index 8228a8103f..e8a0522052 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -79,6 +79,13 @@ define SKELETON_INIT_COMMON_SET_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
 endef
 else
+# Add /bin/sh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define SKELETON_INIT_COMMON_ADD_SH_TO_SHELLS
+	grep -qsE '^/bin/sh$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/sh" >> $(TARGET_DIR)/etc/shells
+endef
+SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_ADD_SH_TO_SHELLS
 ifneq ($(SKELETON_INIT_COMMON_BIN_SH),)
 define SKELETON_INIT_COMMON_SET_BIN_SH
 	ln -sf $(SKELETON_INIT_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
