From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:12:24 +0200
Subject: [Buildroot] [git commit] support/download: convert cvs to use the
	wrapper
Message-ID: <20140804182554.AC10B9D367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=389f50dfb68b5e87413b348b34e87d69ff875e82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This drastically simplifies the cvs helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    9 +++++--
 support/download/cvs    |   54 ++++++++++++++---------------------------------
 2 files changed, 22 insertions(+), 41 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f10aad8..66ce02c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -129,9 +129,12 @@ endef
 
 define DOWNLOAD_CVS
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/cvs $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
-					  $($(PKG)_DL_VERSION) $($(PKG)_RAWNAME) \
-					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(EXTRA_ENV) support/download/wrapper cvs \
+		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
+		$($(PKG)_DL_VERSION) \
+		$($(PKG)_RAWNAME) \
+		$($(PKG)_BASE_NAME)
 endef
 
 # Not all CVS servers support ls/rls, use login to see if we can connect
diff --git a/support/download/cvs b/support/download/cvs
index 9aeed79..c92d491 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -1,47 +1,25 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for cvs
-# Call it with:
-#   $1: cvs repo
-#   $2: cvs revision
-#   $3: package's name (eg. foobar)
-#   $4: package's basename (eg. foobar-1.2.3)
-#   $5: output file
+# Download helper for cvs, to be called from the download wrapper script
+# Expected arguments:
+#   $1: output file
+#   $2: cvs repo
+#   $3: cvs revision
+#   $4: package's name (eg. foobar)
+#   $5: package's basename (eg. foobar-1.2.3)
 # And this environment:
 #   CVS      : the cvs command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-repo="${1}"
-rev="${2}"
-rawname="${3}"
-basename="${4}"
-output="${5}"
+output="${1}"
+repo="${2}"
+rev="${3}"
+rawname="${4}"
+basename="${5}"
 
-repodir="${basename}.tmp-cvs-checkout"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
+${CVS} -z3 -d":pserver:anonymous@${repo}" \
+       co -d "${basename}" -r ":${rev}" -P "${rawname}"
 
-cd "${BUILD_DIR}"
-# Remove leftovers from a previous failed run
-rm -rf "${repodir}"
-
-# Play tic-tac-toe with temp files
-# - first, we download to a trashable location (the build-dir)
-# - then we create a temporary tarball in the final location, so it is
-#   on the same filesystem as the final file
-# - finally, we atomically rename to the final file
-
-ret=1
-if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
-           co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
-    if tar czf "${tmp_output}" "${repodir}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
-fi
-
-# Cleanup
-rm -rf "${repodir}" "${tmp_output}"
-exit ${ret}
+tar czf "${output}" "${basename}"
