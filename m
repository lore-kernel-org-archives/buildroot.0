From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 14 Apr 2020 11:14:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgit2: Bump to version 1.0.0
Message-ID: <20200414091439.25465-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version changes the required dependencies as well as introducing
new bundled ones...

- Start depending on httpparser, instead of using the bundled one.
- Force using regcomp instead of using a bundled pcre.
- Add license for a bundled wildmatch and sha1.

Tested with multiple check-pkg -a invocations, with multiple
dependencies configurations.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/Config.in    |  2 ++
 package/libgit2/libgit2.hash |  4 ++--
 package/libgit2/libgit2.mk   | 10 ++++++----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
index 53ba4d4245..02c51448ff 100644
--- a/package/libgit2/Config.in
+++ b/package/libgit2/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBGIT2
 	bool "libgit2"
+	depends on !BR2_STATIC_LIBS # libhttpparser
+	select BR2_PACKAGE_LIBHTTPPARSER
 	select BR2_PACKAGE_ZLIB
 	help
 	  libgit2 is a portable, pure C implementation of the Git core
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index d4912c0327..a7d910e3bf 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	30f3877469d09f2e4a21be933b4e2800560d16646028dd800744dc5f7fb0c749  libgit2-0.28.4.tar.gz
-sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
+sha256	6a1fa16a7f6335ce8b2630fbdbb5e57c4027929ebc56fcd1ac55edb141b409b4  libgit2-1.0.0.tar.gz
+sha256	afc8bde99ba630012107c25d3c42dde628ec5f0cd3f428131f7e3a0f7d58ff42  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 909fcb83f0..9c3de6c8c6 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 0.28.4
-LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
-LIBGIT2_LICENSE = GPL-2.0 with linking exception
+LIBGIT2_VERSION = 1.0.0
+LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v1.0.0
+LIBGIT2_LICENSE = GPL-2.0 with linking exception, BSD 4-clause variant (wildmatch), MIT (sha1)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_INSTALL_STAGING = YES
 
@@ -14,9 +14,11 @@ LIBGIT2_CONF_OPTS = \
 	-DUSE_GSSAPI=OFF \
 	-DBUILD_CLAR=OFF \
 	-DUSE_ICONV=ON \
+	-DREGEX_BACKEND=regcomp \
+	-DUSE_HTTP_PARSER=system \
 	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
-LIBGIT2_DEPENDENCIES = zlib
+LIBGIT2_DEPENDENCIES = zlib libhttpparser
 
 # If libiconv is available (for !locale toolchains), then we can use
 # it for iconv support. Note that USE_ICONV=ON is still correct even
-- 
2.25.1
