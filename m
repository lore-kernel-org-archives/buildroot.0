From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Dec 2016 20:03:48 +0100
Subject: [Buildroot] [git commit] pkg-autotools: search in the entire source
	directory for ltmain.sh
Message-ID: <20161207190428.B3ACE81810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7485ff4607063faa825ede80d81452fa974ed873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes static linking of berkeleydb package, where ltmain.sh
is not in the sub-directory that contains configure.
Always search the complete source directory.

Fixes:
 http://autobuild.buildroot.net/results/f0a96f671644d9f9efcf245b354affdc84f7d7da

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
