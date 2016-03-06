From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 23:41:30 +0100
Subject: [Buildroot] [git commit] gmrender-resurrect: new package
Message-ID: <20160306225525.DDA7E8185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6a7bafd5a519e71c9415ba1a68fd8e863d2f9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gmrender-resurrect is UPnP (DLNA) renderer based on gstreamer.

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
[Thomas:
 - Fix gstreamer related dependency comments to "gstreamer1 ->
   libglib2", as suggested by Arnout.
 - select BR2_PACKAGE_GST1_PLUGINS_BASE as a run-time dependency, as
   suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/gmrender-resurrect/Config.in               | 16 ++++++++++++++++
 package/gmrender-resurrect/gmrender-resurrect.hash |  2 ++
 package/gmrender-resurrect/gmrender-resurrect.mk   | 16 ++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 12cf5d6..c4d98c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -15,6 +15,7 @@ menu "Audio and video applications"
 	source "package/ffmpeg/Config.in"
 	source "package/flac/Config.in"
 	source "package/flite/Config.in"
+	source "package/gmrender-resurrect/Config.in"
 	source "package/gstreamer/Config.in"
 	source "package/gstreamer1/Config.in"
 	source "package/jack2/Config.in"
diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
new file mode 100644
index 0000000..db655ad
--- /dev/null
+++ b/package/gmrender-resurrect/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GMRENDER_RESURRECT
+	bool "gmrender-resurrect"
+	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2, libupnp
+	depends on BR2_USE_MMU # gstreamer1
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
+	select BR2_PACKAGE_LIBUPNP
+	help
+	  UPnP (DLNA) media renderer based on gstreamer
+
+	  https://github.com/hzeller/gmrender-resurrect
+
+comment "gmrender-resurrect needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
new file mode 100644
index 0000000..f41447a
--- /dev/null
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 502129ecb097bf23ba011f18a8bf1923951ec2dc6da157f3b376383c5f99b623 gmrender-resurrect-aa3d02cf40321cf78a6ea9019e23a7f6cd091dee.tar.gz
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
new file mode 100644
index 0000000..18c6e01
--- /dev/null
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gmrender-resurrect
+#
+################################################################################
+
+GMRENDER_RESURRECT_VERSION = aa3d02cf40321cf78a6ea9019e23a7f6cd091dee
+GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,$(GMRENDER_RESURRECT_VERSION))
+# Original distribution does not have default configure,
+# so we need to autoreconf:
+GMRENDER_RESURRECT_AUTORECONF = YES
+GMRENDER_RESURRECT_LICENSE = GPLv2+
+GMRENDER_RESURRECT_LICENSE_FILES = COPYING
+GMRENDER_RESURRECT_DEPENDENCIES = gstreamer1 libupnp
+
+$(eval $(autotools-package))
