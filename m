From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 17 Jan 2018 18:44:12 +0100
Subject: [Buildroot] [PATCH v2 2/8] package/busybox: add /bin/{a,
 hu}sh to /etc/shells
In-Reply-To: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
References: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1516211058-466-3-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When ash (busybox) is selected, /bin/{a,hu}sh is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connexions for users using {a,hu}sh as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: add double-dollar after /bin/{a,hu}sh (Yann)
    add hush handling
    msh has been removed from Busybox 1.28
    https://git.busybox.net/busybox/commit/?id=2e989ef232e35750df573898077dd356003705b2
    msh is unlikely used.
---
 package/busybox/busybox.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d0bbd3f..1865306 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -258,6 +258,19 @@ define BUSYBOX_INSTALL_TELNET_SCRIPT
 	fi
 endef
 
+# Add /bin/{a,hu}sh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
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
+
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
@@ -291,6 +304,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
+	$(BUSYBOX_INSTALL_ADD_TO_SHELLS)
 endef
 
 define BUSYBOX_INSTALL_INIT_SYSV
-- 
2.7.4
