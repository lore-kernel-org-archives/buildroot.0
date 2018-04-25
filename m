From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 22:41:36 +0200
Subject: [Buildroot] [git commit] libgpgme: fix run-time compatibility with
 gnupg2 2.2.6
Message-ID: <20180425204805.B0AD988DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5be60127e559d80daf27eea2248f206f9ac6d69c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing gpgme_op_verify regression with gnupg2 2.2.6.

https://lists.gnupg.org/pipermail/gnupg-users/2018-April/060230.html

Cc: Philipp Claves <claves@budelmann-elektronik.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-core-Tweak-STATUS_FAILURE-handling.patch  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch b/package/libgpgme/0001-core-Tweak-STATUS_FAILURE-handling.patch
new file mode 100644
index 0000000000..ae0e9c5498
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
