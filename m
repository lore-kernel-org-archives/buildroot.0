From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:23:55 +0200
Subject: [Buildroot] [v3 01/13] core/pkg-download: change all helpers to use
 common options
Message-ID: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently all download helpers accepts the local output file, the remote
locations, the changesets and so on... as positional arguments.

This was well and nice when that's was all we needed.

But then we added an option to quiesce their verbosity, and that was
shoehorned with a trivial getopts, still keeping all the existing
positional arguments as... positional arguments.

Adding yet more options while keeping positional arguments will not be
very easy, even if we do not envision any new option in the foreseeable
future (but 640K ought to be enough for everyone, remember? ;-) ).

Change all helpers to accept a set of generic options (-q for quiet and
-o for the output file) as well as helper-specific options (like -r for
the repository, -c for a changeset...).

Maxime:
Changed -R to -r for recurse (only for the git backend)
Changed -r to -u for URI (for all backend)
Change -R to -c for cset (for CVS and SVN backend)
Add the export of the BR_BACKEND_DL_GETOPTS so all the backend wrapper
can use the same option easily
Now all the backends use the same common options.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v1 -> v2:
   - Fix comment in bzr backend
   - Remove 'R' from BR_BACKEND_DL_GETOPTS
   - check-hash shouldn't have had its options changed since it's not a
   download backend (Arnout)
---
 package/pkg-download.mk     | 38 +++++++++++++++++++-------------------
 support/download/bzr        | 25 ++++++++++++++-----------
 support/download/cp         | 17 +++++++++--------
 support/download/cvs        | 34 +++++++++++++++++++---------------
 support/download/dl-wrapper |  7 ++++++-
 support/download/git        | 33 +++++++++++++++++----------------
 support/download/hg         | 25 ++++++++++++++-----------
 support/download/scp        | 19 ++++++++++---------
 support/download/svn        | 25 ++++++++++++++-----------
 support/download/wget       | 17 +++++++++--------
 10 files changed, 131 insertions(+), 109 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 3712b9ccc6..ce069b9926 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -77,9 +77,9 @@ define DOWNLOAD_GIT
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		$($(PKG)_SITE) \
-		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		-u $($(PKG)_SITE) \
+		-c $($(PKG)_DL_VERSION) \
+		-n $($(PKG)_RAW_BASE_NAME) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -88,9 +88,9 @@ define DOWNLOAD_BZR
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		$(QUIET) \
 		-- \
-		$($(PKG)_SITE) \
-		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		-u $($(PKG)_SITE) \
+		-c $($(PKG)_DL_VERSION) \
+		-n $($(PKG)_RAW_BASE_NAME) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -99,10 +99,10 @@ define DOWNLOAD_CVS
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		$(QUIET) \
 		-- \
-		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
-		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAWNAME) \
-		$($(PKG)_RAW_BASE_NAME) \
+		-u $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
+		-c $($(PKG)_DL_VERSION) \
+		-N $($(PKG)_RAWNAME) \
+		-n $($(PKG)_RAW_BASE_NAME) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -111,9 +111,9 @@ define DOWNLOAD_SVN
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		$(QUIET) \
 		-- \
-		$($(PKG)_SITE) \
-		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		-u $($(PKG)_SITE) \
+		-c $($(PKG)_DL_VERSION) \
+		-n $($(PKG)_RAW_BASE_NAME) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -126,7 +126,7 @@ define DOWNLOAD_SCP
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		'$(call stripurischeme,$(call qstrip,$(1)))' \
+		-u '$(call stripurischeme,$(call qstrip,$(1)))' \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -135,9 +135,9 @@ define DOWNLOAD_HG
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		$(QUIET) \
 		-- \
-		$($(PKG)_SITE) \
-		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		-u $($(PKG)_SITE) \
+		-c $($(PKG)_DL_VERSION) \
+		-n $($(PKG)_RAW_BASE_NAME) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -147,7 +147,7 @@ define DOWNLOAD_WGET
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		'$(call qstrip,$(1))' \
+		-u '$(call qstrip,$(1))' \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -157,7 +157,7 @@ define DOWNLOAD_LOCALFILES
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		$(QUIET) \
 		-- \
-		$(call stripurischeme,$(call qstrip,$(1))) \
+		-u $(call stripurischeme,$(call qstrip,$(1))) \
 		$($(PKG)_DL_OPTS)
 endef
 
diff --git a/support/download/bzr b/support/download/bzr
index 75b7b415c1..5289a421cd 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -5,28 +5,31 @@ set -e
 
 # Download helper for bzr, to be called from the download wrapper script
 #
-# Call it as:
-#   .../bzr [-q] OUT_FILE REPO_URL REV BASENAME
+# Options:
+#   -q          Be quiet
+#   -o FILE     Generate archive in FILE.
+#   -u URI      Clone from repository at URI.
+#   -c CSET     Use changeset (or revision) CSET.
+#   -n NAME     Use basename NAME.
 #
 # Environment:
 #   BZR      : the bzr command to call
 
 
 verbose=
