From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 10:38:03 -0300
Subject: [Buildroot] [PATCH 3/3] pciutils: fixup library permissions
In-Reply-To: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1379511483-30618-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpci.so* is installed without +x permissions thus preventing
stripping. Fix it up in the post install target hooks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 350ca0d..fd6f8aa 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -65,4 +65,12 @@ define PCIUTILS_INSTALL_STAGING_CMDS
 		SHARED=$(PCIUTILS_SHARED) install install-lib
 endef
 
+
+# Library lacks +x so strip skips it
+define PCIUTILS_FIX_LIBRARY_MODE
+	-chmod +x $(TARGET_DIR)/usr/lib/libpci.so*
+endef
+
+PCIUTILS_POST_INSTALL_TARGET_HOOKS += PCIUTILS_FIX_LIBRARY_MODE
+
 $(eval $(generic-package))
-- 
1.8.1.5
