From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:32:41 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/dbus-cpp: fix
	cross-compilation
Message-ID: <20170331071606.3A265826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55a23407aff9ab0b3e3c72b7c5fd6c8873a910d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

dbus-cpp has an ugly hack to not cross-build the tools when it detects
cross-compilation.

However, we already have a host variant that builds those tools (and we
anyway don't seem to need them to begin with).

Drop our patch that propagates the CXXFLAGS/LDFLAGS_FOR_BUILD. Replace
with a patch to cross-compile the tools.

Fixes:
    http://autobuild.buildroot.org/results/110/1100539caae6ef62c61a3b96bc54f7c0a215cc62/
    and many, many more.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f5dbd0dea159393e779f6a1f5fa53b9fa07ff34a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-cpp/0002-cross-compile-tools.patch    | 34 ++++++++++++++++++++++
 .../dbus-cpp/0002-cxxflags-ldflags-for-build.patch | 32 --------------------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/package/dbus-cpp/0002-cross-compile-tools.patch b/package/dbus-cpp/0002-cross-compile-tools.patch
new file mode 100644
index 0000000..39eff31
--- /dev/null
+++ b/package/dbus-cpp/0002-cross-compile-tools.patch
@@ -0,0 +1,34 @@
+tools: just do proper cross-compile
+
+Those tools are not used during the build; besides, they are installed.
+
+So they don't need to not be cross-compiled.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Upstream status: not submitted, upstream is dead.
+
+diff -durN dbus-cpp-0.9.0.orig/tools/Makefile.am dbus-cpp-0.9.0/tools/Makefile.am
+--- dbus-cpp-0.9.0.orig/tools/Makefile.am	2017-03-21 21:48:57.013409423 +0100
++++ dbus-cpp-0.9.0/tools/Makefile.am	2017-03-21 21:49:35.329979798 +0100
+@@ -1,7 +1,3 @@
+-# hacky, but ...
+-
+-CXX = $(CXX_FOR_BUILD)
+-
+ AM_CPPFLAGS = \
+ 	$(dbus_CFLAGS) \
+ 	$(xml_CFLAGS) \
+@@ -9,11 +3,7 @@
+ 	-I$(top_builddir)/include \
+ 	-Wall
+ 
+-if CROSS_COMPILING
+-libdbus_cxx_la = $(BUILD_LIBDBUS_CXX_DIR)/src/libdbus-c++-1.la
+-else
+ libdbus_cxx_la = $(top_builddir)/src/libdbus-c++-1.la
+-endif
+ 
+ bin_PROGRAMS = dbusxx-xml2cpp dbusxx-introspect
+ 
diff --git a/package/dbus-cpp/0002-cxxflags-ldflags-for-build.patch b/package/dbus-cpp/0002-cxxflags-ldflags-for-build.patch
deleted file mode 100644
index fefb969..0000000
--- a/package/dbus-cpp/0002-cxxflags-ldflags-for-build.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Use CXXFLAGS_FOR_BUILD and LDFLAGS_FOR_BUILD for the tools since expat
-may not be living in the default include & library path.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libdbus-c++-0.9.0.orig/configure.ac libdbus-c++-0.9.0/configure.ac
---- libdbus-c++-0.9.0.orig/configure.ac	2014-01-05 15:28:03.653886567 -0300
-+++ libdbus-c++-0.9.0/configure.ac	2014-01-05 15:44:32.571172225 -0300
-@@ -65,7 +65,11 @@
- AC_PROG_CXX
- 
- CXX_FOR_BUILD=${CXX_FOR_BUILD-${CXX}}
-+CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
-+LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
- AC_SUBST(CXX_FOR_BUILD)
-+AC_SUBST(CXXFLAGS_FOR_BUILD)
-+AC_SUBST(LDFLAGS_FOR_BUILD)
- 
- AM_PROG_LIBTOOL
- 
-diff -Nura libdbus-c++-0.9.0.orig/tools/Makefile.am libdbus-c++-0.9.0/tools/Makefile.am
---- libdbus-c++-0.9.0.orig/tools/Makefile.am	2014-01-05 15:28:03.652886535 -0300
-+++ libdbus-c++-0.9.0/tools/Makefile.am	2014-01-05 15:44:42.071482390 -0300
-@@ -1,6 +1,8 @@
- # hacky, but ...
- 
- CXX = $(CXX_FOR_BUILD)
-+CXXFLAGS = $(CXXFLAGS_FOR_BUILD)
-+LDFLAGS = $(LDFLAGS_FOR_BUILD)
- 
- AM_CPPFLAGS = \
- 	$(dbus_CFLAGS) \
