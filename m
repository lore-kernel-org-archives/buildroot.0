From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 22:47:30 +0200
Subject: [Buildroot] [git commit] package infra: add patch-dependencies
Message-ID: <20150409211053.6C0DC81963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97595d11fb3a4e46aae18dce2147a66e205fa9e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages need to vampirise files from one or more other packages.
This is the case, for example, of the Linux kernel and its /extensions/.

Add a new type of dependencies, that are guaranteed to be extracted and
patched before a package is patched.

[Thomas: remove <pkg>-show-build-depends and <pkg>-show-patch-depends,
since they don't seem to really be necessary and very useful.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f77aab2..1d56f81 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -428,6 +428,7 @@ endif
 
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
+$(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
@@ -539,6 +540,8 @@ $$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
 
 $(1)-patch:		$$($(2)_TARGET_PATCH)
 $$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
+# Order-only dependency
+$$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES))
 
 $(1)-extract:			$$($(2)_TARGET_EXTRACT)
 $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
@@ -578,7 +581,7 @@ $(1)-show-version:
 			@echo $$($(2)_VERSION)
 
 $(1)-show-depends:
-			@echo $$($(2)_FINAL_DEPENDENCIES)
+			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
 
 $(1)-graph-depends: graph-depends-requirements
 			@$$(INSTALL) -d $$(GRAPHS_DIR)
