From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Oct 2008 16:03:58 +0200
Subject: [Buildroot] [PATCH/RFC] Add fontconfig bug fix for parallel build
Message-ID: <20081007160358.75a577b2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

fontconfig is affected by a compile bug that only occurs from time to
time when parallel compilation is enabled. The bug is described at
https://bugs.freedesktop.org/show_bug.cgi?id=16464.

The attached patch includes the fix for fontconfig in buildroot.
However, it modifies a Makefile.am file, so running automake is needed,
but I'm not sure Buildroot will do that automatically (as the bug only
occurs sometimes, it's quite hard to test whether the fix properly works
or not).

Sincerly,

Thomas

---
Add a parallel compilation fix for fontconfig

This patch adds a patch to fix bug
https://bugs.freedesktop.org/show_bug.cgi?id=16464 affecting parallel
compilation of fontconfig.

The patch is the one proposed in the bugzilla entry, available at
https://bugs.freedesktop.org/attachment.cgi?id=17294.

Without this patch, the compilation of fontconfig sometimes fails
with:

In file included from fc-case.c:25:
../src/fcint.h:118:21: error: fcalias.h: No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fontconfig/parallel-compilation-fix.patch |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

Index: buildroot/package/fontconfig/parallel-compilation-fix.patch
===================================================================
--- /dev/null
+++ buildroot/package/fontconfig/parallel-compilation-fix.patch
@@ -0,0 +1,22 @@
+=== modified file 'fc-case/Makefile.am'
+--- fc-case/Makefile.am	2008-06-22 15:28:39 +0000
++++ fc-case/Makefile.am	2008-06-22 15:50:28 +0000
+@@ -36,6 +36,8 @@
+ 
+ noinst_MANS=fc-case.man
+ 
++noinst_HEADERS=$(TARG)
++
+ fc_case_SRCS= \
+ 	fc-case.c \
+ 	fccaseint.h \
+@@ -52,7 +54,7 @@
+ 
+ ALIAS_FILES = fcalias.h fcaliastail.h
+ 
+-BUILT_SOURCES = $(ALIAS_FILES) $(TARG)
++BUILT_SOURCES = $(ALIAS_FILES)
+ 
+ $(ALIAS_FILES): 
+ 	touch $(ALIAS_FILES)
+


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
