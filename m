From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:43:49 +0200
Subject: [Buildroot] [git commit] package/xen: Fix builds with GCC 7
Message-ID: <20170701103836.67DE07FA97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7289d2729db82ed413012b3b1a0f7f13c4530c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a "duplicate 'const' declaration specifier" error that occurs when
building Xen. As the issue has already been fixed in upstream Xen let's
just backport the fix to apply here.

Fixes:
    http://autobuild.buildroot.net/results/3a0/3a03c328bc6a6c30cc4f619925608d735632211f/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xen/0008-arm-fix-build-with-gcc-7.patch | 70 +++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/xen/0008-arm-fix-build-with-gcc-7.patch b/package/xen/0008-arm-fix-build-with-gcc-7.patch
new file mode 100644
index 0000000..7bd12a3
--- /dev/null
+++ b/package/xen/0008-arm-fix-build-with-gcc-7.patch
@@ -0,0 +1,70 @@
+From 9d3011bd1cd29f8f3841bf1b64d5ead9ed1434e8 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Fri, 19 May 2017 10:12:08 +0200
+Subject: [PATCH] arm: fix build with gcc 7
+
+The compiler dislikes duplicate "const", and the ones it complains
+about look like they we in fact meant to be placed differently.
+
+Also fix array_access_okay() (just like on x86), despite the construct
+being unused on ARM: -Wint-in-bool-context, enabled by default in
+gcc 7, doesn't like multiplication in conditional operators. "Hide" it,
+at the risk of the next compiler version becoming smarter and
+recognizing even that. (The hope is that added smartness then would
+also better deal with legitimate cases like the one here.) The change
+could have been done in access_ok(), but I think we better keep it at
+the place the compiler is actually unhappy about.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Reviewed-by: Julien Grall <julien.grall@arm.com>
+Release-acked-by: Julien Grall <julien.grall@arm.com>
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ xen/arch/arm/platforms/brcm.c      | 2 +-
+ xen/arch/arm/platforms/rcar2.c     | 2 +-
+ xen/include/asm-arm/guest_access.h | 3 ++-
+ 3 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/xen/arch/arm/platforms/brcm.c b/xen/arch/arm/platforms/brcm.c
+index 6d8b5b9175..d481b2c60f 100644
+--- a/xen/arch/arm/platforms/brcm.c
++++ b/xen/arch/arm/platforms/brcm.c
+@@ -271,7 +271,7 @@ static __init int brcm_init(void)
+     return brcm_populate_plat_regs();
+ }
+ 
+-static const char const *brcm_dt_compat[] __initconst =
++static const char *const brcm_dt_compat[] __initconst =
+ {
+     "brcm,bcm7445d0",
+     NULL
+diff --git a/xen/arch/arm/platforms/rcar2.c b/xen/arch/arm/platforms/rcar2.c
+index bb25751109..df0ac84709 100644
+--- a/xen/arch/arm/platforms/rcar2.c
++++ b/xen/arch/arm/platforms/rcar2.c
+@@ -46,7 +46,7 @@ static int __init rcar2_smp_init(void)
+     return 0;
+ }
+ 
+-static const char const *rcar2_dt_compat[] __initdata =
++static const char *const rcar2_dt_compat[] __initconst =
+ {
+     "renesas,lager",
+     NULL
+diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
+index 5876988b23..421bca5f36 100644
+--- a/xen/include/asm-arm/guest_access.h
++++ b/xen/include/asm-arm/guest_access.h
+@@ -8,7 +8,8 @@
+ #define access_ok(addr,size) (1)
+ 
+ #define array_access_ok(addr,count,size) \
+-    (likely(count < (~0UL/size)) && access_ok(addr,count*size))
++    (likely((count) < (~0UL / (size))) && \
++     access_ok(addr, 0 + (count) * (size)))
+ 
+ unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
+ unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
+-- 
+2.11.0
+
