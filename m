From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 21 Jan 2020 14:33:37 -0600
Subject: [Buildroot] [PATCH 1/1] download/git: support Git LFS
Message-ID: <20200121203337.30856-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: John Keeping <john@metanate.com>

Git Large File Storage replaces large files with text pointers in the
Git repository while storing the contents on a remote server.  If a
repository is using this extension, then git-lfs must be used to
checkout the large files before the source archive is generated.

Signed-off-by: John Keeping <john@metanate.com>
[vfazio:
  - add git-lfs to DL_TOOLS_DEPENDENCIES
  - fixup for 5a0d6813948fea2cdb88a2e35984520eec856dec
    ("infra/pkg-download: make the DOWNLOAD macro fully parameterised")
]
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 docs/manual/adding-packages-generic.txt | 4 ++++
 package/pkg-download.mk                 | 1 +
 package/pkg-generic.mk                  | 3 +++
 support/download/dl-wrapper             | 9 +++++----
 support/download/git                    | 9 +++++++++
 5 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index baa052e31c..7a1fb87795 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -342,6 +342,10 @@ not and can not work as people would expect it should:
   submodules when they contain bundled libraries, in which case we
   prefer to use those libraries from their own package.
 
+* +LIBFOO_GIT_LFS+ should be set to +YES+ if the Git repository uses
+  Git LFS to store large files out of band.  This is only available for
+  packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).
+
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
   The tarball for most packages has one leading component named
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index de619ba90a..d72fc51623 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -109,6 +109,7 @@ define DOWNLOAD
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
+		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
 		-- \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 268d999efb..ae86a2eadc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1082,6 +1082,9 @@ ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
 else ifeq ($$($(2)_SITE_METHOD),git)
 DL_TOOLS_DEPENDENCIES += git
+  ifneq ($$($(2)_GIT_LFS),)
+    DL_TOOLS_DEPENDENCIES += git-lfs
+  endif
 else ifeq ($$($(2)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
 else ifeq ($$($(2)_SITE_METHOD),scp)
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3315bd410e..a41e30b510 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,15 +17,15 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile recurse quiet rc
+    local backend output hfile large_file recurse quiet rc
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:lrf:u:q" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -34,6 +34,7 @@ main() {
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
         H)  hfile="${OPTARG}";;
+        l)  large_file="-l";;
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
@@ -127,7 +128,7 @@ main() {
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
-                ${quiet} ${recurse} -- "${@}"
+                ${quiet} ${large_file} ${recurse} -- "${@}"
         then
             # cd back to keep path coherence
             cd "${OLDPWD}"
diff --git a/support/download/git b/support/download/git
index 075f665bbf..729425d733 100755
--- a/support/download/git
+++ b/support/download/git
@@ -44,10 +44,12 @@ _on_error() {
 }
 
 verbose=
+large_file=0
 recurse=0
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
+    l)  large_file=1;;
     r)  recurse=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
@@ -178,6 +180,13 @@ if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
 fi
 
+# If there are large files then fetch them.
+if [ ${large_file} -eq 1 ]; then
+    _git lfs install
+    _git lfs fetch
+    _git lfs checkout
+fi
+
 # Generate the archive, sort with the C locale so that it is reproducible.
 # We do not want the .git dir; we keep other .git files, in case they are the
 # only files in their directory.
-- 
2.25.0
