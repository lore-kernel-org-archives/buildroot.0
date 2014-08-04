From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:12:24 +0200
Subject: [Buildroot] [git commit] support/download: convert localfiles to
	use the wrapper
Message-ID: <20140804182554.A4E489D367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84469226c1d4e6b7bf7052ef9039b26991041311
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This drastically simplifies the localfiles helper, as it no longer has
to deal with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by setting BUSYBOX_SITE = file:///tmp and running 'make busybox-source')
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    5 +++--
 support/download/cp     |   26 ++++++++------------------
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
