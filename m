From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:27 +0100
Subject: [Buildroot] [PATCH v2] python2: bump to 2.7.3
Message-ID: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pyhton 2.7.3 includes several security fixes.
See: http://www.python.org/download/releases/2.7.3/

Also fixes the patch making sqlite optional and remove the symlink patch
(which has been fixed upstream).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
v2: update commit message about the removed patch (spotted by Thomas P.)
---
 package/python/python-2.7-009-python-symlink.patch | 25 -----------------
 .../python-2.7-100-optional-test-modules.patch     |  3 ++-
 package/python/python-2.7-101-optional-pydoc.patch |  3 ++-
 package/python/python-2.7-102-optional-2to3.patch  | 12 +++------
 .../python/python-2.7-103-optional-sqlite.patch    | 31 +++++++++++++++++++++-
 package/python/python-2.7-104-optional-tk.patch    |  3 ++-
 .../python/python-2.7-105-optional-curses.patch    |  3 ++-
 package/python/python-2.7-106-optional-expat.patch |  3 ++-
 package/python/python-2.7-110-optional-db.patch    |  7 ++---
 package/python/python.mk                           |  2 +-
 10 files changed, 48 insertions(+), 44 deletions(-)
 delete mode 100644 package/python/python-2.7-009-python-symlink.patch

diff --git a/package/python/python-2.7-009-python-symlink.patch b/package/python/python-2.7-009-python-symlink.patch
deleted file mode 100644
index 1b1d0c8..0000000
--- a/package/python/python-2.7-009-python-symlink.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Use a symlink between python and pythonVERSION
-
-By default, a hard link is used between /usr/bin/python and
-/usr/bin/pythonVERSION. Using hard links for such things is fairly
-uncommon, so let's make a symbolic link instead.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
- Makefile.pre.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -796,7 +796,7 @@
- 	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
- 	else true; \
- 	fi
--	(cd $(DESTDIR)$(BINDIR); $(LN) python$(VERSION)$(EXE) $(PYTHON))
-+	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)$(EXE) $(PYTHON))
- 	-rm -f $(DESTDIR)$(BINDIR)/python-config
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-config python-config)
- 	-test -d $(DESTDIR)$(LIBPC) || $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC)
diff --git a/package/python/python-2.7-100-optional-test-modules.patch b/package/python/python-2.7-100-optional-test-modules.patch
index fc49d52..a988717 100644
--- a/package/python/python-2.7-100-optional-test-modules.patch
+++ b/package/python/python-2.7-100-optional-test-modules.patch
@@ -4,6 +4,7 @@ The Python standard distribution comes with many test modules, that
 are not necessarly useful on embedded targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
  Makefile.pre.in |   40 +++++++++++++++++++++++++++-------------
@@ -55,7 +56,7 @@ Index: Python-2.7.2/Makefile.pre.in
 +		ctypes/test distutils/tests unittest/test
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 Index: Python-2.7.2/configure.in
diff --git a/package/python/python-2.7-101-optional-pydoc.patch b/package/python/python-2.7-101-optional-pydoc.patch
index 195abcc..ccc937b 100644
--- a/package/python/python-2.7-101-optional-pydoc.patch
+++ b/package/python/python-2.7-101-optional-pydoc.patch
@@ -4,6 +4,7 @@ It removes 0.5 MB of data from the target plus the pydoc script
 itself.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
  Makefile.pre.in |    6 +++++-
@@ -32,7 +33,7 @@ Index: Python-2.7.2/Makefile.pre.in
 +LIBSUBDIRS += pydoc_data
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 Index: Python-2.7.2/configure.in
diff --git a/package/python/python-2.7-102-optional-2to3.patch b/package/python/python-2.7-102-optional-2to3.patch
index 1e04540..0321619 100644
--- a/package/python/python-2.7-102-optional-2to3.patch
+++ b/package/python/python-2.7-102-optional-2to3.patch
@@ -4,6 +4,7 @@ lib2to3 is a library to convert Python 2.x code to Python 3.x. As
 such, it is probably not very useful on embedded system targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
  Makefile.pre.in |   24 +++++++++++++++++-------
@@ -33,7 +34,7 @@ Index: Python-2.7.2/Makefile.pre.in
  		ctypes/test distutils/tests unittest/test
  endif
  
-@@ -884,6 +882,23 @@
+@@ -884,6 +882,16 @@
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -47,14 +48,7 @@ Index: Python-2.7.2/Makefile.pre.in
 +endif
 +endif
 +
