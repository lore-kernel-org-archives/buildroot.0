From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:06:59 +0200
Subject: [Buildroot] [git commit] package/libplist: fix python support
Message-ID: <20141005120710.D4346B07B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5fb6e17235a1ea47af7e85e640fb34a886aeb95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch:
- fixes the python3 support detection in the libplist CMake code;
- correctly sets the dependencies and configure options in libplist.mk.

Fixes:
  http://autobuild.buildroot.net/results/efb/efba806b9a40a5e9c6bca7e591747ca2102fa1d5/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...support-python2-and-python3-when-defining.patch |   27 ++++++++++++++++++++
 package/libplist/libplist.mk                       |   13 +++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch b/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch
new file mode 100644
index 0000000..a5218e8
--- /dev/null
+++ b/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch
@@ -0,0 +1,27 @@
+From 114d242a3b6b749b404cda80304e621556325d34 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 5 Oct 2014 10:13:06 +0200
+Subject: [PATCH] cmake: swig: support python2 and python3 when defining
+ DISTUTILS_PYTHON_ILIBRARY_PATH
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ swig/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/swig/CMakeLists.txt b/swig/CMakeLists.txt
+index 379cb95..ae6f0e7 100644
+--- a/swig/CMakeLists.txt
++++ b/swig/CMakeLists.txt
+@@ -9,7 +9,7 @@ SWIG_ADD_MODULE( plist python plist.i )
+ SWIG_LINK_LIBRARIES( plist plist plist++ ${PYTHON_LIBRARIES} )
+ 
+ EXEC_PROGRAM("${PYTHON_EXECUTABLE}"
+-    ARGS "-c 'try:\n import distutils.sysconfig; print distutils.sysconfig.get_python_lib(plat_specific=1)\nexcept: pass\n'"
++    ARGS "-c 'from __future__ import print_function\ntry:\n import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(plat_specific=1))\nexcept: pass\n'"
+     OUTPUT_VARIABLE DISTUTILS_PYTHON_ILIBRARY_PATH
+     )
+ 
+-- 
+2.1.2
+
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 87f09c6..1e44fff 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -12,4 +12,17 @@ LIBPLIST_MAKE = $(MAKE1)
 LIBPLIST_LICENSE = LGPLv2.1+
 LIBPLIST_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+LIBPLIST_DEPENDENCIES += \
+	python$(if $(BR2_PACKAGE_PYTHON3),3) \
+	host-swig
+LIBPLIST_CONF_OPTS += \
+	-DENABLE_PYTHON=ON \
+	-DSWIG_EXECUTABLE=$(SWIG)
+else
+LIBPLIST_CONF_OPTS += \
+	-DENABLE_PYTHON=OFF \
+	-DSWIG_EXECUTABLE=SWIG_EXECUTABLE-NOTFOUND
+endif
+
 $(eval $(cmake-package))
