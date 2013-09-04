From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 04 Sep 2013 23:18:35 +0800
Subject: [Buildroot] [PATCH] gcc-initial: Add host-elf2flt dependency when
 BR2_PACKAGE_HOST_ELF2FLT=y
Message-ID: <1378307915.5313.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's needed for some uClibc combination, link-flat.so which uses elf2flt
pulls in libgcc according to uclibc/Makerules (used in uclibc/libc/Makefile.in).
Thus pull it in for gcc-initial.

This also ensures elf2flt is ready when BR2_PACKAGE_HOST_ELF2FLT=y before
building other packages.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
This change is based on Gustavo's comment.
Test build for blackfin looks OK.

This patch replaces my previous patch
"dependencies: Add host prerequisite for elf2flt".

 package/gcc/gcc-initial/gcc-initial.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 0eb492f..6b85983 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,6 +10,10 @@ GCC_INITIAL_SOURCE  = $(GCC_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_HOST_ELF2FLT),y)
+HOST_GCC_INITIAL_DEPENDENCIES += host-elf2flt
+endif
+
 HOST_GCC_INITIAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-- 
1.8.1.2
