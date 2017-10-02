From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:41:29 +0200
Subject: [Buildroot] [git commit] arch: add option to disable internal
	toolchain backend
Message-ID: <20171002193852.34A0481049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31a726122f6bf07b56341144465964fe342ec614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some architectures or specific cores do not have support in upstream
gcc. Currently, they are individually listed as exclusions in the
toolchain choice.

This poses a maintainance burden, as the knowledge about what gcc
version supports what architecture is split across many places: the
toolchain choice, the gcc version choice, the external toolchains.

As a first step, add a blind option that architectures or individual
cores may select to indicate they lack support in our internal backend.

Actual use of the option will come in followup patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in      | 10 ++++++++++
 toolchain/Config.in |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index f385745..caf5a31 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -250,6 +250,16 @@ config BR2_xtensa
 
 endchoice
 
+# For some architectures or specific cores, our internal toolchain
+# backend is not suitable (like, missing support in upstream gcc, or
+# no ChipCo fork exists...)
+config BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	bool
+
+config BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
+	bool
+	default y if !BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 584d053..8866b7d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -43,6 +43,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
 	depends on !BR2_bf606
 	depends on !BR2_bf607
 	depends on !BR2_bf608
