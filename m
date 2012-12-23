From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Dec 2012 08:37:44 +0100
Subject: [Buildroot] [git commit] gettext: disable tools tests when no
	threads
Message-ID: <20121223073743.3F9AE9A424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0280921a82dcddf827417557d9e17a22e96eeecc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable the gettext-tools tests build since they break when a full
toolchain without threads is being used.
Fixes:
http://autobuild.buildroot.net/results/a187c76c359787f8e2ec6e12da2d7b1e33ed43c5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
