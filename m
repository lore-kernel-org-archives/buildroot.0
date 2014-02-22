From: Alexander Varnin <fenixk19@mail.ru>
Date: Sun, 23 Feb 2014 01:51:21 +0400
Subject: [Buildroot] [PATCH 1/1] mono: new package
Message-ID: <1393105881-20127-1-git-send-email-fenixk19@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 package/Config.in              |    1 +
 package/mono/Config.in         |   10 ++++++++++
 package/mono/mono-uclibc.patch |   15 +++++++++++++++
 package/mono/mono.mk           |   17 +++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-uclibc.patch
 create mode 100644 package/mono/mono.mk

diff --git a/package/Config.in b/package/Config.in
index fca61d6..1f86e75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -796,6 +796,7 @@ source "package/googlefontdirectory/Config.in"
 source "package/haveged/Config.in"
 source "package/mcrypt/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
+source "package/mono/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/snowball-init/Config.in"
 source "package/sound-theme-borealis/Config.in"
diff --git a/package/mono/Config.in b/package/mono/Config.in
new file mode 100644
index 0000000..fd34774
--- /dev/null
+++ b/package/mono/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MONO
+	bool "mono"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Mono is a free and open source project to create an Ecma 
+          standard-compliant, .NET Framework-compatible set of tools 
+          including, among others, a C# compiler and a Common Language 
+          Runtime.
+
diff --git a/package/mono/mono-uclibc.patch b/package/mono/mono-uclibc.patch
new file mode 100644
index 0000000..6fcccb4
--- /dev/null
+++ b/package/mono/mono-uclibc.patch
@@ -0,0 +1,15 @@
+--- mono-3.2.5.orig/libgc/include/gc.h	2005-12-09 20:26:20 +0000
++++ mono-3.2.5/libgc/include/gc.h	2005-12-09 20:27:22 +0000
+@@ -483,12 +483,6 @@
+
+ #ifdef __linux__
+ # include <features.h>
+-# if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
+-#   ifndef GC_HAVE_BUILTIN_BACKTRACE
+-#     define GC_HAVE_BUILTIN_BACKTRACE
+-#   endif
+-# endif
+ # if defined(__i386__) || defined(__x86_64__)
+ #   define GC_CAN_SAVE_CALL_STACKS
+ # endif
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
new file mode 100644
index 0000000..261b46c
--- /dev/null
+++ b/package/mono/mono.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# mono
+#
+################################################################################
+
+MONO_VERSION        = 2.11.4
+MONO_SOURCE	     = mono-$(MONO_VERSION).tar.bz2
+MONO_SITE            = http://download.mono-project.com/sources/mono/
+MONO_LICENSE         = GPLv2 LGPLv2.1+
+MONO_LICENSE_FILES   = COPYING LGPL-2.1
+MONO_DEPENDENCIES    = libglib2
+
+MONO_CONF_OPT += --with-tls=pthread --with-sigaltstack=no --disable-mono-debugger --disable-backtrace mono_cv_clang=no mono_cv_uscore=yes
+MONO_MAKE_OPT += CFLAGS=-DARM_FPU_NONE
+
+$(eval $(autotools-package))
-- 
1.7.10.4
