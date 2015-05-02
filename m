From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat,  2 May 2015 23:50:50 +0200
Subject: [Buildroot] [PATCH] autotools-package: also handle pre-installed
	external toolchain in .la fixup
Message-ID: <1430603450-17855-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .la fixup handling looks for paths starting with /usr and assumes
that they are missing the installation prefix (i.e. $(STAGING_DIR)). It
already handles the cases that $(STAGING_DIR) itself and $(BASE_DIR)
are under /usr, but it does not yet handle the case that a
pre-installed external toolchain is under /usr (and tracks that fact
in some .la file). For instance, if you use buildroot to generate a
toolchain with HOST_DIR=/usr/local/some_path, this problem will occur.

Fix this in the same way as $(STAGING_DIR) and $(BASE_DIR), but in
addition check that TOOLCHAIN_EXTERNAL_INSTALL_DIR is non-empty. For
internal toolchains, it is empty and the sed expression would fail.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reported-by: Carlos Soto <csotoalonso@gmail.com>
Cc: Carlos Soto <csotoalonso@gmail.com>
---
I haven't been able to test this very extensively because it's not so
easy to find .la files where it goes wrong.

Carlos, can you check if this patch solves the problem for you?
---
 package/pkg-autotools.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 49b42d4..9dea08a 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -304,10 +304,13 @@ endif
 # needs to be applied to any path that starts with /usr.
 #
 # To protect against the case that the output or staging directories
-# themselves are under /usr, we first substitute away any occurrences
-# of these directories as @BASE_DIR@ and @STAGING_DIR at . Note that
-# STAGING_DIR can be outside BASE_DIR when the user sets BR2_HOST_DIR
-# to a custom value.
+# or the pre-installed external toolchain themselves are under /usr,
+# we first substitute away any occurrences of these directories as
+# @BASE_DIR@, @STAGING_DIR@ and @TOOLCHAIN_EXTERNAL_INSTALL_DIR@ respectively.
+# Note that STAGING_DIR can be outside BASE_DIR when the user sets
+# BR2_HOST_DIR to a custom value. Note that TOOLCHAIN_EXTERNAL_INSTALL_DIR
+# can be under @BASE_DIR@ when it's a downloaded toolchain, and can be empty
+# when we use an internal toolchain.
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
@@ -315,7 +318,11 @@ define $(2)_INSTALL_STAGING_CMDS
 	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
 		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
+			$$(if $$(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
+				-e "s:$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g") \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+			$$(if $$(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
+				-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
 			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
 			-e "s:@BASE_DIR@:$$(BASE_DIR):g"
 endef
-- 
2.1.4
