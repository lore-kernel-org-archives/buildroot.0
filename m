From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Mar 2021 23:47:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to version
 3.7.1
Message-ID: <20210331214705.1492158-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2021-20231 and CVE-2021-20232:
  https://www.gnutls.org/security-new.html#GNUTLS-SA-2021-03-10
- Drop patch (not needed since:
  https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=b2d4b6c87827e34a694278d085a31508af052a37)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Fix-gnulib-stdio.h-include-on-uclibc.patch | 49 -------------------
 package/gnutls/gnutls.hash                    |  4 +-
 package/gnutls/gnutls.mk                      |  4 +-
 3 files changed, 4 insertions(+), 53 deletions(-)
 delete mode 100644 package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch

diff --git a/package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch b/package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch
deleted file mode 100644
index 758e7cca73..0000000000
--- a/package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 60fa934ffba3c230040328fdbbbf51f417f12871 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
-Date: Mon, 22 Jun 2020 14:11:05 +0200
-Subject: [PATCH] Fix gnulib stdio.h include on uclibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The __need_FILE define used by gnulib interferes with the uClibc stdio.h
-header, so move the inclusion the stdio.h to after __need_FILE has been
-undefined again.
-
-Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
----
- gl/fopen.c     | 2 +-
- src/gl/fopen.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gl/fopen.c b/gl/fopen.c
-index 8d6625a..248692c 100644
---- a/gl/fopen.c
-+++ b/gl/fopen.c
-@@ -23,8 +23,8 @@
- #include <config.h>
- 
- /* Get the original definition of fopen.  It might be defined as a macro.  */
--#include <stdio.h>
- #undef __need_FILE
-+#include <stdio.h>
- 
- static FILE *
- orig_fopen (const char *filename, const char *mode)
-diff --git a/src/gl/fopen.c b/src/gl/fopen.c
-index 47d7f19..1f22f4f 100644
---- a/src/gl/fopen.c
-+++ b/src/gl/fopen.c
-@@ -23,8 +23,8 @@
- #include <config.h>
- 
- /* Get the original definition of fopen.  It might be defined as a macro.  */
--#include <stdio.h>
- #undef __need_FILE
-+#include <stdio.h>
- 
- static FILE *
- orig_fopen (const char *filename, const char *mode)
--- 
-2.25.4
-
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index c360a56f93..0788a7a6f0 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.15.tar.xz.sig
-sha256  0ea8c3283de8d8335d7ae338ef27c53a916f15f382753b174c18b45ffd481558  gnutls-3.6.15.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.1.tar.xz.sig
+sha256  3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f  gnutls-3.7.1.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index cf2dedb590..14855bcebc 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).15
+GNUTLS_VERSION_MAJOR = 3.7
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).1
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.30.2
