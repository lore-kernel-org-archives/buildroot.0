From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 22:12:43 +0200
Subject: [Buildroot] [PATCH] util-linux: fix installation of shared
	libraries to not mess with pure static lib
Message-ID: <1402603963-29234-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even when compiled with --enable-static --disable-shared, util-linux
creates some incorrect libuuid.so, libblkid.so and libmount.so
symbolic links, which confuses the compiler which thinks that a shared
library is available. This causes some build issues such as:

  http://autobuild.buildroot.org/results/990/9909d198ce14969d0e9d29a34fcc33f0ef79220d/

This commit fixes that by adding a patch to util-linux that fixes this
issue. The patch has been submitted upstream at
http://article.gmane.org/gmane.linux.utilities.util-linux-ng/9262.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../util-linux-004-support-static-lib-build.patch  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/util-linux/util-linux-004-support-static-lib-build.patch

diff --git a/package/util-linux/util-linux-004-support-static-lib-build.patch b/package/util-linux/util-linux-004-support-static-lib-build.patch
new file mode 100644
index 0000000..f49c6e5
--- /dev/null
+++ b/package/util-linux/util-linux-004-support-static-lib-build.patch
@@ -0,0 +1,57 @@
+Only move shared libraries to /lib if they exists
+
+In several Makemodule.am, there is a install-exec-hook-<library>
+target whose role is to move the shared library from /usr/lib to /lib,
+while keeping a symbolic link /usr/lib/libuuid.so ->
+../../lib/<library>.so.<version>.
+
+However, when util-linux is built with --enable-static
+--disable-shared (as is needed on noMMU platforms that don't support
+shared libraries), no <library>.so is built, but the
+install-exec-hook-libuuid creates an invalid /usr/lib/<library>.so
+symbolic link, pointing to ../../lib (yes, the directory). This causes
+troubles later one when other libraries/programs are compiled with
+-l<library>, as gcc thinks a shared library is available because
+there's a file named /usr/lib/<library>.so.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libuuid/src/Makemodule.am
+===================================================================
+--- a/libuuid/src/Makemodule.am
++++ b/libuuid/src/Makemodule.am
+@@ -44,7 +44,7 @@
+ 
+ # move lib from $(usrlib_execdir) to $(libdir) if needed
+ install-exec-hook-libuuid:
+-	if test "$(usrlib_execdir)" != "$(libdir)"; then \
++	if test "$(usrlib_execdir)" != "$(libdir)" -a -f "$(DESTDIR)$(usrlib_execdir)/libuuid.so"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libuuid.so.* $(DESTDIR)$(libdir); \
+ 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libuuid.so); \
+Index: b/libmount/src/Makemodule.am
+===================================================================
+--- a/libmount/src/Makemodule.am
++++ b/libmount/src/Makemodule.am
+@@ -123,7 +123,7 @@
+ 
+ # move lib from $(usrlib_execdir) to $(libdir) if needed
+ install-exec-hook-libmount:
+-	if test "$(usrlib_execdir)" != "$(libdir)"; then \
++	if test "$(usrlib_execdir)" != "$(libdir)" -a -f "$(DESTDIR)$(usrlib_execdir)/libmount.so"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libmount.so.* $(DESTDIR)$(libdir); \
+ 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libmount.so); \
+Index: b/libblkid/src/Makemodule.am
+===================================================================
+--- a/libblkid/src/Makemodule.am
++++ b/libblkid/src/Makemodule.am
+@@ -220,7 +220,7 @@
+ 
+ # move lib from $(usrlib_execdir) to $(libdir) if needed
+ install-exec-hook-libblkid:
+-	if test "$(usrlib_execdir)" != "$(libdir)"; then \
++	if test "$(usrlib_execdir)" != "$(libdir)" -a -f "$(DESTDIR)$(usrlib_execdir)/libblkid.so"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libblkid.so.* $(DESTDIR)$(libdir); \
+ 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libblkid.so); \
-- 
2.0.0
