From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 23:10:56 +0200
Subject: [Buildroot] [PATCH 3/5] download: move locking into download wrapper
In-Reply-To: <cover.1534972250.git.yann.morin.1998@free.fr>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
Message-ID: <8c2f0ed9cee73879c6bd388ee8bf077c875b0ab8.1534972250.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The script as a whole does not need to be atomic.

The only section that needs to be atomic is checking for, and
grabbing a download from the legacy, global directory, and
linking/copying it to the new location.

The rest of the script goes at great length to ensure that every
operations are concurrent-safe, by using temporary filenames and
directories, with only the last operation being atomic to put the
download in its final location.

As for the backends, all but the git backend are concurrent-safe,
as they work on aforementioned temporary files and directories.
As for the git backend, it internally locks whatever needs to be
atomic, so is concurrent-safe.

Note: the trick to execute only a portion of the shell script is
taken directly from the manpage for flock(1).

Even though using an exclusive lock is the default, we do request
it, to be extra sure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk     |  3 +--
 support/download/dl-wrapper | 16 +++++++++-------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bf93b9a08e..cd77ca5394 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -19,7 +19,6 @@ SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-FLOCK = flock $($(PKG)_DL_DIR)/
 
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
@@ -92,7 +91,7 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)
-	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
+	$(Q)$(EXTRA_ENV) $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-d '$($(PKG)_DL_DIR)' \
 		-D '$(DL_DIR)' \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 490335c859..723c89b7d5 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -57,13 +57,15 @@ main() {
     # download directory. If it does, hard-link it. If it turns out it
     # was an incorrect download, we'd still check it below anyway.
     # If we can neither link nor copy, fallback to doing a download.
-    # NOTE! This is not atomic, is subject to TOCTTOU, but the whole
-    # dl-wrapper runs under an flock, so we're safe.
-    if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
-        ln "${old_dl_dir}/${filename}" "${output}" || \
-        cp "${old_dl_dir}/${filename}" "${output}" || \
-        true
-    fi
+    (
+        flock --exclusive 42 || exit 1
+        if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
+            ln "${old_dl_dir}/${filename}" "${output}" || \
+            cp "${old_dl_dir}/${filename}" "${output}" || \
+            true
+        fi
+    # Yes, we can open a directory for reading!
+    ) 42<"${dl_dir}" || exit ${?}
 
     # If the output file already exists and:
     # - there's no .hash file: do not download it again and exit promptly
-- 
2.14.1
