From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 23:55:09 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 sctp option
Message-ID: <20210301223309.DB8DE862C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd6bcc09165c09d2ab60e52410a9418f8be6f506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sctp unconditionnally uses __sync_*_4 intrinsics in
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/blob/master/ext/sctp/usrsctp/usrsctplib/user_atomic.h

As a result, this will raise the following build failure with bootlin
sparc toolchain:

/srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ext/sctp/usrsctp/libusrsctp-static.a(usrsctplib_user_socket.c.o): in function `usrsctp_conninput':
user_socket.c:(.text+0x3004): undefined reference to `__sync_fetch_and_add_4'

sctp uses an internal version of usrsctp (which is not available in
buildroot) and is available since version 1.15.1:
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/e2f06326eac7c3c7fa9c0d5baf4bf9673fc93376

Fixes:
 - http://autobuild.buildroot.org/results/981b11ae9746d1eef40c1797398c4f6c16f005bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           |  4 ++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 191820df1d..628a9df42c 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -577,6 +577,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC
 	bool "sbc"
 	select BR2_PACKAGE_SBC
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCTP
+	bool "sctp"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrinsics
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM
 	bool "shm"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 83abc7fab8..e8cea5bb34 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -691,6 +691,16 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dsbc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCTP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += \
+	-Dsctp=enabled \
+	-Dsctp-internal-usrsctp=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += \
+	-Dsctp=disabled \
+	-Dsctp-internal-usrsctp=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dshm=enabled
 else
