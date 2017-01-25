From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 25 Jan 2017 11:59:02 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to v0.1.1
Message-ID: <1485341942-31893-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bug-fix release that addresses the musl libc compatibility
issues encountered with buildroot.

We can also remove the patch which got merged upstream.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 ...de-gpiod.h-include-missing-time.h-include.patch | 36 ----------------------
 package/libgpiod/libgpiod.hash                     |  2 +-
 package/libgpiod/libgpiod.mk                       |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/libgpiod/0001-include-gpiod.h-include-missing-time.h-include.patch

diff --git a/package/libgpiod/0001-include-gpiod.h-include-missing-time.h-include.patch b/package/libgpiod/0001-include-gpiod.h-include-missing-time.h-include.patch
deleted file mode 100644
index f3744fd..0000000
--- a/package/libgpiod/0001-include-gpiod.h-include-missing-time.h-include.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 93fd4a02233d29f78b261d99d9ce6b14869b19c7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 23 Jan 2017 21:17:15 +1300
-Subject: [PATCH] include/gpiod.h: include missing <time.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gpiod.h uses "struct timespec", but forgets to include the <time.h>
-header which defines "struct timespec". This causes a build error with
-the musl C library:
-
-In file included from core.c:11:0:
-../../include/gpiod.h:232:49: warning: ?struct timespec? declared inside parameter list
- typedef int (*gpiod_event_cb)(int, const struct timespec *, void *);
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/gpiod.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/gpiod.h b/include/gpiod.h
-index 8c5858e..c1f252d 100644
---- a/include/gpiod.h
-+++ b/include/gpiod.h
-@@ -22,6 +22,7 @@
- 
- #include <stdlib.h>
- #include <stdbool.h>
-+#include <time.h>
- 
- #ifdef __cplusplus
- extern "C" {
--- 
-2.7.4
-
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 7de17bb..7ba0531 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0f9f5215d0100a8066f4e6b064892747720e556cbb83f6c05d6151d68ec2025b libgpiod-v0.1.tar.gz
+sha256 07f75ae1e0c086d28d77ef60d0566180698ce11c3271d89da444c0fc6c2f4580 libgpiod-v0.1.1.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index b9bd311..e2e27f9 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = v0.1
+LIBGPIOD_VERSION = v0.1.1
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
 LIBGPIOD_LICENSE = GPLv3+
 LIBGPIOD_LICENSE_FILES = COPYING
-- 
2.9.3
