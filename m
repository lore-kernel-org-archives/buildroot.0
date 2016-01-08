From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 19:17:10 +0100
Subject: [Buildroot] [git commit] readline: fix stripping on target
Message-ID: <20160108182923.4F283827F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af8501cf963d2b23f8c092615a4c047da92accfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libraries got installed read only, so strip failed.

[Peter: simplify chmod logic]
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/readline/readline.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 3d31696..7631970 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -24,5 +24,13 @@ define READLINE_INSTALL_INPUTRC
 endef
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
 
+ifneq ($(BR2_STATIC_LIBS),y)
+# libraries get installed read only, so strip fails
+define READLINE_INSTALL_FIXUPS_SHARED
+	chmod +w $(addprefix $(TARGET_DIR)/usr/lib/,libhistory.so.* libreadline.so.*)
+endef
+READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_FIXUPS_SHARED
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
