From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:15 +0100
Subject: [Buildroot] [PATCH 09/16] toolchain-buildroot: don't show musl on
	noMMU platforms
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While musl has recently gained noMMU support for the sh2 platform, we
don't support this yet. So for the time being, let's not show musl as
an available C library on noMMU platforms. This is for example
important on ARM noMMU: ARM is supported by musl, but not its noMMU
variants.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index ea290eb..1fba06b 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -94,6 +94,9 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
+	# sh2 nommu is supported by musl, but we don't have support
+	# for it yet in Buildroot.
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
-- 
2.6.4
