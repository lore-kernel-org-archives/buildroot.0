From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:30:52 +0100
Subject: [Buildroot] [git commit] libffi: add patch to fix library
	installation location
Message-ID: <20130208214321.B47C19AA2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80e47a533bed9745f56379e45e4ec136a1590697
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libffi library was installed in a wrong directory when using the
non-default variant of a multilib toolchain. We fix this by patching
the libffi Makefile.am to install its library in a normal
location. The patch has been submitted upstream.

Fixes:

 http://autobuild.buildroot.org/results/471b1d1547c8d726999ba9a865b87fd75429dcab/build-end.log (dbus-glib)
 http://autobuild.buildroot.org/results/eda3ae14eea61e777511fca561f8d43dc7f4a2a5/build-end.log (shared-mime-info)
 http://autobuild.buildroot.org/results/9c86692ae3485d5ae371c695bfbb4a9b67aa2368/build-end.log (librsvg)
 http://autobuild.buildroot.org/results/affd7f20c95f1019d040e2911877694300e3c876/build-end.log (bustle)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...i-001-Fix-installation-location-of-libffi.patch |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/libffi/libffi-001-Fix-installation-location-of-libffi.patch b/package/libffi/libffi-001-Fix-installation-location-of-libffi.patch
new file mode 100644
index 0000000..56e08f7
--- /dev/null
+++ b/package/libffi/libffi-001-Fix-installation-location-of-libffi.patch
@@ -0,0 +1,50 @@
+From 102c02de867bfe831b5366c89d66bcf170db962e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 7 Feb 2013 22:26:56 +0100
+Subject: [PATCH] Fix installation location of libffi
+
+The libffi is currently declared as toolexeclib_LTLIBRARIES. In many
+cases, toolexeclib libraries will be installed in /usr/lib, so it
+doesn't make any difference.
+
+However, with multilib toolchains, they get installed in a
+subdirectory of /usr/lib/. For example, with a Sourcery CodeBench
+PowerPC toolchain, if the e500mc multilib variant is used, the libffi
+library gets installed in /usr/lib/te500mc/. This is due to the
+following code in the configure script:
+
+  multi_os_directory=`$CC -print-multi-os-directory`
+  case $multi_os_directory in
+    .) ;; # Avoid trailing /.
+    *) toolexeclibdir=$toolexeclibdir/$multi_os_directory ;;
+  esac
+
+Once the library is installed in /usr/lib/te500mc/, nothing works
+because this installation location is inconsistent with the
+installation location declared in libffi.pc.
+
+So, instead of using this bizarre toolexeclib_LTLIBRARIES, simply use
+the more standard lib_LTLIBRARIES, which ensures that the libffi
+library is always installed in /usr/lib.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6f669ca..b60bcc1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -93,7 +93,7 @@ FLAGS_TO_PASS = $(AM_MAKEFLAGS)
+ 
+ MAKEOVERRIDES=
+ 
+-toolexeclib_LTLIBRARIES = libffi.la
++lib_LTLIBRARIES = libffi.la
+ noinst_LTLIBRARIES = libffi_convenience.la
+ 
+ libffi_la_SOURCES = src/prep_cif.c src/types.c \
+-- 
+1.7.9.5
+
