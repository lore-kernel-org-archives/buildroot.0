From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  2 Nov 2016 02:55:06 -0400
Subject: [Buildroot] [PATCH v4 2/4] lttng-babeltrace: bump to version 1.4.0
In-Reply-To: <20161102065508.3162-1-eeppeliteloop@gmail.com>
References: <20161102065508.3162-1-eeppeliteloop@gmail.com>
Message-ID: <20161102065508.3162-3-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current patches are dropped because they were merged upstream.

Official upstream site of Babeltrace for the distribution of tarballs
changed from lttng.org to efficios.com (see
<http://diamon.org/babeltrace>).

Official Babeltrace's website changed from
<http://www.efficios.com/babeltrace> to <http://diamon.org/babeltrace>.

I explicitly disable the support for debug informations in this patch to
add it in a separate patch.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
Changes v3 -> v4:
  - Remove patch related to configure.ac for elfutils (not needed here
  	since debug infos are disabled).
  - Fix patch file that does not apply.

Changes v2 -> v3:
  - Add links to original patches in patch files.
  - Do not take care of debug info stuff in this patch.
  - Do not remove the host babeltrace build (needed for the next patch).

Changes v1 -> v2:
  - Detailed commit message.
  - Detailed patch messages.
  - Add comment above `LTTNG_BABELTRACE_AUTORECONF = YES` in
    `lttng-babeltrace.mk`.

 .../0001-no-posix-fallocate-in-uclibc.patch        | 37 -------------
 ...b-Makefile.am-remove-unneeded-static-flag.patch | 36 +++++++++++++
 ...ix-uuid-support-detection-on-static-build.patch | 63 ----------------------
 package/lttng-babeltrace/Config.in                 | 10 ++--
 package/lttng-babeltrace/lttng-babeltrace.hash     | 11 ++--
 package/lttng-babeltrace/lttng-babeltrace.mk       |  9 ++--
 6 files changed, 48 insertions(+), 118 deletions(-)
 delete mode 100644 package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
 create mode 100644 package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
 delete mode 100644 package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch

diff --git a/package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch b/package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
deleted file mode 100644
index d77825f..0000000
--- a/package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Do not call posix_fallocate() on uClibc
-
-uClibc does not implement posix_fallocate(), and posix_fallocate() is
-mostly only an hint to the kernel that we will need such or such
-amount of space inside a file. So we just don't call posix_fallocate()
-when building against uClibc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: add #include <features.h>
----
- formats/ctf/ctf.c |    3 +++
- 1 file changed, 3 insertions(+)
-
-Index: lttng-babeltrace-0.8/formats/ctf/ctf.c
-===================================================================
---- lttng-babeltrace-0.8.orig/formats/ctf/ctf.c
-+++ lttng-babeltrace-0.8/formats/ctf/ctf.c
-@@ -32,6 +32,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <dirent.h>
-+#include <features.h>
- #include <glib.h>
- #include <unistd.h>
- #include <stdlib.h>
-@@ -384,9 +385,11 @@
- 		}
- 		pos->content_size = -1U;	/* Unknown at this point */
- 		pos->packet_size = WRITE_PACKET_LEN;
-+#ifndef __UCLIBC__
- 		off = posix_fallocate(pos->fd, pos->mmap_offset,
- 				      pos->packet_size / CHAR_BIT);
- 		assert(off >= 0);
-+#endif
- 		pos->offset = 0;
- 	} else {
- 	read_next_packet:
diff --git a/package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch b/package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
new file mode 100644
index 0000000..b903d87
--- /dev/null
+++ b/package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
@@ -0,0 +1,36 @@
+From 27e37d2621317d25e08ba0683bf8540b05b9347d Mon Sep 17 00:00:00 2001
+From: Philippe Proulx <eeppeliteloop@gmail.com>
+Date: Fri, 28 Oct 2016 02:09:20 -0400
+Subject: [PATCH] tests/lib/Makefile.am: remove unneeded -static flag
+
+Having those -static flags breaks the build in shared-only builds.
+
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+[Philippe: grabbed from this pull request:
+    https://github.com/efficios/babeltrace/pull/49
+]
+---
+ tests/lib/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tests/lib/Makefile.am b/tests/lib/Makefile.am
+index 33ada16..c685e77 100644
+--- a/tests/lib/Makefile.am
++++ b/tests/lib/Makefile.am
+@@ -31,13 +31,11 @@ check_SCRIPTS = test_seek_big_trace \
+ 		test_ctf_writer_complete
+ 
+ if ENABLE_DEBUG_INFO
+-test_dwarf_LDFLAGS = -static
+ test_dwarf_LDADD = $(LIBTAP) \
+ 	$(top_builddir)/lib/libbabeltrace.la \
+ 	$(top_builddir)/lib/libdebug-info.la
+ test_dwarf_SOURCES = test_dwarf.c
+ 
+-test_bin_info_LDFLAGS = -static
+ test_bin_info_LDADD = $(LIBTAP) \
+ 	$(top_builddir)/lib/libbabeltrace.la \
+ 	$(top_builddir)/lib/libdebug-info.la
+-- 
+2.9.3
+
diff --git a/package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch b/package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
deleted file mode 100644
index 849c0a3..0000000
--- a/package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 670d0961a823df0db28f39a354430f3dc2519418 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 28 May 2016 12:53:33 +0200
-Subject: [PATCH] configure: fix uuid support detection on static build
-
-This change adds uuid support detection using pkg-config, before falling
-back on default AC_CHECK_LIB calls.
-
-Using flags from pkg-config is useful for static build, because they
-also include dependency flags; whereas
-
-AC_CHECK_LIB function achieves its test by trying to link against the
-requested library, without taking care of its dependency
-requirements/flags. Therefore, in case of static build, it can fail on
-the uuid detection like [1], because the uuid's dependency flags
-(regarding gettext) are missing.
-Instead, using pkg-config to do the check will take care of getting and
-setting all required flags.
-
-This change adds uuid detection using pkg-config helper before falling
-back on the standard AC_CHECK_LIB detection for platforms missing
-pkg-config.
-
-This issue [1] has been triggered on Buildroot farms.
-
-[1] http://autobuild.buildroot.net/results/43b/43b98ddf9eb44152ed9ac4a98d887af14831d8da/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- configure.ac | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 632fe39..b344fa8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -65,6 +65,15 @@ esac
- AM_CONDITIONAL([BABELTRACE_BUILD_WITH_MINGW], [test "x$MINGW32" = "xyes"])
- 
- # Check for libuuid
-+PKG_CHECK_MODULES([UUID], [uuid],
-+[
-+	LIBS="${UUID_LIBS} ${LIBS}"
-+	CFLAGS="${CFLAGS} ${UUID_CFLAGS}"
-+	AC_DEFINE_UNQUOTED([BABELTRACE_HAVE_LIBUUID], 1, [Has libuuid support.])
-+	have_libuuid=yes
-+],
-+[
-+# try detecting libuuid without pkg-config
- AC_CHECK_LIB([uuid], [uuid_generate],
- [
- 	AC_DEFINE_UNQUOTED([BABELTRACE_HAVE_LIBUUID], 1, [Has libuuid support.])
-@@ -83,6 +92,7 @@ AC_CHECK_LIB([uuid], [uuid_generate],
- 			AC_MSG_ERROR([Cannot find libuuid uuid_generate nor libc uuid_create. Use [LDFLAGS]=-Ldir to specify their location.])
- 		fi
- 	])
-+])
- ]
- )
- AM_CONDITIONAL([BABELTRACE_BUILD_WITH_LIBUUID], [test "x$have_libuuid" = "xyes"])
--- 
-2.8.3
-
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index d362779..2e8d778 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -14,18 +14,16 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	  to/from another trace format.
 
 	  Babeltrace is the reference implementation of the Common
