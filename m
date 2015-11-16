From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:12 +0100
Subject: [Buildroot] [PATCH 17/21 RFC] core/legal-info: install source
	archives in their own sub-dir
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <c00f3106a2d337019874a80f915929995869dd36.1447713615.git.yann.morin.1998@free.fr>
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
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a04adcf..6e53c59 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -492,6 +492,8 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAWNAME)-$$($(2)_VERSION)
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency
@@ -822,7 +824,7 @@ endif
 # Copy the source tarball
 	$$(Q)$$(call hardlink-copy,\
 		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
-		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
+		     $$($(2)_REDIST_SOURCES_DIR))
 endif # redistribute
 
 endif # other packages
-- 
1.9.1
