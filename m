From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:50 -0000
Subject: [Buildroot] [git commit branch/next] openipmi: don't search host
	library path
Message-ID: <20150808105639.5521B803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed7a55c4ef0f36289bdd94f722c88b3cc715afa7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch removing search of host library path.

Fixes:
http://autobuild.buildroot.net/results/bb9/bb9a5d4f2058765a3630170a11ee087c9c289c3d/
http://autobuild.buildroot.net/results/0b3/0b37f7648bed99bcb1b5bf727171ccc83283d01e/
http://autobuild.buildroot.net/results/5f7/5f7e6b3279d0e78e3298cdfe7db595e5043ff685/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Avoid-searching-host-library-path.patch   |   52 ++++++++++++++++++++
 package/openipmi/openipmi.mk                       |    2 +
 2 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/openipmi/0001-Avoid-searching-host-library-path.patch b/package/openipmi/0001-Avoid-searching-host-library-path.patch
new file mode 100644
index 0000000..9a51d97
--- /dev/null
+++ b/package/openipmi/0001-Avoid-searching-host-library-path.patch
@@ -0,0 +1,52 @@
+From ca6e99d9fa4bf503a883407e964eaad5e18d51c7 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 22 Jul 2015 07:04:33 +0300
+Subject: [PATCH] Avoid searching host library path
+
+The $(libdir) variable points to the location of the directory on the target
+system, /usr/lib by default. When cross compiling this directory contains the
+host libraries which may be different than target libraries. Don't use
+$(libdir) in the library search path.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ cmdlang/Makefile.am | 2 +-
+ unix/Makefile.am    | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
+index e80090dd0c6f..b59ff244b9a8 100644
+--- a/cmdlang/Makefile.am
++++ b/cmdlang/Makefile.am
+@@ -16,7 +16,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
+ 	$(top_builddir)/utils/libOpenIPMIutils.la \
+ 	$(top_builddir)/lib/libOpenIPMI.la
+ libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIcmdlang.map -L$(libdir)
++	-Wl,-Map -Wl,libOpenIPMIcmdlang.map
+ 
+ bin_PROGRAMS = openipmish
+ 
+diff --git a/unix/Makefile.am b/unix/Makefile.am
+index a7921477e1c4..a108bc679c9a 100644
+--- a/unix/Makefile.am
++++ b/unix/Makefile.am
+@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
+ libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
+ 	$(top_builddir)/utils/libOpenIPMIutils.la
+ libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIpthread.map -L$(libdir)
++	-Wl,-Map -Wl,libOpenIPMIpthread.map
+ 
+ libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
+ libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
+ 	$(GDBM_LIB)
+ libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-Wl,-Map -Wl,libOpenIPMIposix.map -L$(libdir)
++	-Wl,-Map -Wl,libOpenIPMIposix.map
+ 
+ noinst_HEADERS = heap.h
+ 
+-- 
+2.1.4
+
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index b6abf0f..4a813ad 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -10,6 +10,8 @@ OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
 OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
+# Patching Makefile.am
+OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
 	--with-glib=no \
