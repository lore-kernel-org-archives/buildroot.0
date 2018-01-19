From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 19 Jan 2018 11:15:04 +0100
Subject: [Buildroot] [PATCH v3 4/9] package/screen: add /usr/bin/screen to
 /etc/shells
In-Reply-To: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1516356909-18620-5-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When screen is selected, /usr/bin/screen is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connections for users using screen as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: Fix typo (Thomas)
    Use TARGET_FINALIZE_HOOKS to avoid issues with the upcoming
    top-level parallel build (Arnout)
v2: add double-dollar after /usr/bin/screen (Yann)
    remove /etc/shells handling from SCREEN_INSTALL_SCREENRC (Yann)
    fix conding style (Yann)
---
 package/screen/screen.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 8d67c04..37d4336 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -17,7 +17,14 @@ SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 define SCREEN_INSTALL_SCREENRC
 	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
 endef
-
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
 
+# Add /usr/bin/screen to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define SCREEN_ADD_SCREEN_TO_SHELLS
+	grep -qsE '^/usr/bin/screen$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/usr/bin/screen" >> $(TARGET_DIR)/etc/shells
+endef
+SCREEN_TARGET_FINALIZE_HOOKS += SCREEN_ADD_SCREEN_TO_SHELLS
+
 $(eval $(autotools-package))
-- 
2.7.4
