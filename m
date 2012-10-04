From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 22:49:58 +0200
Subject: [Buildroot] [git commit] pkg-infra: make sure cross compiling is
	enabled when host == target
Message-ID: <20121004205124.9BD9D997BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11017f081fc5b034e680d89eaea729c19f450e01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling for the same architecture and libc as the host,
GNU_TARGET_NAME and GNU_HOST_NAME are equal.  configure scripts use
these to detect cross-compilation, and will decide that we're doing
native compilation.  This may trigger running of executables,
which fail because of missing libraries in the host environment.

To solve this, set the vendor part in GNU_TARGET_NAME to buildroot.

This problem exists for instance in xserver_xorg-server on x86_64.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 64508b2..30a542a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -20,7 +20,7 @@ MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIBC=uclibc
