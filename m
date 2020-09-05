From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 10:02:46 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/cups: Add lp user
 as default cups user
Message-ID: <20200905082723.DCFB683487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8fc3a668becfc930d15b31f65755903cf9ce7ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This patch is a backport from the rockchip tree.

Author: Jeffy Chen <jeffy.chen@rock-chips.com>
Date:   Tue Nov 13 18:25:34 2018 +0800

    package: cups: Add lp user as default cups user

    Change-Id: Ic7434fe0a7b41b86b5b8b097fa29dd9718e29aa5
    Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

User lp is necessary for running the cups spooler.
Groups lpadmin grants administrative privileges to users.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 608c12c044438cb7640cd5e9c9bd31946ecb729b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 53b0e2ab08..656beb7bc2 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -22,6 +22,9 @@ CUPS_CONF_OPTS = \
 	--disable-gssapi \
 	--disable-pam \
 	--libdir=/usr/lib \
+	--with-cups-user=lp \
+	--with-cups-group=lp \
+	--with-system-groups="lpadmin sys root" \
 	--without-rcdir
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
@@ -77,4 +80,11 @@ define CUPS_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S81cupsd
 endef
 
+# lp user is needed to run cups spooler
+# lpadmin group membership grants administrative privileges
+define CUPS_USERS
+	lp -1 lp -1 * /var/spool/lpd /bin/false - lp
+	- - lpadmin -1 * - - - Printers admin group.
+endef
+
 $(eval $(autotools-package))
