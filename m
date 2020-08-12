From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:45:34 +0200
Subject: [Buildroot] [git commit branch/next] package/atest: fix build with
 gcc 10
Message-ID: <20200812144330.42EAF85F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf8d7fe24a2c045af096dcce280dc90299a1a9bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - http://autobuild.buildroot.org/results/887c466b3703449239eedaf86f3f4dd2a2dc8afe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../atest/0001-seq.h-fix-build-with-gcc-10.patch   | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/atest/0001-seq.h-fix-build-with-gcc-10.patch b/package/atest/0001-seq.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..c0ae042b01
--- /dev/null
+++ b/package/atest/0001-seq.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,40 @@
+From fb374e0775fd9772a2cd7b99a5c21f96f7fe2a9a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Aug 2020 12:12:07 +0200
+Subject: [PATCH] seq.h: fix build with gcc 10
+
+Rename state structure to avoid the following build failure with gcc
+10.0:
+
+/bin/bash ./libtool  --tag=CC   --mode=link /home/test/autobuild/run/instance-0/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -include config.h   -Wall -Wno-sign-compare -Wno-strict-aliasing  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os     -o atest atest.o seq.o alsa.o capture.o playback.o loopback_delay.o -L/home/test/autobuild/run/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lasound -lev
+libtool: link: /home/test/autobuild/run/instance-0/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -include config.h -Wall -Wno-sign-compare -Wno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -o atest atest.o seq.o alsa.o capture.o playback.o loopback_delay.o  -L/home/test/autobuild/run/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib /home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libasound.so -ldl -lpthread -lrt /home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libev.so -lm -Wl,-rpath -Wl,/home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -Wl,-rpath -Wl,/home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
+/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: seq.o:(.bss+0x8): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
+/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: capture.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
+/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: playback.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
+/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: loopback_delay.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/887c466b3703449239eedaf86f3f4dd2a2dc8afe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/amouiche/atest/pull/3]
+---
+ seq.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/seq.h b/seq.h
+index 0fa1a95..b7ba8d1 100644
+--- a/seq.h
++++ b/seq.h
+@@ -30,7 +30,7 @@ enum seq_stat_e {
+     NULL_FRAME = 0,
+     INVALID_FRAME,
+     VALID_FRAME,
+-} state;
++};
+ 
+ 
+ struct seq_info {
+-- 
+2.27.0
+
