Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C9DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EBD185940;
	Fri, 28 Feb 2025 17:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fwB6kSt4Cuu; Fri, 28 Feb 2025 17:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 728DA8561D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 728DA8561D;
	Fri, 28 Feb 2025 17:13:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D76268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7AE242F33
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FJgm7b5Vz1X for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D222E42F7D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D222E42F7D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB26085E25; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:16:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7f6d8881050558b768bce014f6b313e17f587f7e
X-Git-Newrev: 11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.CB26085E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{gobject-introspection,
 libglib2}: bump to {1.82.0, 2.82.4}
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5691606958852906533=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5691606958852906533==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There are a lot of interconnected changes in these releases:

Since 2.79.0, the introspection (i11n) data for libglib2 was moved out
of gobject-introspection (GOI) and into libglib2 itself, thus building
libglib2 with i11n needs tools provided by GOI [0].

However, GOI needs libglib2, but it is content with a libglib2 that
does not have i11n. So we introduce a new package, libglib2-bootstrap,
that provides a minimalist libglib2 that is enough to build GOI, build
GOI, then build the final, complete libglib2 with i11n.

However, not every package needs i11n, so we make that optional: if GOI
is enabled, libglib2 will have i11n, otherwise it won't.

This means the dependency ordering has changed: GOI used to
build-depend on libglib2, but now that's the other way around. This
will cause issues with packages that build-depend only on GOI and then
expect a libglib2 with i11n; those will only get a basic libglib2
without i11n at build time, but a full one at runtime. Those packages
will have to be fixed to also include a build dependency on libglib2.

The version bump between libglib2 and GOI must be done in lock-step,
because newer GOI does not support an older libglib2 and, as seen
above, newer libglib2 has the data previously provided by older GOI.

As a consequence of now generating its own i11n data, libglib2 needs to
be able to run target programs during the build, to extract data layout
and generate i11n data, a bit like GOI does [1]. So we provide a qemu
wrapper similar to the one in nodejs-src, and use that as meson's
exe_wrapper.

Except for our first patch, the other libglib2 patches were backports,
and are present upstream already, so we can drop them; the first patch
needs being refreshed.

We also move the remaining patch to a versioned sub-directory, so that
it is easier to share the patches between libglib2-bootstrap and
libglib2, should we need to add more patches in the future.

Drop the "giscanner: remove dependency on distutils.msvccompile"
patch, included upstream.

Updated hash for giscanner/scannerlexer.l is due to code changes, no
change in license, see [2] (two commits in 2024).

[0] https://gitlab.gnome.org/GNOME/glib/-/blob/2.79.0/NEWS?ref_type=tags#L8-17
[1] technically, this should not be needed if libglib2 only uses the
    wrappers provided by GOI: g-ir-scanner et al. However, its
    meson.build explicitly checks that it can run generated binaries
    through the exe_wrapper. Investigating if that's really needed is
    left as an exercise for the interested party: in practice, we will
    have to be able to run via host-qemu, so this does not add any build
    time overhead.
[2] https://gitlab.gnome.org/GNOME/gobject-introspection/-/commits/1.82.0/giscanner/scannerlexer.l?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host                             |   1 +
 ...emove-dependency-on-distutils.msvccompile.patch | 104 ---------------------
 package/gobject-introspection/Config.in            |   3 +-
 package/gobject-introspection/Config.in.host       |   2 +
 .../gobject-introspection.hash                     |   6 +-
 .../gobject-introspection/gobject-introspection.mk |  17 +++-
 ...or-format-in-gio-gunixconnection.c-part-2.patch |  93 ------------------
 ...html-documentation-generation-with-gtk_do.patch |  96 -------------------
 ...etection-of-a-system-provided-proxy-libin.patch |  53 -----------
 .../0005-meson-try-iconv-in-libintl-lookup.patch   |  53 -----------
 .../0006-link-with-latomic-when-needed.patch       |  52 -----------
 ...-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch |  38 ++++----
 package/libglib2/Config.in                         |   4 +
 package/libglib2/libglib2-bootstrap/2.82.0         |   1 +
 package/libglib2/libglib2-bootstrap/Config.in      |   9 ++
 .../libglib2-bootstrap/libglib2-bootstrap.hash     |   1 +
 .../libglib2-bootstrap/libglib2-bootstrap.mk       |  77 +++++++++++++++
 package/libglib2/libglib2-qemu-wrapper.in          |   9 ++
 package/libglib2/libglib2.hash                     |   4 +-
 package/libglib2/libglib2.mk                       |  31 +++++-
 20 files changed, 172 insertions(+), 482 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index e06824ad6b..90b161eeab 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -47,6 +47,7 @@ menu "Host utilities"
 	source "package/gnupg/Config.in.host"
 	source "package/gnupg2/Config.in.host"
 	source "package/go/Config.in.host"