-	  Trace Format (see <http://diamon.org/docs/ctf/>). Babeltrace
+	  Trace Format (see <http://diamon.org/ctf/>). Babeltrace
 	  can decode and display LTTng traces, since the latter are
 	  written using the CTF format.
 
 	  Having this tool on the target is not mandatory. You can
 	  transfer the binary trace output from the target to your
-	  development workstation, and use babeltrace here. Buildroot
-	  automatically builds a host babeltrace in
-	  $(O)/host/usr/bin/babeltrace as a dependency of the
-	  lttng-tools package.
+	  development workstation, and use babeltrace here. Babeltrace
+	  is packaged for all major Linux distributions.
 
-	  http://www.efficios.com/babeltrace
+	  http://diamon.org/babeltrace
 
 comment "lttng-babeltrace needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
index a9f45b2..bca0bdb 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.hash
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -1,7 +1,6 @@
-# From http://lttng.org/files/babeltrace/babeltrace-1.2.4.tar.bz2.md5
-md5     20a806fa7570e69a91707855a98f3ca6 babeltrace-1.2.4.tar.bz2
-# From http://lttng.org/files/babeltrace/babeltrace-1.2.4.tar.bz2.sha1
-sha1    c72a80e8fd905cb1ae3b0cf88885517faafe0fa1  babeltrace-1.2.4.tar.bz2
-# Locally generated
-sha256  666e3a1ad2dc7d5703059963056e7800f0eab59c8eeb6be2efe4f3acc5209eb1  babeltrace-1.2.4.tar.bz2
+# From http://www.efficios.com/files/babeltrace/babeltrace-1.4.0.tar.bz2.{md5,sha1}
+md5     fa99064048af5c9c6ff00e489ac809c2  babeltrace-1.4.0.tar.bz2
+sha1    3b162480ee883625e8581bf163817f78a4b6487b  babeltrace-1.4.0.tar.bz2
 
+# Locally generated
+sha256  9469eeb22617cd12668683b04c27003e5337e9ac66ade914988df3642fc0d0e4  babeltrace-1.4.0.tar.bz2
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index b2e03a9..291a561 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -4,18 +4,15 @@
 #
 ################################################################################
 
-LTTNG_BABELTRACE_SITE = http://lttng.org/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.2.4
+LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
+LTTNG_BABELTRACE_VERSION = 1.4.0
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
-
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
+LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
 HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
 	host-popt host-util-linux host-libglib2 host-pkgconf
 
-# for 0002-configure-fix-uuid-support-detection-on-static-build.patch
-LTTNG_BABELTRACE_AUTORECONF = YES
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
