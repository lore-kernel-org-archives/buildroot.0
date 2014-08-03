From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Aug 2014 19:53:41 +0200
Subject: [Buildroot] [PATCH 8/9 v4] support/download: convert svn to use the
	wrapper
In-Reply-To: <cover.1407088287.git.yann.morin.1998@free.fr>
References: <cover.1407088287.git.yann.morin.1998@free.fr>
Message-ID: <ca8b1785dfe5434a5bb8a459380c348f1b7c61fc.1407088287.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the svn helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by running 'make open2300-source')

---
Changes v3 -> v4:
  - tweak the usage comment  (Thomas DS)
---
 package/pkg-download.mk |  7 +++++--
 support/download/svn    | 48 +++++++++++++-----------------------------------
 2 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index d749b54..c23dcfa 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -151,8 +151,11 @@ endef
 
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/svn $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
-					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(EXTRA_ENV) support/download/wrapper svn \
+		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$($(PKG)_SITE) \
+		$($(PKG)_DL_VERSION) \
+		$($(PKG)_BASE_NAME)
 endef
 
 define SOURCE_CHECK_SVN
diff --git a/support/download/svn b/support/download/svn
index 39cbbcb..3a9512d 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -1,44 +1,22 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for svn
-# Call it with:
-#   $1: svn repo
-#   $2: svn revision
-#   $3: package's basename (eg. foobar-1.2.3)
-#   $4: output file
+# Download helper for svn, to be called from the download wrapper script
+# Expected arguments:
+#   $1: output file
+#   $2: svn repo
+#   $3: svn revision
+#   $4: package's basename (eg. foobar-1.2.3)
 # And this environment:
 #   SVN      : the svn command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-repo="${1}"
-rev="${2}"
-basename="${3}"
-output="${4}"
+output="${1}"
+repo="${2}"
+rev="${3}"
+basename="${4}"
 
-repodir="${basename}.tmp-svn-checkout"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
+${SVN} export "${repo}@${rev}" "${basename}"
 
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
-if ${SVN} export "${repo}@${rev}" "${repodir}"; then
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
-- 
1.9.1
