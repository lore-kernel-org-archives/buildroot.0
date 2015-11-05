From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  5 Nov 2015 13:41:54 -0500
Subject: [Buildroot] [PATCH v2 3/3] gpsd: disable attempt to reload systemd
In-Reply-To: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
References: <1446748914-12628-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1446748914-12628-3-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following disables the attempt to reload the host system's systemd
(`systemctl daemon-reload`; if any) when installing the gpsd package.
In previous attempts, the command would invoke and fail (either by being
non-existent or a system policy kit would timeout) falling back to a
`true` invoke.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v1 -> v2:
  - Package change introduced in change set 2.
---
 package/gpsd/gpsd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 5a369b0..40b95f7 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -234,4 +234,12 @@ endef
 GPSD_POST_INSTALL_TARGET_HOOKS += GPSD_INSTALL_UDEV_RULES
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+define GPSD_DISABLE_SYSTEMD_DAEMON_RELOAD
+	$(SED) 's/systemctl daemon-reload || //g' $(@D)/SConstruct
+endef
+
+GPSD_POST_PATCH_HOOKS += GPSD_DISABLE_SYSTEMD_DAEMON_RELOAD
+endif
+
 $(eval $(generic-package))
-- 
1.9.5.msysgit.1
