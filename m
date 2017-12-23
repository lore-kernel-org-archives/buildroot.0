From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 23 Dec 2017 21:29:43 +0200
Subject: [Buildroot] [PATCH] json-c: bump to version 0.13
Message-ID: <78b00dd8559b57a0c687caf9aef6c28c243b7f89.1514057383.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use upstream provided tarball; drop autoreconf.

Drop -Werror removal patch; json-c builds fine with gcc 7 without this
patch.

Drop upstream libm patch.

Drop --disable-oldname-compat; removed upstream.

Add license file hash.

Enable parallel build. The commit introducing MAKE1, ecd0f65af92
(json-c: bump to version 0.11) does not explain the reason for that. A
sequence of a few builds on a multi-core system never faild.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-don-t-threat-warnings-as-errors.patch     | 21 ---------
 .../0002-Link-against-libm-when-needed.patch       | 53 ----------------------
 package/json-c/json-c.hash                         |  4 +-
 package/json-c/json-c.mk                           |  9 +---
 4 files changed, 5 insertions(+), 82 deletions(-)
 delete mode 100644 package/json-c/0001-don-t-threat-warnings-as-errors.patch
 delete mode 100644 package/json-c/0002-Link-against-libm-when-needed.patch

diff --git a/package/json-c/0001-don-t-threat-warnings-as-errors.patch b/package/json-c/0001-don-t-threat-warnings-as-errors.patch
deleted file mode 100644
index 804fb2cd33ec..000000000000
--- a/package/json-c/0001-don-t-threat-warnings-as-errors.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From 2b4a43a94fb988e344f2d7edc74d6a4a5f64571d Mon Sep 17 00:00:00 2001
-From: Sagaert Johan <sagaert.johan@proximus.be>
-Date: Wed, 15 Apr 2015 00:40:46 +0200
-Subject: [PATCH] don't threat warnings as errors
-
-Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
----
- Makefile.am.inc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am.inc b/Makefile.am.inc
-index fec591b..5eb461e 100644
---- a/Makefile.am.inc
-+++ b/Makefile.am.inc
-@@ -1,2 +1,2 @@
--AM_CFLAGS = -Wall -Werror -Wno-error=deprecated-declarations -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
-+AM_CFLAGS = -Wall -Wno-error=deprecated-declarations -Wextra -Wwrite-strings -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
- 
--- 
-2.1.0
-
diff --git a/package/json-c/0002-Link-against-libm-when-needed.patch b/package/json-c/0002-Link-against-libm-when-needed.patch
deleted file mode 100644
index 305b782f76c4..000000000000
--- a/package/json-c/0002-Link-against-libm-when-needed.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ccb15ee3d7e8c925cb3af9ea805feea2863c4f81 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 1 May 2015 12:52:18 +0200
-Subject: [PATCH] Link against libm when needed
-
-In certain C libraries (e.g uClibc), isnan() and related functions are
-implemented in libm, so json-c needs to link against it. This commit
-therefore adds an AC_TRY_LINK() test to check whether a program
-calling isnan() can be properly linked with no special flags. If not,
-we assume linking against libm is needed.
-
-The json-c.pc.in file is also adjusted so that in the case of static
-linking against json-c, -lm is also used.
-
-Submitted upstream: https://github.com/json-c/json-c/pull/182
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 4 ++++
- json-c.pc.in | 3 ++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 99660a4..2a14ccf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,6 +50,10 @@ AC_CHECK_DECLS([isinf], [], [], [[#include <math.h>]])
- AC_CHECK_DECLS([_isnan], [], [], [[#include <float.h>]])
- AC_CHECK_DECLS([_finite], [], [], [[#include <float.h>]])
- 
-+if test "$ac_cv_have_decl_isnan" = "yes" ; then
-+   AC_TRY_LINK([#include <math.h>], [float f = 0.0; return isnan(f)], [], [LIBS="$LIBS -lm"])
-+fi
-+
- #check if .section.gnu.warning accepts long strings (for __warn_references)
- AC_LANG_PUSH([C])
- 
-diff --git a/json-c.pc.in b/json-c.pc.in
-index 037739d..05bfbc8 100644
---- a/json-c.pc.in
-+++ b/json-c.pc.in
-@@ -6,6 +6,7 @@ includedir=@includedir@
- Name: json-c
- Description: JSON implementation in C
- Version: @VERSION@
--Requires: 
-+Requires:
-+Libs.private: @LIBS@
- Libs:  -L${libdir} -ljson-c
- Cflags: -I${includedir}/json-c
--- 
-2.1.0
-
diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 1868d75042ca..41e614d6dc32 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,2 +1,4 @@
+# From https://github.com/json-c/json-c/wiki
+sha256 0316780be9ad16c42d7c26b015a784fd5df4b0909fef0aba51cfb13e492ac24d  json-c-0.13.tar.gz
 # Locally calculated
-sha256 989e09b99ded277a0a651cd18b81fcb76885fea08769d7a21b6da39fb8a34816  json-c-json-c-0.12.1-20160607.tar.gz
+sha256 74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 86636d7433eb..d8007b869133 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,14 +4,9 @@
 #
 ################################################################################
 
-JSON_C_VERSION = json-c-0.12.1-20160607
-JSON_C_SITE = $(call github,json-c,json-c,$(JSON_C_VERSION))
+JSON_C_VERSION = 0.13
+JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
-JSON_C_MAKE = $(MAKE1)
-JSON_C_CONF_OPTS = --disable-oldname-compat
-# AUTORECONF is needed because of Makefile.am.inc patch.
-JSON_C_AUTORECONF = YES
-HOST_JSON_C_AUTORECONF = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
-- 
2.15.1
