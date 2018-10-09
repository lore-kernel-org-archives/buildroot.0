From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue,  9 Oct 2018 22:24:22 +0300
Subject: [Buildroot] [PATCH] meson: Use AR via wrapper
Message-ID: <20181009192422.20809-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If building with LTO enabled we need to use GCC wrapper for AR otherwise
archives get created improperly and we see a lot of unresolved symbols
on finla linkage.

In particular this allows to build SystemD with LTO.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Mark Corbin <mark.corbin@embecosm.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/meson/cross-compilation.conf.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 0eec74087b..de4600cc58 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -6,7 +6,7 @@
 [binaries]
 c = '@TARGET_CROSS at gcc'
 cpp = '@TARGET_CROSS at g++'
-ar = '@TARGET_CROSS at ar'
+ar = '@TARGET_CROSS at gcc-ar'
 strip = '@TARGET_CROSS at strip'
 pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
 
-- 
2.16.2