+	source "package/gobject-introspection/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch b/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
deleted file mode 100644
index a3231a5ad6..0000000000
--- a/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From c8310afa42dfa598097eb0e003cef7965b5ed7be Mon Sep 17 00:00:00 2001
-From: Christoph Reiter <reiter.christoph@gmail.com>
-Date: Wed, 28 Aug 2024 21:26:02 +0200
-Subject: [PATCH] giscanner: remove dependency on distutils.msvccompiler
-
-It was removed with setuptools 74.0.0. Since we still depend on the
-MSVCCompiler class use new_compiler() to get it some other way.
-
-Remove any reference to MSVC9Compiler, which was for Visual Studio 2008
-which we no longer support anyway.
-
-Fixes #515
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a2139dba59eac283a7f543ed737f038deebddc19
----
- giscanner/ccompiler.py    |  7 +++----
- giscanner/msvccompiler.py | 14 +++++++-------
- 2 files changed, 10 insertions(+), 11 deletions(-)
-
-diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index 2912fe0e..766c9a36 100644
---- a/giscanner/ccompiler.py
-+++ b/giscanner/ccompiler.py
-@@ -26,7 +26,6 @@ import tempfile
- import sys
- import distutils
- 
--from distutils.msvccompiler import MSVCCompiler
- from distutils.unixccompiler import UnixCCompiler
- from distutils.cygwinccompiler import Mingw32CCompiler
- from distutils.sysconfig import get_config_vars
-@@ -167,7 +166,7 @@ class CCompiler(object):
-         # Now, create the distutils ccompiler instance based on the info we have.
-         if compiler_name == 'msvc':
-             # For MSVC, we need to create a instance of a subclass of distutil's
--            # MSVC9Compiler class, as it does not provide a preprocess()
-+            # MSVCCompiler class, as it does not provide a preprocess()
-             # implementation
-             from . import msvccompiler
-             self.compiler = msvccompiler.get_msvc_compiler()
-@@ -453,7 +452,7 @@ class CCompiler(object):
-             return self.compiler.linker_exe
- 
-     def check_is_msvc(self):
--        return isinstance(self.compiler, MSVCCompiler)
-+        return self.compiler.compiler_type == "msvc"
- 
-     # Private APIs
-     def _set_cpp_options(self, options):
-@@ -479,7 +478,7 @@ class CCompiler(object):
-                     # macros for compiling using distutils
-                     # get dropped for MSVC builds, so
-                     # escape the escape character.
--                    if isinstance(self.compiler, MSVCCompiler):
-+                    if self.check_is_msvc():
-                         macro_value = macro_value.replace('\"', '\\\"')
-                 macros.append((macro_name, macro_value))
-             elif option.startswith('-U'):
-diff --git a/giscanner/msvccompiler.py b/giscanner/msvccompiler.py
-index 0a543982..e333a80f 100644
---- a/giscanner/msvccompiler.py
-+++ b/giscanner/msvccompiler.py
-@@ -19,30 +19,30 @@
- #
- 
- import os
--import distutils
-+from typing import Type
- 
- from distutils.errors import DistutilsExecError, CompileError
--from distutils.ccompiler import CCompiler, gen_preprocess_options
-+from distutils.ccompiler import CCompiler, gen_preprocess_options, new_compiler
- from distutils.dep_util import newer
- 
- # Distutil's MSVCCompiler does not provide a preprocess()
- # Implementation, so do our own here.
- 
- 
-+DistutilsMSVCCompiler: Type = type(new_compiler(compiler="msvc"))
-+
-+
- def get_msvc_compiler():
-     return MSVCCompiler()
- 
- 
--class MSVCCompiler(distutils.msvccompiler.MSVCCompiler):
-+class MSVCCompiler(DistutilsMSVCCompiler):
- 
-     def __init__(self, verbose=0, dry_run=0, force=0):
--        super(distutils.msvccompiler.MSVCCompiler, self).__init__()
-+        super(DistutilsMSVCCompiler, self).__init__()
-         CCompiler.__init__(self, verbose, dry_run, force)
-         self.__paths = []
-         self.__arch = None  # deprecated name
--        if os.name == 'nt':
--            if isinstance(self, distutils.msvc9compiler.MSVCCompiler):
--                self.__version = distutils.msvc9compiler.VERSION
-         self.initialized = False
-         self.preprocess_options = None
-         if self.check_is_clang_cl():
--- 
-2.34.1
-
diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 681655c2d4..7b47c9561e 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -28,10 +28,11 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# unconditionally to the target when building
 	# gobject-introspection.
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_HOST_QEMU
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	select BR2_PACKAGE_LIBFFI
-	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGLIB2_BOOTSTRAP
 	select BR2_PACKAGE_ZLIB
 	help
 	  GObject introspection is a middleware layer between C
