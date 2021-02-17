From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:20:32 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/orc: fix powerpc
 build with headers < 4.11
Message-ID: <20210217100032.B24AF847B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00de741676354078b5cfb46d6428fb1fd8ca26b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Autobuilder failures are raised with bootlin toolchains but it affects
orc since version 0.4.30

Fixes:
 - http://autobuild.buildroot.org/results/0821e96cba3e455edd47b87485501d892fc7ac6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 31c430cf5b82ab315eefdeeb105ba2ab11105917)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ccpu-powerpc.c-fix-build-with-kernel-4.11.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch b/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch
new file mode 100644
index 0000000000..0a4e7010f2
--- /dev/null
+++ b/package/orc/0001-orc-orccpu-powerpc.c-fix-build-with-kernel-4.11.patch
@@ -0,0 +1,70 @@
+From a45f6d49ec090ad94333c0865c378d2d96ab2af4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 15 Feb 2021 20:17:43 +0100
+Subject: [PATCH] orc/orccpu-powerpc.c: fix build with kernel < 4.11
+
+Build with powerpc and kernel < 4.11 is broken since version 0.4.30 and
+https://gitlab.freedesktop.org/gstreamer/orc/-/commit/a999325abea6a5549d60d99ddeb0271d2aa00235:
+
+FAILED: orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/powerpc-linux-gcc -Iorc/liborc-0.4.so.0.32.0.p -Iorc -I../orc -I. -I.. -fdiagnostics-color=always -pipe -Wall -Winvalid-pch -std=gnu99 -O3 -DHAVE_CONFIG_H -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fPIC -pthread -DORC_ENABLE_UNSTABLE_API -D_GNU_SOURCE -DBUILDING_ORC -MD -MQ orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o -MF orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o.d -o orc/liborc-0.4.so.0.32.0.p/orccpu-powerpc.c.o -c ../orc/orccpu-powerpc.c
+../orc/orccpu-powerpc.c: In function 'orc_check_powerpc_proc_auxv':
+../orc/orccpu-powerpc.c:164:21: error: 'AT_L1D_CACHESIZE' undeclared (first use in this function); did you mean 'AT_DCACHEBSIZE'?
+  164 |       if (buf[i] == AT_L1D_CACHESIZE) {
+      |                     ^~~~~~~~~~~~~~~~
+      |                     AT_DCACHEBSIZE
+../orc/orccpu-powerpc.c:164:21: note: each undeclared identifier is reported only once for each function it appears in
+../orc/orccpu-powerpc.c:168:21: error: 'AT_L2_CACHESIZE' undeclared (first use in this function); did you mean 'AT_ICACHEBSIZE'?
+  168 |       if (buf[i] == AT_L2_CACHESIZE) {
+      |                     ^~~~~~~~~~~~~~~
+      |                     AT_ICACHEBSIZE
+../orc/orccpu-powerpc.c:172:21: error: 'AT_L3_CACHESIZE' undeclared (first use in this function); did you mean 'AT_ICACHEBSIZE'?
+  172 |       if (buf[i] == AT_L3_CACHESIZE) {
+      |                     ^~~~~~~~~~~~~~~
+      |                     AT_ICACHEBSIZE
+
+Indeed, AT_{L1D,L2,L3}_CACHESIZE is only defined since kernel 4.11 and
+https://github.com/torvalds/linux/commit/98a5f361b8625c6f4841d6ba013bbf0e80d08147
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0821e96cba3e455edd47b87485501d892fc7ac6a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/orc/-/merge_requests/56]
+---
+ orc/orccpu-powerpc.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/orc/orccpu-powerpc.c b/orc/orccpu-powerpc.c
+index 6796f17..340cf05 100644
+--- a/orc/orccpu-powerpc.c
++++ b/orc/orccpu-powerpc.c
+@@ -161,18 +161,24 @@ orc_check_powerpc_proc_auxv (void)
+         _orc_cpu_name = (char*)buf[i + 1];
+         found++;
+       }
++#ifdef AT_L1D_CACHESIZE
+       if (buf[i] == AT_L1D_CACHESIZE) {
+         _orc_data_cache_size_level1 = buf[i + 1];
+         found++;
+       }
++#endif
++#ifdef AT_L2_CACHESIZE
+       if (buf[i] == AT_L2_CACHESIZE) {
+         _orc_data_cache_size_level2 = buf[i + 1];
+         found++;
+       }
++#endif
++#ifdef AT_L3_CACHESIZE
+       if (buf[i] == AT_L3_CACHESIZE) {
+         _orc_data_cache_size_level3 = buf[i + 1];
+         found++;
+       }
++#endif
+       if (found == 6)
+         break;
+     }
+-- 
+2.30.0
+
