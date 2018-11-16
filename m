From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 20:27:31 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] busybox: bump version to
 1.29.3
Message-ID: <20181119074421.0B0A683A81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eaf77e729a57b176c1a25bb2855f4974b6ab9b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Remove 0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch
It caused a segfault which was fixed in this release.

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 77497f549784b4eba4706885f8c212ca43c3864f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...b-remove-unnecessary-variable-in-xmalloc_.patch | 39 ----------------------
 package/busybox/busybox.hash                       |  4 +--
 package/busybox/busybox.mk                         |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch b/package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch
deleted file mode 100644
index ba2d214c29..0000000000
--- a/package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0d598ab9f03dbf320f7b81c05e4a94cb303dfbc7 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Sun, 2 Sep 2018 18:35:29 +0200
-Subject: [PATCH] Revert "libbb: remove unnecessary variable in xmalloc_fgets"
-
-The variable is in fact necessary.
-
-    commit 2da9724b56169f00bd7fb6b9a11c9409a7620981
-    Author: Quentin Rameau <quinq@fifth.space>
-    Date:   Sun Apr 1 17:05:35 2018 +0200
-        libbb: remove unnecessary variable in xmalloc_fgets
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-[Thomas De Schampheleire: added to unbreak 'head -n -1',
-see http://lists.busybox.net/pipermail/busybox/2018-August/086617.html ]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
----
- libbb/get_line_from_file.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/libbb/get_line_from_file.c b/libbb/get_line_from_file.c
-index f3d6c6203..49ef093c2 100644
---- a/libbb/get_line_from_file.c
-+++ b/libbb/get_line_from_file.c
-@@ -47,7 +47,9 @@ char* FAST_FUNC bb_get_chunk_from_file(FILE *file, size_t *end)
- /* Get line, including trailing \n if any */
- char* FAST_FUNC xmalloc_fgets(FILE *file)
- {
--	return bb_get_chunk_from_file(file, NULL);
-+	int i;
-+
-+	return bb_get_chunk_from_file(file, &i);
- }
- /* Get line.  Remove trailing \n */
- char* FAST_FUNC xmalloc_fgetline(FILE *file)
--- 
-2.16.4
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index dc7c5613f8..b12bc21293 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From https://busybox.net/downloads/busybox-1.29.2.tar.bz2.sha256
-sha256 67d2fa6e147a45875fe972de62d907ef866fe784c495c363bf34756c444a5d61  busybox-1.29.2.tar.bz2
+# From https://busybox.net/downloads/busybox-1.29.3.tar.bz2.sha256
+sha256 97648636e579462296478e0218e65e4bc1e9cd69089a3b1aeb810bff7621efb7  busybox-1.29.3.tar.bz2
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ab0930a7fc..757086592f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.29.2
+BUSYBOX_VERSION = 1.29.3
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
