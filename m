From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 14 Jan 2018 22:03:32 +0100
Subject: [Buildroot] [PATCH 4/7] package/screen: add /usr/bin/screen to
 /etc/shells
In-Reply-To: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1515963815-5843-5-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When screen is selected, /usr/bin/screen is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connexions for users using screen as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/screen/screen.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 8d67c04..5f2eb1e 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -16,8 +16,18 @@ SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
 define SCREEN_INSTALL_SCREENRC
 	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
+	grep -qsE '^/usr/bin/screen' $(TARGET_DIR)/etc/shells \
+		|| echo "/usr/bin/screen" >> $(TARGET_DIR)/etc/shells
 endef
 
-SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
+# Add /usr/bin/screen to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
+define SCREEN_INSTALL_ADD_SCREEN_TO_SHELLS
+	grep -qsE '^/usr/bin/screen' $(TARGET_DIR)/etc/shells \
+		|| echo "/usr/bin/screen" >> $(TARGET_DIR)/etc/shells
+endef
+
+SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC \
+	SCREEN_INSTALL_ADD_SCREEN_TO_SHELLS
 
 $(eval $(autotools-package))
-- 
2.7.4
