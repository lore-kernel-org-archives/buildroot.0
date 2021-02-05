From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 09:39:51 +0100
Subject: [Buildroot] [git commit] package/xenomai: smp support needs at
 least armv6
Message-ID: <20210205082838.570E281566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb380c2e1155a295919aec122788d046b34e45f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are no autobuilder failures for this issue, but the following
defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XENOMAI=y
BR2_PACKAGE_XENOMAI_COBALT=y

See:
https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L56

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998 at free.fr: fix the condition]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xenomai/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b655733528..e39a550416 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -110,6 +110,8 @@ endchoice
 config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 	bool "Enable SMP support"
 	default y
+	# SMP not supported below armv6
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	help
 	  This option enables SMP support in Xenomai userspace.
 
