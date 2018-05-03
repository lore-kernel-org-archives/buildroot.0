From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:14:43 +0200
Subject: [Buildroot] [git commit] package/screen: add /usr/bin/screen to
 /etc/shells
Message-ID: <20180503212454.B292B8B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d19ed2fe4c52cbc2e618af6d3a168e5669231453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When screen is selected, /usr/bin/screen is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connections for users using screen as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

While at it, drop an empty line between an existing hook definition
and its registration, to be consistent with the coding style used in
the rest of Buildroot.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/screen/screen.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 8d67c04b63..37d43366c2 100644
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
