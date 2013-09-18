From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 16:57:14 +0200
Subject: [Buildroot] [git commit] libiconv: fixup library permissions
Message-ID: <20130918222318.B77F69B7D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22718b0e2c1d2b471ef60dc7992ad94376bb48b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libiconv.so* and libcharset.so* are installed without +x permissions
thus preventing stripping. Fix it up in the post install target hooks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libiconv/libiconv.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
