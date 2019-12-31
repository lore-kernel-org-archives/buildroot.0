From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 15:28:45 +0100
Subject: [Buildroot] [git commit] package/iputils: fix static build with
 libidn2
Message-ID: <20191231141927.B17707F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdb44ea17f146a6903342d19c001622b28c7b2d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/82d4738711a009959436fa419bd78c7a9540d33e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...meson.build-fix-static-build-with-libidn2.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/iputils/0001-meson.build-fix-static-build-with-libidn2.patch b/package/iputils/0001-meson.build-fix-static-build-with-libidn2.patch
new file mode 100644
index 0000000000..851d043784
--- /dev/null
+++ b/package/iputils/0001-meson.build-fix-static-build-with-libidn2.patch
@@ -0,0 +1,39 @@
+From 5bb4432b8c194620c28a45a069de1b3dad692ac9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 28 Dec 2019 11:24:12 +0100
+Subject: [PATCH] meson.build: fix static build with libidn2
+
+libidn2 can optionnaly depends on libunistring so use dependency
+function instead of cc.find_library ro retrieve this dependency and
+avoid the following build failure when building statically:
+
+FAILED: ping
+/home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-linux-gcc  -o ping 'ping at exe/ping.c.o' 'ping at exe/ping_common.c.o' 'ping at exe/ping6_common.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group libcommon.a -lm -lcap -lidn2 /home/buildroot/autobuild/run/instance-1/output-1/host/usr/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a /home/buildroot/autobuild/run/instance-1/output-1/host/usr/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libz.a /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/lib/libatomic.a -lpthread /home/buildroot/autobuild/run/instance-1/output-1/host/usr/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a -lresolv -Wl,--end-group '-Wl,-rpath,$ORIGIN/' -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-1/output-1/build/iputils-20190709/build/
+/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libidn2.a(lookup.o): in function `idn2_lookup_u8':
+lookup.c:(.text+0x7c): undefined reference to `u8_strlen'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/82d4738711a009959436fa419bd78c7a9540d33e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/iputils/iputils/pull/245]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 53c65b2..905cb96 100644
+--- a/meson.build
++++ b/meson.build
+@@ -130,7 +130,7 @@ endif
+ 
+ opt = get_option('USE_IDN')
+ if opt == true
+-	idn_dep = cc.find_library('idn2', required : false)
++	idn_dep = dependency('libidn2', required : false)
+ 	if idn_dep.found()
+ 		add_project_arguments('-DUSE_IDN', language : 'c')
+ 		conf.set('USE_IDN', 1,
+-- 
+2.24.0
+
