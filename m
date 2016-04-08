From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 12:09:52 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: don't show musl on
	noMMU platforms
Message-ID: <20160408123252.6EFD881E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee47352920cd0a89d6b775d489541183b31fb9d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While musl has recently gained noMMU support for the sh2 platform, we
don't support this yet. So for the time being, let's not show musl as
an available C library on noMMU platforms. This is for example
important on ARM noMMU: ARM is supported by musl, but not its noMMU
variants.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index ea290eb..0c40801 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -94,6 +94,9 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
+	# sh2 nommu is supported by musl, but we don't have support
+	# for it in Buildroot.
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
