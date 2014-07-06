From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 06 Jul 2014 16:23:04 +0200
Subject: [Buildroot] [PATCH] infra: fix autotools .la fixing when no .la
	files are present
Message-ID: <297a83abd0584662acb7.1404656584@localhost>
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

Since a for construct is not very nice to handle this case, this commit
changes the 'find | xargs sed -i' into 'find -exec sed -i'.

Reported-by: Rohit Kumar <rkthebest@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-autotools.mk |  8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff -r c8ed6565ea09 -r 297a83abd058 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Thu Jul 03 12:35:57 2014 +0300
+++ b/package/pkg-autotools.mk	Sun Jul 06 16:19:04 2014 +0200
@@ -277,16 +277,20 @@
 # of these directories as @BASE_DIR@ and @STAGING_DIR at . Note that
 # STAGING_DIR can be outside BASE_DIR when the user sets BR2_HOST_DIR
 # to a custom value.
+# We use 'find ... -exec sed' instead of 'find ... | xargs sed' because
+# find may return no results and 'sed -i' requires at least one input
+# file.
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
+	find $$(STAGING_DIR)/usr/lib* -name "*.la" -exec \
 		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
 			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
-			-e "s:@BASE_DIR@:$$(BASE_DIR):g"
+			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
+		{} \;
 endef
 endif
 
