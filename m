From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:12:24 +0200
Subject: [Buildroot] [git commit] support/download: convert bzr to use the
	wrapper
Message-ID: <20140804182554.98CCC9D367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c48d45e3424e8ad7a1f320a66a4bebc7c056e052
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This drastically simplifies the bzr helper, as it no longer has to
deal with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    6 +++++-
 support/download/bzr    |   42 ++++++++++++------------------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 118591c..0c9397a 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -112,7 +112,11 @@ endef
 
 define DOWNLOAD_BZR
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/bzr $($(PKG)_SITE) $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(EXTRA_ENV) support/download/wrapper bzr \
+		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$($(PKG)_SITE) \
+		$($(PKG)_DL_VERSION) \
+		$($(PKG)_BASE_NAME)
 endef
 
 define SOURCE_CHECK_BZR
diff --git a/support/download/bzr b/support/download/bzr
index 19d837d..b545cb1 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -1,38 +1,20 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for bzr
-# Call it with:
-#   $1: bzr repo
-#   $2: bzr revision
-#   $3: output file
+# Download helper for bzr, to be called from the download wrapper script
+# Expected arguments:
+#   $1: output file
+#   $2: bzr repo
+#   $3: bzr revision
+#   $4: basename
 # And this environment:
 #   BZR      : the bzr command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-repo="${1}"
-rev="${2}"
-output="${3}"
+output="${1}"
+repo="${2}"
+rev="${3}"
+basename="${4}"
 
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
+${BZR} export --root="${basename}/" --format=tgz "${output}" "${repo}" -r "${rev}"
