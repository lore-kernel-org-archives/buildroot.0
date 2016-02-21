From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:48:39 +0100
Subject: [Buildroot] [PATCH 1/7] package/gstreamer1/gstreamer1: add optional
	support for libcap
Message-ID: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcap was compiled before, gstreamer1 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/libexec/gstreamer-1.0/gst-ptp-helper | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index b788160..6761e8c 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -36,6 +36,13 @@ GSTREAMER1_CONF_OPTS = \
 
 GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+GSTREAMER1_CONF_OPTS += --with-ptp-helper-permissions=capabilities
+GSTREAMER1_DEPENDENCIES += libcap
+else
+GSTREAMER1_CONF_OPTS += --with-ptp-helper-permissions=auto
+endif
+
 # gstreamer-1.6 changed the location of its gstconfig.h file,
 # and unfortunately, not all (by far!) consumers have been
 # updated to look in the correct location.
-- 
2.7.0
