From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Jan 2020 22:23:36 +0100
Subject: [Buildroot] [PATCH] package/coreutils: drop useless patch
Message-ID: <20200106212336.7411-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until version 8.23, we needed to patch coreutils to ensure that options
be passed before non-options when calling help2man (during the build).
Our patch would just swap around two consecutive lines, and required
autoreconfguring and gettextising.

However, in coreutils 8.24, upstream applied a semantically equivalent
fix, but we did not notice, and we blindly fixed the patch by swapping
the previously faulty lines, even though the issue was no longer present
to begin with (if one would need an example of cargo cult, this is it).

Drop our patch, as it has not been needed for the past 4.5 years.

This means that we can also stop autoreconfiguring and gettextising.
Woot!

Rename the remaining patch.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-for-dummy-man-usage.patch        | 25 -------------------
 ... 0001-strtod_fix_clash_with_strtold.patch} |  0
 package/coreutils/coreutils.mk                |  4 ---
 3 files changed, 29 deletions(-)
 delete mode 100644 package/coreutils/0001-fix-for-dummy-man-usage.patch
 rename package/coreutils/{0002-strtod_fix_clash_with_strtold.patch => 0001-strtod_fix_clash_with_strtold.patch} (100%)

diff --git a/package/coreutils/0001-fix-for-dummy-man-usage.patch b/package/coreutils/0001-fix-for-dummy-man-usage.patch
deleted file mode 100644
index 4c5a088257..0000000000
--- a/package/coreutils/0001-fix-for-dummy-man-usage.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-coreutils: fix for dummy-man usage
-
-The options should be before the final argument, otherwise, the following error
-would appear when compiling.
-
-"dummy-man: too many non-option arguments"
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[Gustavo: update for 8.24]
-
-diff -Nura coreutils-8.24.orig/man/local.mk coreutils-8.24/man/local.mk
---- coreutils-8.24.orig/man/local.mk	2015-07-04 11:23:47.190503631 -0300
-+++ coreutils-8.24/man/local.mk	2015-07-04 11:24:25.046741090 -0300
-@@ -186,8 +186,8 @@
- 	  && $(run_help2man)						\
- 		     --source='$(PACKAGE_STRING)'			\
- 		     --include=$(srcdir)/man/$$name.x			\
--		     --output=$$t/$$name.1				\
- 		     --info-page='\(aq(coreutils) '$$name' invocation\(aq' \
-+		     --output=$$t/$$name.1				\
- 		     $$t/$$argv$(EXEEXT)				\
- 	  && sed \
- 	       -e 's|$*\.td/||g' \
diff --git a/package/coreutils/0002-strtod_fix_clash_with_strtold.patch b/package/coreutils/0001-strtod_fix_clash_with_strtold.patch
similarity index 100%
rename from package/coreutils/0002-strtod_fix_clash_with_strtold.patch
rename to package/coreutils/0001-strtod_fix_clash_with_strtold.patch
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index d312197e7e..e4628d1aac 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -10,10 +10,6 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
 
-# coreutils-01-fix-for-dummy-man-usage.patch triggers autoreconf on build
-COREUTILS_AUTORECONF = YES
-COREUTILS_GETTEXTIZE = YES
-
 COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 
-- 
2.20.1
