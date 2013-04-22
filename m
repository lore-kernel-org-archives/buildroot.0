From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 22 Apr 2013 13:37:25 +0200
Subject: [Buildroot] [PATCH 1/7] arc: Add ARC and ARC BE architecture
In-Reply-To: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366630651-6857-2-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs that
can be used from deeply embedded to high performance host applications.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 arch/Config.in     |   18 ++++++++++++++++++
 arch/Config.in.arc |   10 ++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 arch/Config.in.arc

diff --git a/arch/Config.in b/arch/Config.in
index 795f24f..46edbab 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -7,6 +7,20 @@ choice
 	help
 	  Select the target architecture family to build for.
 
+config BR2_arc
+	bool "ARC (little endian)"
+	help
+	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
+	  that can be used from deeply embedded to high performance host
+	  applications. Little endian.
+
+config BR2_arceb
+	bool "ARC (big endian)"
+	help
+	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
+	  that can be used from deeply embedded to high performance host
+	  applications. Big endian.
+
 config BR2_arm
 	bool "ARM (little endian)"
 	help
@@ -175,6 +189,10 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_CPU
 	string
 
+if BR2_arc || BR2_arceb
+source "arch/Config.in.arc"
+endif
+
 if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
new file mode 100644
index 0000000..80b2dc4
--- /dev/null
+++ b/arch/Config.in.arc
@@ -0,0 +1,10 @@
+config BR2_ARCH
+	default "arc"	if BR2_arc
+	default "arceb"	if BR2_arceb
+
+config BR2_ENDIAN
+	default "LITTLE" if BR2_arc
+	default "BIG"	 if BR2_arceb
+
+config BR2_GCC_TARGET_CPU
+	default "arc700"
-- 
1.7.0.4
