From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 May 2016 18:14:29 +0200
Subject: [Buildroot] [PATCH 04/13 v7] core/legal-info: install source
	archives in their own sub-dir
In-Reply-To: <cover.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <596aa96d1442410a2ffe8c28e131112c57424b91.1462637351.git.yann.morin.1998@free.fr>
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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v6 -> v7:
  - directly call the helper

Changes v5 -> v6:
  - variable with raw name was renamed  (Thomas)

Changes v1 -> v2:
  - perl no longer has a post-legal-info hook  (Thomas, Luca)
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 688123c..b031879 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -482,6 +482,8 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASE_NAME)
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency
@@ -807,7 +809,7 @@ endif
 # Save the source tarball
 	$$(Q)support/scripts/hardlink-or-copy \
 		$$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) \
-		$$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+		$$($(2)_REDIST_SOURCES_DIR)
 endif # redistribute
 
 endif # other packages
-- 
2.7.4
