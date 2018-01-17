From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 17 Jan 2018 18:44:16 +0100
Subject: [Buildroot] [PATCH v2 6/8] package/zsh: add /bin/zsh to /etc/shells
In-Reply-To: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
References: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1516211058-466-7-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When zsh is selected, /bin/zsh is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connexions for users using zsh as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: add double-dollar after /bin/zsh (Yann)
---
 package/zsh/zsh.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index bfd0a1a..3afb467 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -34,6 +34,14 @@ else
 ZSH_CONF_OPTS += --disable-pcre
 endif
 
+# Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
+define ZSH_INSTALL_ADD_ZSH_TO_SHELLS
+	grep -qsE '^/bin/zsh$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/zsh" >> $(TARGET_DIR)/etc/shells
+endef
+ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_INSTALL_ADD_ZSH_TO_SHELLS
+
 # Remove versioned zsh-x.y.z binary taking up space
 define ZSH_TARGET_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
-- 
2.7.4
