From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2019 08:05:03 +0200
Subject: [Buildroot] [git commit] package/cups-filters: fix ln -r workaround
 for older distributions
Message-ID: <20191005060124.6946F88473@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bef2a36d1f2f49bb50de33affea5a18b0b0b68d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to create the ln-srf script that was not included in the 1.25.6
release tarball.  Also add a post-patch hook to ensure that the script is
executable, since GNU patch < 2.7 does not handle the git patch permission
extensions.

Fixes:
  http://autobuild.buildroot.net/results/c78e7d6d703b1b48ba19d8c4fae32b4e4489cb43/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Build-system-add-missing-ln-srf-script.patch | 71 ++++++++++++++++++++++
 package/cups-filters/cups-filters.mk               |  9 +++
 2 files changed, 80 insertions(+)

diff --git a/package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch b/package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch
new file mode 100644
index 0000000000..bdc431d8f3
--- /dev/null
+++ b/package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch
@@ -0,0 +1,71 @@
+From 6f6fb88077bce7f9dd9d21a286eeec700acff04e Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Mon, 16 Sep 2019 22:22:37 -0300
+Subject: [PATCH] Build system:: add missing ln-srf script
+
+It is missing in the 1.25.6 release tarball.
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ ln-srf | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 49 insertions(+)
+ create mode 100755 ln-srf
+
+diff --git a/ln-srf b/ln-srf
+new file mode 100755
+index 00000000..f395a760
+--- /dev/null
++++ b/ln-srf
+@@ -0,0 +1,49 @@
++#!/bin/sh
++#
++# Author: Carlos Santos <unixmania@gmail.com>
++# This file is in public domain.
++#
++
++error() {
++	echo "$@" 1>&2
++	exit 1
++}
++
++src="$1"
++dst="$2"
++
++check_path() {
++	case "$2" in
++		*/../*|*/./*|*/.|*/..) error "$1 path '$2' must be absolute";;
++		*/) error "$1 path '$2' must not end with '/'";;
++		/?*) ;;
++		*) error "$1 path '$2' must start with '/'";;
++	esac
++}
++
++check_path "source" "$src"
++check_path "destination" "$dst"
++
++# strip leading '/'
++src=${src#/*}
++tmp=${dst#/*}
++
++s_prefix=${src%%/*}
++d_prefix=${tmp%%/*}
++
++# strip leading common
++while [ "$s_prefix" = "$d_prefix" ]; do
++	src="${src#$s_prefix/}"
++	tmp="${tmp#$d_prefix/}"
++	s_prefix=${src%%/*}
++	d_prefix=${tmp%%/*}
++done
++
++s_prefix="../"
++while [ -n "$d_prefix" ] && [ "$tmp" != "$d_prefix" ]; do
++	s_prefix="../$s_prefix"
++	tmp="${tmp#$d_prefix/}"
++	d_prefix=${tmp%%/*}
++done
++
++ln -s -f "$s_prefix$src" "$dst"
+-- 
+2.18.1
+
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index ffd55fa95d..76fc1afb28 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -20,6 +20,15 @@ CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--with-pdftops=pdftops \
 	--with-jpeg
 
+# 0001-Build-system-add-missing-ln-srf-script.patch adds a ln-srf script
+# for older distributions, but GNU patch < 2.7 does not handle the git
+# patch permission extensions - So ensure it is executable
+define CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE
+	chmod +x $(@D)/ln-srf
+endef
+
+CUPS_FILTERS_POST_PATCH_HOOKS += CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CUPS_FILTERS_CONF_OPTS += --with-png
 CUPS_FILTERS_DEPENDENCIES += libpng
