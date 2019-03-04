From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Mar 2019 20:22:57 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: build Qt 5.6 with
 LibreSSL if present
Message-ID: <20190304201145.D9DD882246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a55aca6a3d565c4fea31e410a8b7f009639f59df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LibreSSL build is successful with shared linkage, but not default dlopen().

Also adds patch for successful compilation by using -fpermissive.

Signed-off-by: James Grant <jamesg@zaltys.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-fpermissive-gcc-flag-to-allow-compilati.patch | 29 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                     |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/5.6.3/0003-libressl-add-fpermissive-gcc-flag-to-allow-compilati.patch b/package/qt5/qt5base/5.6.3/0003-libressl-add-fpermissive-gcc-flag-to-allow-compilati.patch
new file mode 100644
index 0000000000..c8fc426f79
--- /dev/null
+++ b/package/qt5/qt5base/5.6.3/0003-libressl-add-fpermissive-gcc-flag-to-allow-compilati.patch
@@ -0,0 +1,29 @@
+From 62588f2d8267c67c2337004e83e80695280db9eb Mon Sep 17 00:00:00 2001
+From: James Grant <jamesg@zaltys.org>
+Date: Sun, 3 Mar 2019 17:29:29 +1300
+Subject: [PATCH 1/1] libressl - add -fpermissive gcc flag to allow
+ compilation.
+
+Workaround for 'const BIO_METHOD *' vs. 'BIO_METHOD *' changes to BIO_new() and BIO_s_mem() function signatures.
+
+Signed-off-by: James Grant <jamesg@zaltys.org>
+---
+ src/network/ssl/ssl.pri | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/network/ssl/ssl.pri b/src/network/ssl/ssl.pri
+index 29c47cd7..f0aad448 100644
+--- a/src/network/ssl/ssl.pri
++++ b/src/network/ssl/ssl.pri
+@@ -77,7 +77,7 @@ android:!android-no-sdk: SOURCES += ssl/qsslsocket_openssl_android.cpp
+         LIBS_PRIVATE += $$OPENSSL_LIBS_RELEASE
+     }
+ 
+-    QMAKE_CXXFLAGS += $$OPENSSL_CFLAGS
++    QMAKE_CXXFLAGS += $$OPENSSL_CFLAGS -fpermissive
+     LIBS_PRIVATE += $$OPENSSL_LIBS
+     win32: LIBS_PRIVATE += -lcrypt32
+ }
+-- 
+2.18.1
+
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a5ce583327..e7f6e658f1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -190,7 +190,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 # No OpenSSL 1.1.x support in Qt 5.6.x
-QT5BASE_CONFIGURE_OPTS += -no-openssl
+# LibreSSL works with shared linkage only and -fpermissive patch
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBRESSL),-openssl-linked,-no-openssl)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBRESSL),openssl)
 else
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
