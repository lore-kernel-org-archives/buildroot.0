From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 18 Apr 2019 20:38:45 +0300
Subject: [Buildroot] [PATCH v2] linux-tools/perf: Add dependency on 32-bit
 atomics
Message-ID: <20190418173845.14495-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atomic ops are strictly required by perf utility as it uses
atomic_xxx() functions.

Otherwise building fails like that:
|.../output/host/opt/ext-toolchain/bin/../lib/gcc/arc-snps-linux-uclibc/8.2.1/../../../../arc-snps-linux-uclibc/bin/ld:
|.../output/build/linux-5.0.7/tools/perf/libperf.a(libperf-in.o): in function `atomic_cmpxchg':
|.../output/build/linux-5.0.7/tools/include/asm-generic/atomic-gcc.h:69: undefined reference to `__sync_val_compare_and_swap_4'

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---

Changes v1 -> v2:
 * Depend on generic BR2_TOOLCHAIN_HAS_SYNC_4

 package/linux-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 4916faa349..104065b22d 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -46,6 +46,7 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	select BR2_PACKAGE_LINUX_TOOLS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
 	  "Performance Counters for Linux") - is a performance
@@ -64,6 +65,9 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
 
 	  https://perf.wiki.kernel.org/
 
+comment "perf needs 32-bit atomic ops"
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_4
+
 if BR2_PACKAGE_LINUX_TOOLS_PERF
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
-- 
2.16.2
