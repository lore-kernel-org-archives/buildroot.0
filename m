From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 00:42:24 +0200
Subject: [Buildroot] [PATCH 6/9 v3] support/download: convert Hg to use the
	wrapper
In-Reply-To: <cover.1405895896.git.yann.morin.1998@free.fr>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
Message-ID: <83b2b869f2ced5344f0cd1483a216ff15bd66245.1405895896.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the hg helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |  7 +++++--
 support/download/hg     | 48 +++++++++++++-----------------------------------
 2 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 696ff3e..454179c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -180,8 +180,11 @@ endef
 
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
index 6e9e26b..510ef8b 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -1,46 +1,24 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
 # Download helper for hg
 # Call it with:
-#   $1: hg repo
-#   $2: hg cset
-#   $3: package's basename (eg. foobar-1.2.3)
-#   $4: output file
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
