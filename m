From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:25:59 +0100
Subject: [Buildroot] [git commit] package/gkrellm: fix client build
Message-ID: <20210114210822.A231A8642F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86b07d220cea7cb236dff694df5e07f7c335e1bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set X11_LIBS to avoid the following build failure:

/home/buildroot/autobuild/run/instance-1/output-1/host/bin/aarch64-linux-gnu-gcc main.o alerts.o battery.o base64.o clock.o cpu.o disk.o fs.o hostname.o inet.o mail.o mem.o net.o proc.o sensors.o uptime.o chart.o panel.o config.o gui.o krell.o plugins.o pixops.o client.o utils.o sysdeps-unix.o deprecated.o log.o winops-x11.o  -o gkrellm \
		 -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0 -lharfbuzz -lfontconfig -lfreetype -Wl,--export-dynamic -lgmodule-2.0 -lglib-2.0 -lgthread-2.0 -pthread -lglib-2.0   -L/usr/X11R6/lib -lX11 -lSM -lICE  -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -lssl -lcrypto    -lm -Wl,-E
aarch64-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/X11R6/lib'

Fixes:
 - http://autobuild.buildroot.org/results/fff9a48efe3818f67a8f4b0fe3a3a605e4985b3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gkrellm/gkrellm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index ebc0cd72f3..2a68722663 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -36,6 +36,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GKRELLM_CLIENT),y)
 GKRELLM_DEPENDENCIES += libgtk2 xlib_libSM
+GKRELLM_BUILD_OPTS += X11_LIBS="-lX11 -lSM -lICE"
 GKRELLM_LICENSE += GPL (base64.c), Public Domain (md5.h, md5c.c)
 endif
 
