From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 19:35:15 +0100
Subject: [Buildroot] [PATCH 06/13 v2] core/legal-info: install source
	archives in their own sub-dir
In-Reply-To: <cover.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <72f53f4f69afe29c7621731bae6eb536864501c5.1450031251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we put all source archives side-by-side in the same
directory.

Since we're about to also save individual patches that were applied
on those sources, we don't want to make that directory a complete
mess of unassorted files.

So, we install each source archive in its own sub-directory, where
we'll later store the patches too. Store that location in a variable,
so it can be re-used later on (to install patches in a future commit).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2:
  - perl no longer has a post-legal-info hook  (Thoams, Luca)
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 784c39c..3b6240a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -491,6 +491,8 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAWNAME_VERSION)
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency
@@ -824,7 +826,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball
 	$$(Q)$$(call hardlink-copy,\
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
-		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
+		     $$($(2)_REDIST_SOURCES_DIR))
 endif # redistribute
 
 endif # other packages
-- 
1.9.1
