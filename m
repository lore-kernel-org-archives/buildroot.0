From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 08:53:25 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-external: warn for
 untested GCC/kernel version
Message-ID: <20200202075057.178538818C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4ba0b7bf1aa647f1ec4cd0b01700a2d6d5456f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The oldest toolchain we test in the autobuilders is the Sourcery ARM
toolchain which is GCC 4.8 and kernel headers 3.13. Therefore, it is
likely that we're missing the required _AT_LEAST dependencies to exclude
packages that don't build with older GCC/headers.

Add a comment to the custom external toolchain that warns when an
untested GCC or kernel headers version is selected.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 665765a104..9680509a13 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -92,6 +92,9 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
 
 endchoice
 
+comment "GCC older than 4.8 is not tested by Buildroot. Use at your own risk."
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 choice
 	bool "External toolchain kernel headers series"
 	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
@@ -298,6 +301,9 @@ config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
 
 endchoice
 
+comment "Kernel headers older than 3.13 is not tested by Buildroot. Use at your own risk."
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+
 choice
 	prompt "External toolchain C library"
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
