From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 22 Dec 2012 09:31:02 -0300
Subject: [Buildroot] [PATCH] gettext: disable tools tests when no threads
Message-ID: <1356179462-2125-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the gettext-tools tests build since they break when a full
toolchain without threads is being used.
Fixes:
http://autobuild.buildroot.net/results/a187c76c359787f8e2ec6e12da2d7b1e33ed43c5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 77881d3..a91cb7f 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -44,6 +44,12 @@ define GETTEXT_DISABLE_TOOLS
 endef
 endif # GETTEXT_TOOLS = n
 
+# The tools tests build fails with full toolchain without threads
+define GETTEXT_DISABLE_TESTS
+	$(SED) 's/m4 tests/m4/' $(@D)/gettext-tools/Makefile.in
+endef
+
 GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TOOLS
+GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TESTS
 
 $(eval $(autotools-package))
-- 
1.7.8.6
