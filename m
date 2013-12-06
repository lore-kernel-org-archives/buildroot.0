From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Dec 2013 23:15:34 -0300
Subject: [Buildroot] [PATCH] freetype: fix staging headers
Message-ID: <1386296134-21775-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

freetype 2.5.1 moved headers from /usr/include/freetype2/freetype to
/usr/include/freetype2.
Some packages use a non-recommended header inclusion of <freetype/x.h>
instead of using the recommended ft2build.h method, so until it's fixed
across the board upstream for packages that break do a symlink.

See:
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=fae382076409db198dfbff36ac4cbb97b05b30a1

Fixes:
http://autobuild.buildroot.net/results/64c/64cc8467eeb44f741aeb42bf1a0c77edbfbd285f/
http://autobuild.buildroot.net/results/708/708fa7423c83e22a51854f1abca0f3358506a318/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 398bf61..0f1bb88 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -57,5 +57,12 @@ define FREETYPE_FIX_CONFIG_FILE_LIBS
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
 
+# Version 2.5.1 reorganized headers out of freetype2/freetype
+# It's unexpected for some packages so symlink it until it spreads upstream
+define FREETYPE_FIX_FREETYPE_INCLUDE
+	ln -sf . $(STAGING_DIR)/usr/include/freetype2/freetype
+endef
+FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_FREETYPE_INCLUDE
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
