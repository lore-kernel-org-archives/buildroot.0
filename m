From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 16:29:12 +0200
Subject: [Buildroot] [PATCH 1/1] fltk: fix build
In-Reply-To: <cover.1274452131.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274452131.git.thomas.petazzoni@free-electrons.com>
Message-ID: <584921cb87b66f6c2dd8d080593137ed64a529d0.1274452131.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build of fltk was failing due to an issue in the usage of
scandir(). This issue is fixed by a new patch,
fltk-1.1.7-scandir-fix.patch. Moreover, this problem was not
necessarly visible, as the build process of FLTK didn't bail out with
an error when it was failing. This if fixed by
fltk-1.1.7-bail-out-on-error.patch. Finally, there was a problem with
the tests of FLTK, so we disabled them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fltk/fltk-1.1.7-bail-out-on-error.patch |   54 +++++++++++++++++++++++
 package/fltk/fltk-1.1.7-disable-test.patch      |   17 +++++++
 package/fltk/fltk-1.1.7-scandir-fix.patch       |   20 ++++++++
 package/fltk/fltk-1.1.7-tests.patch             |   11 -----
 4 files changed, 91 insertions(+), 11 deletions(-)
 create mode 100644 package/fltk/fltk-1.1.7-bail-out-on-error.patch
 create mode 100644 package/fltk/fltk-1.1.7-disable-test.patch
 create mode 100644 package/fltk/fltk-1.1.7-scandir-fix.patch
 delete mode 100644 package/fltk/fltk-1.1.7-tests.patch

diff --git a/package/fltk/fltk-1.1.7-bail-out-on-error.patch b/package/fltk/fltk-1.1.7-bail-out-on-error.patch
new file mode 100644
index 0000000..644a056
--- /dev/null
+++ b/package/fltk/fltk-1.1.7-bail-out-on-error.patch
@@ -0,0 +1,54 @@
+When a submake fails, the build of FLTK was stopping, but the main
+make was returning 0. Therefore, Buildroot was going on with the build
+of the other components, even though the build of FLTK failed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: fltk-1.1.7/Makefile
+===================================================================
+--- fltk-1.1.7.orig/Makefile	2010-05-21 15:52:20.000000000 +0200
++++ fltk-1.1.7/Makefile	2010-05-21 15:52:43.000000000 +0200
+@@ -32,7 +32,7 @@
+ all: makeinclude
+ 	for dir in $(DIRS); do\
+ 		echo "=== making $$dir ===";\
+-		(cd $$dir; $(MAKE) $(MFLAGS)) || break;\
++		(cd $$dir; $(MAKE) $(MFLAGS)) || exit 1;\
+ 	done
+ 
+ install: makeinclude
+@@ -42,7 +42,7 @@
+ 	-chmod 755 $(DESTDIR)$(bindir)/fltk-config
+ 	for dir in FL $(DIRS); do\
+ 		echo "=== installing $$dir ===";\
+-		(cd $$dir; $(MAKE) $(MFLAGS) install) || break;\
++		(cd $$dir; $(MAKE) $(MFLAGS) install) || exit 1;\
+ 	done
+ 
+ install-desktop: makeinclude
+@@ -54,7 +54,7 @@
+ 	$(RM) $(DESTDIR)$(bindir)/fltk-config
+ 	for dir in FL $(DIRS); do\
+ 		echo "=== uninstalling $$dir ===";\
+-		(cd $$dir; $(MAKE) $(MFLAGS) uninstall) || break;\
++		(cd $$dir; $(MAKE) $(MFLAGS) uninstall) || exit 1;\
+ 	done
+ 
+ uninstall-desktop: makeinclude
+@@ -65,14 +65,14 @@
+ depend: makeinclude
+ 	for dir in $(DIRS); do\
+ 		echo "=== making dependencies in $$dir ===";\
+-		(cd $$dir; $(MAKE) $(MFLAGS) depend) || break;\
++		(cd $$dir; $(MAKE) $(MFLAGS) depend) || exit 1;\
+ 	done
+ 
+ clean:
+ 	-$(RM) core *.o
+ 	for dir in $(DIRS); do\
+ 		echo "=== cleaning $$dir ===";\
+-		(cd $$dir; $(MAKE) $(MFLAGS) clean) || break;\
++		(cd $$dir; $(MAKE) $(MFLAGS) clean) || exit 1;\
+ 	done
+ 
+ distclean: clean
diff --git a/package/fltk/fltk-1.1.7-disable-test.patch b/package/fltk/fltk-1.1.7-disable-test.patch
new file mode 100644
index 0000000..c83e1da
--- /dev/null
+++ b/package/fltk/fltk-1.1.7-disable-test.patch
@@ -0,0 +1,17 @@
+Disable tests in FLTK because they use the fluid tool on the host.
+
+Patch borrowed from OpenEmbedded.
+
+Index: fltk-1.1.9/Makefile
+===================================================================
+--- fltk-1.1.9.orig/Makefile	2008-06-06 16:14:11.936736201 +0200
++++ fltk-1.1.9/Makefile	2008-06-06 16:14:22.526357637 +0200
+@@ -27,7 +27,7 @@
+ 
+ include makeinclude
+ 
+-DIRS	=	$(IMAGEDIRS) src fluid test documentation
++DIRS	=	$(IMAGEDIRS) src fluid documentation
+ 
+ all: makeinclude fltk-config
+ 	for dir in $(DIRS); do\
diff --git a/package/fltk/fltk-1.1.7-scandir-fix.patch b/package/fltk/fltk-1.1.7-scandir-fix.patch
new file mode 100644
index 0000000..ba2b560
--- /dev/null
+++ b/package/fltk/fltk-1.1.7-scandir-fix.patch
@@ -0,0 +1,20 @@
+Use the correct scandir() call.
+
+See http://www.fltk.org/str.php?L2205. This patch is a simplified
+version of http://www.fltk.org/strfiles/2205/scandir_posix.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: fltk-1.1.7/src/filename_list.cxx
+===================================================================
+--- fltk-1.1.7.orig/src/filename_list.cxx	2010-05-21 15:58:09.000000000 +0200
++++ fltk-1.1.7/src/filename_list.cxx	2010-05-21 16:00:21.000000000 +0200
+@@ -54,7 +54,7 @@
+                      Fl_File_Sort_F *sort) {
+ #ifndef HAVE_SCANDIR
+   int n = scandir(d, list, 0, sort);
+-#elif defined(__hpux) || defined(__CYGWIN__)
++#elif defined(__hpux) || defined(__CYGWIN__) || defined(__USE_POSIX)
+   // HP-UX, Cygwin define the comparison function like this:
+   int n = scandir(d, list, 0, (int(*)(const dirent **, const dirent **))sort);
+ #elif defined(__osf__)
diff --git a/package/fltk/fltk-1.1.7-tests.patch b/package/fltk/fltk-1.1.7-tests.patch
deleted file mode 100644
index 32d4981..0000000
--- a/package/fltk/fltk-1.1.7-tests.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/test/Makefile	2006-01-15 13:36:16.000000000 -0500
-+++ b/test/Makefile	2008-02-12 13:34:25.000000000 -0500
-@@ -230,7 +230,7 @@ uninstall-osx:
- # FLUID file rules
- .fl.cxx .fl.h:	../fluid/fluid$(EXEEXT)
- 	echo Generating $<...
--	../fluid/fluid$(EXEEXT) -c $<
-+	/usr/bin/fluid$(EXEEXT) -c $<
- 
- # All demos depend on the FLTK library...
- $(ALL): ../lib/$(LIBNAME)
-- 
1.6.3.3
