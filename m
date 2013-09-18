From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 16:57:06 +0200
Subject: [Buildroot] [git commit] gettext: fixup library permissions
Message-ID: <20130918222318.AD9F09B7D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96ac9ef5be29dee88f24cf583ca8c53be481bb8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libintl.so* is installed without +x permissions thus preventing
stripping. Fix it up in the post install target hooks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gettext/gettext.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
