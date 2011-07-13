From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 13 Jul 2011 08:50:46 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-ng: allow
	pre-downloading the sources
Message-ID: <20110713065843.44C748A2F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea23f34e25839a9559c3bb61cc5d9f54c89e137b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On "make source", just download the required sources, and do not
build the entire toolchain. This requires a new patch against
crosstool-NG (got from upstream).

The "uclibc-source" rule requires an installed and configured
crosstool-NG, so it has to be after the variables declaration.
For consistency, move down the main rule "uclibc".

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-break-on-existing-symlinks-and-build.log.patch |   76 ++++++++++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   17 +++--
 2 files changed, 88 insertions(+), 5 deletions(-)
 create mode 100644 toolchain/toolchain-crosstool-ng/002-dont-break-on-existing-symlinks-and-build.log.patch

diff --git a/toolchain/toolchain-crosstool-ng/002-dont-break-on-existing-symlinks-and-build.log.patch b/toolchain/toolchain-crosstool-ng/002-dont-break-on-existing-symlinks-and-build.log.patch
new file mode 100644
index 0000000..2bb613f
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/002-dont-break-on-existing-symlinks-and-build.log.patch
@@ -0,0 +1,76 @@
+
+# HG changeset patch
+# User "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+# Date 1310507544 -7200
+# Node ID 1ebc2248cc60230cd53ff94ae8f8f1e3261461a3
+# Parent  f1c730da41f3b22ca1a1e1b14592da4b7c078797
+scripts, cc/gcc: do not fail on existing symlinks or build.log
+
+If the user builds a toolchain over an existing one, so, without removing
+CT_PREFIX_DIR, the build fails as the symlinks already exist, as does the
+build.log.
+
+This can also happen (for build.log) if the user first ran in download-
+or extract-only.
+
+Patch (with no SoB) originally from:
+  Phil Wilshire <phil.wilshire@overturenetworks.com>
+
+Modified by me as it did not apply cleanly.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+
+diff -r f1c730da41f3 -r 1ebc2248cc60 scripts/build/cc/gcc.sh
+--- a/scripts/build/cc/gcc.sh	Tue Jul 12 23:21:27 2011 +0200
++++ b/scripts/build/cc/gcc.sh	Tue Jul 12 23:52:24 2011 +0200
+@@ -386,7 +386,7 @@
+     # check whether compiler has an extension
+     file="$( ls -1 "${core_prefix_dir}/bin/${CT_TARGET}-gcc."* 2>/dev/null || true )"
+     [ -z "${file}" ] || ext=".${file##*.}"
+-    CT_DoExecLog ALL ln -sv "${CT_TARGET}-gcc${ext}" "${core_prefix_dir}/bin/${CT_TARGET}-cc${ext}"
++    CT_DoExecLog ALL ln -sfv "${CT_TARGET}-gcc${ext}" "${core_prefix_dir}/bin/${CT_TARGET}-cc${ext}"
+ 
+     CT_EndStep
+ }
+@@ -630,7 +630,7 @@
+     # check whether compiler has an extension
+     file="$( ls -1 "${CT_PREFIX_DIR}/bin/${CT_TARGET}-gcc."* 2>/dev/null || true )"
+     [ -z "${file}" ] || ext=".${file##*.}"
+-    CT_DoExecLog ALL ln -sv "${CT_TARGET}-gcc${ext}" "${CT_PREFIX_DIR}/bin/${CT_TARGET}-cc${ext}"
++    CT_DoExecLog ALL ln -sfv "${CT_TARGET}-gcc${ext}" "${CT_PREFIX_DIR}/bin/${CT_TARGET}-cc${ext}"
+ 
+     CT_EndStep
+ }
+diff -r f1c730da41f3 -r 1ebc2248cc60 scripts/build/internals.sh
+--- a/scripts/build/internals.sh	Tue Jul 12 23:21:27 2011 +0200
++++ b/scripts/build/internals.sh	Tue Jul 12 23:52:24 2011 +0200
+@@ -86,14 +86,14 @@
+     for t in "${CT_TARGET}-"*; do
+         if [ -n "${CT_TARGET_ALIAS}" ]; then
+             _t=$(echo "$t" |sed -r -e 's/^'"${CT_TARGET}"'-/'"${CT_TARGET_ALIAS}"'-/;')
+-            CT_DoExecLog ALL ln -sv "${t}" "${_t}"
++            CT_DoExecLog ALL ln -sfv "${t}" "${_t}"
+         fi
+         if [ -n "${CT_TARGET_ALIAS_SED_EXPR}" ]; then
+             _t=$(echo "$t" |sed -r -e "${CT_TARGET_ALIAS_SED_EXPR}")
+             if [ "${_t}" = "${t}" ]; then
+                 CT_DoLog WARN "The sed expression '${CT_TARGET_ALIAS_SED_EXPR}' has no effect on '${t}'"
+             else
+-                CT_DoExecLog ALL ln -sv "${t}" "${_t}"
++                CT_DoExecLog ALL ln -sfv "${t}" "${_t}"
+             fi
+         fi
+     done
+diff -r f1c730da41f3 -r 1ebc2248cc60 scripts/crosstool-NG.sh.in
+--- a/scripts/crosstool-NG.sh.in	Tue Jul 12 23:21:27 2011 +0200
++++ b/scripts/crosstool-NG.sh.in	Tue Jul 12 23:52:24 2011 +0200
+@@ -604,7 +604,7 @@
+ # moment... Consign all ouptut to oblivion...
+ CT_DoLog INFO "Finishing installation (may take a few seconds)..."
+ exec >/dev/null 2>&1
+-
++rm -f ${CT_PREFIX_DIR}/build.log.bz2
+ if [ "${CT_LOG_TO_FILE}" = "y" ]; then
+     cp "${tmp_log_file}" "${CT_PREFIX_DIR}/build.log"
+     if [ "${CT_LOG_FILE_COMPRESS}" = y ]; then
+
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 2d1b51c..d3fcc65 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -6,11 +6,6 @@
 # except that it is not pre-built.
 
 #-----------------------------------------------------------------------------
-# 'uclibc' is the target to depend on to get the toolchain and prepare
-# the staging directory and co.
-uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
-
-#-----------------------------------------------------------------------------
 # Internal variables
 
 # Crostool-NG hard-coded configuration options
@@ -33,6 +28,18 @@ PATH=$(HOST_PATH) $(CTNG_DIR)/ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
 endef
 
 #-----------------------------------------------------------------------------
+# 'uclibc' is the target to depend on to get the toolchain and prepare
+# the staging directory and co.
+uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
+
+# 'uclibc-source' is the target used by the infra structure to mean
+# "we just want to download the toolchain's sources, not build it"
+# For crosstool-NG, we need it to be configured before we can download;
+# then we have to override a config option to just do the download
+uclibc-source: $(CTNG_DIR)/.config
+	$(Q)$(call ctng,build CT_ONLY_DOWNLOAD=y)
+
+#-----------------------------------------------------------------------------
 # Installing the libs to target/ and staging/
 
 #--------------
-- 
1.7.3.4
