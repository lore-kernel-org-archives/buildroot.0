From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun,  7 Aug 2011 22:37:57 +0200
Subject: [Buildroot] [PATCH 1/2] toochain/crosstool-NG: bump version
In-Reply-To: <1312749478-10361-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312749478-10361-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312749478-10361-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 .../crosstool-ng-000-makefile-recursion.patch      |   39 ++++++++++
 package/crosstool-ng/crosstool-ng-001-no-cvs.patch |   15 ----
 ...-break-on-existing-symlinks-and-build.log.patch |   76 --------------------
 .../crosstool-ng-003-autostuf-compat.patch         |   10 ---
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 6 files changed, 41 insertions(+), 103 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch b/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch
new file mode 100644
index 0000000..3fb05ad
--- /dev/null
+++ b/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch
@@ -0,0 +1,39 @@
+Makefile: allow recursion
+
+When crosstool-NG is used standalone, we completely avoid recursion,
+because the Makefile calls itself only once.
+
+But when used as the buildroot toolchain backend, there is already
+one level of make recursion when we first call the crosstool-NG
+Makefile. And when buildroot is used out-of-tree, we are already
+at the second level of recursion when calling the crosstool-NG
+Makefile.
+
+So, to cope with the situation, only bail out at the 2nd level of
+recursion, not the 0-th level.
+
+This probably won't go upstream.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+
+diff -du crosstool-ng-1.12.0/Makefile.in host-crosstool-ng-1.12.0/Makefile.in
+--- crosstool-ng-1.12.0/Makefile.in     2011-08-01 01:21:34.000000000 +0200
++++ host-crosstool-ng-1.12.0/Makefile.in        2011-08-07 21:39:16.055958219 +0200
+@@ -95,9 +95,14 @@
+ # level.
+ # This has the side effect of only showing the real targets, and hiding our
+ # internal ones. :-)
+-ifneq ($(MAKELEVEL),0)
+-$(error Recursion detected, bailing out...)
+-endif
++#
++# NB: For buildroot, this has no importance:
++# - crosstool-NG should never ever be called manually
++# - thus auto-completion would never ever be attempted
++# - so we shouldn't have to detect it
++#ifneq ($(MAKELEVEL),0)
++#$(error Recursion detected, bailing out...)
++#endif
+ 
+ MAKEFLAGS += $(CT_MAKEFLAGS)
+ build install clean distclean uninstall:
diff --git a/package/crosstool-ng/crosstool-ng-001-no-cvs.patch b/package/crosstool-ng/crosstool-ng-001-no-cvs.patch
deleted file mode 100644
index c82d359..0000000
--- a/package/crosstool-ng/crosstool-ng-001-no-cvs.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Remove dependency on cvs.
-
-cvs is used to retrieve newlib, which is not supported
-under Buildroot, so cvs is not required.
-
---- crosstool-ng-1.8.0/configure.orig	2010-11-27 15:43:52.000000000 +0000
-+++ crosstool-ng-1.8.0/configure	2010-11-27 15:44:10.000000000 +0000
-@@ -359,7 +359,6 @@
-              err="'libtool' 1.5.26 or above was not found"
- has_or_abort prog=stat
- has_or_abort prog="curl wget"
--has_or_abort prog=cvs
- has_or_abort prog=patch
- has_or_abort prog=tar
- has_or_abort prog=gzip
diff --git a/package/crosstool-ng/crosstool-ng-002-dont-break-on-existing-symlinks-and-build.log.patch b/package/crosstool-ng/crosstool-ng-002-dont-break-on-existing-symlinks-and-build.log.patch
deleted file mode 100644
index 2bb613f..0000000
--- a/package/crosstool-ng/crosstool-ng-002-dont-break-on-existing-symlinks-and-build.log.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-
-# HG changeset patch
-# User "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-# Date 1310507544 -7200
-# Node ID 1ebc2248cc60230cd53ff94ae8f8f1e3261461a3
-# Parent  f1c730da41f3b22ca1a1e1b14592da4b7c078797
-scripts, cc/gcc: do not fail on existing symlinks or build.log
-
-If the user builds a toolchain over an existing one, so, without removing
-CT_PREFIX_DIR, the build fails as the symlinks already exist, as does the
-build.log.
-
-This can also happen (for build.log) if the user first ran in download-
-or extract-only.
-
-Patch (with no SoB) originally from:
-  Phil Wilshire <phil.wilshire@overturenetworks.com>
-
-Modified by me as it did not apply cleanly.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
-
-diff -r f1c730da41f3 -r 1ebc2248cc60 scripts/build/cc/gcc.sh
---- a/scripts/build/cc/gcc.sh	Tue Jul 12 23:21:27 2011 +0200
-+++ b/scripts/build/cc/gcc.sh	Tue Jul 12 23:52:24 2011 +0200
-@@ -386,7 +386,7 @@
-     # check whether compiler has an extension
-     file="$( ls -1 "${core_prefix_dir}/bin/${CT_TARGET}-gcc."* 2>/dev/null || true )"
-     [ -z "${file}" ] || ext=".${file##*.}"
--    CT_DoExecLog ALL ln -sv "${CT_TARGET}-gcc${ext}" "${core_prefix_dir}/bin/${CT_TARGET}-cc${ext}"
-+    CT_DoExecLog ALL ln -sfv "${CT_TARGET}-gcc${ext}" "${core_prefix_dir}/bin/${CT_TARGET}-cc${ext}"
- 
-     CT_EndStep
- }
-@@ -630,7 +630,7 @@
-     # check whether compiler has an extension
-     file="$( ls -1 "${CT_PREFIX_DIR}/bin/${CT_TARGET}-gcc."* 2>/dev/null || true )"
-     [ -z "${file}" ] || ext=".${file##*.}"
--    CT_DoExecLog ALL ln -sv "${CT_TARGET}-gcc${ext}" "${CT_PREFIX_DIR}/bin/${CT_TARGET}-cc${ext}"
-+    CT_DoExecLog ALL ln -sfv "${CT_TARGET}-gcc${ext}" "${CT_PREFIX_DIR}/bin/${CT_TARGET}-cc${ext}"
- 
-     CT_EndStep
- }
-diff -r f1c730da41f3 -r 1ebc2248cc60 scripts/build/internals.sh
---- a/scripts/build/internals.sh	Tue Jul 12 23:21:27 2011 +0200
-+++ b/scripts/build/internals.sh	Tue Jul 12 23:52:24 2011 +0200
-@@ -86,14 +86,14 @@
-     for t in "${CT_TARGET}-"*; do
-         if [ -n "${CT_TARGET_ALIAS}" ]; then
-             _t=$(echo "$t" |sed -r -e 's/^'"${CT_TARGET}"'-/'"${CT_TARGET_ALIAS}"'-/;')
--            CT_DoExecLog ALL ln -sv "${t}" "${_t}"
-+            CT_DoExecLog ALL ln -sfv "${t}" "${_t}"
-         fi
-         if [ -n "${CT_TARGET_ALIAS_SED_EXPR}" ]; then
-             _t=$(echo "$t" |sed -r -e "${CT_TARGET_ALIAS_SED_EXPR}")
-             if [ "${_t}" = "${t}" ]; then
-                 CT_DoLog WARN "The sed expression '${CT_TARGET_ALIAS_SED_EXPR}' has no effect on '${t}'"
-             else
--                CT_DoExecLog ALL ln -sv "${t}" "${_t}"
-+                CT_DoExecLog ALL ln -sfv "${t}" "${_t}"
-             fi
-         fi
-     done
-diff -r f1c730da41f3 -r 1ebc2248cc60 scripts/crosstool-NG.sh.in
---- a/scripts/crosstool-NG.sh.in	Tue Jul 12 23:21:27 2011 +0200
-+++ b/scripts/crosstool-NG.sh.in	Tue Jul 12 23:52:24 2011 +0200
-@@ -604,7 +604,7 @@
- # moment... Consign all ouptut to oblivion...
- CT_DoLog INFO "Finishing installation (may take a few seconds)..."
- exec >/dev/null 2>&1
--
-+rm -f ${CT_PREFIX_DIR}/build.log.bz2
- if [ "${CT_LOG_TO_FILE}" = "y" ]; then
-     cp "${tmp_log_file}" "${CT_PREFIX_DIR}/build.log"
-     if [ "${CT_LOG_FILE_COMPRESS}" = y ]; then
-
diff --git a/package/crosstool-ng/crosstool-ng-003-autostuf-compat.patch b/package/crosstool-ng/crosstool-ng-003-autostuf-compat.patch
deleted file mode 100644
index d79e62b..0000000
--- a/package/crosstool-ng/crosstool-ng-003-autostuf-compat.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- crosstool-ng-1.11.3/configure	2011-05-21 01:10:10.000000000 +0200
-+++ host-crosstool-ng-1.11.3/configure	2011-07-14 17:35:25.830403914 +0200
-@@ -260,6 +260,7 @@
-         # Skip, auto-stuff compatibility
-         --build=*|--host=*|--infodir=*|--datadir=*|--sysconfdir=*|--localstatedir=*) shift;;
-         --build|--host|--infodir|--datadir|--sysconfdir|--localstatedir)             shift 2;;
-+        --enable-shared|--disable-shared|--enable-static|--disable-static)           shift;;
-         *)          printf "Unrecognised option: '${1}'\n"; do_help; exit 1;;
-     esac
- done
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index b40cf35..2bbf631 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.11.3
+CROSSTOOL_NG_VERSION           = 1.12.0
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 912bb06..3a205dd 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -203,7 +203,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="unknown":;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(GNU_TARGET_NAME)":;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG $(CTNG_VERSION) - buildroot $(BR2_VERSION_FULL)":;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;
 ifneq ($(call qstrip,$(BR2_USE_MMU)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
 else
-- 
1.7.2.5
