From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 00:42:20 +0200
Subject: [Buildroot] [PATCH 2/9 v3] support/download: convert bzr to use the
	wrapper
In-Reply-To: <cover.1405895896.git.yann.morin.1998@free.fr>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
Message-ID: <ce8ca130016f8932d332539f40f909fad0fdad4c.1405895896.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the bzr helper, as it no longer has to
deal with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |  2 +-
 support/download/bzr    | 36 ++++++++----------------------------
 2 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 118591c..6320338 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -112,7 +112,7 @@ endef
 
 define DOWNLOAD_BZR
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/bzr $($(PKG)_SITE) $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(EXTRA_ENV) support/download/wrapper bzr $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) $($(PKG)_DL_VERSION)
 endef
 
 define SOURCE_CHECK_BZR
diff --git a/support/download/bzr b/support/download/bzr
index 19d837d..24bb1d0 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -1,38 +1,18 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
 # Download helper for bzr
 # Call it with:
-#   $1: bzr repo
-#   $2: bzr revision
-#   $3: output file
+#   $1: output file
+#   $2: bzr repo
+#   $3: bzr revision
 # And this environment:
 #   BZR      : the bzr command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-repo="${1}"
-rev="${2}"
-output="${3}"
+output="${1}"
+repo="${2}"
+rev="${3}"
 
-tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
-
-# Play tic-tac-toe with temp files
-# - first, we download to a trashable location (the build-dir)
-# - the we move to a temp file in the final location, so it is
-#   on the same filesystem as the final file
-# - finally, we atomically rename to the final file
-
-ret=1
-if ${BZR} export --format=tgz "${tmp_dl}" "${repo}" -r "${rev}"; then
-    if mv "${tmp_dl}" "${tmp_output}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
-fi
-
-# Cleanup
-rm -f "${tmp_dl}" "${tmp_output}"
-exit ${ret}
+${BZR} export --format=tgz "${output}" "${repo}" -r "${rev}"
-- 
1.9.1
