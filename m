From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:37:03 +0200
Subject: [Buildroot] [git commit] package/cups-filters: bump version to
 1.25.11
Message-ID: <20191020133507.C580F82DE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36bcb31d1444e4f556b2d10d509a0d0f217ccc08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/OpenPrinting/cups-filters/commit/1fa09312860cdee342a0afc9423c9d3c411bbbae

Drop CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE which is no longer needed now
that the ln-srf script is part of the tarball and not added through a
patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Build-system-add-missing-ln-srf-script.patch | 71 ----------------------
 package/cups-filters/cups-filters.hash             |  2 +-
 package/cups-filters/cups-filters.mk               | 11 +---
 3 files changed, 2 insertions(+), 82 deletions(-)

diff --git a/package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch b/package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch
deleted file mode 100644
index bdc431d8f3..0000000000
--- a/package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 6f6fb88077bce7f9dd9d21a286eeec700acff04e Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Mon, 16 Sep 2019 22:22:37 -0300
-Subject: [PATCH] Build system:: add missing ln-srf script
-
-It is missing in the 1.25.6 release tarball.
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- ln-srf | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 49 insertions(+)
- create mode 100755 ln-srf
-
-diff --git a/ln-srf b/ln-srf
-new file mode 100755
-index 00000000..f395a760
---- /dev/null
-+++ b/ln-srf
-@@ -0,0 +1,49 @@
-+#!/bin/sh
-+#
-+# Author: Carlos Santos <unixmania@gmail.com>
-+# This file is in public domain.
-+#
-+
-+error() {
-+	echo "$@" 1>&2
-+	exit 1
-+}
-+
-+src="$1"
-+dst="$2"
-+
-+check_path() {
-+	case "$2" in
-+		*/../*|*/./*|*/.|*/..) error "$1 path '$2' must be absolute";;
-+		*/) error "$1 path '$2' must not end with '/'";;
-+		/?*) ;;
-+		*) error "$1 path '$2' must start with '/'";;
-+	esac
-+}
-+
-+check_path "source" "$src"
-+check_path "destination" "$dst"
-+
-+# strip leading '/'
-+src=${src#/*}
-+tmp=${dst#/*}
-+
-+s_prefix=${src%%/*}
-+d_prefix=${tmp%%/*}
-+
-+# strip leading common
-+while [ "$s_prefix" = "$d_prefix" ]; do
-+	src="${src#$s_prefix/}"
-+	tmp="${tmp#$d_prefix/}"
-+	s_prefix=${src%%/*}
-+	d_prefix=${tmp%%/*}
-+done
-+
-+s_prefix="../"
-+while [ -n "$d_prefix" ] && [ "$tmp" != "$d_prefix" ]; do
-+	s_prefix="../$s_prefix"
-+	tmp="${tmp#$d_prefix/}"
-+	d_prefix=${tmp%%/*}
-+done
-+
-+ln -s -f "$s_prefix$src" "$dst"
--- 
-2.18.1
-
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index dace8845e0..205cf99da3 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 d936f1f07a8d79dcb188ba7fdf0800bbe25085c1af875169d45a9615a5ffb6cb  cups-filters-1.25.6.tar.gz
+sha256 397ba572d32b269ac70827f5c0f77878f857d5ab39de3fd0e801a00663037148  cups-filters-1.25.11.tar.gz
 sha256 527463af65312372111804589a9624f4c52813e253062ae351e75af5003f317f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 76fc1afb28..6a1adbed63 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.25.6
+CUPS_FILTERS_VERSION = 1.25.11
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
@@ -20,15 +20,6 @@ CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--with-pdftops=pdftops \
 	--with-jpeg
 
-# 0001-Build-system-add-missing-ln-srf-script.patch adds a ln-srf script
-# for older distributions, but GNU patch < 2.7 does not handle the git
-# patch permission extensions - So ensure it is executable
-define CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE
-	chmod +x $(@D)/ln-srf
-endef
-
-CUPS_FILTERS_POST_PATCH_HOOKS += CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE
-
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CUPS_FILTERS_CONF_OPTS += --with-png
 CUPS_FILTERS_DEPENDENCIES += libpng
