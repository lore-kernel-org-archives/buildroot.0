From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Apr 2014 10:43:30 -0300
Subject: [Buildroot] [PATCH 1/2] gettext: make host gettextize
	non-interactive
Message-ID: <1396532611-30218-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the host gettextize tool non-interactive to avoid stalling for user
confirmation when using it to fix up a package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 748c2a5..b5efa76 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -57,5 +57,11 @@ endef
 endif
 endif # GETTEXT_TOOLS = n
 
+# Disable interactive confirmation in host gettextize for package fixups
+define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
+	$(SED) '/read dummy/d' $(HOST_DIR)/usr/bin/gettextize
+endef
+HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
