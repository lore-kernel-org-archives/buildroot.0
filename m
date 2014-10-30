From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 30 Oct 2014 16:57:27 +0300
Subject: [Buildroot] [PATCH 1/3] arc: add explicit selection of CPU
	templates ARC 750D and ARC770D
In-Reply-To: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1414677449-15937-2-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This separation allows to specify unique options and features for each
CPU.

For example ARC 770D has LLOCK/SCOND instructions built-in by default.
Also this new scheme simplifies selection of proper configuration for
users - preconfigured options now match templates for ARC CPUs.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
---
 arch/Config.in.arc | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index fcb5d7d..b31b141 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,6 +1,22 @@
-# Choise of atomic instructions presence
+choice
+	prompt "Target CPU"
+	depends on BR2_arc
+	default BR2_arc770d
+	help
+	    Specific CPU to use
+
+config BR2_arc750d
+	bool "ARC 750D"
+
+config BR2_arc770d
+	bool "ARC 770D"
+
+endchoice
+
+# Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
+	default y if BR2_arc770d
 
 config BR2_ARCH_HAS_ATOMICS
 	default y if BR2_ARC_ATOMIC_EXT
@@ -18,4 +34,5 @@ config BR2_ENDIAN
 	default "BIG"	 if BR2_arceb
 
 config BR2_GCC_TARGET_CPU
-	default "arc700"
+	default "arc700" if BR2_arc750d
+	default "arc700" if BR2_arc770d
-- 
1.9.3