-while getopts :q OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    o)  output="${OPTARG}";;
+    u)  uri="${OPTARG}";;
+    c)  cset="${OPTARG}";;
+    n)  basename="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
 
-output="${1}"
-repo="${2}"
-rev="${3}"
-basename="${4}"
-
-shift 4 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -51,5 +54,5 @@ if [ ${bzr_version} -ge ${bzr_min_version} ]; then
 fi
 
 _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
-    ${timestamp_opt} - "${@}" "'${repo}'" -r "'${rev}'" \
+    ${timestamp_opt} - "${@}" "'${uri}'" -r "'${cset}'" \
     >"${output}"
diff --git a/support/download/cp b/support/download/cp
index 0ee1f3ba82..52fe2de83d 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -5,8 +5,10 @@ set -e
 
 # Download helper for cp, to be called from the download wrapper script
 #
-# Call it as:
-#   .../cp [-q] OUT_FILE SRC_FILE
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Copy to file FILE.
+#   -u FILE     Copy from file FILE.
 #
 # Environment:
 #   LOCALFILES: the cp command to call
@@ -17,18 +19,17 @@ set -e
 # Make 'cp' verbose by default, so it behaves a bit like the others.
 verbose=-v
 
-while getopts :q OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=;;
+    o)  output="${OPTARG}";;
+    u)  source="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
 
-output="${1}"
-source="${2}"
-
-shift 2 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
diff --git a/support/download/cvs b/support/download/cvs
index 50050ab1c9..69d5c71f28 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -5,28 +5,32 @@ set -e
 
 # Download helper for cvs, to be called from the download wrapper script
 #
-# Call it as:
-#   .../cvs [-q] OUT_FILE CVS_URL REV PKG_NAME BASENAME
+# Options:
+#   -q          Be quiet
+#   -o FILE     Generate archive in FILE.
+#   -u URI      Checkout from repository at URI.
+#   -c REV      Use revision REV.
+#   -N RAWNAME  Use rawname (aka module name) RAWNAME.
+#   -n NAME     Use basename NAME.
 #
 # Environment:
 #   CVS      : the cvs command to call
 
 verbose=
-while getopts :q OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-Q;;
+    o)  output="${OPTARG}";;
+    u)  uri="${OPTARG}";;
+    c)  rev="${OPTARG}";;
+    N)  rawname="${OPTARG}";;
+    n)  basename="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
 
-output="${1}"
-repo="${2}"
-rev="${3}"
-rawname="${4}"
-basename="${5}"
-
-shift 5 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -42,14 +46,14 @@ else
     select="-r"
 fi
 
-# The absence of an initial : on ${repo} means access method undefined
-if [[ ! "${repo}" =~ ^: ]]; then
+# The absence of an initial : on ${uri} means access method undefined
+if [[ ! "${uri}" =~ ^: ]]; then
    # defaults to anonymous pserver
-   repo=":pserver:anonymous@${repo}"
+   uri=":pserver:anonymous@${uri}"
 fi
 
 export TZ=UTC
-_cvs ${verbose} -z3 -d"'${repo}'" \
+_cvs ${verbose} -z3 -d"'${uri}'" \
      co "${@}" -d "'${basename}'" ${select} "'${rev}'" -P "'${rawname}'"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index f944b71db5..510e7ef852 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -19,6 +19,8 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
+export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:q"
+
 main() {
     local OPT OPTARG
     local backend output hfile recurse quiet
@@ -83,7 +85,10 @@ main() {
     # If the backend fails, we can just remove the temporary directory to
     # remove all the cruft it may have left behind. Then we just exit in
     # error too.
-    if ! "${OLDPWD}/support/download/${backend}" ${quiet} ${recurse} "${tmpf}" "${@}"; then
+    if ! "${OLDPWD}/support/download/${backend}" \
+            ${quiet} ${recurse} \
+            -o "${tmpf}" "${@}"
+    then
         rm -rf "${tmpd}"
         exit 1
     fi
diff --git a/support/download/git b/support/download/git
index f590ff6494..58a2c6ad9d 100755
--- a/support/download/git
+++ b/support/download/git
@@ -5,32 +5,33 @@ set -e
 
 # Download helper for git, to be called from the download wrapper script
 #
-# Call it as:
-#   .../git [-q] [-r] OUT_FILE REPO_URL CSET BASENAME
-#
-#   -q  Be quiet.
-#   -r  Clone and archive sub-modules.
+# Options:
+#   -q          Be quiet.
+#   -r          Clone and archive sub-modules.
+#   -o FILE     Generate archive in FILE.
+#   -u URI      Clone from repository at URI.
+#   -c CSET     Use changeset CSET.
+#   -n NAME     Use basename NAME.
 #
 # Environment:
 #   GIT      : the git command to call
 
 verbose=
 recurse=0
-while getopts :qr OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
     r)  recurse=1;;
+    o)  output="${OPTARG}";;
+    u)  uri="${OPTARG}";;
+    c)  cset="${OPTARG}";;
+    n)  basename="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
-
-output="${1}"
-repo="${2}"
-cset="${3}"
-basename="${4}"
 
