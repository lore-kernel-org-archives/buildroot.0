From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:15:06 +0200
Subject: [Buildroot] [git commit] package/zsh: add /bin/zsh to /etc/shells
Message-ID: <20180503212454.CBAA98B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dbfd500006c630a0299e384965045056fdb4d3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When zsh is selected, /bin/zsh is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connections for users using zsh as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zsh/zsh.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index a45c61b931..e798838922 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -35,6 +35,14 @@ else
 ZSH_CONF_OPTS += --disable-pcre
 endif
 
+# Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define ZSH_ADD_ZSH_TO_SHELLS
+	grep -qsE '^/bin/zsh$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/zsh" >> $(TARGET_DIR)/etc/shells
+endef
+ZSH_TARGET_FINALIZE_HOOKS += ZSH_ADD_ZSH_TO_SHELLS
+
 # Remove versioned zsh-x.y.z binary taking up space
 define ZSH_TARGET_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
