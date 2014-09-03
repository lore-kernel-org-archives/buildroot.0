From: Bai Yingjie <byj.tea@gmail.com>
Date: Wed,  3 Sep 2014 21:29:14 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain-external: Improve lib
	subdirectory matching
Message-ID: <1409750954-3636-1-git-send-email-byj.tea@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some external toolchain provides lib32-fp which supports FPU instructions
as well as lib32 in sys-root/usr, but lib32-fp can't be matched and
in consequence causes a compile error.

The toolchain in this case is OCTEON mips64 toolchain, and the CFLAGS
cause the issue is -march=octeon3.

This patch improves the matching by accepting lib(32|64)?([^/]*)? as lib
name.

Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b2957d9..dad000e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -436,13 +436,13 @@ endef
 
 # Returns the sysroot location for the given compiler + flags
 define toolchain_find_sysroot
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e
 # typically lib32 or lib64 for some toolchains)
 define toolchain_find_libdir
-$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
+$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
 endef
 
 # Checks for an already installed toolchain: check the toolchain
-- 
1.9.1
