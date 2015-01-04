From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 18:39:46 +0100
Subject: [Buildroot] [git commit] pkg-download: silence downloads if make is
	silent
Message-ID: <20150104175709.AA4B48041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b600227b059695453b737af647747e01b2b522a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If doing a silent build (make -s -> QUIET=-q), silence all downloads,
by passing the -q flag downward to backends as well as to check-hash.

Change a printf to use the trace functions.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk     |    8 ++++++++
 support/download/dl-wrapper |   13 +++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ba72fc1..9c782fe 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -88,6 +88,7 @@ define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -109,6 +110,7 @@ define DOWNLOAD_BZR
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -127,6 +129,7 @@ define DOWNLOAD_CVS
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
@@ -147,6 +150,7 @@ define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -168,6 +172,7 @@ define DOWNLOAD_SCP
 	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
 		-o $(DL_DIR)/$(2) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		'$(call stripurischeme,$(call qstrip,$(1)))'
 endef
@@ -185,6 +190,7 @@ define DOWNLOAD_HG
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -206,6 +212,7 @@ define DOWNLOAD_WGET
 	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
 		-o $(DL_DIR)/$(2) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		'$(call qstrip,$(1))'
 endef
@@ -222,6 +229,7 @@ define DOWNLOAD_LOCALFILES
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
 		-o $(DL_DIR)/$(2) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		$(QUIET) \
 		-- \
 		$(call stripurischeme,$(call qstrip,$(1)))
 endef
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index cced8f6..3b30840 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,15 +21,16 @@ set -e
 
 main() {
     local OPT OPTARG
-    local backend output hfile
+    local backend output hfile quiet
 
     # Parse our options; anything after '--' is for the backend
-    while getopts :hb:o:H: OPT; do
+    while getopts :hb:o:H:q OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         b)  backend="${OPTARG}";;
         o)  output="${OPTARG}";;
         H)  hfile="${OPTARG}";;
+        q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
@@ -49,11 +50,11 @@ main() {
 
     # If the output file already exists, do not download it again
     if [ -e "${output}" ]; then
-        if support/download/check-hash "${hfile}" "${output}" "${output##*/}"; then
+        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
             exit 0
         fi
         rm -f "${output}"
-        printf "Re-downloading '%s'...\n" "${output##*/}"
+        warn "Re-downloading '%s'...\n" "${output##*/}"
     fi
 
     # tmpd is a temporary directory in which backends may store intermediate
@@ -75,7 +76,7 @@ main() {
     # If the backend fails, we can just remove the temporary directory to
     # remove all the cruft it may have left behind. Then we just exit in
     # error too.
-    if ! "${OLDPWD}/support/download/${backend}" "${tmpf}" "${@}"; then
+    if ! "${OLDPWD}/support/download/${backend}" ${quiet} "${tmpf}" "${@}"; then
         rm -rf "${tmpd}"
         exit 1
     fi
@@ -85,7 +86,7 @@ main() {
 
     # Check if the downloaded file is sane, and matches the stored hashes
     # for that file
-    if ! support/download/check-hash "${hfile}" "${tmpf}" "${output##*/}"; then
+    if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
         rm -rf "${tmpd}"
         exit 1
     fi
