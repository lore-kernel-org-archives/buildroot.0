From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 14:49:00 +0200
Subject: [Buildroot] [git commit] package/libdrm: fix linking of
	etnaviv_cmd_stream_test
Message-ID: <20170402124912.754C38263F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=658bf79aeb6e00f8d8ded65395d4dfb1566c564e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/68a/68af62f4ab6944d326468818562c05fd5cc55b03/
http://autobuild.buildroot.net/results/c33/c3330ef9a8cadb46bbd31c5b14ece34f192133e3/
http://autobuild.buildroot.net/results/d18/d181bd044246646732a14815aae08337b0b5eecf/
http://autobuild.buildroot.net/results/4f5/4f5872211812c7e191cffcf41cab998fc20c0d20/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: add missing autoreconf=yes.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-tests-etnaviv-link-against-libdrm.patch   | 31 ++++++++++++++++++++++
 package/libdrm/libdrm.mk                           |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/package/libdrm/0003-tests-etnaviv-link-against-libdrm.patch b/package/libdrm/0003-tests-etnaviv-link-against-libdrm.patch
new file mode 100644
index 0000000..62da60e
--- /dev/null
+++ b/package/libdrm/0003-tests-etnaviv-link-against-libdrm.patch
@@ -0,0 +1,31 @@
+From b1e904cd1d5989a13c0a184525e8153bac22e1d7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 2 Apr 2017 12:17:41 +0200
+Subject: [PATCH] tests/etnaviv: link against libdrm
+
+Fixes link errors detected by buildroot autobuilders:
+
+http://autobuild.buildroot.net/results/68a/68af62f4ab6944d326468818562c05fd5cc55b03/build-end.log
+
+Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=100530
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ tests/etnaviv/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/etnaviv/Makefile.am b/tests/etnaviv/Makefile.am
+index 06318643..226baee2 100644
+--- a/tests/etnaviv/Makefile.am
++++ b/tests/etnaviv/Makefile.am
+@@ -28,6 +28,7 @@ etnaviv_2d_test_SOURCES = \
+ 	write_bmp.h
+ 
+ etnaviv_cmd_stream_test_LDADD = \
++	$(top_builddir)/libdrm.la \
+ 	$(top_builddir)/etnaviv/libdrm_etnaviv.la
+ 
+ etnaviv_cmd_stream_test_SOURCES = \
+-- 
+2.11.0
+
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 8ece196..875d3cc 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -8,6 +8,8 @@ LIBDRM_VERSION = 2.4.76
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
+# 0003-tests-etnaviv-link-against-libdrm.patch
+LIBDRM_AUTORECONF = YES
 
 LIBDRM_INSTALL_STAGING = YES
 
