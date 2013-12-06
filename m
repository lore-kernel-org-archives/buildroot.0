From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 09:34:32 +0100
Subject: [Buildroot] [git commit] freetype: fix staging headers
Message-ID: <20131206084201.3EAE19BA54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a9cedbcf49641b2569e0a137818ad9f8c539edd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
