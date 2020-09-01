From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  1 Sep 2020 16:12:49 +0200
Subject: [Buildroot] [PATCH] package/gobject-introspection: disable for
 riscv32
Message-ID: <20200901141249.23158-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e32/e323f43952b3863cedfdae765b3fb10ec6b8d889/
http://autobuild.buildroot.net/results/53e/53e7b82baa9edb342cd110717d6b8ac82d5d933c/

And many more.

qemu-user 5.0.0 for riscv32 segfaults when running the g-i qemu wrapper, so
disable gobject-introspection.  There are no autobuilder failures for next,
so it looks to be fixed in qemu 5.1.0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gobject-introspection/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index e312852cf2..95a73980da 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	bool "gobject-introspection"
 	depends on BR2_USE_MMU # python3, libglib2
 	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_RISCV_32 # qemu-riscv32 segfaults in qemu-5.0.0
 	# While gcc 4.8 might be compatible with gobject-introspection,
 	# The autobuilders use some toolchains from codesourcery which
 	# have gcc 4.8 and a very old version of glibc, which will cause
-- 
2.20.1
