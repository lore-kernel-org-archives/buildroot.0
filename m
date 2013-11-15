From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Fri, 15 Nov 2013 17:18:34 +0800
Subject: [Buildroot] [PATCH v2] util-linux: flat: Add patch to skip creating
	dynamic libraries
Message-ID: <1384507114-4358-1-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

when BR2_PREFER_STATIC_LIB is selected.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 ...reating-dynamic-libraries-for-static-link.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/util-linux/util-linux-005-skip-creating-dynamic-libraries-for-static-link.patch

diff --git a/package/util-linux/util-linux-005-skip-creating-dynamic-libraries-for-static-link.patch b/package/util-linux/util-linux-005-skip-creating-dynamic-libraries-for-static-link.patch
new file mode 100644
index 0000000..35ed9ae
--- /dev/null
+++ b/package/util-linux/util-linux-005-skip-creating-dynamic-libraries-for-static-link.patch
@@ -0,0 +1,43 @@
+Skip creating dynamic libraries when BR2_PREFER_STATIC_LIB is select.
+    
+Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
+
+diff -urN util-linux-2.23.2.old/libblkid/src/Makemodule.am util-linux-2.23.2/libblkid/src/Makemodule.am
+--- util-linux-2.23.2.old/libblkid/src/Makemodule.am	2013-07-15 16:25:46.281049040 +0800
++++ util-linux-2.23.2/libblkid/src/Makemodule.am	2013-11-11 16:28:19.956656546 +0800
+@@ -220,7 +220,8 @@
+ 
+ # move lib from $(usrlib_execdir) to $(libdir) if needed
+ install-exec-hook-libblkid:
+-	if test "$(usrlib_execdir)" != "$(libdir)"; then \
++	ls $(DESTDIR)$(usrlib_execdir)/libblkid.so.*; \
++	if $? == 0 && test "$(usrlib_execdir)" != "$(libdir)"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libblkid.so.* $(DESTDIR)$(libdir); \
+ 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libblkid.so); \
+diff -urN util-linux-2.23.2.old/libmount/src/Makemodule.am util-linux-2.23.2/libmount/src/Makemodule.am
+--- util-linux-2.23.2.old/libmount/src/Makemodule.am	2013-02-28 00:46:29.874020654 +0800
++++ util-linux-2.23.2/libmount/src/Makemodule.am	2013-11-11 16:29:37.366370584 +0800
+@@ -120,7 +120,8 @@
+ 
+ # move lib from $(usrlib_execdir) to $(libdir) if needed
+ install-exec-hook-libmount:
+-	if test "$(usrlib_execdir)" != "$(libdir)"; then \
++	ls $(DESTDIR)$(usrlib_execdir)/libmount.so.*; \
++	if $? == 0 && test "$(usrlib_execdir)" != "$(libdir)"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libmount.so.* $(DESTDIR)$(libdir); \
+ 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libmount.so); \
+diff -urN util-linux-2.23.2.old/libuuid/src/Makemodule.am util-linux-2.23.2/libuuid/src/Makemodule.am
+--- util-linux-2.23.2.old/libuuid/src/Makemodule.am	2013-02-28 00:46:29.882020725 +0800
++++ util-linux-2.23.2/libuuid/src/Makemodule.am	2013-11-11 16:29:00.700507322 +0800
+@@ -39,7 +39,8 @@
+ 
+ # move lib from $(usrlib_execdir) to $(libdir) if needed
+ install-exec-hook-libuuid:
+-	if test "$(usrlib_execdir)" != "$(libdir)"; then \
++	ls $(DESTDIR)$(usrlib_execdir)/libuuid.so.*; \
++	if $? == 0 && test "$(usrlib_execdir)" != "$(libdir)"; then \
+ 		mkdir -p $(DESTDIR)$(libdir); \
+ 		mv $(DESTDIR)$(usrlib_execdir)/libuuid.so.* $(DESTDIR)$(libdir); \
+ 		so_img_name=$$(readlink $(DESTDIR)$(usrlib_execdir)/libuuid.so); \
-- 
1.8.2.3
