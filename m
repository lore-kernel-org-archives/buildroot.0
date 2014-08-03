From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Aug 2014 19:53:38 +0200
Subject: [Buildroot] [PATCH 5/9 v4] support/download: convert git to use the
	wrapper
In-Reply-To: <cover.1407088287.git.yann.morin.1998@free.fr>
References: <cover.1407088287.git.yann.morin.1998@free.fr>
Message-ID: <7f262255b49551ff2ce9caba7270689c15fafd1c.1407088287.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the git helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by running 'make fmc-fsl-sdk-source')

---
Changes v3 -> v4:
  - tweak the usage comment  (Thomas DS)
---
 package/pkg-download.mk |  7 ++++--
 support/download/git    | 62 ++++++++++++++++---------------------------------
 2 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 66ce02c..1649c83 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -95,8 +95,11 @@ endef
 # problems
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/git $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
-					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(EXTRA_ENV) support/download/wrapper git \
+		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$($(PKG)_SITE) \
+		$($(PKG)_DL_VERSION) \
+		$($(PKG)_BASE_NAME)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
diff --git a/support/download/git b/support/download/git
index 116e5a9..6edaa90 100755
--- a/support/download/git
+++ b/support/download/git
@@ -1,60 +1,38 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for git
-# Call it with:
-#   $1: git repo
-#   $2: git cset
-#   $3: package's basename (eg. foobar-1.2.3)
-#   $4: output file
+# Download helper for git, to be called from the download wrapper script
+# Expected arguments:
+#   $1: output file
+#   $2: git repo
+#   $3: git cset
+#   $4: package's basename (eg. foobar-1.2.3)
 # And this environment:
 #   GIT      : the git command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-repo="${1}"
-cset="${2}"
-basename="${3}"
-output="${4}"
+output="${1}"
+repo="${2}"
+cset="${3}"
+basename="${4}"
 
-repodir="${basename}.tmp-git-checkout"
-tmp_tar="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
-
-# Play tic-tac-toe with temp files
-# - first, we download to a trashable location (the build-dir)
-# - then we create the uncomporessed tarball in tht same trashable location
-# - then we create a temporary compressed tarball in the final location, so
-#   it is on the same filesystem as the final file
-# - finally, we atomically rename to the final file
-
-cd "${BUILD_DIR}"
-# Remove leftovers from a previous failed run
-rm -rf "${repodir}"
-
-git_done=0
+# Try to see if we can do a shallow clone, since it is faster
+# than a full clone.
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
-    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${repodir}"; then
+    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
         git_done=1
+    else
+        printf "Shallow clone failed, falling back to doing a full clone\n"
     fi
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
-    ${GIT} clone --bare "${repo}" "${repodir}"
+    ${GIT} clone --bare "${repo}" "${basename}"
 fi
 
-ret=1
-pushd "${repodir}" >/dev/null
-if ${GIT} archive --prefix="${basename}/" -o "${tmp_tar}" \
-                  --format=tar "${cset}"; then
-    if gzip -c "${tmp_tar}" >"${tmp_output}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
-fi
-popd >/dev/null
+GIT_DIR="${basename}" \
+${GIT} archive --prefix="${basename}/" -o "${output}" --format=tar "${cset}"
 
-rm -rf "${repodir}" "${tmp_tar}" "${tmp_output}"
-exit ${ret}
+gzip "${output}"
-- 
1.9.1
