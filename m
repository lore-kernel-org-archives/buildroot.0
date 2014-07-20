From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 00:42:21 +0200
Subject: [Buildroot] [PATCH 3/9 v3] support/download: convert localfiles to
	use the wrapper
In-Reply-To: <cover.1405895896.git.yann.morin.1998@free.fr>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
Message-ID: <05b08895dc36985d013b09ce3e05f67c1bfd1396.1405895896.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the localfiles helper, as it no longer has
to deal with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |  4 ++--
 support/download/cp     | 20 +++++---------------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 6320338..94febab 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -205,8 +205,8 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call qstrip,$(1))) \
-					 $(DL_DIR)/$(2) && \
+	$(EXTRA_ENV) support/download/wrapper cp $(DL_DIR)/$(2) \
+						 $(call stripurischeme,$(call qstrip,$(1))) && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
diff --git a/support/download/cp b/support/download/cp
index 8f6bc06..4945c56 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -5,22 +5,12 @@ set -e
 
 # Download helper for cp
 # Call it with:
-#   $1: source file
-#   $2: output file
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
