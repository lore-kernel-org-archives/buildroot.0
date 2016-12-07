From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 7 Dec 2016 19:41:20 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: search in the source directory
	for ltmain.sh
Message-ID: <20161207184120.GA12225@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes static linking of berkeleydb package, where ltmain.sh
is not in the sub-directory that contains configure.
Always search the complete source directory.

Fixes:
 http://autobuild.buildroot.net/results/f0a96f671644d9f9efcf245b354affdc84f7d7da

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Solution found after discussion and suggestions with Arnout and
Thomas P.
thx
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 00822e2..f7b8488 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -59,7 +59,7 @@ endef
 #
 define LIBTOOL_PATCH_HOOK
 	@$(call MESSAGE,"Patching libtool")
-	$(Q)for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
+	$(Q)for i in `find $($(PKG)_DIR) -name ltmain.sh`; do \
 		ltmain_version=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
 		sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\"//'`; \
 		ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
-- 
2.1.4
