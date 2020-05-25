From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 May 2020 20:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] boot/grub2: Fix GRUB i386-pc build with
 Ubuntu gcc
Message-ID: <20200525180029.2140650-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12946

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x-GRUB-i386-pc-build-with-Ubuntu-gcc.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch

diff --git a/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
new file mode 100644
index 0000000000..d8acbc5621
--- /dev/null
+++ b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
@@ -0,0 +1,48 @@
+From 6643507ce30f775008e093580f0c9499dfb2c485 Mon Sep 17 00:00:00 2001
+From: Simon Hardy <simon.hardy@itdev.co.uk>
+Date: Tue, 24 Mar 2020 13:29:12 +0000
+Subject: build: Fix GRUB i386-pc build with Ubuntu gcc
+
+With recent versions of gcc on Ubuntu a very large lzma_decompress.img file is
+output. (e.g. 134479600 bytes instead of 2864.) This causes grub-mkimage to
+fail with: "error: Decompressor is too big."
+
+This seems to be caused by a section .note.gnu.property that is placed at an
+offset such that objcopy needs to pad the img file with zeros.
+
+This issue is present on:
+Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0
+Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
+
+This issue is not present on:
+Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0
+RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)
+
+The issue can be fixed by removing the section using objcopy as shown in
+this patch.
+
+Signed-off-by: Simon Hardy <simon.hardy@itdev.co.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+[Retrieved from:
+http://git.savannah.gnu.org/cgit/grub.git/commit/?id=6643507ce30f775008e093580f0c9499dfb2c485]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gentpl.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gentpl.py b/gentpl.py
+index 387588c05..c86550d4f 100644
+--- a/gentpl.py
++++ b/gentpl.py
+@@ -766,7 +766,7 @@ def image(defn, platform):
+ if test x$(TARGET_APPLE_LINKER) = x1; then \
+   $(MACHO2IMG) $< $@; \
+ else \
+-  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; \
++  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; \
+ fi
+ """)
+ 
+-- 
+cgit v1.2.1
+
-- 
2.26.2
