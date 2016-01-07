From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  7 Jan 2016 14:56:22 -0200
Subject: [Buildroot] [PATCH 1/1] readline: fix stripping on target
Message-ID: <1452185782-7505-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libraries got installed read only, so strip failed.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/readline/readline.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 3d31696..58cd948 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -24,5 +24,14 @@ define READLINE_INSTALL_INPUTRC
 endef
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
 
+ifneq ($(BR2_STATIC_LIBS),y)
+# libraries get installed read only, so strip fails
+define READLINE_INSTALL_FIXUPS_SHARED
+	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libhistory.so.* libreadline.so.*); \
+	do chmod +w $$i; done
+endef
+READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_FIXUPS_SHARED
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.1
