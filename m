From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 00:42:22 +0200
Subject: [Buildroot] [PATCH 4/9 v3] support/download: convert cvs to use the
	wrapper
In-Reply-To: <cover.1405895896.git.yann.morin.1998@free.fr>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
Message-ID: <0e6a49a6da7926e3ef51f3e63cddcb2c9cff172d.1405895896.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This drastically simplifies the cvs helper, as it no longer has to deal
with atomically saving the downloaded archive.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk |  9 ++++++---
 support/download/cvs    | 50 ++++++++++++++-----------------------------------
 2 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 94febab..235adcb 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -125,9 +125,12 @@ endef
 
 define DOWNLOAD_CVS
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/cvs $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
-					  $($(PKG)_DL_VERSION) $($(PKG)_RAWNAME) \
-					  $($(PKG)_BASE_NAME) $(DL_DIR)/$($(PKG)_SOURCE)
+	$(EXTRA_ENV) support/download/wrapper cvs \
+		$(DL_DIR)/$($(PKG)_SOURCE) \
+		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
+		$($(PKG)_DL_VERSION) \
+		$($(PKG)_RAWNAME) \
+		$($(PKG)_BASE_NAME)
 endef
 
 # Not all CVS servers support ls/rls, use login to see if we can connect
diff --git a/support/download/cvs b/support/download/cvs
index 9aeed79..b4b0acc 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -1,47 +1,25 @@
 #!/bin/bash
 
-# We want to catch any command failure, and exit immediately
+# We want to catch any unexpected failure, and exit immediately
 set -e
 
 # Download helper for cvs
 # Call it with:
-#   $1: cvs repo
-#   $2: cvs revision
-#   $3: package's name (eg. foobar)
-#   $4: package's basename (eg. foobar-1.2.3)
-#   $5: output file
+#   $1: output file
+#   $2: cvs repo
+#   $3: cvs revision
+#   $4: package's name (eg. foobar)
+#   $5: package's basename (eg. foobar-1.2.3)
 # And this environment:
 #   CVS      : the cvs command to call
-#   BUILD_DIR: path to Buildroot's build dir
 
-repo="${1}"
-rev="${2}"
-rawname="${3}"
-basename="${4}"
-output="${5}"
+output="${1}"
+repo="${2}"
+rev="${3}"
+rawname="${4}"
+basename="${5}"
 
-repodir="${basename}.tmp-cvs-checkout"
-tmp_output="$( mktemp "${output}.XXXXXX" )"
+${CVS} -z3 -d":pserver:anonymous@${repo}" \
+       co -d "${basename}" -r ":${rev}" -P "${rawname}"
 
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
-if ${CVS} -z3 -d":pserver:anonymous@${repo}" \
-           co -d "${repodir}" -r ":${rev}" -P "${rawname}"; then
-    if tar czf "${tmp_output}" "${repodir}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
-fi
-
-# Cleanup
-rm -rf "${repodir}" "${tmp_output}"
-exit ${ret}
+tar czf "${output}" "${basename}"
-- 
1.9.1