diff --git a/package/gobject-introspection/Config.in.host b/package/gobject-introspection/Config.in.host
new file mode 100644
index 0000000000..df77338b52
--- /dev/null
+++ b/package/gobject-introspection/Config.in.host
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION
+	bool
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 063b96275d..c39c06d102 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.76/gobject-introspection-1.76.1.sha256sum
-sha256  196178bf64345501dcdc4d8469b36aa6fe80489354efe71cb7cb8ab82a3738bf  gobject-introspection-1.76.1.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.82/gobject-introspection-1.82.0.sha256sum
+sha256  0f5a4c1908424bf26bc41e9361168c363685080fbdb87a196c891c8401ca2f09  gobject-introspection-1.82.0.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
-sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
+sha256  fb538e24d22de4f8dab6b48b862be84469bcc089e1cf98f6f46d6f74f6f44655  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index b1b44d0b4f..eb46fb61c1 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,27 +4,32 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.76
-GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.82
+GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
 GOBJECT_INTROSPECTION_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-2-Clause
 GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scannerlexer.l
 
+# gobject-introspection depends on the bootstrap version of libglib2
+# during the build because the full version depends on
+# gobject-introspection (applies to target and host packages
+# alike). "select BR2_PACKAGE_LIBGLIB2" in Config.in ensures the full
+# libglib2 gets installed together with gobject-introspection.
 GOBJECT_INTROSPECTION_DEPENDENCIES = \
 	host-autoconf-archive \
 	host-gobject-introspection \
 	host-qemu \
 	libffi \
-	libglib2 \
+	libglib2-bootstrap \
 	python3 \
 	zlib
 
 HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
 	host-bison \
 	host-flex \
-	host-libglib2 \
+	host-libglib2-bootstrap \
 	host-python3
 
 # g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
@@ -117,7 +122,9 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 	# causes the host /usr/share being used instead of $(STAGING_DIR)/usr/share.
 	# Change datadir to $(libdir)/../share which will prefix $(STAGING_DIR)
 	# to the correct location.
-	$(SED) "s%^datadir=.*%datadir=\$${libdir}/../share%g" \
+	# Since we use libdir to define datadir, we must define datadir after
+	# libdir is defined.
+	$(SED) "\%^datadir=%d; s%^\(libdir=.*\)$$%\1\ndatadir=\$${libdir}/../share%" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
 	# By default, girdir and typelibdir use datadir and libdir as their prefix,
