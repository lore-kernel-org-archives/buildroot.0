From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 16 Jan 2020 13:38:51 -0600
Subject: [Buildroot] [PATCH 3/4] core/pkg-infra: deprecate GIT_SUBMODULES
In-Reply-To: <20200116193852.17683-1-vfazio@xes-inc.com>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
Message-ID: <20200116193852.17683-3-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

`${PKG}_DL_FEATURES = submodules` is the new method to indicate the need
for git submodules. Any package with ${PKG}_GIT_SUBMODULES set will
implicitly define this value with a warning that the package should be
updated to use the feature flags.

Update documentation to note this change.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 docs/manual/adding-packages-generic.txt | 13 +++++++------
 docs/manual/migrating.txt               | 15 +++++++++++++++
 package/pkg-download.mk                 |  1 -
 package/pkg-generic.mk                  |  4 ++++
 support/download/dl-wrapper             |  9 ++++-----
 support/download/git                    |  1 -
 6 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index baa052e31c..fba3fc84aa 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -335,12 +335,13 @@ not and can not work as people would expect it should:
      still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
      xref:hooks-rsync[].
 
-* +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
-  with the git submodules in the repository.  This is only available
-  for packages downloaded with git (i.e. when
-  +LIBFOO_SITE_METHOD=git+).  Note that we try not to use such git
-  submodules when they contain bundled libraries, in which case we
-  prefer to use those libraries from their own package.
+* +LIBFOO_DL_FEATURES+ allows optional features to be specified to the
+  downloading backend. Currently the following are supported:
+  ** +submodules+ will create an archive with the git submodules in the
+     repository.  This is only available for packages downloaded with
+     git (i.e. when +LIBFOO_SITE_METHOD=git+).  Note that we try not to
+     use such git submodules when they contain bundled libraries, in
+     which case we prefer to use those libraries from their own package.
 
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 92e487c71e..27f53f71a1 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -56,3 +56,18 @@ Whenever a package installs an executable that is linked with a library
 in +$(HOST_DIR)/lib+, it must have an RPATH pointing to that directory.
 
 An RPATH pointing to +$(HOST_DIR)/usr/lib+ is no longer accepted.
+
+[[migrating-git-submodules]]
+=== Migrating to 2020.02
+
+Before Buildroot 2020.02, packages that required git submodules would indicate
+the requirement by defining:
+---------------------
+LIBFOO_GIT_SUBMODULES = YES
+---------------------
+
+Submodule support has been made a feature flag supported by the git downloading
+mechanism. Packages should now define the following:
+---------------------
+LIBFOO_DL_FEATURES = submodules
+---------------------
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 889ff57ded..424880b51d 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -109,7 +109,6 @@ define DOWNLOAD
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
 		-x '$($(2)_DL_FEATURES)' \
-		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
 		-- \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3ea818fc15..d26a6b2bbf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -584,6 +584,10 @@ ifneq ($$($(2)_GIT_SUBMODULES),)
   $$(error $(2) declares having git sub-modules, but does not use the \
 	   'git' method (uses '$$($(2)_SITE_METHOD)' instead))
  endif
+ # Transitional: set the submodules feature based on the old GIT_SUBMODULES flag
+ $$(warning $(2)_GIT_SUBMODULES is defined, this package should transition \
+	 to $(2)_DL_FEATURES = submodules)
+ $(2)_DL_FEATURES += submodules
 endif
 
 ifeq ($$($(2)_SITE_METHOD),local)
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index b77ee06b86..855b269a81 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,15 +17,15 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:x:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:u:qf:x:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile recurse quiet rc features
+    local backend output hfile quiet rc features
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:x:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:f:u:x:q" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -34,7 +34,6 @@ main() {
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
         H)  hfile="${OPTARG}";;
-        r)  recurse="-r";;
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
         x)  features="${OPTARG}";;
@@ -129,7 +128,7 @@ main() {
                 -u "${uri}" \
                 -o "${tmpf}" \
                 -x "${features}" \
-                ${quiet} ${recurse} -- "${@}"
+                ${quiet} -- "${@}"
         then
             # cd back to keep path coherence
             cd "${OLDPWD}"
diff --git a/support/download/git b/support/download/git
index eb1778a2f9..add9c4bfbb 100755
--- a/support/download/git
+++ b/support/download/git
@@ -56,7 +56,6 @@ features=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
-    r)  recurse=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
-- 
2.25.0
