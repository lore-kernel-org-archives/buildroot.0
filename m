From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 17 Nov 2015 18:20:45 +0100
Subject: [Buildroot] [PATCH v2] readline: install configuration file from
	package recipe
Message-ID: <1447780845-22019-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/inputrc is configuration file for readline. However, until now, it
was provided by skeleton. This patch install /etc/inputrc from readline
recipe.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
v2:
  Send patch using -M

  
 {system/skeleton/etc => package/readline}/inputrc | 0
 package/readline/readline.mk                      | 6 +++++-
 2 files changed, 5 insertions(+), 1 deletion(-)
 rename {system/skeleton/etc => package/readline}/inputrc (100%)

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
-- 
2.1.4
