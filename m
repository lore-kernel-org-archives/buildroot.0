From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Aug 2013 10:37:46 -0300
Subject: [Buildroot] [PATCH] readline: use normal/default install target
Message-ID: <1376314666-26777-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the custom INSTALL_TARGET doesn't consider static builds it breaks
horribly and there's no need with the current version since it works
just fine with a little varnish to remove samples. Fixes:
http://autobuild.buildroot.net/results/5a6/5a62c38ec621d49230d76981db6024035e88804a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/readline/readline.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 0c883bc..ff55199 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -13,14 +13,10 @@ READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes
 READLINE_LICENSE = GPLv3+
 READLINE_LICENSE_FILES = COPYING
 
-define READLINE_INSTALL_TARGET_CMDS
-	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(@D) install-shared uninstall-doc
-	chmod 775 $(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) \
-		$(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
-		$(TARGET_DIR)/usr/lib/libreadline.so.$(READLINE_VERSION) \
-		$(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
+define READLINE_PURGE_EXAMPLES
+	rm -rf $(TARGET_DIR)/usr/share/readline
 endef
 
+READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
+
 $(eval $(autotools-package))
-- 
1.8.1.5
