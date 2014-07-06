From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 06 Jul 2014 17:10:51 +0200
Subject: [Buildroot] [PATCH v2] infra: fix autotools .la fixing when no .la
 files are present
Message-ID: <bb03ffeaa528d3c99f51.1404659451@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 6f638ea9c9c7bacc646430a74ad3dd2740eae676 ("infra: /usr support:
STAGING_DIR can be outside BASE_DIR") changed a for-construct around 'sed
-i' in a 'find | xargs sed -i'. However, if the find returns no results,
sed complains with:
    '/bin/sed: no input files'

This commit adds the extra parameter -r / --no-run-if-empty to the xargs
call, effectively fixing this problem case.

Reported-by: Rohit Kumar <rkthebest@gmail.com>
Fix-suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-autotools.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff -r c8ed6565ea09 -r bb03ffeaa528 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Thu Jul 03 12:35:57 2014 +0300
+++ b/package/pkg-autotools.mk	Sun Jul 06 16:19:04 2014 +0200
@@ -281,7 +281,7 @@
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
+	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
 		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
