From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jul 2014 22:22:52 +0200
Subject: [Buildroot] [git commit] infra: fix autotools .la fixing when no
	.la files are present
Message-ID: <20140706202334.6B51A9CE4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18a0e073507e03eaba80c25017f9f28bd830a48a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 432b27f..ddff9bf 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -281,7 +281,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
+	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
 		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
