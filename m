From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 26 Jun 2018 11:09:41 +0200
Subject: [Buildroot] [PATCH] libostree: bump to version 2018.6
Message-ID: <20180626090941.4570-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, add upstream patch for not fail builds on 32bit architectures.
The patch will be removed when bumping to v2018.7.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...-repo-Fix-32-bit-format-string-error.patch | 34 +++++++++++++++++++
 package/libostree/libostree.hash              |  2 +-
 package/libostree/libostree.mk                |  2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch

diff --git a/package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch b/package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch
new file mode 100644
index 0000000000..8a2453df52
--- /dev/null
+++ b/package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch
@@ -0,0 +1,34 @@
+From 1174d9f5ba537562c67084caf0214544fbb14ffc Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Thu, 21 Jun 2018 14:17:28 +0000
+Subject: [PATCH] lib/repo: Fix 32 bit format string error
+
+---
+ src/libostree/ostree-repo-commit.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libostree/ostree-repo-commit.c b/src/libostree/ostree-repo-commit.c
+index 37be748b..7e1d707b 100644
+--- a/src/libostree/ostree-repo-commit.c
++++ b/src/libostree/ostree-repo-commit.c
+@@ -903,7 +903,7 @@ write_content_object (OstreeRepo         *self,
+             return glnx_throw (error, "min-free-space-percent '%u%%' would be exceeded, %s more required",
+                                self->min_free_space_percent, formatted_required);
+           else
+-            return glnx_throw (error, "min-free-space-size %luMB would be exceeded, %s more required",
++            return glnx_throw (error, "min-free-space-size %" G_GUINT64_FORMAT "MB would be exceeded, %s more required",
+                                self->min_free_space_mb, formatted_required);
+         }
+       /* This is the main bit that needs mutex protection */
+@@ -1617,7 +1617,7 @@ ostree_repo_prepare_transaction (OstreeRepo     *self,
+             return glnx_throw (error, "min-free-space-percent '%u%%' would be exceeded, %s available",
+                                self->min_free_space_percent, formatted_free);
+           else
+-            return glnx_throw (error, "min-free-space-size %luMB would be exceeded, %s available",
++            return glnx_throw (error, "min-free-space-size %" G_GUINT64_FORMAT "MB would be exceeded, %s available",
+                                self->min_free_space_mb, formatted_free);
+         }
+       g_mutex_unlock (&self->txn_lock);
+-- 
+2.18.0
+
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 9ee0c7bdb2..c694a90e22 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ad0f5a0e7a7f22f87c72b318b2cfdbe8cf908a1a469ec94eb72984bbb3690261  libostree-2018.5.tar.xz
+sha256 8dd49a1ab94924e351ff9cfd8ea2bf725770400900f4875ad2cc95712c6cc905  libostree-2018.6.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index ddb230517b..bf5118413b 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2018.5
+LIBOSTREE_VERSION = 2018.6
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.18.0
