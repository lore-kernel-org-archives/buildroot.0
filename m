From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 14 Jan 2018 22:03:34 +0100
Subject: [Buildroot] [PATCH 6/7] package/zsh: add /bin/zsh to /etc/shells
In-Reply-To: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1515963815-5843-7-git-send-email-romain.naour@smile.fr>
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
 package/zsh/zsh.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index bfd0a1a..c2b0270 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -34,10 +34,18 @@ else
 ZSH_CONF_OPTS += --disable-pcre
 endif
 
+# Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
+define ZSH_INSTALL_ADD_ZSH_TO_SHELLS
+	grep -qsE '^/bin/zsh' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/zsh" >> $(TARGET_DIR)/etc/shells
+endef
+
 # Remove versioned zsh-x.y.z binary taking up space
 define ZSH_TARGET_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
 endef
-ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_TARGET_INSTALL_FIXUPS
+ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_TARGET_INSTALL_FIXUPS \
+	ZSH_INSTALL_ADD_ZSH_TO_SHELLS
 
 $(eval $(autotools-package))
-- 
2.7.4
