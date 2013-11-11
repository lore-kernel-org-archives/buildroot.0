From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Mon, 11 Nov 2013 18:29:25 +0800
Subject: [Buildroot] [PATCH 2/2] util-linux: flat: Add patch to avoid
	creating dynamic libraries.
In-Reply-To: <1384165765-23210-1-git-send-email-Sonic.adi@gmail.com>
References: <1384165765-23210-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <1384165765-23210-2-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/util-linux/util-linux-flat.patch | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/util-linux/util-linux-flat.patch

diff --git a/package/util-linux/util-linux-flat.patch b/package/util-linux/util-linux-flat.patch
new file mode 100644
index 0000000..2cfae0f
--- /dev/null
+++ b/package/util-linux/util-linux-flat.patch
@@ -0,0 +1,39 @@
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
