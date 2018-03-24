From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 15:20:02 +0100
Subject: [Buildroot] [PATCH v4 3/9] package/pkg-generic: add the concept of
 extract dependency
In-Reply-To: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180324142008.10375-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extract dependencies are dependencies that must be ready before the
extract step of a package, i.e for tools that are needed to extract
packages themselves. Current examples of such tools are host-tar,
host-lzip and host-xz.

They are currently handled through DEPENDENCIES_HOST_PREREQ. However,
this mechanism has a number of drawbacks:

 - First and foremost, because host-tar/host-lzip/host-xz are not
   listed in the dependencies of packages, the package infrastructure
   does not know it should rsync them in the context of per-package
   SDK.

 - Second, there is no dependency handling *between* them. I.e, we
   have no mechanism that says host-tar should be built before
   host-lzip, while it is in fact the case: if you need to build
   host-lzip, you need to extract a tarball, so you may need host-tar
   if your system tarball is not capable enough.

For those reasons, it makes sense to add explicit support for "extract
dependencies" in the package infrastructure, through the
<pkg>_EXTRACT_DEPENDENCIES variable. It is unlikely this variable will
ever be used by a package .mk file, but it will be used internally by
the package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes since v3:
 - Fix typo in documentation noticed by Yann (use -> used)
 - Add Reviewed-by from Yann
Changes since v2:
 - New patch
---
 docs/manual/adding-packages-generic.txt | 7 +++++++
 package/pkg-generic.mk                  | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 521d6d50c7..194da00e67 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -347,6 +347,13 @@ information is (assuming the package name is +libfoo+) :
   a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
   the current host package.
 
+* +LIBFOO_EXTRACT_DEPENDENCIES+ lists the dependencies (in terms of
+  package name) that are required for the current target package to be
+  extracted. These depnedencies are guaranteed to be compiled and
+  installed before the extract step of the current package
+  starts. This is only used internally by the package infrastructure,
+  and should typically not be used directly by packages.
+
 * +LIBFOO_PATCH_DEPENDENCIES+ lists the dependencies (in terms of
   package name) that are required for the current package to be
   patched. These dependencies are guaranteed to be extracted and
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3cadb28595..0a404040b0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -557,8 +557,13 @@ endif
 
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
+$(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
 $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
-$(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
+$(2)_FINAL_ALL_DEPENDENCIES = \
+	$$(sort \
+		$$($(2)_FINAL_DEPENDENCIES) \
+		$$($(2)_FINAL_EXTRACT_DEPENDENCIES) \
+		$$($(2)_FINAL_PATCH_DEPENDENCIES))
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
@@ -681,6 +686,7 @@ $$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES
 
 $(1)-extract:			$$($(2)_TARGET_EXTRACT)
 $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
+$$($(2)_TARGET_EXTRACT): | $$($(2)_FINAL_EXTRACT_DEPENDENCIES)
 
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
-- 
2.14.3
