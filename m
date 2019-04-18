From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 18 Apr 2019 12:39:02 +0300
Subject: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
Message-ID: <20190418093902.41835-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perf uses its own build-system and doesn't respect externally set flags.
Let's force it to use target flags as perf utility is nothing but
an ordinary user-space application.

This among other things is required to build perf for ARC700 for which
we pass "-matomic" via TARGET_ABI, see [1] for more details.

[1] https://patchwork.ozlabs.org/patch/1087471/

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 80e00c3c56..e7565773c4 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -19,6 +19,7 @@ PERF_MAKE_FLAGS = \
 	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
+	EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 	prefix=/usr \
 	WERROR=0 \
 	NO_LIBAUDIT=1 \
-- 
2.16.2
