From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:15:07 +0200
Subject: [Buildroot] [git commit] package/bash: use target finalize hook
Message-ID: <20180503212454.F213F8B602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=311c9eebc4dcfb764e3a7082706daf68e0603188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Arnout reported an issue with the upcoming top-level parallel build.
The file /etc/shells can be modified by several packages (shell providers)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bash/bash.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 2182bede15..bb52bf3259 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -39,14 +39,18 @@ BASH_CONF_ENV += bash_cv_getenv_redef=yes
 endif
 endif
 
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
