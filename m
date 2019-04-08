From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon,  8 Apr 2019 17:43:11 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static linking
 failure due to lack of deps
In-Reply-To: <20190408110431.734b346b@windsurf>
References: <20190408110431.734b346b@windsurf>
Message-ID: <20190408154311.127351-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When static linking some dependency library can be missing(i.e. -latomic
for -lcrypto) on linking libraries list. This is because when static
linking libraries dependencies are not transparently linked into binary.

To avoid moving libraries before/after one another or add new ones
that are not needed at all in some linking case use `pkg-config --libs
LIBRARY` where LIBRARY is the library we "probe" for its existence and
dependency.
So:
- Remove 0005-fix-static-link-zlib.patch where -lcrypto and -lz were
swapped
- Replace it with 0005-Use-pkgconf-to-get-libs-deps.patch where -lcrypto
has been substituted with `pkg-config --libs libcrypto`
- Add host-pkgconf to ANDROID_TOOLS_DEPENDENCIES

Fixes:
http://autobuild.buildroot.net/results/d3d/d3d6679cfc8afe4467368bd3d31483172c1032de/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../0005-Use-pkgconf-to-get-libs-deps.patch   | 35 ++++++++++++++++++
 .../0005-fix-static-link-zlib.patch           | 36 -------------------
 package/android-tools/android-tools.mk        |  1 +
 3 files changed, 36 insertions(+), 36 deletions(-)
 create mode 100644 package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
 delete mode 100644 package/android-tools/0005-fix-static-link-zlib.patch

diff --git a/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch b/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
new file mode 100644
index 0000000000..63ea1fb6a4
--- /dev/null
+++ b/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
@@ -0,0 +1,35 @@
+makefiles: use pkgconf to get libs deps
+
+LIBS lists library dependencies without taking into account static linking
+that need ordered listing and more libraries listed since differently from
+shared linking dependency is not transparent(i.e. -lcrypto could need
+-latomic etc.).
+
+Replace -lcrypto with `pkg-config --libs libcrypto` command to be sure all
+needed libraries are listed during linking.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+diff -urpN android-tools-4.2.2+git20130218.orig/debian/makefiles/adbd.mk android-tools-4.2.2+git20130218/debian/makefiles/adbd.mk
+--- android-tools-4.2.2+git20130218.orig/debian/makefiles/adbd.mk	2019-04-08 16:05:02.967710428 +0200
++++ android-tools-4.2.2+git20130218/debian/makefiles/adbd.mk	2019-04-08 16:30:42.463084426 +0200
+@@ -44,7 +44,7 @@ CPPFLAGS+= -DADBD_NON_ANDROID
+ CPPFLAGS+= -I$(SRCDIR)/core/adbd
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+
+-LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
++LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto` -lcrypt
+
+ OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
+
+diff -urpN android-tools-4.2.2+git20130218.orig/debian/makefiles/adb.mk android-tools-4.2.2+git20130218/debian/makefiles/adb.mk
+--- android-tools-4.2.2+git20130218.orig/debian/makefiles/adb.mk	2019-04-08 16:05:02.959701400 +0200
++++ android-tools-4.2.2+git20130218/debian/makefiles/adb.mk	2019-04-08 16:31:06.529426250 +0200
+@@ -41,7 +41,7 @@ CPPFLAGS+= -DHAVE_TERMIO_H
+ CPPFLAGS+= -I$(SRCDIR)/core/adb
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+
+-LIBS+= -lc -lpthread -lz -lcrypto
++LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto`
+
+ OBJS= $(SRCS:.c=.o)
diff --git a/package/android-tools/0005-fix-static-link-zlib.patch b/package/android-tools/0005-fix-static-link-zlib.patch
deleted file mode 100644
index dff4df6e79..0000000000
--- a/package/android-tools/0005-fix-static-link-zlib.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix static linking of adb/adbd
-
-Both adb and adbd use OpenSSL, which indirectly uses zlib. Since
-adb/adbd also use zlib directly -lz is included in the linker flags,
-but not at the right position to ensure that static linking works: to
-make it possible for OpenSSL symbols to see zlib symbols, -lz must
-appear after -lcrypto.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/debian/makefiles/adb.mk
-===================================================================
---- a/debian/makefiles/adb.mk
-+++ b/debian/makefiles/adb.mk
-@@ -41,7 +41,7 @@
- CPPFLAGS+= -I$(SRCDIR)/core/adb
- CPPFLAGS+= -I$(SRCDIR)/core/include
- 
--LIBS+= -lc -lpthread -lz -lcrypto
-+LIBS+= -lc -lpthread -lcrypto -lz
- 
- OBJS= $(SRCS:.c=.o)
- 
-Index: b/debian/makefiles/adbd.mk
-===================================================================
---- a/debian/makefiles/adbd.mk
-+++ b/debian/makefiles/adbd.mk
-@@ -44,7 +44,7 @@
- CPPFLAGS+= -I$(SRCDIR)/core/adbd
- CPPFLAGS+= -I$(SRCDIR)/core/include
- 
--LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
-+LIBS+= -lc -lpthread -lcrypto -lz -lcrypt
- 
- OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
- 
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 6f6ca7729b..3a63139014 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -11,6 +11,7 @@ ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41
 HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
+ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
 
 # Extract the Debian tarball inside the sources
 define ANDROID_TOOLS_DEBIAN_EXTRACT
-- 
2.17.1
