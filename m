From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 17:10:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/sconeserver: bump version to fix
	musl build
In-Reply-To: <1454256656-9253-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454256656-9253-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454256656-9253-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes this musl build error:
TermBuffer.cpp: In member function ?virtual scx::Condition scx::TermBuffer::read(void*, int, int&)?:
TermBuffer.cpp:83:10: error: ?CEOT? was not declared in this scope
     case CEOT:
          ^
TermBuffer.cpp:123:10: error: ?CERASE? was not declared in this scope
     case CERASE: // Backspace
          ^
The autobuilders did not catch this specific error yet because they
failed earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

- added hash
- removed 0001-fix-ssl-libs-ordering.patch, applied upstream:
  https://github.com/sconemad/sconeserver/commit/ffb69ca18fd03d0dc976696144d215b3a8555155
- disabled markdown module because its git submodule cmark
  ( https://github.com/sconemad/sconeserver/tree/master/markdown )
  has no cross-compile support provided by the sconeserver build system:

make[4]: Entering directory '/home/bernd/buildroot/br3/output/build/sconeserver-c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd/markdown/cmark'
mkdir -p build; \
cd build; \
cmake .. \
	-G "Unix Makefiles" \
	-DCMAKE_BUILD_TYPE= \
	-DCMAKE_INSTALL_PREFIX=/usr/local
-- The C compiler identification is GNU 5.3.1
-- The CXX compiler identification is GNU 5.3.1
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated comments in sconeserver.mk (Arnout)

 .../sconeserver/0001-fix-ssl-libs-ordering.patch   | 36 ----------------------
 package/sconeserver/sconeserver.hash               |  2 ++
 package/sconeserver/sconeserver.mk                 | 11 ++++---
 3 files changed, 8 insertions(+), 41 deletions(-)
 delete mode 100644 package/sconeserver/0001-fix-ssl-libs-ordering.patch
 create mode 100644 package/sconeserver/sconeserver.hash

diff --git a/package/sconeserver/0001-fix-ssl-libs-ordering.patch b/package/sconeserver/0001-fix-ssl-libs-ordering.patch
deleted file mode 100644
index f1f25b9..0000000
--- a/package/sconeserver/0001-fix-ssl-libs-ordering.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-configure: re-order SSL libs when linking
-
-When doing static builds, the ordering of libs is important, as the
-linker does not back-pedal to previous libraries specified on the
-command line to find missing symbols, and only searches for those
-missing symbols in the following libs.
-
-Thus, as -lssl needs symbols from -lcrypto, it needs to come before
--lcrypto.
-
-And globally, we do *not* append new libraries, we prepend them.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN a/configure.in b/configure.in
---- a/configure.in	2014-10-16 11:12:08.000000000 +0200
-+++ b/configure.in	2015-05-30 15:44:25.540329788 +0200
-@@ -133,12 +133,14 @@
-     [AC_MSG_ERROR([header file <openssl/ssl.h> is required for OpenSSL, use --with-openssl-path=PATH])]
-   )
-   AC_CHECK_LIB([crypto],[CRYPTO_new_ex_data],
--    [SSL_LIBADD="$SSL_LIBADD -lcrypto"],
--    [AC_MSG_ERROR([library 'crypto' is required for OpenSSL])]
-+    [SSL_LIBADD="-lcrypto $SSL_LIBADD"],
-+    [AC_MSG_ERROR([library 'crypto' is required for OpenSSL])],
-+    [$SSL_LIBADD]
-   )
-   AC_CHECK_LIB([ssl],[SSL_library_init],
--    [SSL_LIBADD="$SSL_LIBADD -lssl"],
--    [AC_MSG_ERROR([library 'ssl' is required for OpenSSL])]
-+    [SSL_LIBADD="-lssl $SSL_LIBADD"],
-+    [AC_MSG_ERROR([library 'ssl' is required for OpenSSL])],
-+    [$SSL_LIBADD]
-   )
-   AC_SUBST(SSL_LIBADD)
- fi
diff --git a/package/sconeserver/sconeserver.hash b/package/sconeserver/sconeserver.hash
new file mode 100644
index 0000000..2e1fe84
--- /dev/null
+++ b/package/sconeserver/sconeserver.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	442c29ae93f615b610983187023ba6c1a9ca69526cb07f69576efba1d29d9daf	sconeserver-c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd.tar.gz
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 2072142..0a8158e 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -4,16 +4,17 @@
 #
 ################################################################################
 
-# Release 0.6.0 doesn't build cleanly, so use a recent
-# Git commit.
-SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
+SCONESERVER_VERSION = c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
-# For 0001-fix-ssl-libs-ordering.patch and configure isn't up to date
+# upstream tarball does not contain a configure script
 SCONESERVER_AUTORECONF = YES
 SCONESERVER_DEPENDENCIES += pcre
-SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6
+# disable markdown module because its git submodule cmark
+# https://github.com/sconemad/sconeserver/tree/master/markdown
+# has no cross-compile support provided by the sconeserver build system
+SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6 --without-markdown
 
 # Sconeserver configure script fails to find the libxml2 headers.
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-- 
2.7.0
