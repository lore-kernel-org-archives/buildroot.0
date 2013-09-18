From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 10:38:01 -0300
Subject: [Buildroot] [PATCH 1/3] gettext: fixup library permissions
Message-ID: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libintl.so* is installed without +x permissions thus preventing
stripping. Fix it up in the post install target hooks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index baf42ef..7af2035 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -58,5 +58,12 @@ endef
 endif
 endif # GETTEXT_TOOLS = n
 
+# Library lacks +x so strip skips it
+define GETTEXT_FIX_LIBRARY_MODE
+	-chmod +x $(TARGET_DIR)/usr/lib/libintl.so*
+endef
+
+GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_FIX_LIBRARY_MODE
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.1.5
