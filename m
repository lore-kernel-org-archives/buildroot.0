From: Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 31 Jan 2020 09:39:52 -0600
Subject: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-buildroot: PPC64(LE)
 support in musl requires ALTIVEC
Message-ID: <20200131153952.680-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl currently assumes all PPC64(LE) CPUs support ALTIVEC instructions.

However, there are exceptions (such as the e5500) for which musl builds
ultimately generate illegal instructions for the targets.

Disable musl if the PPC64(LE) CPU does not support ALTIVEC instructions.

This patch addresses the issues seen here:
  https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092743
  https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092744

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 toolchain/toolchain-buildroot/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index a980f766ac..09a46822c9 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -83,8 +83,10 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
 		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
-		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
-		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
+		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_RISCV_64 || \
+		   BR2_sh	   || BR2_x86_64 || \
+		   ((BR2_powerpc64 || BR2_powerpc64le) && BR2_POWERPC_CPU_HAS_ALTIVEC)
+		   # musl assumes all PPC64 targets support ALTIVEC instructions
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
-- 
2.25.0
