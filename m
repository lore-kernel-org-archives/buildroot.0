From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 09:15:29 +0200
Subject: [Buildroot] [git commit] libgpgme: bump to version 1.11.1
Message-ID: <20180504071550.4236A8B6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36795821e467ce257825fb05f1886aedba6079da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-core-Tweak-STATUS_FAILURE-handling.patch  | 51 ----------------------
 package/libgpgme/libgpgme.hash                     |  8 ++--
 package/libgpgme/libgpgme.mk                       |  2 +-
 3 files changed, 5 insertions(+), 56 deletions(-)

diff --git a/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch b/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch
deleted file mode 100644
index ae0e9c5498..0000000000
--- a/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From b99502274ae5efdf6df0d967900ec3d1e64373d7 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Thu, 12 Apr 2018 20:36:30 +0200
-Subject: [PATCH] core: Tweak STATUS_FAILURE handling.
-
-* src/op-support.c (_gpgme_parse_failure): Ignore failures with
-location "gpg-exit".
-* tests/gpg/t-verify.c (main): Adjust for the now working checking of
-the second key.
-
-Signed-off-by: Werner Koch <wk@gnupg.org>
-[baruch: drop test]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit b99502274ae
-
- src/op-support.c     | 10 +++++++++-
- tests/gpg/t-verify.c |  8 +++++---
- 2 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/src/op-support.c b/src/op-support.c
-index 43cb1c760e0d..e55875f904d0 100644
---- a/src/op-support.c
-+++ b/src/op-support.c
-@@ -400,7 +400,13 @@ _gpgme_parse_plaintext (char *args, char **filenamep)
- 
- 
- /* Parse a FAILURE status line and return the error code.  ARGS is
--   modified to contain the location part.  */
-+ * modified to contain the location part.  Note that for now we ignore
-+ * failure codes with a location of gpg-exit; they are too trouble
-+ * some.  Instead we should eventually record that error in the
-+ * context and provide a function to return a fuller error
-+ * description; this could then also show the location of the error
-+ * (e.g. "option- parser") to make it easier for the user to detect
-+ * the actual error. */
- gpgme_error_t
- _gpgme_parse_failure (char *args)
- {
-@@ -418,6 +424,8 @@ _gpgme_parse_failure (char *args)
-     *where = '\0';
- 
-   where = args;
-+  if (!strcmp (where, "gpg-exit"))
-+    return 0;
- 
-   return atoi (which);
- }
--- 
-2.17.0
-
diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 6bd595c5ac..54c7bf7a09 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000418.html
-sha1 77d3390887da25ed70b7ac04392360efbdca501f  gpgme-1.10.0.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000423.html
+sha1 95b1fc427871ca8d30d6d3b1985c816fe0b5077b  gpgme-1.11.1.tar.bz2
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.10.0.tar.bz2.sig
-sha256 1a8fed1197c3b99c35f403066bb344a26224d292afc048cfdfc4ccd5690a0693  gpgme-1.10.0.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.11.1.tar.bz2.sig
+sha256 2d1b111774d2e3dd26dcd7c251819ce4ef774ec5e566251eb9308fa7542fbd6f  gpgme-1.11.1.tar.bz2
 # Locally calculated
 sha256 ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 5c46c7c561..03402cf382 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.10.0
+LIBGPGME_VERSION = 1.11.1
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
