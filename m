From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 00:42:25 +0200
Subject: [Buildroot] [PATCH 7/9 v3] support/download: convert scp to use the
	wrapper
In-Reply-To: <cover.1405895896.git.yann.morin.1998@free.fr>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
Message-ID: <526b9b79924e75121605fd3d446b119768d04362.1405895896.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the scp helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |  5 +++--
 support/download/scp    | 24 ++++++------------------
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 454179c..434eeaf 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -164,8 +164,9 @@ endef
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/scp '$(call stripurischeme,$(call qstrip,$(1)))' \
-					  $(DL_DIR)/$(2) && \
+	$(EXTRA_ENV) support/download/wrapper scp \
+		$(DL_DIR)/$(2) \
+		'$(call stripurischeme,$(call qstrip,$(1)))' && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
diff --git a/support/download/scp b/support/download/scp
index d3aad43..6ae545c 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -1,28 +1,16 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
 # Download helper for scp
 # Call it with:
-#   $1: URL
-#   $2: output file
+#   $1: output file
+#   $2: URL
 # And this environment:
 #   SCP       : the scp command to call
 
-url="${1}"
-output="${2}"
-tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
+output="${1}"
+url="${2}"
 
-ret=1
-if ${SCP} "${url}" "${tmp_dl}"; then
-    if mv "${tmp_dl}" "${tmp_output}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
-fi
-
-# Cleanup
-rm -f "${tmp_dl}" "${tmp_output}"
-exit ${ret}
+${SCP} "${url}" "${output}"
-- 
1.9.1
