From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:12:25 +0200
Subject: [Buildroot] [git commit] support/download: convert scp to use the
	wrapper
Message-ID: <20140804182554.CA1029D367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b3880e174983caa8410a3678975bb7233f33d36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This drastically simplifies the scp helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Tested by setting a primary site to 'scp://localhost:/tmp' and
running 'make vim-source')
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    5 +++--
 support/download/scp    |   28 ++++++++--------------------
 2 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7878c66..d749b54 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -168,8 +168,9 @@ endef
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
index d3aad43..1676929 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -1,28 +1,16 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for scp
-# Call it with:
-#   $1: URL
-#   $2: output file
+# Download helper for scp, to be called from the download wrapper script
+# Expected arguments:
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
