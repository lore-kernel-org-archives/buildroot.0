From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:12:20 +0200
Subject: [Buildroot] [git commit] package/busybox: add /bin/{a,
 hu}sh to /etc/shells
Message-ID: <20180503212454.96DD88B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=854e3dd1a0ce1902230118f3abd90a0113d171cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When ash (busybox) is selected, /bin/{a,hu}sh is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connections for users using {a,hu}sh as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fd4ac600c2..60a55a2c78 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -262,6 +262,20 @@ define BUSYBOX_INSTALL_TELNET_SCRIPT
 	fi
 endef
 
+# Add /bin/{a,hu}sh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define BUSYBOX_INSTALL_ADD_TO_SHELLS
+	if grep -q CONFIG_ASH=y $(@D)/.config; then \
+		grep -qsE '^/bin/ash$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/ash" >> $(TARGET_DIR)/etc/shells; \
+	fi
+	if grep -q CONFIG_HUSH=y $(@D)/.config; then \
+		grep -qsE '^/bin/hush$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/hush" >> $(TARGET_DIR)/etc/shells; \
+	fi
+endef
+BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
+
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
