From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:12:21 +0200
Subject: [Buildroot] [git commit] package/dash: add /etc/dash to /etc/shells
Message-ID: <20180503212454.A6CE38B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=129f3276989de6f07ba02eb3fe175f731f2ae9a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When dash is selected, /bin/dash is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connections for users using dash as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dash/dash.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 2ee292b8d3..9a26ebb642 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -28,4 +28,12 @@ define DASH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
 
+# Add /bin/dash to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define DASH_ADD_DASH_TO_SHELLS
+	grep -qsE '^/bin/dash$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/dash" >> $(TARGET_DIR)/etc/shells
+endef
+DASH_TARGET_FINALIZE_HOOKS += DASH_ADD_DASH_TO_SHELLS
+
 $(eval $(autotools-package))
