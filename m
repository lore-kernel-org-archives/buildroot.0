From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Jul 2018 22:40:23 +0200
Subject: [Buildroot] [git commit] libostree: bump to version 2018.7
Message-ID: <20180721204713.87D2D8912E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf6dbebea78108c9cc71ff9b470ce8ac63ccd1ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-lib-repo-Fix-32-bit-format-string-error.patch | 35 -----------------
 ...stree-soup-to-build-process-when-configur.patch | 45 ----------------------
 package/libostree/libostree.hash                   |  2 +-
 package/libostree/libostree.mk                     |  4 +-
 4 files changed, 2 insertions(+), 84 deletions(-)

diff --git a/package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch b/package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch
deleted file mode 100644
index d74afcd412..0000000000
--- a/package/libostree/0001-lib-repo-Fix-32-bit-format-string-error.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1174d9f5ba537562c67084caf0214544fbb14ffc Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Thu, 21 Jun 2018 14:17:28 +0000
-Subject: [PATCH] lib/repo: Fix 32 bit format string error
-
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
----
- src/libostree/ostree-repo-commit.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libostree/ostree-repo-commit.c b/src/libostree/ostree-repo-commit.c
-index 37be748b..7e1d707b 100644
---- a/src/libostree/ostree-repo-commit.c
-+++ b/src/libostree/ostree-repo-commit.c
-@@ -903,7 +903,7 @@ write_content_object (OstreeRepo         *self,
-             return glnx_throw (error, "min-free-space-percent '%u%%' would be exceeded, %s more required",
-                                self->min_free_space_percent, formatted_required);
-           else
--            return glnx_throw (error, "min-free-space-size %luMB would be exceeded, %s more required",
-+            return glnx_throw (error, "min-free-space-size %" G_GUINT64_FORMAT "MB would be exceeded, %s more required",
-                                self->min_free_space_mb, formatted_required);
-         }
-       /* This is the main bit that needs mutex protection */
-@@ -1617,7 +1617,7 @@ ostree_repo_prepare_transaction (OstreeRepo     *self,
-             return glnx_throw (error, "min-free-space-percent '%u%%' would be exceeded, %s available",
-                                self->min_free_space_percent, formatted_free);
-           else
--            return glnx_throw (error, "min-free-space-size %luMB would be exceeded, %s available",
-+            return glnx_throw (error, "min-free-space-size %" G_GUINT64_FORMAT "MB would be exceeded, %s available",
-                                self->min_free_space_mb, formatted_free);
-         }
-       g_mutex_unlock (&self->txn_lock);
--- 
-2.18.0
-
diff --git a/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch b/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch
deleted file mode 100644
index b89bd743a1..0000000000
--- a/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1cd86d4978ad32405b41f864e11ac21a2474c2f3 Mon Sep 17 00:00:00 2001
-From: Marcus Folkesson <marcus.folkesson@gmail.com>
-Date: Tue, 3 Jul 2018 10:02:46 +0200
-Subject: [PATCH] build: add ostree-soup-* to build process when configured
- with avahi
-
-Avoid getting these link errors:
-    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_path'
-    ./.libs/libostree-1.so: undefined reference to `soup_uri_new'
-    ./.libs/libostree-1.so: undefined reference to `soup_uri_free'
-    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_scheme'
-    ./.libs/libostree-1.so: undefined reference to `soup_uri_to_string'
-    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_host'
-    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_port'
-    collect2: error: ld returned 1 exit status
-
-Reproduce with:
-    ./configure --with-avahi --without-soup
-
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
----
- Makefile-libostree.am | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/Makefile-libostree.am b/Makefile-libostree.am
-index 01a209d1..dbc9ebb8 100644
---- a/Makefile-libostree.am
-+++ b/Makefile-libostree.am
-@@ -238,6 +238,13 @@ if USE_LIBSOUP
- libostree_1_la_SOURCES += src/libostree/ostree-fetcher-soup.c
- libostree_1_la_CFLAGS += $(OT_INTERNAL_SOUP_CFLAGS)
- libostree_1_la_LIBADD += $(OT_INTERNAL_SOUP_LIBS)
-+else
-+if USE_AVAHI
-+libostree_1_la_SOURCES += src/libostree/ostree-soup-uri.h \
-+	src/libostree/ostree-soup-uri.c \
-+	src/libostree/ostree-soup-form.c \
-+	$(NULL)
-+endif
- endif
- endif
- 
--- 
-2.18.0
-
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index c694a90e22..2d501ccf93 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8dd49a1ab94924e351ff9cfd8ea2bf725770400900f4875ad2cc95712c6cc905  libostree-2018.6.tar.xz
+sha256 483e359fd934f3fb1abde2cd8ff9c5bccb97e2a37d52ed8bedfa9ab1290883d9  libostree-2018.7.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 69e84343e9..24eda0d1db 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2018.6
+LIBOSTREE_VERSION = 2018.7
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
@@ -12,8 +12,6 @@ LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
-# For 0002-build-add-ostree-soup-to-build-process-when-configur.patch
-LIBOSTREE_AUTORECONF = YES
 
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
