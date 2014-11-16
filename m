From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 15:04:32 +0100
Subject: [Buildroot] [PATCH 1/2] packae/duma: do not build test programs
Message-ID: <1416146673-29582-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building test programs fails for a static link, because duma.a redefines
memcpy and strcpy, which are already present in the C library.

Fixes quite some build failures:
    http://autobuild.buildroot.net/results/3c7/3c7a4751c7ca71ad429c2d67f380aa225f151350/ (arm)
    http://autobuild.buildroot.net/results/358/358293d22ae24237719f0aa27e88e87d03856973/ (x86_64)
    http://autobuild.buildroot.net/results/947/9472d78b890639d3204e1942491f1eae62fb8a36/ (powerpc)
    http://autobuild.buildroot.net/results/ffd/ffd2e7ab7a6045f5eeaa25cd25088ad0a5b6509a/ (i686)
    ...

Also rename patches according to the new naming scheme.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...ilation.patch => 0001-fix-cross-compilation.patch} |  0
 package/duma/0002-no-tests.patch                      | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+)
 rename package/duma/{duma-01-fix-cross-compilation.patch => 0001-fix-cross-compilation.patch} (100%)
 create mode 100644 package/duma/0002-no-tests.patch

diff --git a/package/duma/duma-01-fix-cross-compilation.patch b/package/duma/0001-fix-cross-compilation.patch
similarity index 100%
rename from package/duma/duma-01-fix-cross-compilation.patch
rename to package/duma/0001-fix-cross-compilation.patch
diff --git a/package/duma/0002-no-tests.patch b/package/duma/0002-no-tests.patch
new file mode 100644
index 0000000..6fe76f7
--- /dev/null
+++ b/package/duma/0002-no-tests.patch
@@ -0,0 +1,19 @@
+Do not build test programs
+
+Biulding test programs does not work when we want to do a static link,
+because duma.a redefines memcpy and strcpy, so the link fails.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN duma-2.5.15.orig/GNUmakefile duma-2.5.15/GNUmakefile
+--- duma-2.5.15.orig/GNUmakefile	2014-11-16 14:47:05.874448560 +0100
++++ duma-2.5.15/GNUmakefile	2014-11-16 14:54:50.792048921 +0100
+@@ -294,7 +294,7 @@
+ SO_OBJECTS=dumapp_so.o duma_so.o sem_inc_so.o print_so.o
+ 
+ # Make all the top-level targets the makefile knows about.
+-all:	libduma.a tstheap$(EXEPOSTFIX) dumatest$(EXEPOSTFIX) thread-test$(EXEPOSTFIX) testmt$(EXEPOSTFIX) dumatestpp$(EXEPOSTFIX) testoperators$(EXEPOSTFIX) $(DUMA_DYN_DEPS)
++all:	libduma.a $(DUMA_DYN_DEPS)
+ 
+ # Perform self tests on the program this makefile builds.
+ check test:
-- 
1.9.1
