From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 22:19:15 +0100
Subject: [Buildroot] [git commit] readline: install configuration file from
	package recipe
Message-ID: <20151201232118.21F937FBD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5583d2dbfc15e7d4f059d7323db5d63c8b0ec5c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/etc/inputrc is configuration file for readline. However, until now, it
was provided by skeleton. This patch install /etc/inputrc from readline
recipe.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 {system/skeleton/etc => package/readline}/inputrc | 0
 package/readline/readline.mk                      | 6 +++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/system/skeleton/etc/inputrc b/package/readline/inputrc
similarity index 100%
rename from system/skeleton/etc/inputrc
rename to package/readline/inputrc
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index c004899..3d31696 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -17,8 +17,12 @@ READLINE_LICENSE_FILES = COPYING
 define READLINE_PURGE_EXAMPLES
 	rm -rf $(TARGET_DIR)/usr/share/readline
 endef
-
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
 
+define READLINE_INSTALL_INPUTRC
+	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
+endef
+READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
