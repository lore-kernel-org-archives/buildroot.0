From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:18:56 +0200
Subject: [Buildroot] [git commit] package/efl: bump to version 1.22.3
Message-ID: <20190923211803.E1A468F1FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3af5d06e5887cac83c61e4e3ae030374f435448d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch and rename the remaining patch.

This version is needed for enlightenment 0.23.0.

See:
https://www.enlightenment.org/news/efl-1.22.3

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...set-EINA_VALUE_EMPTY-during-library-init.patch} |  0
 ...-add-missing-__has_attribute-definitions-.patch | 48 ----------------------
 package/efl/efl.hash                               |  4 +-
 package/efl/efl.mk                                 |  2 +-
 4 files changed, 3 insertions(+), 51 deletions(-)

diff --git a/package/efl/0002-eina-set-EINA_VALUE_EMPTY-during-library-init.patch b/package/efl/0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
similarity index 100%
rename from package/efl/0002-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
rename to package/efl/0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
diff --git a/package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch b/package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch
deleted file mode 100644
index 3b70d15293..0000000000
--- a/package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c394fba4c4c820ea2b7200306ff033e4bbc12ead Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Mon, 22 Apr 2019 19:26:09 +0200
-Subject: [PATCH] libunibreak: add missing __has_attribute definitions for old
- compilers
-
-__has_attribute has been introduced with gcc 5 [1].
-
-[1] https://www.gnu.org/software/gcc/gcc-5/changes.html
-
-Fixes:
-http://autobuild.buildroot.net/results/64ab825048fac1654b0d0698740ddf857fcc0afa/build-end.log
-
-Upstream status:
-https://phab.enlightenment.org/T7818
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/static_libs/libunibreak/wordbreak.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/static_libs/libunibreak/wordbreak.c b/src/static_libs/libunibreak/wordbreak.c
-index 017e0fd091..50c830c7cc 100644
---- a/src/static_libs/libunibreak/wordbreak.c
-+++ b/src/static_libs/libunibreak/wordbreak.c
-@@ -209,6 +209,9 @@ static void set_wordbreaks(
-                 posLast = posCur;
-                 break;
-             }
-+#ifndef __has_attribute
-+# define __has_attribute(x) 0
-+#endif
- #if __has_attribute(fallthrough)
-            __attribute__((fallthrough));
- #endif
-@@ -325,6 +328,9 @@ static void set_wordbreaks(
-                 wbcSeqStart = wbcCur;
-                 posLast = posCur;
-             }
-+#ifndef __has_attribute
-+# define __has_attribute(x) 0
-+#endif
- #if __has_attribute(fallthrough)
-            __attribute__((fallthrough));
- #endif
--- 
-2.14.5
-
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index f9015681ee..c60495418c 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.2.tar.xz.sha256
-sha256 1699891f825911622de0aa77fe1140eff7335aba619d2352485e54dcff6b1cd0 efl-1.22.2.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.3.tar.xz.sha256
+sha256 7e7a4199b1e90d400dab2491db6032f8e0b26bab65ec19c9f8a97a82394331c8 efl-1.22.3.tar.xz
 
 sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
 sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 6f7c09ffa3..f1e69f8a23 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.22.2
+EFL_VERSION = 1.22.3
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
