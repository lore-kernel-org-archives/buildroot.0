From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 17 Jan 2018 18:44:17 +0100
Subject: [Buildroot] [PATCH v2 7/8] package/mksh: add /bin/mksh to
 /etc/shells
In-Reply-To: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
References: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1516211058-466-8-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When mksh is selected, /bin/mksh is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connexions for users using mksh as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: add double-dollar after /bin/mksh (Yann)
---
 package/mksh/mksh.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index b5706db..9160543 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -21,4 +21,12 @@ define MKSH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/mksh $(TARGET_DIR)/bin/mksh
 endef
 
+# Add /bin/mksh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
+define MKSH_INSTALL_ADD_MKSH_TO_SHELLS
+	grep -qsE '^/bin/mksh$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/mksh" >> $(TARGET_DIR)/etc/shells
+endef
+MKSH_POST_INSTALL_TARGET_HOOKS += MKSH_INSTALL_ADD_MKSH_TO_SHELLS
+
 $(eval $(generic-package))
-- 
2.7.4
