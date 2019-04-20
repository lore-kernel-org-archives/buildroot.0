From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:35:38 +0200
Subject: [Buildroot] [git commit] package/linux-tools/perf: add dependency
 on 32-bit sync builtins
Message-ID: <20190420133637.12C068A53D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5edfa6eef6a0e0b124b894be4ce5da4f14c4af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sync builtins ops are strictly required by perf utility as it uses
atomic_xxx() functions.

Otherwise building fails like that:
|.../output/host/opt/ext-toolchain/bin/../lib/gcc/arc-snps-linux-uclibc/8.2.1/../../../../arc-snps-linux-uclibc/bin/ld:
|.../output/build/linux-5.0.7/tools/perf/libperf.a(libperf-in.o): in function `atomic_cmpxchg':
|.../output/build/linux-5.0.7/tools/include/asm-generic/atomic-gcc.h:69: undefined reference to `__sync_val_compare_and_swap_4'

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: drop Config.in comment]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 4916faa349..90b4825fee 100644
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
