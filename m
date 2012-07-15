From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 15 Jul 2012 02:49:14 +0200
Subject: [Buildroot] [PATCH v3] pkg-infra: make sure cross compiling is
	enabled when host == target
Message-ID: <1342313355-30517-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling for the same architecture and libc as the host,
GNU_TARGET_NAME and GNU_HOST_NAME are equal.  configure scripts use
these to detect cross-compilation, and will decide that we're doing
native compilation.  This may trigger running of executables,
which fail because of missing libraries in the host environment.

To solve this, set the vendor part in GNU_TARGET_NAME to buildroot.

This problem exists for instance in xserver_xorg-server on x86_64.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: modify GNU_TARGET_NAME instead of GNU_HOST_NAME, which makes a lot
    more sense of course.  Thank you ThomasP!

    I only tested this one with xserver_xorg-server on a Sourcery
    x86_64 toolchain and with a simple config and an internal toolchain.

v2: -buildroot- instead of -buildroot_cross-, as suggested by ThomasP.

 package/Makefile.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c5ad00a..01fdd90 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -20,7 +20,7 @@ MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIBC=uclibc
-- 
tg: (b8b57bb..) t/force-cross (depends on: master)
