From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jul 2014 23:44:35 +0200
Subject: [Buildroot] [PATCH 4/6 v2] support/download: simplify the
	local-files helper
In-Reply-To: <cover.1404769268.git.yann.morin.1998@free.fr>
References: <cover.1404769268.git.yann.morin.1998@free.fr>
Message-ID: <8c9735a5326a84f418e0b4f24a4f918ff57bf2c8.1404769268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the local-files download helper behaves like all the other
download helpers, by first copying into the BUILD_DIR, then to
BR2_DL_DIR, and then rename the final file.

This does two copies, for the sake of using the LOCALFILES command.

Just get rid of the intermediate copy to BUILD_DIR. Instead, directly
copy to the final temp file and rename that.

This does a single copy, but we lose the file access mode, so we just
reinstate them (in case it's a self-extracting executable used in a
br2-external package, for example.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
One may argue that we could just do a symlink dest -> source. But
if source is on a network mount, it may vanish any time (eg. when
undocking your laptop for example ;-) ). So we really need to do a
copy.
---
 Config.in               |  4 ----
 Config.in.legacy        | 11 +++++++++++
 package/pkg-download.mk |  1 -
 support/download/cp     | 13 ++++++-------
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index 50968fb..9e81d77 100644
--- a/Config.in
+++ b/Config.in
@@ -71,10 +71,6 @@ config BR2_CVS
 	string "CVS command"
 	default "cvs"
 
-config BR2_LOCALFILES
-	string "Local files retrieval command"
-	default "cp"
-
 config BR2_SCP
 	string "Secure copy (scp) command"
 	default "scp"
diff --git a/Config.in.legacy b/Config.in.legacy
index a2c7846..aa49806 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,17 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.08"
 
+config BR2_LOCALFILES
+	string "Local files retrieval command has been removed"
+	help
+	  The option to specify how to copy local files has been removed.
+	  It is now handled by a helper script in support/download/cp.
+
+config BR2_LOCALFILES_WRAP
+	bool
+	default y if BR2_LOCALFILES != ""
+	select BR2_LEGACY
+
 config BR2_KERNEL_HEADERS_3_8
 	bool "kernel headers version 3.8.x are no longer supported"
 	select BR2_KERNEL_HEADERS_3_9
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7f208d5..fb52ae0 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -16,7 +16,6 @@ export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
 export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
-export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
diff --git a/support/download/cp b/support/download/cp
index e73159b..e1e7337 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -8,20 +8,19 @@ set -e
 #   $1: source file
 #   $2: output file
 # And this environment:
-#   LOCALFILES: the cp command to call
+#   (nothing special)
 
 source="${1}"
 output="${2}"
 
-tmp_dl="$( mktemp "${BUILD_DIR}/.XXXXXX" )"
 tmp_output="$( mktemp "${output}.XXXXXX" )"
 
 ret=1
-if ${LOCALFILES} "${source}" "${tmp_dl}"; then
-    if cat "${tmp_dl}" >"${tmp_output}"; then
-        mv "${tmp_output}" "${output}"
-        ret=0
-    fi
+if cat "${source}" >"${tmp_output}"; then
+    mode="$( stat -c '%a' "${source}" )"
+    chmod "${mode}" "${tmp_output}"
+    mv "${tmp_output}" "${output}"
+    ret=0
 fi
 
 # Cleanup
-- 
1.9.1
