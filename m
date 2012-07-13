From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 21:51:55 +0200
Subject: [Buildroot] [git commit] Remove -fPIC on x86_64
Message-ID: <20120713203602.2E1DE90D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ea1e92bdd9acf6cd5b021e61a18703e27885426
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
