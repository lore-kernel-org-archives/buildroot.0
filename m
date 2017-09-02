From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Sep 2017 21:38:49 +0200
Subject: [Buildroot] [PATCH 1/4] arch: add option to disable internal
	toolchain backend
In-Reply-To: <cover.1504381100.git.yann.morin.1998@free.fr>
References: <cover.1504381100.git.yann.morin.1998@free.fr>
Message-ID: <5326fe3900e51f3b0a2ac4fc9d750245d560802c.1504381100.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some architectures or specific cores do not have support in upstream
gcc. Currently, they are individually listed as exclusions in the
toolchain choice.

This poses a maintainance burden, as the knowledge about what gcc
version supports what architecture is split across many places: the
toolchain choice, the gcc version choice, the external toolchains.

As a first step, add a blind option that architectures or individual
cores may select to indicate they lack support in our internal backend.

Yes, the logic is inverted, because the very large majority of archs and
cores do have support in upstream gcc (or in a vendor fork we support,
like bfin and arc). Only a very few do not, and it is much easier to
cater to those rather than all the others.

Actual use of the option will come in followup patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in      | 6 ++++++
 toolchain/Config.in | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index f385745e47..da893caf5a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -250,6 +250,12 @@ config BR2_xtensa
 
 endchoice
 
+# For some architectures or specific cores, our internal toolchain
+# backend is not suitable (like, missing support in upstream gcc, or
+# no ChipCo fork exists...)
+config BR2_ARCH_NO_INTERNAL_BACKEND
+	bool
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 584d053058..919757e558 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -43,6 +43,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	depends on !BR2_ARCH_NO_INTERNAL_BACKEND
 	depends on !BR2_bf606
 	depends on !BR2_bf607
 	depends on !BR2_bf608
-- 
2.11.0
