From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 24 Apr 2020 23:40:20 +0200
Subject: [Buildroot] [PATCH] package/apparmor: fix compilation with libintl
Message-ID: <20200424214020.381865-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libintl is enabled, Apparmor should link againts libintl.
The attached patch is already sent upstream.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...inutils-fix-compilation-with-libintl.patch | 48 +++++++++++++++++++
 package/apparmor/apparmor.mk                  |  4 ++
 2 files changed, 52 insertions(+)
 create mode 100644 package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch

diff --git a/package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch b/package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch
new file mode 100644
index 0000000000..d3f4a51646
--- /dev/null
+++ b/package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch
@@ -0,0 +1,48 @@
+From c9fe40d9386a5e4cf99f44df9b98382d83f1c4f4 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Fri, 24 Apr 2020 17:34:24 +0200
+Subject: [PATCH] parser: binutils: fix compilation with libintl
+
+When libintl is available on the system, we need to link against the
+libintl library too.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ binutils/Makefile | 4 ++++
+ parser/Makefile   | 5 +++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/binutils/Makefile b/binutils/Makefile
+index 11459bec..d8c1b634 100644
+--- a/binutils/Makefile
++++ b/binutils/Makefile
+@@ -56,6 +56,10 @@ SBINTOOLS = aa-status
+ 
+ AALIB = -Wl,-Bstatic -lapparmor  -Wl,-Bdynamic -lpthread
+ 
++ifdef WITH_LIBINTL
++	AALIB += -lintl
++endif
++
+ ifdef USE_SYSTEM
+   # Using the system libapparmor so Makefile dependencies can't be used
+   LIBAPPARMOR_A =
+diff --git a/parser/Makefile b/parser/Makefile
+index eab64be9..998230ee 100644
+--- a/parser/Makefile
++++ b/parser/Makefile
+@@ -91,6 +91,11 @@ AAREOBJECTS = $(AAREOBJECT)
+ AARE_LDFLAGS = -static-libgcc -static-libstdc++ -L. $(LDFLAGS)
+ AALIB = -Wl,-Bstatic -lapparmor -Wl,-Bdynamic -lpthread
+ 
++ifdef WITH_LIBINTL
++	AALIB += -lintl
++endif
++
++
+ ifdef USE_SYSTEM
+   # Using the system libapparmor so Makefile dependencies can't be used
+   LIBAPPARMOR_A =
+-- 
+2.25.1
+
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 9180fcd803..c3b9d9fab9 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -17,6 +17,10 @@ APPARMOR_DEPENDENCIES = libapparmor
 APPARMOR_TOOLS = parser
 APPARMOR_MAKE_OPTS = USE_SYSTEM=1 DISTRO=unknown
 
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
+APPARMOR_MAKE_OPTS += WITH_LIBINTL=1
+endif
+
 ifeq ($(BR2_PACKAGE_APPARMOR_BINUTILS),y)
 APPARMOR_TOOLS += binutils
 endif
-- 
2.25.1
