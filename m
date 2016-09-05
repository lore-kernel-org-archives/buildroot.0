From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:10:45 +0200
Subject: [Buildroot] [git commit] micropython: replace local fix with
	upstream one
Message-ID: <20160905201048.77CC481D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a0a45f038706c74769640d05302fe1da3af4411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fix from commit 26248571b625 ("micropython: fix build failures") was
applied upstream. This replaces the local buildroot fix with the patch
that was accepted upstream.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ....c-provide-mp_raw_code_load_file-for-any-.patch | 27 ----------------------
 package/micropython/micropython.hash               |  1 +
 package/micropython/micropython.mk                 |  1 +
 3 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch b/package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch
deleted file mode 100644
index 8465ce9..0000000
--- a/package/micropython/0002-py-emitglue.c-provide-mp_raw_code_load_file-for-any-.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4177e71862a2817d2555abd8d0bc9a8a361dad8a Mon Sep 17 00:00:00 2001
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-Date: Sat, 3 Sep 2016 20:44:12 +1200
-Subject: [PATCH] py/emitglue.c: provide mp_raw_code_load_file for any unix
- architecture
-
-Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
----
- py/emitglue.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/py/emitglue.c b/py/emitglue.c
-index 1b9992b..2e79d5f 100644
---- a/py/emitglue.c
-+++ b/py/emitglue.c
-@@ -381,7 +381,7 @@ mp_raw_code_t *mp_raw_code_load_mem(const byte *buf, size_t len) {
- // here we define mp_raw_code_load_file depending on the port
- // TODO abstract this away properly
- 
--#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || (defined(__arm__) && (defined(__unix__)))
-+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || defined(__unix__)
- // unix file reader
- 
- #include <sys/stat.h>
--- 
-2.9.2.518.ged577c6.dirty
-
diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index ea42bfb..a8ad2ba 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,3 @@
 #locally computed
 sha256 871378fcf1f1042c399896d5673da67d12e1fb36c2e706af289fc959bc8f7a57  micropython-v1.8.3.tar.gz
+sha256 ff3194ebecda99023d7c1bb94d32b31b9491e95a79958a25ffd05213c5553acc  8c6856d2e76c5865d9f30cad2c51615d4a1a1418.patch
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 047e340..590956e 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -9,6 +9,7 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
+MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8c6856d2e76c5865d9f30cad2c51615d4a1a1418.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
