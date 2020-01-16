From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 16 Jan 2020 13:38:49 -0600
Subject: [Buildroot] [PATCH 1/4] core/pkg-infra: introduce download features
 concept
Message-ID: <20200116193852.17683-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-download.mk     | 1 +
 package/pkg-generic.mk      | 7 +++++++
 support/download/dl-wrapper | 8 +++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index de619ba90a..889ff57ded 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -108,6 +108,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		-x '$($(2)_DL_FEATURES)' \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 268d999efb..3ea818fc15 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -567,6 +567,13 @@ ifndef $(2)_DL_OPTS
  endif
 endif
 
+ifndef $(2)_DL_FEATURES
+ ifdef $(3)_DL_FEATURES
+  $(2)_DL_FEATURES = $$($(3)_DL_FEATURES)
+ endif
+endif
+
+
 ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3315bd410e..b77ee06b86 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,15 +17,15 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:x:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile recurse quiet rc
+    local backend output hfile recurse quiet rc features
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:rf:u:x:q" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -37,6 +37,7 @@ main() {
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
+        x)  features="${OPTARG}";;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
@@ -127,6 +128,7 @@ main() {
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
+                -x "${features}" \
                 ${quiet} ${recurse} -- "${@}"
         then
             # cd back to keep path coherence
-- 
2.25.0
