From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:15:06 +0200
Subject: [Buildroot] [git commit] package/mksh: add /bin/mksh to /etc/shells
Message-ID: <20180503212454.DA8C2886DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e05e4de693416e7a099fb87097c21e2b32ae5472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When mksh is selected, /bin/mksh is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connections for users using mksh as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mksh/mksh.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index b5706dbe0f..4fa0e020af 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -21,4 +21,12 @@ define MKSH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/mksh $(TARGET_DIR)/bin/mksh
 endef
 
+# Add /bin/mksh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define MKSH_ADD_MKSH_TO_SHELLS
+	grep -qsE '^/bin/mksh$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/mksh" >> $(TARGET_DIR)/etc/shells
+endef
+MKSH_TARGET_FINALIZE_HOOKS += MKSH_ADD_MKSH_TO_SHELLS
+
 $(eval $(generic-package))
