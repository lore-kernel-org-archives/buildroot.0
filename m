From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 14 Jan 2018 22:03:30 +0100
Subject: [Buildroot] [PATCH 2/7] package/busybox: add /bin/ash to /etc/shells
In-Reply-To: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1515963815-5843-3-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When ash (busybox) is selected, /bin/ash is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connexions for users using ash as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

ash is disabled for MMUless systems, so don't add /bin/ash in
/etc/shells in this case.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/busybox/busybox.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d0bbd3f..37d064a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -258,6 +258,15 @@ define BUSYBOX_INSTALL_TELNET_SCRIPT
 	fi
 endef
 
+# Add /bin/ash to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
+ifeq ($(BR2_USE_MMU),y)
+define BUSYBOX_INSTALL_ADD_ASH_TO_SHELLS
+	grep -qsE '^/bin/ash' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/ash" >> $(TARGET_DIR)/etc/shells
+endef
+endif
+
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
@@ -291,6 +300,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
+	$(BUSYBOX_INSTALL_ADD_ASH_TO_SHELLS)
 endef
 
 define BUSYBOX_INSTALL_INIT_SYSV
-- 
2.7.4
