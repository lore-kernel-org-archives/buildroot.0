From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 17 Jan 2018 18:44:13 +0100
Subject: [Buildroot] [PATCH v2 3/8] package/dash: add /etc/dash to
 /etc/shells
In-Reply-To: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
References: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1516211058-466-4-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When dash is selected, /bin/dash is not added to /etc/shells
(see man shells). So, login tools like dropbear reject the ssh
connexions for users using dash as shell in /etc/passwd.

buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: add double-dollar after /bin/dash (Yann)
---
 package/dash/dash.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index c8b4164..e39fe0a 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -9,8 +9,12 @@ DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
+# Add /bin/dash to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
 define DASH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
+	grep -qsE '^/bin/dash$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/dash" >> $(TARGET_DIR)/etc/shells
 endef
 
 $(eval $(autotools-package))
-- 
2.7.4