-shift 4 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -46,9 +47,9 @@ _git() {
 # Messages for the type of clone used are provided to ease debugging in case of
 # problems
 git_done=0
-if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
+if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
     printf "Doing shallow clone\n"
-    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${repo}'" "'${basename}'"; then
+    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${basename}'"; then
         git_done=1
     else
         printf "Shallow clone failed, falling back to doing a full clone\n"
@@ -56,7 +57,7 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    _git clone ${verbose} "${@}" "'${repo}'" "'${basename}'"
+    _git clone ${verbose} "${@}" "'${uri}'" "'${basename}'"
 fi
 
 pushd "${basename}" >/dev/null
diff --git a/support/download/hg b/support/download/hg
index 3af01690b3..efb515fca5 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -5,27 +5,30 @@ set -e
 
 # Download helper for hg, to be called from the download wrapper script
 #
-# Call it as:
-#   .../hg [-q] OUT_FILE REPO_URL CSET BASENAME
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Generate archive in FILE.
+#   -u URI      Clone from repository at URI.
+#   -c CSET     Use changeset (or revision) CSET.
+#   -n NAME     Use basename NAME.
 #
 # Environment:
 #   HG       : the hg command to call
 
 verbose=
-while getopts :q OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    o)  output="${OPTARG}";;
+    u)  uri="${OPTARG}";;
+    c)  cset="${OPTARG}";;
+    n)  basename="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
 
-output="${1}"
-repo="${2}"
-cset="${3}"
-basename="${4}"
-
-shift 4 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -33,7 +36,7 @@ _hg() {
     eval ${HG} "${@}"
 }
 
-_hg clone ${verbose} "${@}" --noupdate "'${repo}'" "'${basename}'"
+_hg clone ${verbose} "${@}" --noupdate "'${uri}'" "'${basename}'"
 
 _hg archive ${verbose} --repository "'${basename}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
diff --git a/support/download/scp b/support/download/scp
index 825fd41c64..8ecf2f4b22 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -5,25 +5,26 @@ set -e
 
 # Download helper for scp, to be called from the download wrapper script
 #
-# Call it as:
-#   .../scp [-q] OUT_FILE SRC_URL
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Copy to local file FILE.
+#   -u FILE     Copy from remote file FILE.
 #
 # Environment:
 #   SCP       : the scp command to call
 
 verbose=
-while getopts :q OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    o)  output="${OPTARG}";;
+    u)  uri="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
 
-output="${1}"
-url="${2}"
-
-shift 2 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -31,4 +32,4 @@ _scp() {
     eval ${SCP} "${@}"
 }
 
-_scp ${verbose} "${@}" "'${url}'" "'${output}'"
+_scp ${verbose} "${@}" "'${uri}'" "'${output}'"
diff --git a/support/download/svn b/support/download/svn
index 77abf3d02d..542b25c0a2 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -5,27 +5,30 @@ set -e
 
 # Download helper for svn, to be called from the download wrapper script
 #
-# Call it as:
-#   .../svn [-q] OUT_FILE REPO_URL REV BASNAME
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Generate archive in FILE.
+#   -u URI      Checkout from repository at URI.
+#   -c REV      Use revision REV.
+#   -n NAME     Use basename NAME.
 #
 # Environment:
 #   SVN      : the svn command to call
 
 verbose=
-while getopts :q OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    o)  output="${OPTARG}";;
+    u)  uri="${OPTARG}";;
+    c)  rev="${OPTARG}";;
+    n)  basename="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
 
-output="${1}"
-repo="${2}"
-rev="${3}"
-basename="${4}"
-
-shift 4 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
@@ -33,6 +36,6 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
+_svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
diff --git a/support/download/wget b/support/download/wget
index 768de904c3..fece6663ca 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -5,25 +5,26 @@ set -e
 
 # Download helper for wget, to be called from the download wrapper script
 #
-# Call it as:
-#   .../wget [-q] OUT_FILE URL
+# Options:
+#   -q          Be quiet.
+#   -o FILE     Save into file FILE.
+#   -u URL      Download file at URL.
 #
 # Environment:
 #   WGET     : the wget command to call
 
 verbose=
-while getopts :q OPT; do
+while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
+    o)  output="${OPTARG}";;
+    u)  url="${OPTARG}";;
+    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-shift $((OPTIND-1))
 
-output="${1}"
-url="${2}"
-
-shift 2 # Get rid of our options
+shift $((OPTIND-1)) # Get rid of our options
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
-- 
2.16.2
