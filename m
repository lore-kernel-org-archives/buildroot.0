From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Aug 2014 19:53:39 +0200
Subject: [Buildroot] [PATCH 6/9 v4] support/download: convert Hg to use the
	wrapper
In-Reply-To: <cover.1407088287.git.yann.morin.1998@free.fr>
References: <cover.1407088287.git.yann.morin.1998@free.fr>
Message-ID: <0ff18dfb028d5181c9b2db1a48b5e8ee916f9656.1407088287.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the hg helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by running 'make vim-source')

---
Changes v3 -> v4:
  - tweak the usage comment  (Thomas DS)
---
 package/pkg-download.mk |  7 +++++--
 support/download/hg     | 52 ++++++++++++++-----------------------------------
 2 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1649c83..7878c66 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -184,8 +184,11 @@ endef
 
 define DOWNLOAD_HG
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/hg $($(PKG)_SITE) $($(PKG)_DL_VERSION) \
-					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(EXTRA_ENV) support/download/wrapper hg \
+		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$($(PKG)_SITE) \
+		$($(PKG)_DL_VERSION) \
+		$($(PKG)_BASE_NAME)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
diff --git a/support/download/hg b/support/download/hg
index 6e9e26b..747dd34 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -1,46 +1,24 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for hg
-# Call it with:
-#   $1: hg repo
-#   $2: hg cset
-#   $3: package's basename (eg. foobar-1.2.3)
-#   $4: output file
+# Download helper for hg, to be called from the download wrapper script
+# Expected arguments:
+#   $1: output file
+#   $2: hg repo
+#   $3: hg cset
+#   $4: package's basename (eg. foobar-1.2.3)
 # And this environment:
 #   HG       : the hg command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-repo="${1}"
-cset="${2}"
-basename="${3}"
-output="${4}"
+output="${1}"
+repo="${2}"
+cset="${3}"
+basename="${4}"
 
-repodir="${basename}.tmp-hg-checkout"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
+${HG} clone --noupdate --rev "${cset}" "${repo}" "${basename}"
 
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
-if ${HG} clone --noupdate --rev "${cset}" "${repo}" "${repodir}"; then
-    if ${HG} archive --repository "${repodir}" --type tgz \
-                     --prefix "${basename}" --rev "${cset}" \
-                     "${tmp_output}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
-fi
-
-# Cleanup
-rm -rf "${repodir}" "${tmp_output}"
-exit ${ret}
+${HG} archive --repository "${basename}" --type tgz \
+              --prefix "${basename}" --rev "${cset}" \
+              "${output}"
-- 
1.9.1
