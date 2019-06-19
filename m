From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 19 Jun 2019 18:42:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/busybox: bump version to 1.31.0
In-Reply-To: <20190619164257.183607-1-titouan.christophe@railnova.eu>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
Message-ID: <20190619164257.183607-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0003-libbb-mark-scripted_main-as-externally-visible.patch
as it was committed upstream in 3193cb56d6

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 ...-scripted_main-as-externally-visible.patch | 53 -------------------
 package/busybox/busybox.hash                  |  4 +-
 package/busybox/busybox.mk                    |  2 +-
 3 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 package/busybox/0003-libbb-mark-scripted_main-as-externally-visible.patch

diff --git a/package/busybox/0003-libbb-mark-scripted_main-as-externally-visible.patch b/package/busybox/0003-libbb-mark-scripted_main-as-externally-visible.patch
deleted file mode 100644
index d3b174dd4a..0000000000
--- a/package/busybox/0003-libbb-mark-scripted_main-as-externally-visible.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From eb5830223d452944b96e526b2f44158bda5c5c56 Mon Sep 17 00:00:00 2001
-From: Ron Yorston <rmy@pobox.com>
-Date: Sat, 30 Mar 2019 07:47:12 +0000
-Subject: [PATCH] libbb: mark scripted_main() as externally visible
-
-Building with individual binaries enabled fails when embedded
-script applets are included:
-
-   /tmp/ccIvMFZg.o: In function `main':
-   applet.c:(.text.main+0x20): undefined reference to `scripted_main'
-
-Mark scripted_main() as externally visible.
-
-Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Signed-off-by: Ron Yorston <rmy@pobox.com>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Upstream status: reported, patch pending;
-    http://lists.busybox.net/pipermail/busybox/2019-March/087148.html
-    http://lists.busybox.net/pipermail/busybox/2019-March/087149.html
----
- include/libbb.h   | 2 +-
- libbb/appletlib.c | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/libbb.h b/include/libbb.h
-index e0d5521e4..a20d5e403 100644
---- a/include/libbb.h
-+++ b/include/libbb.h
-@@ -1347,7 +1347,7 @@ void bb_logenv_override(void) FAST_FUNC;
- 
- /* Embedded script support */
- char *get_script_content(unsigned n) FAST_FUNC;
--int scripted_main(int argc, char** argv);
-+int scripted_main(int argc, char** argv) MAIN_EXTERNALLY_VISIBLE;
- 
- /* Applets which are useful from another applets */
- int bb_cat(char** argv) FAST_FUNC;
-diff --git a/libbb/appletlib.c b/libbb/appletlib.c
-index c15014a34..fa19e8488 100644
---- a/libbb/appletlib.c
-+++ b/libbb/appletlib.c
-@@ -770,6 +770,7 @@ static int find_script_by_name(const char *name)
- 	return -1;
- }
- 
-+int scripted_main(int argc UNUSED_PARAM, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int scripted_main(int argc UNUSED_PARAM, char **argv)
- {
- 	int script = find_script_by_name(applet_name);
--- 
-2.14.1
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index c6804dc1fe..2b346e685d 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From https://busybox.net/downloads/busybox-1.30.1.tar.bz2.sha256
-sha256 3d1d04a4dbd34048f4794815a5c48ebb9eb53c5277e09ffffc060323b95dfbdc  busybox-1.30.1.tar.bz2
+# From https://busybox.net/downloads/busybox-1.31.0.tar.bz2.sha256
+sha256 0e4925392fd9f3743cc517e031b68b012b24a63b0cf6c1ff03cce7bb3846cc99  busybox-1.31.0.tar.bz2
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e606068a90..7a5a37a05d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.30.1
+BUSYBOX_VERSION = 1.31.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
-- 
2.21.0
