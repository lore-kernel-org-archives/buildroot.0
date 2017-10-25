From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:10:03 +0200
Subject: [Buildroot] [PATCH v2 13/13] WIP: support package with '-'
In-Reply-To: <20171025201003.16105-1-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
Message-ID: <20171025201003.16105-14-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
Changes v1 --> v2:
  - from https://github.com/maximeh/buildroot/commit/39fb06a2b4d7662474520db849a56b9977650487.patch
  - new WIP patch
---
 package/pkg-download.mk     |  2 +-
 support/download/bzr        |  3 ++-
 support/download/cvs        |  3 ++-
 support/download/dl-wrapper | 15 ++++++++-------
 support/download/file       |  3 ++-
 support/download/git        |  7 ++++---
 support/download/hg         |  3 ++-
 support/download/scp        |  3 ++-
 support/download/svn        |  3 ++-
 support/download/wget       |  3 ++-
 10 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 307c415f64..3973778181 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -99,7 +99,7 @@ define DOWNLOAD
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-n $($(PKG)_RAW_BASE_NAME) \
 		-N $($(PKG)_RAWNAME) \
-		-o $($(PKG)_DL_DIR)/$(notdir $(1)) \
+		-o $($(PKG)_DL_DIR) \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(DOWNLOAD_URIS) \
 		$(QUIET) \
diff --git a/support/download/bzr b/support/download/bzr
index 5289a421cd..36f19cc0bb 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -20,6 +20,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    f)  filename="${OPTARG}";;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -55,4 +56,4 @@ fi
 
 _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
     ${timestamp_opt} - "${@}" "'${uri}'" -r "'${cset}'" \
-    >"${output}"
+    >"${output}/${filename}"
diff --git a/support/download/cvs b/support/download/cvs
index 3f77b849e4..959583dcc0 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -21,6 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-Q;;
     o)  output="${OPTARG}";;
+    f)  filename="${OPTARG}";;
     u)  uri="${OPTARG#*://}";;
     c)  rev="${OPTARG}";;
     N)  rawname="${OPTARG}";;
@@ -56,4 +57,4 @@ export TZ=UTC
 _cvs ${verbose} -z3 -d"'${uri}'" \
      co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
-tar czf "${output}" "${basename}"
+tar czf "${output}/${filename}" "${basename}"
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 67e9742767..c022d356fa 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -19,7 +19,7 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:qf:eR:"
 
 main() {
     local OPT OPTARG
@@ -56,8 +56,8 @@ main() {
     # - matches all its hashes: do not download it again and exit promptly
     # - fails at least one of its hashes: force a re-download
     # - there's no hash (but a .hash file): consider it a hard error
-    if [ -e "${output}" ]; then
-        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
+    if [ -e "${output}/${filename}" ]; then
+        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${filename}"; then
             exit 0
         elif [ ${?} -ne 2 ]; then
             # Do not remove the file, otherwise it might get re-downloaded
@@ -109,9 +109,10 @@ main() {
                 -c "${cset}" \
                 -n "${raw_base_name}" \
                 -N "${raw_name}" \
-                -f "${filename}" \
+                -f "$(basename ${tmpf})" \
+                -R "${filename}" \
                 -u "${uri}" \
-                -o "${tmpf}" \
+                -o "${tmpd}" \
                 ${quiet} ${recurse} "${@}"
         then
             rm -rf "${tmpd:?}/*"
@@ -125,7 +126,7 @@ main() {
 
         # Check if the downloaded file is sane, and matches the stored hashes
         # for that file
-        if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+        if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${filename}"; then
             rm -rf "${tmpd:?}/*"
             # cd back to keep path coherence
             cd "${OLDPWD}"
@@ -181,7 +182,7 @@ main() {
     # that 'mv' is atomic, because it then uses rename() that POSIX mandates
     # to be atomic, see:
     #   http://pubs.opengroup.org/onlinepubs/9699919799/functions/rename.html
-    if ! mv -f "${tmp_output}" "${output}"; then
+    if ! mv -f "${tmp_output}" "${output}/${filename}"; then
         rm -f "${tmp_output}"
         exit 1
     fi
diff --git a/support/download/file b/support/download/file
index a3e616a181..5d77d2b66c 100755
--- a/support/download/file
+++ b/support/download/file
@@ -22,6 +22,7 @@ verbose=-v
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=;;
+    f)  filename="${OPTARG}";;
     o)  output="${OPTARG}";;
     u)  source="${OPTARG#*://}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
@@ -37,4 +38,4 @@ _localfiles() {
     eval ${LOCALFILES} "${@}"
 }
 
-_localfiles ${verbose} "${@}""'${source}'" "'${output}'"
+_localfiles ${verbose} "${@}""'${source}'" "'${output}/${filename}'"
diff --git a/support/download/git b/support/download/git
index 5d09cc0d7a..813784970b 100755
--- a/support/download/git
+++ b/support/download/git
@@ -22,6 +22,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
     r)  recurse=1;;
+    f)  filename="${OPTARG}";;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -106,9 +107,9 @@ LC_ALL=C sort <"${BR2_DL_DIR}/${basename}.list" >"${BR2_DL_DIR}/${basename}.list
 # sources.buildroot.org and used in the *.hash files
 tar cf - --transform="s/^\.$/${basename}/" \
 	--numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
-         -T "${BR2_DL_DIR}/${basename}.list.sorted" >"${output}.tar"
-gzip -6 -n <"${output}.tar" >"${output}"
-tar tf "${output}"
+         -T "${BR2_DL_DIR}/${basename}.list.sorted" >"${output}/${filename}.tar"
+gzip -n <"${output}/${filename}.tar" >"${output}/${filename}"
+tar tf "${output}/${filename}"
 
 rm -f "${BR2_DL_DIR}/${basename}.list"
 rm -f "${BR2_DL_DIR}/${basename}.list.sorted"
diff --git a/support/download/hg b/support/download/hg
index efb515fca5..586d62f3be 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -19,6 +19,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    f)  filename="${OPTARG}";;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -40,4 +41,4 @@ _hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
 
 _hg archive ${verbose} --repository "'${basename}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
-            - >"${output}"
+            - >"${output}/${filename}"
diff --git a/support/download/scp b/support/download/scp
index 8ecf2f4b22..92276dfef2 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -17,6 +17,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    f)  filename="${OPTARG}";;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
@@ -32,4 +33,4 @@ _scp() {
     eval ${SCP} "${@}"
 }
 
-_scp ${verbose} "${@}" "'${uri}'" "'${output}'"
+_scp ${verbose} "${@}" "'${uri}'" "'${output}/${filename}'"
diff --git a/support/download/svn b/support/download/svn
index 542b25c0a2..a326d0523e 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -19,6 +19,7 @@ verbose=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    f)  filename="${OPTARG}";;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  rev="${OPTARG}";;
@@ -38,4 +39,4 @@ _svn() {
 
 _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
-tar czf "${output}" "${basename}"
+tar czf "${output}/${filename}" "${basename}"
diff --git a/support/download/wget b/support/download/wget
index c69e6071aa..97aa43de73 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -21,6 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     q)  verbose=-q;;
     o)  output="${OPTARG}";;
     f)  filename="${OPTARG}";;
+    R)  remote_filename="${OPTARG}";;
     u)  url="${OPTARG}";;
     e)  encode="-e";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
@@ -40,4 +41,4 @@ _wget() {
 # mirror
 [ -n "${encode}" ] && filename=${filename//\?/%3F}
 
-_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
+_wget ${verbose} "${@}" -O "'${output}/${filename}'" "'${url}/${remote_filename}'"
-- 
2.14.2
