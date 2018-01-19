From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 19 Jan 2018 11:15:09 +0100
Subject: [Buildroot] [PATCH v3 9/9] package/bash: use target finalize hook
In-Reply-To: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1516356909-18620-10-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout reported an issue with the upcoming top-level parallel build.
The file /etc/shells can be modified by several packages (shell providers)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/bash/bash.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index ab6b43b..12f33f1 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -40,14 +40,18 @@ endif
 endif
 
 # Make /bin/sh -> bash (no other shell, better than busybox shells)
-# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
-# can reject the user connexion. See man shells.
 define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
 	rm -f $(TARGET_DIR)/bin/bashbug
+endef
+
+# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
+# can reject the user connection. See man shells.
+define BASH_ADD_MKSH_TO_SHELLS
 	grep -qsE '^/bin/bash$$' $(TARGET_DIR)/etc/shells \
 		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
 endef
+BASH_TARGET_FINALIZE_HOOKS += BASH_ADD_MKSH_TO_SHELLS
 
 $(eval $(autotools-package))
-- 
2.7.4
