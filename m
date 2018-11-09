From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:02:16 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: enable
 glibc for all little-endian ARCs with atomic ops
Message-ID: <20181109210046.89F7582169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=311af5e8c2db887800639bc803c8201b6b70e9ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Initially we had a port only for ARCv2 cores but then with a simple
change ARCompact cores got supported as well.

So we generalize from BR2_archs to BR2_arcle as we haven't tried to
get glibc working on big-endian ARCs yet.

Also we never bothered to check avaialbility of atomic instructions in
the core but in case of Glibc for ARC this is really a must, so we add
this check here.

Note in case of uClibc we may have system w/o HW atomics but:

 1. Only single-core systems are allowed
 2. Atomic instructions are emulated via arc_usr_cmpxchg syscall

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 7d9428c70e..beb17a218b 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   BR2_archs38
+		   (BR2_arcle && BR2_ARC_ATOMIC_EXT)
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
