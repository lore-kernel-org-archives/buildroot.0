From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 17 Jan 2019 21:36:05 +0100
Subject: [Buildroot] [PATCH 1/1] libmad: needs autoreconf
Message-ID: <20190117203605.7325-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmad uses a very old configure script.

When the toolchain lacks C++ and the build machine lacks /lib/cpp, this
old configure script fails because it can't find a C++ preprocessor that
is valid:

    checking for arm-buildroot-linux-uclibcgnueabi-g++... no
    checking whether we are using the GNU C++ compiler... no
    checking whether no accepts -g... no
    checking dependency style of no... none
    checking how to run the C++ preprocessor... /lib/cpp
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check
    See `config.log' for more details.

This is yet another case that was tentatively fixed by bd39d11d2e
(core/infra: fix build on toolchain without C++), further amended by
4cd1ab15886 (core: alternate solution to disable C++).

However, this only works on libtool scripts that are recent enough, and
thus we need to autoreconf to get it.

We also need to patch configure.ac so that it does not fail on the
missing, GNU-specific files: NEWS, AUTHORS, and Changelog.

Fixes:
 - http://autobuild.buildroot.org/results/6a6aa29295bd70679c3a22a149e79010fa20c1bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmad/0006-configure-ac-automake-foreign.patch | 16 ++++++++++++++++
 package/libmad/libmad.mk                                |  8 +++-----
 2 files changed, 19 insertions(+), 5 deletions(-)
 create mode 100644 package/libmad/0006-configure-ac-automake-foreign.patch

diff --git a/package/libmad/0006-configure-ac-automake-foreign.patch b/package/libmad/0006-configure-ac-automake-foreign.patch
new file mode 100644
index 0000000000..828ad0c152
--- /dev/null
+++ b/package/libmad/0006-configure-ac-automake-foreign.patch
@@ -0,0 +1,16 @@
+configure.ac: don't require GNU-specific files when running automake
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -ur libmad-0.15.1b-orig/configure.ac libmad-0.15.1b/configure.ac
+--- libmad-0.15.1b-orig/configure.ac	2019-01-17 21:24:52.259194527 +0100
++++ libmad-0.15.1b/configure.ac	2019-01-17 21:25:32.779481058 +0100
+@@ -26,7 +26,7 @@
+ 
+ AC_CONFIG_SRCDIR([decoder.h])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER([config.h])
+ 
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 7175eaa30e..108c4f641b 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -13,17 +13,15 @@ LIBMAD_LICENSE_FILES = COPYING
 LIBMAD_PATCH = \
 	https://sources.debian.net/data/main/libm/libmad/0.15.1b-8/debian/patches/frame_length.diff
 
-define LIBMAD_PREVENT_AUTOMAKE
-	# Prevent automake from running.
-	(cd $(@D); touch -c config* aclocal.m4 Makefile*);
-endef
+# Force autoreconf to be able to use a more recent libtool script, that
+# is able to properly behave in the face of a missing C++ compiler.
+LIBMAD_AUTORECONF = YES
 
 define LIBMAD_INSTALL_STAGING_PC
 	$(INSTALL) -D package/libmad/mad.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
 endef
 
-LIBMAD_POST_PATCH_HOOKS += LIBMAD_PREVENT_AUTOMAKE
 LIBMAD_POST_INSTALL_STAGING_HOOKS += LIBMAD_INSTALL_STAGING_PC
 
 LIBMAD_CONF_OPTS = \
-- 
2.14.1
