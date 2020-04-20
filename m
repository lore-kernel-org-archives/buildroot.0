From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:36:29 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: PPC64(LE)
 support in musl requires ALTIVEC
Message-ID: <20200420212433.2D28F8F544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c267f2e9a9664a87a1804555dd4703e9a3665c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl currently assumes all PPC64(LE) CPUs support ALTIVEC instructions.

However, there are exceptions (such as the e5500) for which musl builds
ultimately generate illegal instructions for the targets.

Disable musl if the PPC64(LE) CPU does not support ALTIVEC instructions.

This patch addresses the issues seen here:
  https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092743
  https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092744

musl mailing list thread:
  https://www.openwall.com/lists/musl/2020/02/03/10

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index a980f766ac..8c33b2b4dd 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -86,6 +86,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
 		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
+	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
 	depends on BR2_USE_MMU
