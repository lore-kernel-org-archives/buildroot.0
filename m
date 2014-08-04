From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:12:25 +0200
Subject: [Buildroot] [git commit] support/download: convert wget to use the
	wrapper
Message-ID: <20140804182554.DE5AE9D3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a8470c9ee4dab3b872280656316c08a0d573d53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This drastically simplifies the wget helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by running 'make busybox-source')
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    4 +++-
 support/download/wget   |   35 ++++++++---------------------------
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c23dcfa..0761736 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -208,7 +208,9 @@ endef
 
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/wget '$(call qstrip,$(1))' $(DL_DIR)/$(2) && \
+	$(EXTRA_ENV) support/download/wrapper wget \
+		$(DL_DIR)/$(2) \
+		'$(call qstrip,$(1))' && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
diff --git a/support/download/wget b/support/download/wget
index cbeca3b..2cea100 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -1,35 +1,16 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for wget
-# Call it with:
-#   $1: URL
-#   $2: output file
+# Download helper for wget, to be called from the download wrapper script
+# Expected arguments:
+#   $1: output file
+#   $2: URL
 # And this environment:
 #   WGET     : the wget command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-url="${1}"
-output="${2}"
+output="${1}"
+url="${2}"
 
-tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
-
-# Play tic-tac-toe with temp files
-# - first, we download to a trashable location (the build-dir)
-# - then we copy to a temporary tarball in the final location, so it is
-#   on the same filesystem as the final file
-# - finally, we atomically rename to the final file
-
-ret=1
-if ${WGET} -O "${tmp_dl}" "${url}"; then
-    if mv "${tmp_dl}" "${tmp_output}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
-fi
-
-rm -f "${tmp_dl}" "${tmp_output}"
-exit ${ret}
+${WGET} -O "${output}" "${url}"
