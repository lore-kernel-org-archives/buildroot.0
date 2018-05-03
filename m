From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:15:06 +0200
Subject: [Buildroot] [git commit] package/tmux: add /usr/bin/tmux to
 /etc/shells
Message-ID: <20180503212454.BF3B78B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8491c62f44e0ad7a0b7bed6f922f814004d4a6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When tmux is selected, /usr/bin/tmux is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connections for users using tmux as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tmux/tmux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 6e03d01abf..e380227475 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -10,4 +10,12 @@ TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
+# Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define TMUX_ADD_TMUX_TO_SHELLS
+	grep -qsE '^/usr/bin/tmux$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/usr/bin/tmux" >> $(TARGET_DIR)/etc/shells
+endef
+TMUX_TARGET_FINALIZE_HOOKS += TMUX_ADD_TMUX_TO_SHELLS
+
 $(eval $(autotools-package))
