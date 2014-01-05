From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  5 Jan 2014 16:00:39 -0300
Subject: [Buildroot] [PATCH] dbus-cpp: fix cross build for tools when expat
	is missing
Message-ID: <1388948439-9882-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dbus-c++ tools use CXX_FOR_BUILD to build in cross scenarios, however
they don't use CXXFLAGS_FOR_BUILD nor LDFLAGS_FOR_BUILD thus breaking
when there aren't any expat devel files in the default PATHs (build
host). Fixes:
http://autobuild.buildroot.net/results/44f/44fc2cab2b60aa82460bb46b1035ddda115af750/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../dbus-cpp-0002-cxxflags-ldflags-for-build.patch | 32 ++++++++++++++++++++++
 package/dbus-cpp/dbus-cpp.mk                       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 package/dbus-cpp/dbus-cpp-0002-cxxflags-ldflags-for-build.patch

diff --git a/package/dbus-cpp/dbus-cpp-0002-cxxflags-ldflags-for-build.patch b/package/dbus-cpp/dbus-cpp-0002-cxxflags-ldflags-for-build.patch
new file mode 100644
index 0000000..fefb969
--- /dev/null
+++ b/package/dbus-cpp/dbus-cpp-0002-cxxflags-ldflags-for-build.patch
@@ -0,0 +1,32 @@
+Use CXXFLAGS_FOR_BUILD and LDFLAGS_FOR_BUILD for the tools since expat
+may not be living in the default include & library path.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libdbus-c++-0.9.0.orig/configure.ac libdbus-c++-0.9.0/configure.ac
+--- libdbus-c++-0.9.0.orig/configure.ac	2014-01-05 15:28:03.653886567 -0300
++++ libdbus-c++-0.9.0/configure.ac	2014-01-05 15:44:32.571172225 -0300
+@@ -65,7 +65,11 @@
+ AC_PROG_CXX
+ 
+ CXX_FOR_BUILD=${CXX_FOR_BUILD-${CXX}}
++CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
++LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
+ AC_SUBST(CXX_FOR_BUILD)
++AC_SUBST(CXXFLAGS_FOR_BUILD)
++AC_SUBST(LDFLAGS_FOR_BUILD)
+ 
+ AM_PROG_LIBTOOL
+ 
+diff -Nura libdbus-c++-0.9.0.orig/tools/Makefile.am libdbus-c++-0.9.0/tools/Makefile.am
+--- libdbus-c++-0.9.0.orig/tools/Makefile.am	2014-01-05 15:28:03.652886535 -0300
++++ libdbus-c++-0.9.0/tools/Makefile.am	2014-01-05 15:44:42.071482390 -0300
+@@ -1,6 +1,8 @@
+ # hacky, but ...
+ 
+ CXX = $(CXX_FOR_BUILD)
++CXXFLAGS = $(CXXFLAGS_FOR_BUILD)
++LDFLAGS = $(LDFLAGS_FOR_BUILD)
+ 
+ AM_CPPFLAGS = \
+ 	$(dbus_CFLAGS) \
diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
index 7936abd..4cf6d18 100644
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -15,6 +15,7 @@ DBUS_CPP_CONF_OPT = --disable-examples --disable-tests --disable-doxygen-docs \
 	--with-build-libdbus-cxx=$(HOST_DBUS_CPP_BUILDDIR)
 HOST_DBUS_CPP_CONF_OPT = --disable-examples --disable-tests \
 	--disable-doxygen-docs --disable-ecore --disable-glib
+DBUS_CPP_AUTORECONF = YES
 DBUS_CPP_LICENSE = LGPLv2.1+
 DBUS_CPP_LICENSE_FILES = COPYING
 
-- 
1.8.3.2
