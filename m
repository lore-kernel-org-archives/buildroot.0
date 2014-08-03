From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Aug 2014 19:53:36 +0200
Subject: [Buildroot] [PATCH 3/9 v4] support/download: convert localfiles to
	use the wrapper
In-Reply-To: <cover.1407088287.git.yann.morin.1998@free.fr>
References: <cover.1407088287.git.yann.morin.1998@free.fr>
Message-ID: <d2e34e4bfbd35d3bc4bf16c3ee82745680e3f7b9.1407088287.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the localfiles helper, as it no longer has
to deal with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by setting BUSYBOX_SITE = file:///tmp and running 'make busybox-source')

--
Changes v3 -> v4:
  - tweak the usage comment  (Thomas DS)
---
 package/pkg-download.mk |  5 +++--
 support/download/cp     | 26 ++++++++------------------
 2 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0c9397a..f10aad8 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -209,8 +209,9 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call qstrip,$(1))) \
-					 $(DL_DIR)/$(2) && \
+	$(EXTRA_ENV) support/download/wrapper cp \
+		$(DL_DIR)/$(2) \
+		$(call stripurischeme,$(call qstrip,$(1))) && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
diff --git a/support/download/cp b/support/download/cp
index 8f6bc06..264f5dc 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -1,26 +1,16 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for cp
-# Call it with:
-#   $1: source file
-#   $2: output file
+# Download helper for cp, to be called from the download wrapper script
+# Expected arguments:
+#   $1: output file
+#   $2: source file
 # And this environment:
 #   LOCALFILES: the cp command to call
 
-source="${1}"
-output="${2}"
+output="${1}"
+source="${2}"
 
-tmp_output="$( mktemp "${output}.XXXXXX" )"
-
-ret=1
-if ${LOCALFILES} "${source}" "${tmp_output}"; then
-    mv "${tmp_output}" "${output}"
-    ret=0
-fi
-
-# Cleanup
-rm -f "${tmp_output}"
-exit ${ret}
+${LOCALFILES} "${source}" "${output}"
-- 
1.9.1
