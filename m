From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 19 Jun 2020 16:57:16 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/cups: Add lp user as default
 cups user
In-Reply-To: <20200619145719.2352019-1-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
Message-ID: <20200619145719.2352019-5-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is a backport from the rockchip tree.

Author: Jeffy Chen <jeffy.chen@rock-chips.com>
Date:   Tue Nov 13 18:25:34 2018 +0800

    package: cups: Add lp user as default cups user

    Change-Id: Ic7434fe0a7b41b86b5b8b097fa29dd9718e29aa5
    Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

but fixes the CUPS_USERS table.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups/cups.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 461e0d9143..40fe210c94 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -22,6 +22,9 @@ CUPS_CONF_OPTS = \
 	--disable-gssapi \
 	--disable-pam \
 	--libdir=/usr/lib \
+	--with-cups-user=lp \
+	--with-cups-group=lp \
+	--with-system-groups="lpadmin sys root" \
 	--with-rcdir=no
 CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
@@ -78,4 +81,9 @@ define CUPS_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S81cupsd
 endef
 
+define CUPS_USERS
+	lp -1 lp -1 * /var/spool/lpd /bin/false - lp
+	- - lpadmin -1 * - - - Printers admin group.
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1
