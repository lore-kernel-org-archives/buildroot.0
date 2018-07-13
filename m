From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jul 2018 10:08:58 +0200
Subject: [Buildroot] [git commit] libostree: add upstream patch to fix
 linking errors
Message-ID: <20180713080510.290577FB18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b88e60abaca1b21f6c67890c1e632d73e9b419b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for Avahi in libostree depends on some support functions from
libsoup.
Use its own support functions in case of libsoup is not provided.

Fixes:
  http://autobuild.buildroot.net/results/5e5441822e2a94f8de51bfa0470aced84720ce31

[Peter: enable AUTORECONF as .am file is touched]
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...stree-soup-to-build-process-when-configur.patch | 45 ++++++++++++++++++++++
 package/libostree/libostree.mk                     |  2 +
 2 files changed, 47 insertions(+)

diff --git a/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch b/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch
new file mode 100644
index 0000000000..b89bd743a1
--- /dev/null
+++ b/package/libostree/0002-build-add-ostree-soup-to-build-process-when-configur.patch
@@ -0,0 +1,45 @@
+From 1cd86d4978ad32405b41f864e11ac21a2474c2f3 Mon Sep 17 00:00:00 2001
+From: Marcus Folkesson <marcus.folkesson@gmail.com>
+Date: Tue, 3 Jul 2018 10:02:46 +0200
+Subject: [PATCH] build: add ostree-soup-* to build process when configured
+ with avahi
+
+Avoid getting these link errors:
+    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_path'
+    ./.libs/libostree-1.so: undefined reference to `soup_uri_new'
+    ./.libs/libostree-1.so: undefined reference to `soup_uri_free'
+    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_scheme'
+    ./.libs/libostree-1.so: undefined reference to `soup_uri_to_string'
+    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_host'
+    ./.libs/libostree-1.so: undefined reference to `soup_uri_set_port'
+    collect2: error: ld returned 1 exit status
+
+Reproduce with:
+    ./configure --with-avahi --without-soup
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+---
+ Makefile-libostree.am | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/Makefile-libostree.am b/Makefile-libostree.am
+index 01a209d1..dbc9ebb8 100644
+--- a/Makefile-libostree.am
++++ b/Makefile-libostree.am
+@@ -238,6 +238,13 @@ if USE_LIBSOUP
+ libostree_1_la_SOURCES += src/libostree/ostree-fetcher-soup.c
+ libostree_1_la_CFLAGS += $(OT_INTERNAL_SOUP_CFLAGS)
+ libostree_1_la_LIBADD += $(OT_INTERNAL_SOUP_LIBS)
++else
++if USE_AVAHI
++libostree_1_la_SOURCES += src/libostree/ostree-soup-uri.h \
++	src/libostree/ostree-soup-uri.c \
++	src/libostree/ostree-soup-form.c \
++	$(NULL)
++endif
+ endif
+ endif
+ 
+-- 
+2.18.0
+
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index d9739b7901..69e84343e9 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -12,6 +12,8 @@ LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
+# For 0002-build-add-ostree-soup-to-build-process-when-configur.patch
+LIBOSTREE_AUTORECONF = YES
 
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
