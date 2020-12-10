From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:21:50 +0100
Subject: [Buildroot] [git commit]
 package/gstreamer1/gstreamer1-editing-services: bump version to 1.18.2
Message-ID: <20201210210759.1787D8267F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a078be8599df11082ddef53c1ba57643c7778b77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 0001-utils.c-fix-static-build.patch
  (upstream committed [1])

[1] https://gitlab.freedesktop.org/gstreamer/gst-editing-services/-/commit/c4faa178af25bf1cabee680b5f2a69b3029db943

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-utils.c-fix-static-build.patch            | 74 ----------------------
 .../gstreamer1-editing-services.hash               |  4 +-
 .../gstreamer1-editing-services.mk                 |  2 +-
 3 files changed, 3 insertions(+), 77 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-utils.c-fix-static-build.patch b/package/gstreamer1/gstreamer1-editing-services/0001-utils.c-fix-static-build.patch
deleted file mode 100644
index 8b60299ce3..0000000000
--- a/package/gstreamer1/gstreamer1-editing-services/0001-utils.c-fix-static-build.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 248290c5c49b25b72b40017857c6118c51ef614e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 18 Oct 2020 16:08:36 +0200
-Subject: [PATCH] utils.c: fix static build
-
-Static build fails since version 1.17.1 and
-https://gitlab.freedesktop.org/gstreamer/gst-editing-services/-/commit/1e488d4311420b5ca193155ad8ab05509c9a4a37
-on:
-
-FAILED: tools/ges-launch-1.0
-/srv/storage/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc  -o tools/ges-launch-1.0 tools/ges-launch-1.0.p/ges-validate.c.o tools/ges-launch-1.0.p/ges-launch.c.o tools/ges-launch-1.0.p/ges-launcher.c.o tools/ges-launch-1.0.p/utils.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,-Bsymbolic-functions -static -Wl,--start-group ges/libges-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgobject-2.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libglib-2.0.a -pthread /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcre.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libffi.a /srv/storage/autobuild/run/instance-2/output
 -1/host/
 arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgmodule-2.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstbase-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstvideo-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstpbutils-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstaudio-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libz.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgsttag-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstcontroller-1.0.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sys
 root/usr
 /lib/libgio-2.0.a /srv/storage/autobuild/run/instance
-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmount.a /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libblkid.a -lm -Wl,--end-group
-/srv/storage/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /srv/storage/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(err.os): in function `warn':
-err.c:(.text+0x1d8): multiple definition of `warn'; tools/ges-launch-1.0.p/utils.c.o:utils.c:(.text+0x9bc): first defined here
-
-So rename warn function to gst_warn
-
-Fixes:
- - http://autobuild.buildroot.org/results/2a528a1185644f5b23d26eb3f2b342e99aa1e493
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gst-editing-services/-/merge_requests/216]
----
- tools/ges-launcher.c | 2 +-
- tools/utils.c        | 2 +-
- tools/utils.h        | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/ges-launcher.c b/tools/ges-launcher.c
-index ad2921cc..9eb1f615 100644
---- a/tools/ges-launcher.c
-+++ b/tools/ges-launcher.c
-@@ -261,7 +261,7 @@ _set_rendering_details (GESLauncher * self)
-       }
- 
-       if (!prof) {
--        warn ("No format specified and couldn't find one from output file extension, " "falling back to theora+vorbis in ogg.");
-+        gst_warn ("No format specified and couldn't find one from output file extension, " "falling back to theora+vorbis in ogg.");
-         g_free (opts->format);
- 
-         opts->format =
-diff --git a/tools/utils.c b/tools/utils.c
-index 7ad64522..fe79f0a1 100644
---- a/tools/utils.c
-+++ b/tools/utils.c
-@@ -222,7 +222,7 @@ ok (const gchar * format, ...)
- }
- 
- void
--warn (const gchar * format, ...)
-+gst_warn (const gchar * format, ...)
- {
-   va_list var_args;
- 
-diff --git a/tools/utils.h b/tools/utils.h
-index ac18ab5a..e2f0ac67 100644
---- a/tools/utils.h
-+++ b/tools/utils.h
-@@ -29,9 +29,9 @@ void print_enum (GType enum_type);
- 
- void print (GstDebugColorFlags c, gboolean err, gboolean nline, const gchar * format, va_list var_args);
- void ok (const gchar * format, ...);
--void warn (const gchar * format, ...);
-+void gst_warn (const gchar * format, ...);
- void printerr (const gchar * format, ...);
- 
- gchar * get_file_extension (gchar * uri);
- void describe_encoding_profile (GstEncodingProfile *profile);
--void print_timeline(GESTimeline *timeline);
-\ No newline at end of file
-+void print_timeline(GESTimeline *timeline);
--- 
-2.28.0
-
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 4b97105f39..e7ee3a4473 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.1.tar.xz.sha256sum
-sha256  e93cb3f1896565c57defa72758e49b6eb6685e0f804abd184f395c94822a3927  gst-editing-services-1.18.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.2.tar.xz.sha256sum
+sha256  25ac7cd252a9bcb9ae179eca0b52fc9cf5384c1df16adab4d87bd84b3f9a625f  gst-editing-services-1.18.2.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index a802e824d5..6fc5b71358 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.1
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.2
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
