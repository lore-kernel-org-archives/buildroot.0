From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:14:19 +0200
Subject: [Buildroot] [git commit] package/sngrep: bump to version 1.4.7
Message-ID: <20200618201238.3931B85F62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8418b2fa519287be8fcb0bec21bd3b121e64b35e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Remove upstream patch

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-capture-fix-typo-in-FILE-object.patch     | 43 ----------------------
 package/sngrep/sngrep.hash                         |  8 ++--
 package/sngrep/sngrep.mk                           |  2 +-
 3 files changed, 5 insertions(+), 48 deletions(-)

diff --git a/package/sngrep/0001-capture-fix-typo-in-FILE-object.patch b/package/sngrep/0001-capture-fix-typo-in-FILE-object.patch
deleted file mode 100644
index ec8a0f5dc5..0000000000
--- a/package/sngrep/0001-capture-fix-typo-in-FILE-object.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 604f6d0ce2ec42ac494d76c95e68850ea6e7da8f Mon Sep 17 00:00:00 2001
-From: Sebastian Kemper <sebastian_ml@gmx.net>
-Date: Sun, 4 Nov 2018 16:58:00 +0100
-Subject: [PATCH] capture: fix typo in FILE object
-
-FILE *fstdin is defined, but when calling freopen() stdin is used instead
-of fstdin.
-
-This causes the compile to fail:
-
-  CC       sngrep-capture.o
-capture.c: In function 'capture_offline':
-capture.c:194:21: error: assignment of read-only variable 'stdin'
-         if (!(stdin = freopen("/dev/tty", "r", stdin))) {
-                     ^
-make[5]: *** [Makefile:519: sngrep-capture.o] Error 1
-
-This commit fixes the typo.
-
-Signed-off-by: Sebastian Kemper <sebastian_ml@gmx.net>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 604f6d0ce2ec
-
- src/capture.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/capture.c b/src/capture.c
-index 911c35f43a35..a799413e2b0e 100644
---- a/src/capture.c
-+++ b/src/capture.c
-@@ -191,7 +191,7 @@ capture_offline(const char *infile, const char *outfile)
- 
-     // Reopen tty for ncurses after pcap have used stdin
-     if (!strncmp(infile, "/dev/stdin", 10)) {
--        if (!(stdin = freopen("/dev/tty", "r", stdin))) {
-+        if (!(fstdin = freopen("/dev/tty", "r", stdin))) {
-             fprintf(stderr, "Failed to reopen tty while using stdin for capture.");
-             return 1;
-         }
--- 
-2.19.2
-
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index a751d95394..33fa91ef5e 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,6 +1,6 @@
-# From https://github.com/irontec/sngrep/releases/download/v1.4.6/sngrep-1.4.6.tar.gz.md5sum
-md5 094e76786b118258bac69e1514aac826  sngrep-1.4.6.tar.gz
+# From https://github.com/irontec/sngrep/releases/download/v1.4.7/sngrep-1.4.7.tar.gz.md5sum
+md5  78fe753e24f36ddaf627bc2b734f45ba  sngrep-1.4.7.tar.gz
 
 # Locally computed
-sha256 638d6557dc68db401b07d73b2e7f8276800281f021fe0c942992566d6b59a48a sngrep-1.4.6.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE
+sha256  3c96aadd8b8c6b7adb5552d6fb4234f2000f15109b0f6c5feb632c81306cc49b  sngrep-1.4.7.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 1cb3814c9e..841a7bb991 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNGREP_VERSION = 1.4.6
+SNGREP_VERSION = 1.4.7
 SNGREP_SITE = $(call github,irontec,sngrep,v$(SNGREP_VERSION))
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