-+ifeq (@SQLITE3@,yes)
-+LIBSUBDIRS += sqlite3
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += sqlite3/test
-+endif
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 Index: Python-2.7.2/configure.in
diff --git a/package/python/python-2.7-103-optional-sqlite.patch b/package/python/python-2.7-103-optional-sqlite.patch
index 4172bae..a915c55 100644
--- a/package/python/python-2.7-103-optional-sqlite.patch
+++ b/package/python/python-2.7-103-optional-sqlite.patch
@@ -1,10 +1,12 @@
 Add option to disable the sqlite3 module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
+ Makefile.pre.in |   24 +++++++++++++++++-------
  configure.in |    9 +++++++++
- 1 file changed, 9 insertions(+)
+ 2 file changed, 9 insertions(+)
 
 Index: Python-2.7.2/configure.in
 ===================================================================
@@ -26,3 +28,30 @@ Index: Python-2.7.2/configure.in
  AC_SUBST(PYDOC)
  
  AC_ARG_ENABLE(pydoc,
+Index: Python-2.7.2/Makefile.pre.in
+===================================================================
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -875,7 +874,7 @@
+ 		lib-tk/test/test_ttk test test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
+ 		test/tracedmodules email/test email/test/data \
+-		json/tests sqlite3/test bsddb/test \
++		json/tests  bsddb/test \
+ 		ctypes/test distutils/tests unittest/test
+ endif
+ 
+@@ -884,6 +882,13 @@
+ LIBSUBDIRS += pydoc_data
+ endif
+ 
++ifeq (@SQLITE3@,yes)
++LIBSUBDIRS += sqlite3
++ifeq (@TEST_MODULES@,yes)
++LIBSUBDIRS += sqlite3/test
++endif
++endif
++
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
diff --git a/package/python/python-2.7-104-optional-tk.patch b/package/python/python-2.7-104-optional-tk.patch
index 12f1236..9333e33 100644
--- a/package/python/python-2.7-104-optional-tk.patch
+++ b/package/python/python-2.7-104-optional-tk.patch
@@ -1,6 +1,7 @@
 Add an option to disable the tk module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
  Makefile.pre.in |   14 ++++++++++----
@@ -42,7 +43,7 @@ Index: Python-2.7.2/Makefile.pre.in
 +endif
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 Index: Python-2.7.2/configure.in
diff --git a/package/python/python-2.7-105-optional-curses.patch b/package/python/python-2.7-105-optional-curses.patch
index e3705cb..7f8da7c 100644
--- a/package/python/python-2.7-105-optional-curses.patch
+++ b/package/python/python-2.7-105-optional-curses.patch
@@ -1,6 +1,7 @@
 Add an option to disable the curses module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
  Makefile.pre.in |    6 +++++-
@@ -28,7 +29,7 @@ Index: Python-2.7.2/Makefile.pre.in
 +LIBSUBDIRS += curses
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 Index: Python-2.7.2/configure.in
diff --git a/package/python/python-2.7-106-optional-expat.patch b/package/python/python-2.7-106-optional-expat.patch
index be1b4a3..2d8ae74 100644
--- a/package/python/python-2.7-106-optional-expat.patch
+++ b/package/python/python-2.7-106-optional-expat.patch
@@ -7,6 +7,7 @@ builtin the Python sources, or no expat at all (which disables the
 installation of XML modules).
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
  Makefile.pre.in |    6 +++++-
@@ -35,7 +36,7 @@ Index: Python-2.7.2/Makefile.pre.in
 +LIBSUBDIRS += $(XMLLIBSUBDIRS)
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 Index: Python-2.7.2/configure.in
diff --git a/package/python/python-2.7-110-optional-db.patch b/package/python/python-2.7-110-optional-db.patch
index 0d5ee0c..b32eea9 100644
--- a/package/python/python-2.7-110-optional-db.patch
+++ b/package/python/python-2.7-110-optional-db.patch
@@ -5,6 +5,7 @@ able to build Python without it, this patch adds an option to disable
 the build/installation of this Python module.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 ---
  Makefile.pre.in |   10 ++++++++--
@@ -28,8 +29,8 @@ Index: Python-2.7.2/Makefile.pre.in
  LIBSUBDIRS +=   test test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
  		test/tracedmodules email/test email/test/data \
--		json/tests sqlite3/test bsddb/test \
-+		json/tests sqlite3/test \
+-		json/tests  bsddb/test \
++		json/tests \
  		ctypes/test distutils/tests unittest/test
  endif
  
@@ -44,7 +45,7 @@ Index: Python-2.7.2/Makefile.pre.in
 +endif
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
+ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 Index: Python-2.7.2/configure.in
diff --git a/package/python/python.mk b/package/python/python.mk
index e0ec9bb..6e960cd 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).2
+PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).3
 PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE       = Python software foundation license v2, others
-- 
1.8.0.1
