From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 18 Jun 2021 20:31:50 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/sane-backends: fix NDEBUG
 compile (missing PDBG before pixma_dbg)
In-Reply-To: <20210618183150.618-1-ps.report@gmx.net>
References: <20210618183150.618-1-ps.report@gmx.net>
Message-ID: <20210618183150.618-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to add missing PDBG before pixma_dbg.

Fixes:

  - http://autobuild.buildroot.net/results/88f4ea971875b1a5eb88662326d9343341eaaea2

  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: ./.libs/libpixma.a(libpixma_la-pixma_common.o): in function `sanei_pixma_read_image':
  pixma_common.c:(.text+0xc05): undefined reference to `DBG'
  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: pixma_common.c:(.text+0xc38): undefined reference to `DBG'
  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: pixma_common.c:(.text+0xcbf): undefined reference to `DBG'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ackend-pixma-fix-compile-with-NDEBUG.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/sane-backends/0006-backend-pixma-fix-compile-with-NDEBUG.patch

diff --git a/package/sane-backends/0006-backend-pixma-fix-compile-with-NDEBUG.patch b/package/sane-backends/0006-backend-pixma-fix-compile-with-NDEBUG.patch
new file mode 100644
index 0000000000..2213cdb9b5
--- /dev/null
+++ b/package/sane-backends/0006-backend-pixma-fix-compile-with-NDEBUG.patch
@@ -0,0 +1,47 @@
+From b1021e09e435e6c727303b9bfa2f69eb8fcf958a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 18 Jun 2021 20:10:02 +0200
+Subject: [PATCH] backend/pixma: fix compile with NDEBUG
+
+Fixes:
+
+  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: ./.libs/libpixma.a(libpixma_la-pixma_common.o): in function `sanei_pixma_read_image':
+pixma_common.c:(.text+0xc05): undefined reference to `DBG'
+  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: pixma_common.c:(.text+0xc38): undefined reference to `DBG'
+  .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: pixma_common.c:(.text+0xcbf): undefined reference to `DBG'
+
+[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/638]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ backend/pixma/pixma_common.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/backend/pixma/pixma_common.c b/backend/pixma/pixma_common.c
+index 6bce4bce9..24912b863 100644
+--- a/backend/pixma/pixma_common.c
++++ b/backend/pixma/pixma_common.c
+@@ -968,16 +968,16 @@ pixma_read_image (pixma_t * s, void *buf, unsigned len)
+               s->last_source = s->param->source;
+               if ((s->cur_image_size != s->param->image_size) && !s->param->mode_jpeg)
+                 {
+-                  pixma_dbg (1, "WARNING:image size mismatches\n");
+-                  pixma_dbg (1,
++                  PDBG (pixma_dbg (1, "WARNING:image size mismatches\n"));
++                  PDBG (pixma_dbg (1,
+                        "    %"PRIu64" expected (%d lines) but %"PRIu64" received (%"PRIu64" lines)\n",
+                        s->param->image_size, s->param->h,
+                        s->cur_image_size,
+-                       s->cur_image_size / s->param->line_size);
++                       s->cur_image_size / s->param->line_size));
+                   if ((s->cur_image_size % s->param->line_size) != 0)
+                     {
+-                      pixma_dbg (1,
+-                     "BUG:received data not multiple of line_size\n");
++                      PDBG (pixma_dbg (1,
++                           "BUG:received data not multiple of line_size\n"));
+                     }
+                 }
+               if ((s->cur_image_size < s->param->image_size) && !s->param->mode_jpeg)
+-- 
+2.31.1
+
-- 
2.31.1
