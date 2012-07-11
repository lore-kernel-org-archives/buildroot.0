From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 11 Jul 2012 14:57:18 +0200
Subject: [Buildroot] [PATCH v3] Remove -fPIC on x86_64
Message-ID: <1342011438-13433-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -fPIC breaks the purgatory of kexec (= the code that passes command-line
arguments to the kernel): kexec doesn't know how to handle the GOT and PLT
relocation entries.

There is also no reason at all to pass -fPIC.  Shared libraries that require
it will add it to their local Makefiles, and normal executables have no
business with -fPIC (plus it adds overhead...).

The -fPIC was added by Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
in commit 8027784c.  That commit adds sysroot parameters to CFLAGS.
There is no explanation why -fPIC is also added for x86_64.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Build-tested with Sourcery toolchain and full-featured internal toolchain
on a x86_64 host with allyesconfig (but without the packages that fail to
build in the first place).

v3:
 - Rebase on master (v2 was accidentally diffed against the rejected 
   libgcrypt-config patch)
 - Remove CCACHE_DISABLE again (I couldn't reproduce it on clean rebuild
   of the allyesconfig)

v2:
 - Add CCACHE_DISABLE to TARGET_CONFIGURE_ARGS
 - Test with allyesconfig

 package/Makefile.in |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c5ad00a..1c3ce48 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -87,12 +87,6 @@ endif
 
 TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
-ifeq ($(BR2_x86_64),y)
-TARGET_CFLAGS+=-fPIC -DPIC
-endif # PIC for dynamic objects on x86_64
-endif
-
 ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
 endif
-- 
tg: (9546394..) t/remove-pic (depends on: t/force-cross)
