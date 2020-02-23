From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 22:16:19 +0100
Subject: [Buildroot] [git commit] package/rcw: allow not having custom rcwi
 files
Message-ID: <20200223210440.510D08E865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78a9eab661c2e097a43fbee780f80423701796be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A project could quite possibly have a custom rcw file
that does not rely on any custom rcw include files (rcwi).

Allow the build to succeed if this is the case.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
[yann.morin.1998 at free.fr: install includes in a separate hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rcw/rcw.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index 36d2da61b5..81e22fff93 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -13,6 +13,7 @@ RCW_LICENSE_FILES = LICENSE
 RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
 
 ifneq ($(RCW_FILES),)
+RCW_INCLUDES = $(filter-out %.rcw,$(RCW_FILES))
 # Get the name of the custom rcw file from the custom list
 RCW_PROJECT = $(notdir $(filter %.rcw,$(RCW_FILES)))
 
@@ -23,9 +24,16 @@ $(error BR2_PACKAGE_HOST_RCW_CUSTOM_PATH must have exactly one .rcw file)
 endif
 endif
 
+ifneq ($(RCW_INCLUDES),)
+define HOST_RCW_ADD_CUSTOM_RCW_INCLUDES
+	mkdir -p $(@D)/custom_board
+	cp -f $(RCW_INCLUDES) $(@D)/custom_board
+endef
+HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_INCLUDES
+endif
+
 define HOST_RCW_ADD_CUSTOM_RCW_FILES
 	mkdir -p $(@D)/custom_board/rcw
-	cp -f $(filter-out %.rcw,$(RCW_FILES)) $(@D)/custom_board
 	cp -f $(filter %.rcw,$(RCW_FILES)) $(@D)/custom_board/rcw
 endef
 HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
