From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Feb 2021 12:58:01 +0100
Subject: [Buildroot] [PATCH] package/ebtables: install symlink to
 ebtables-legacy
Message-ID: <20210216115802.32317-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Since the upgrade of ebtables from 2.0.10-4 to 2.0.11, there no longer is an
'ebtables' binary. It has been renamed to 'ebtables-legacy' and moved from
'/sbin' to '/usr/sbin'. This change is part of the upstream change to
integrate the functionality of ebtables (and arptables) in the iptables
package, using the nf_tables kernel backend [1].

Unfortunately, the renaming (and move) of the original 'ebtables' binary
breaks existing scripts that are calling 'ebtables' or '/sbin/ebtables'.
Therefore, add a symlink from the original path to 'ebtables-legacy'.

However, do not provide this symlink if BR2_PACKAGE_IPTABLES_NFTABLES is
enabled. In this case, the iptables package will build the new equivalent
of ebtables -- a symlink to ebtables-legacy would cause conflicts.

[1] https://wiki.nftables.org/wiki-nftables/index.php/Legacy_xtables_tools

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/ebtables/ebtables.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 998f06f5f6..54932334c2 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -33,4 +33,11 @@ endef
 EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_REMOVE_UTILS_RESTORE
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),)
+define EBTABLES_INSTALL_LEGACY_SYMLINK
+	ln -sf /usr/sbin/ebtables-legacy $(TARGET_DIR)/sbin/ebtables
+endef
+EBTABLES_POST_INSTALL_TARGET_HOOKS += EBTABLES_INSTALL_LEGACY_SYMLINK
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
