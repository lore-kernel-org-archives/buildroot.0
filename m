From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  2 Dec 2011 09:56:09 +0100
Subject: [Buildroot] [PATCH] Remove -fPIC on x86_64
Message-ID: <1322816170-27327-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

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
 package/Makefile.in |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c3af5d3..de077bb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -62,12 +62,6 @@ endif
 
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
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
1.7.7.3
