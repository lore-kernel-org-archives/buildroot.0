From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Thu, 29 Aug 2013 19:10:40 -0300
Subject: [Buildroot] [PATCH v3 1/2] nios2: Add new architecture
In-Reply-To: <1377814241-10526-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1377814241-10526-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <1377814241-10526-2-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This commit adds very basic support to build for the Nios II
architecture. Toolchain support is still missing and instead
we need to use an external custom toolchain.

Notice that this architecture had been previously removed in
Buildroot 2010.05-rc1 release (as explained in the CHANGES file)
and this commit adds it back.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 arch/Config.in       | 11 +++++++++++
 arch/Config.in.nios2 |  5 +++++
 toolchain/Config.in  |  5 +++--
 3 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 arch/Config.in.nios2

diff --git a/arch/Config.in b/arch/Config.in
index 0b5b218..14899ca 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -124,6 +124,13 @@ config BR2_mips64el
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
+config BR2_nios2
+	bool "Nios II"
+	help
+	  Nios II is a soft core processor from Altera Corporation.
+	  http://www.altera.com/
+	  http://en.wikipedia.org/wiki/Nios_II
+
 config BR2_powerpc
 	bool "PowerPC"
 	help
@@ -305,6 +312,10 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
 source "arch/Config.in.mips"
 endif
 
+if BR2_nios2
+source "arch/Config.in.nios2"
+endif
+
 if BR2_powerpc
 source "arch/Config.in.powerpc"
 endif
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
new file mode 100644
index 0000000..ed63898
--- /dev/null
+++ b/arch/Config.in.nios2
@@ -0,0 +1,5 @@
+config BR2_ARCH
+	default "nios2"
+
+config BR2_ENDIAN
+	default "LITTLE"
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 53d2573..9d1e68f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -25,7 +25,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_microblaze && !BR2_aarch64
+	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_nios2
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
@@ -38,7 +38,8 @@ config BR2_TOOLCHAIN_EXTERNAL
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
 	depends on BR2_DEPRECATED
-	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa && !BR2_arc
+	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa && \
+		   !BR2_arc && !BR2_nios2
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
-- 
1.8.1.5
