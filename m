From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri,  1 Jun 2018 17:41:58 +0200
Subject: [Buildroot] [PATCH 1/3] libgit2: Do not use a bundled zlib.
Message-ID: <20180601154200.22088-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgit2 depends on zlib.  If libgit2's build system does not find a
system zlib, then it compiles a bundled version of it.

Force a dependency on zlib to avoid building this bundled version.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/Config.in  | 1 +
 package/libgit2/libgit2.mk | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
index 24a1f3b5a9..53ba4d4245 100644
--- a/package/libgit2/Config.in
+++ b/package/libgit2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGIT2
 	bool "libgit2"
+	select BR2_PACKAGE_ZLIB
 	help
 	  libgit2 is a portable, pure C implementation of the Git core
 	  methods provided as a linkable library with a solid API,
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 277a8d46ac..fcace39290 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -16,6 +16,8 @@ LIBGIT2_CONF_OPTS = \
 	-DUSE_ICONV=ON \
 	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
+LIBGIT2_DEPENDENCIES = zlib
+
 # If libiconv is available (for !locale toolchains), then we can use
 # it for iconv support. Note that USE_ICONV=ON is still correct even
 # without libiconv because (1) most toolchain have iconv support
@@ -25,11 +27,6 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBGIT2_DEPENDENCIES += libiconv
 endif
 
-# No option to explicitly enable/disable zlib
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBGIT2_DEPENDENCIES += zlib
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBGIT2_DEPENDENCIES += libssh2
 LIBGIT2_CONF_OPTS += -DUSE_SSH=ON
-- 
2.17.0
