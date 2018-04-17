From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Apr 2018 12:37:11 +0300
Subject: [Buildroot] [PATCH 1/3] libgpgme: fix run-time compatibility with
 gnupg2 2.2.6
Message-ID: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing gpgme_op_verify regression with gnupg2 2.2.6.

https://lists.gnupg.org/pipermail/gnupg-users/2018-April/060230.html

Cc: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-core-Tweak-STATUS_FAILURE-handling.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch

diff --git a/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch b/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch
new file mode 100644
index 000000000000..ae0e9c549872
--- /dev/null
+++ b/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch
@@ -0,0 +1,51 @@
+From b99502274ae5efdf6df0d967900ec3d1e64373d7 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Thu, 12 Apr 2018 20:36:30 +0200
+Subject: [PATCH] core: Tweak STATUS_FAILURE handling.
+
+* src/op-support.c (_gpgme_parse_failure): Ignore failures with
+location "gpg-exit".
+* tests/gpg/t-verify.c (main): Adjust for the now working checking of
+the second key.
+
+Signed-off-by: Werner Koch <wk@gnupg.org>
+[baruch: drop test]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit b99502274ae
+
+ src/op-support.c     | 10 +++++++++-
+ tests/gpg/t-verify.c |  8 +++++---
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/op-support.c b/src/op-support.c
+index 43cb1c760e0d..e55875f904d0 100644
+--- a/src/op-support.c
++++ b/src/op-support.c
+@@ -400,7 +400,13 @@ _gpgme_parse_plaintext (char *args, char **filenamep)
+ 
+ 
+ /* Parse a FAILURE status line and return the error code.  ARGS is
+-   modified to contain the location part.  */
++ * modified to contain the location part.  Note that for now we ignore
++ * failure codes with a location of gpg-exit; they are too trouble
++ * some.  Instead we should eventually record that error in the
++ * context and provide a function to return a fuller error
++ * description; this could then also show the location of the error
++ * (e.g. "option- parser") to make it easier for the user to detect
++ * the actual error. */
+ gpgme_error_t
+ _gpgme_parse_failure (char *args)
+ {
+@@ -418,6 +424,8 @@ _gpgme_parse_failure (char *args)
+     *where = '\0';
+ 
+   where = args;
++  if (!strcmp (where, "gpg-exit"))
++    return 0;
+ 
+   return atoi (which);
+ }
+-- 
+2.17.0
+
-- 
2.17.0
