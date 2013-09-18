From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 10:38:02 -0300
Subject: [Buildroot] [PATCH 2/3] libiconv: fixup library permissions
In-Reply-To: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1379511483-30618-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libiconv.so* and libcharset.so* are installed without +x permissions
thus preventing stripping. Fix it up in the post install target hooks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libiconv/libiconv.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index d6a1d6f..aa6d6de 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -21,6 +21,14 @@ endef
 LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
 LIBICONV_POST_INSTALL_STAGING_HOOKS += LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
 
+# Library lacks +x so strip skips it
+define LIBICONV_FIX_LIBRARY_MODE
+	-chmod +x $(TARGET_DIR)/usr/lib/libcharset.so*
+	-chmod +x $(TARGET_DIR)/usr/lib/libiconv.so*
+endef
+
+LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_FIX_LIBRARY_MODE
+
 $(eval $(autotools-package))
 
 # Configurations where the toolchain supports locales and the libiconv
-- 
1.8.1.5