diff --git a/package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch b/package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
deleted file mode 100644
index 6075bacb06..0000000000
--- a/package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 4ae8606b6f80f9764e1f0a82cea7e23c8af487ae Mon Sep 17 00:00:00 2001
-From: James Knight <james.d.knight@live.com>
-Date: Thu, 20 Apr 2023 23:41:32 -0400
-Subject: [PATCH] Fix error format in gio/gunixconnection.c (part 2)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Update a series of error messages to use `g_set_error_literal` instead
-of `g_set_error`. This should prevent `format-nonliteral` compiler
-issues when `-Werror` is configured:
-
-    ../gio/gunixconnection.c: In function ‘g_unix_connection_receive_fd’:
-    ../gio/gunixconnection.c:183:9: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-      183 |         nscm);
-          |         ^~~~
-    ../gio/gunixconnection.c:217:20: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-      217 |                    nfd);
-          |                    ^~~
-    ../gio/gunixconnection.c: In function ‘g_unix_connection_receive_credentials’:
-    ../gio/gunixconnection.c:601:24: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-      601 |                        nscm);
-          |                        ^~~~
-
-This is similar to a previous change [1] made to `gunixconnection.c`.
-
-[1]: 44b3d5d80445234041f6c59feb89645f7102c3a4
-
-Signed-off-by: James Knight <james.d.knight@live.com>
-Upstream: backport from upstream https://gitlab.gnome.org/GNOME/glib/-/commit/4ae8606b6f80f9764e1f0a82cea7e23c8af487ae
----
- gio/gunixconnection.c | 31 ++++++++++++++-----------------
- 1 file changed, 14 insertions(+), 17 deletions(-)
-
-diff --git a/gio/gunixconnection.c b/gio/gunixconnection.c
-index b3f2b1c04b0abdf7136918585ae4cea8970a88bb..c012fcbfe00b69e9da609c7b626229db98e931ac 100644
---- a/gio/gunixconnection.c
-+++ b/gio/gunixconnection.c
-@@ -176,11 +176,10 @@ g_unix_connection_receive_fd (GUnixConnection  *connection,
-     {
-       gint i;
- 
--      g_set_error (error, G_IO_ERROR, G_IO_ERROR_FAILED,
--        ngettext("Expecting 1 control message, got %d",
--                 "Expecting 1 control message, got %d",
--                 nscm),
--        nscm);
-+      g_set_error_literal (error, G_IO_ERROR, G_IO_ERROR_FAILED,
-+                           ngettext ("Expecting 1 control message, got %d",
-+                                     "Expecting 1 control message, got %d",
-+                                     nscm));
- 
-       for (i = 0; i < nscm; i++)
-         g_object_unref (scms[i]);
-@@ -210,11 +209,10 @@ g_unix_connection_receive_fd (GUnixConnection  *connection,
-     {
-       gint i;
- 
--      g_set_error (error, G_IO_ERROR, G_IO_ERROR_FAILED,
--                   ngettext("Expecting one fd, but got %d\n",
--                            "Expecting one fd, but got %d\n",
--                            nfd),
--                   nfd);
-+      g_set_error_literal (error, G_IO_ERROR, G_IO_ERROR_FAILED,
-+                           ngettext ("Expecting one fd, but got %d\n",
-+                                     "Expecting one fd, but got %d\n",
-+                                     nfd));
- 
-       for (i = 0; i < nfd; i++)
-         close (fds[i]);
-@@ -592,13 +590,12 @@ g_unix_connection_receive_credentials (GUnixConnection      *connection,
-     {
-       if (nscm != 1)
-         {
--          g_set_error (error,
--                       G_IO_ERROR,
--                       G_IO_ERROR_FAILED,
--                       ngettext("Expecting 1 control message, got %d",
--                                "Expecting 1 control message, got %d",
--                                nscm),
--                       nscm);
-+          g_set_error_literal (error,
-+                               G_IO_ERROR,
-+                               G_IO_ERROR_FAILED,
-+                               ngettext ("Expecting 1 control message, got %d",
-+                                         "Expecting 1 control message, got %d",
-+                                         nscm));
-           goto out;
-         }
- 
--- 
-2.39.1.windows.1
-
diff --git a/package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch b/package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
deleted file mode 100644
index 0fa15ad164..0000000000
--- a/package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 0fa17ec3c7152cf0e1cbf965acf1426ac203bb1d Mon Sep 17 00:00:00 2001
-From: James Knight <james.d.knight@live.com>
-Date: Thu, 27 Apr 2023 20:23:30 -0400
-Subject: [PATCH] meson: wrap html documentation generation with gtk_doc option
-
-By default, if a host environment has the `rst2html5` application
-available, builds will automatically perform some HTML documentation
-generation from the documentation's glib reference content (e.g.
-creating `gvariant-specification-1.0.html`). The creation of this
-documentation is not required for all use cases.
-
-This commit tweaks the building of the HTML-based GLIB specification
-document to be guarded by `gtk_doc`.
-
-Signed-off-by: James Knight <james.d.knight@live.com>
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/0fa17ec3c7152cf0e1cbf965acf1426ac203bb1d
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- docs/reference/glib/meson.build | 58 +++++++++++++++++----------------
- 1 file changed, 30 insertions(+), 28 deletions(-)
-
-diff --git a/docs/reference/glib/meson.build b/docs/reference/glib/meson.build
-index 114de49da..3cfff2f0b 100644
---- a/docs/reference/glib/meson.build
-+++ b/docs/reference/glib/meson.build
-@@ -113,35 +113,37 @@ if get_option('man')
-   endforeach
- endif
- 
--# GVariant specification is currently standalone
--rst2html5 = find_program('rst2html5', 'rst2html5.py', required: false)
-+if get_option('gtk_doc')
-+  # GVariant specification is currently standalone
-+  rst2html5 = find_program('rst2html5', 'rst2html5.py', required: false)
- 
--if rst2html5.found()
--  spec_path = glib_datadir / 'doc' / 'glib-2.0'
-+  if rst2html5.found()
-+    spec_path = glib_datadir / 'doc' / 'glib-2.0'
- 
--  figures = files(
--    'gvariant-byte-boundaries.svg',
--    'gvariant-integer-and-string-structure.svg',
--    'gvariant-integer-array.svg',
--    'gvariant-string-array.svg',
--  )
-+    figures = files(
-+      'gvariant-byte-boundaries.svg',
-+      'gvariant-integer-and-string-structure.svg',
-+      'gvariant-integer-array.svg',
-+      'gvariant-string-array.svg',
-+    )
- 
--  custom_target('gvariant-specification-1.0',
--    input: 'gvariant-specification-1.0.rst',
--    output: 'gvariant-specification-1.0.html',
--    command: [
--      rst2html5,
--      '@INPUT@',
--    ],
--    capture: true,
--    install: true,
--    install_dir: spec_path,
--    install_tag: 'doc',
--    depend_files: figures,
--  )
-+    custom_target('gvariant-specification-1.0',
-+      input: 'gvariant-specification-1.0.rst',
-+      output: 'gvariant-specification-1.0.html',
-+      command: [
-+        rst2html5,
-+        '@INPUT@',
-+      ],
-+      capture: true,
-+      install: true,
-+      install_dir: spec_path,
-+      install_tag: 'doc',
-+      depend_files: figures,
-+    )
- 
--  install_data(figures,
--    install_dir : spec_path,
--    install_tag : 'doc',
--  )
--endif
-\ No newline at end of file
-+    install_data(figures,
-+      install_dir : spec_path,
-+      install_tag : 'doc',
-+    )
-+  endif
-+endif
--- 
-2.25.1
-
diff --git a/package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch b/package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
deleted file mode 100644
index 57404705d0..0000000000
--- a/package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2ca9f53327308e85e376bcbef7f8259a6331a453 Mon Sep 17 00:00:00 2001
-From: Nirbheek Chauhan <nirbheek@centricular.com>
-Date: Thu, 8 Sep 2022 02:36:33 +0530
-Subject: [PATCH] meson: Fix detection of a system-provided proxy-libintl
-
-proxy-libintl defines ngettext() as a define in the header that points
-to the actual symbol in the library which is g_libintl_ngettext().
-Same with bind_textdomain_codeset().
-
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/32249a22fc39319651e7c23442d37ec837f05764
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- meson.build | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 0cbc9689f..de0bee5a3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2089,6 +2089,7 @@ libz_dep = dependency('zlib')
- # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
- # implementations. This could be extended if issues are found in some platforms.
- libintl_deps = []
-+libintl_prefix = '#include <libintl.h>'
- libintl = dependency('intl', required: false, allow_fallback: false)
- if libintl.found()
-   # libintl supports different threading APIs, which may not
-@@ -2100,11 +2101,11 @@ if libintl.found()
-   #
-   # Meson's builtin dependency lookup as of 0.60.0 doesn't check for
-   # pthread, so we do this manually here.
--  if cc.has_function('ngettext', dependencies : libintl)
-+  if cc.has_function('ngettext', dependencies : libintl, prefix: libintl_prefix)
-     libintl_deps += [libintl]
-   else
-     libintl_pthread = cc.find_library('pthread', required : false)
--    if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread])
-+    if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread], prefix: libintl_prefix)
-       libintl_deps += [libintl, libintl_pthread]
-     else
-       libintl = disabler()
-@@ -2113,7 +2114,7 @@ if libintl.found()
- endif
- 
- if libintl.found()
--  have_bind_textdomain_codeset = cc.has_function('bind_textdomain_codeset', dependencies: libintl_deps)
-+  have_bind_textdomain_codeset = cc.has_function('bind_textdomain_codeset', dependencies: libintl_deps, prefix: libintl_prefix)
- else
-   libintl = dependency('intl', allow_fallback: true)
-   assert(libintl.type_name() == 'internal')
--- 
-2.34.1
-
diff --git a/package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch b/package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
deleted file mode 100644
index a342ee95d6..0000000000
--- a/package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From fe7f54d4f339b7948c961b60729f620f2eaec716 Mon Sep 17 00:00:00 2001
-From: Jan200101 <sentrycraft123@gmail.com>
-Date: Tue, 23 May 2023 23:42:37 +0200
-Subject: [PATCH] meson: try iconv in libintl lookup
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This was originally removed in !2734 but still appears to be required for
-some MinGW setups, such as the `x86_64-w64-mingw32.static` target in
-[mxe](https://github.com/mxe/mxe).
-
-Currently, this configuration fails the libintl internal assert on line
-2128, as on this platform `ngettext()` is only found inside libiconv.
-
-This commit will look up iconv potentially twice, once as `libiconv` and
-potentially once as `libintl_iconv`. This is what the code did before
-!2734 landed, so it’s known to work reliably on a number of platforms.
-
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/a497d5be122f193dcf8679334308333bbbc14a71
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- meson.build | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index de0bee5a3..653f9eddf 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2104,11 +2104,16 @@ if libintl.found()
-   if cc.has_function('ngettext', dependencies : libintl, prefix: libintl_prefix)
-     libintl_deps += [libintl]
-   else
--    libintl_pthread = cc.find_library('pthread', required : false)
--    if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread], prefix: libintl_prefix)
--      libintl_deps += [libintl, libintl_pthread]
-+    libintl_iconv = cc.find_library('iconv', required : false)
-+    if libintl_iconv.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_iconv])
-+      libintl_deps += [libintl, libintl_iconv]
-     else
--      libintl = disabler()
-+      libintl_pthread = cc.find_library('pthread', required : false)
-+      if libintl_pthread.found() and cc.has_function('ngettext', dependencies : [libintl, libintl_pthread], prefix: libintl_prefix)
-+        libintl_deps += [libintl, libintl_pthread]
-+      else
-+        libintl = disabler()
-+      endif
-     endif
-   endif
- endif
--- 
-2.34.1
-
diff --git a/package/libglib2/0006-link-with-latomic-when-needed.patch b/package/libglib2/0006-link-with-latomic-when-needed.patch
deleted file mode 100644
index 3b5a071010..0000000000
--- a/package/libglib2/0006-link-with-latomic-when-needed.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4e6dc4dee0e1c6407113597180d9616b4f275f94 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 2 May 2024 14:02:17 +0200
-Subject: [PATCH] link with -latomic when needed
-
-Some architecture such as sparc and some flavors of arm needs -latomic
-to avoid the following build failure:
-
-gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/4e6dc4dee0e1c6407113597180d9616b4f275f94
----
- glib/meson.build | 1 +
- meson.build      | 9 +++++++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/glib/meson.build b/glib/meson.build
-index 24cbb664d4..b2dd569e1e 100644
---- a/glib/meson.build
-+++ b/glib/meson.build
-@@ -419,6 +419,7 @@ libglib = library('glib-2.0',
-   include_directories : configinc,
-   link_with: [charset_lib, gnulib_lib],
-   dependencies : [
-+    atomic_dep,
-     gnulib_libm_dependency,
-     libiconv,
-     libintl_deps,
-diff --git a/meson.build b/meson.build
-index 46c5aa200a..8b42940558 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2233,6 +2233,15 @@ libffi_dep = dependency('libffi', version : '>= 3.0.0')
-
- libz_dep = dependency('zlib')
-
-+libatomic_test_code = '''
-+  int main (int argc, char ** argv) {
-+    return 0;
-+  }'''
-+atomic_dep = []
-+if cc.links(libatomic_test_code, args : '-latomic', name : 'check for -latomic')
-+  atomic_dep = cc.find_library('atomic')
-+endif
-+
- # First check in libc, fallback to libintl, and as last chance build
- # proxy-libintl subproject.
- # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
---
-2.44.0
-
diff --git a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
similarity index 53%
rename from package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
rename to package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index 8f87671167..c6135b15a1 100644
--- a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ b/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -1,4 +1,4 @@
-From 03e9cae3f3a7e2bbd5110f1ce2739601571bc024 Mon Sep 17 00:00:00 2001
+From 3fcd5f431dee9909b6bcbd9b8b61d4b1fe4b5f92 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 12 Nov 2021 18:01:05 +0100
 Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
@@ -16,6 +16,8 @@ Fixes:
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[Fiona: refresh for glib 2.80.4]
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
 Upstream: Never submitted
 ---
  gio/meson.build  | 1 +
@@ -23,29 +25,29 @@ Upstream: Never submitted
  2 files changed, 2 insertions(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 462606f3b56c..e6b736167b8d 100644
+index 59c2b0f..5120537 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -880,6 +880,7 @@ pkg.generate(libgio,
-   variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
-                'schemasdir=' + join_paths('${datadir}', schemas_subdir),
-                'bindir=' + join_paths('${prefix}', get_option('bindir')),
-+               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
-                'giomoduledir=' + pkgconfig_giomodulesdir,
-                'gio=' + join_paths('${bindir}', 'gio'),
-                'gio_querymodules=@0@'.format(pkgconfig_multiarch_bindir / 'gio-querymodules'),
+@@ -885,6 +885,7 @@ pkg.generate(libgio,
+   variables : [
+     'schemasdir=' + '${datadir}' / schemas_subdir,
+     'dtdsdir=' + '${datadir}' / dtds_subdir,
++    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
+     'giomoduledir=' + pkgconfig_giomodulesdir,
+     'gio=' + '${bindir}' / 'gio',
+     'gio_querymodules=' + pkgconfig_multiarch_bindir / 'gio-querymodules',
 diff --git a/glib/meson.build b/glib/meson.build
-index da76fc005e46..cde2edb197c7 100644
+index d2efeba..a69532b 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -441,6 +441,7 @@ pkg.generate(libglib,
+@@ -447,6 +447,7 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
-   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
-+               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
-                'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
-                'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
-                'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
+   variables : [
++    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
+     'glib_genmarshal=' + '${bindir}' / 'glib-genmarshal',
+     'gobject_query=' + '${bindir}' / 'gobject-query',
+     'glib_mkenums=' + '${bindir}' / 'glib-mkenums',
 -- 
-2.43.0
+2.45.2
 
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 077d7d66e8..393a7f4405 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_HOST_QEMU if BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE if BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_PCRE2
@@ -15,3 +17,5 @@ config BR2_PACKAGE_LIBGLIB2
 comment "libglib2 needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+source "package/libglib2/libglib2-bootstrap/Config.in"
diff --git a/package/libglib2/libglib2-bootstrap/2.82.0 b/package/libglib2/libglib2-bootstrap/2.82.0
new file mode 120000
index 0000000000..28b180f102
--- /dev/null
+++ b/package/libglib2/libglib2-bootstrap/2.82.0
@@ -0,0 +1 @@
+../2.82.0
\ No newline at end of file
diff --git a/package/libglib2/libglib2-bootstrap/Config.in b/package/libglib2/libglib2-bootstrap/Config.in
new file mode 100644
index 0000000000..189de9a4f2
--- /dev/null
+++ b/package/libglib2/libglib2-bootstrap/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBGLIB2_BOOTSTRAP
+	bool
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_ZLIB
diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash
new file mode 120000
index 0000000000..f182b8b6ec
--- /dev/null
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash
@@ -0,0 +1 @@
+../libglib2.hash
\ No newline at end of file
diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
new file mode 100644
index 0000000000..72a32bd825
--- /dev/null
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# libglib2-bootstrap
+#
+################################################################################
+
+# Since version 2.79.0 libglib2 needs gobject-introspection to build
+# with introspection support. As gobject-introspection requires
+# libglib2 to build this means a bootstrap process is needed, as
+# described in the NEWS entry:
+#
+# 1. build libglib2 without introspection (this bootstrap package)
+# 2. build build gobject-introspection
+# 3. build libglib2 with introspection (the main libglib2 package).
+#
+# The bootstrap package is an implementation detail that nothing
+# except gobject-introspection should depend on.
+
+LIBGLIB2_BOOTSTRAP_VERSION_MAJOR = $(LIBGLIB2_VERSION_MAJOR)
+LIBGLIB2_BOOTSTRAP_VERSION = $(LIBGLIB2_VERSION)
+LIBGLIB2_BOOTSTRAP_SOURCE = $(LIBGLIB2_SOURCE)
+LIBGLIB2_BOOTSTRAP_SITE = $(LIBGLIB2_SITE)
+LIBGLIB2_BOOTSTRAP_LICENSE = $(LIBGLIB2_LICENSE)
+LIBGLIB2_BOOTSTRAP_LICENSE_FILES = $(LIBGLIB2_LICENSE_FILES)
+LIBGLIB2_BOOTSTRAP_CPE_ID_VENDOR = $(LIBGLIB2_CPE_ID_VENDOR)
+LIBGLIB2_BOOTSTRAP_CPE_ID_PRODUCT = $(LIBGLIB2_CPE_ID_PRODUCT)
+LIBGLIB2_BOOTSTRAP_INSTALL_STAGING = YES
+LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2
+
+LIBGLIB2_BOOTSTRAP_CFLAGS = $(LIBGLIB2_CFLAGS)
+LIBGLIB2_BOOTSTRAP_LDFLAGS = $(LIBGLIB2_LDFLAGS)
+
+LIBGLIB2_BOOTSTRAP_DEPENDENCIES = \
+	libffi \
+	pcre2 \
+	zlib \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBGLIB2_BOOTSTRAP_CONF_OPTS = \
+	-Dglib_debug=disabled \
+	-Dlibelf=disabled \
+	-Dgio_module_dir=/usr/lib/gio/modules \
+	-Dtests=false \
+	-Doss_fuzz=disabled \
+	-Dintrospection=disabled \
+	-Dselinux=disabled \
+	-Dxattr=false \
+	-Dlibmount=disabled
+
+LIBGLIB2_BOOTSTRAP_MESON_EXTRA_PROPERTIES = \
+	have_c99_vsnprintf=true \
+	have_c99_snprintf=true \
+	have_unix98_printf=true
+
+LIBGLIB2_BOOTSTRAP_POST_INSTALL_TARGET_HOOKS = $(LIBGLIB2_POST_INSTALL_TARGET_HOOKS)
+
+HOST_LIBGLIB2_BOOTSTRAP_DEPENDENCIES = \
+	host-gettext \
+	host-libffi \
+	host-pcre2 \
+	host-pkgconf \
+	host-util-linux \
+	host-zlib
+
+HOST_LIBGLIB2_BOOTSTRAP_CONF_OPTS = \
+	-Ddtrace=false \
+	-Dglib_debug=disabled \
+	-Dintrospection=disabled \
+	-Dlibelf=disabled \
+	-Dselinux=disabled \
+	-Dsystemtap=false \
+	-Dxattr=false \
+	-Dtests=false \
+	-Doss_fuzz=disabled
+
+$(eval $(meson-package))
+$(eval $(host-meson-package))
diff --git a/package/libglib2/libglib2-qemu-wrapper.in b/package/libglib2/libglib2-qemu-wrapper.in
new file mode 100644
index 0000000000..7bfbd2eceb
--- /dev/null
+++ b/package/libglib2/libglib2-qemu-wrapper.in
@@ -0,0 +1,9 @@
+#!/usr/bin/env sh
+
+# Pass -r to qemu-user as to trick glibc into not erroring out if the host kernel
+# is older than the target kernel.
+exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
+    @QEMU_USERMODE_ARGS@ \
+   -L "${STAGING_DIR}/" \
+   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
+   "$@"
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 07ed7635a6..6175a7157c 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.76/glib-2.76.1.sha256sum
-sha256  43dc0f6a126958f5b454136c4398eab420249c16171a769784486e25f2fda19f  glib-2.76.1.tar.xz
+# https://download.gnome.org/sources/glib/2.82/glib-2.82.4.sha256sum
+sha256  37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0cb6b8b2dff187c709  glib-2.82.4.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c33df70b25..58a9eb3ee6 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.76
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION_MAJOR = 2.82
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -44,6 +44,13 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 	host-util-linux \
 	host-zlib
 
+ifeq ($(BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION),y)
+HOST_LIBGLIB2_CONF_OPTS += -Dintrospection=enabled
+HOST_LIBGLIB2_DEPENDENCIES += host-gobject-introspection
+else
+HOST_LIBGLIB2_CONF_OPTS += -Dintrospection=disabled
+endif
+
 # We explicitly specify a giomodule-dir to avoid having a value
 # containing ${libdir} in gio-2.0.pc. Indeed, a value depending on
 # ${libdir} would be prefixed by the sysroot by pkg-config, causing a
@@ -60,6 +67,24 @@ LIBGLIB2_MESON_EXTRA_PROPERTIES = \
 	have_c99_snprintf=true \
 	have_unix98_printf=true
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGLIB2_CONF_OPTS += -Dintrospection=enabled
+LIBGLIB2_DEPENDENCIES += gobject-introspection host-qemu
+LIBGLIB2_MESON_EXTRA_BINARIES = exe_wrapper='$(@D)/libglib2-qemu-wrapper'
+define LIBGLIB2_INSTALL_QEMUWARPPER
+	$(INSTALL) -D -m 755 $(LIBGLIB2_PKGDIR)/libglib2-qemu-wrapper.in \
+		$(@D)/libglib2-qemu-wrapper
+	$(SED) 's%@QEMU_USER@%$(QEMU_USER)%g; \
+		s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g; \
+		s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g; \
+		' \
+		$(@D)/libglib2-qemu-wrapper
+endef
+LIBGLIB2_PRE_CONFIGURE_HOOKS += LIBGLIB2_INSTALL_QEMUWARPPER
+else
+LIBGLIB2_CONF_OPTS += -Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 LIBGLIB2_DEPENDENCIES += elfutils
 endif
@@ -138,3 +163,5 @@ $(eval $(meson-package))
 $(eval $(host-meson-package))
 
 LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
+
+include package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk

--===============5691606958852906533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5691606958852906533==--
