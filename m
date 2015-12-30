From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Wed, 30 Dec 2015 14:30:56 +0100
Subject: [Buildroot] [PATCH 1/1] libdvbpsi: new package
Message-ID: <1451482256-11816-1-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libdvbpsi is a library used by vlc for decoding MPEG TS

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 package/Config.in                |  1 +
 package/libdvbpsi/Config.in      |  8 ++++++++
 package/libdvbpsi/libdvbpsi.hash |  4 ++++
 package/libdvbpsi/libdvbpsi.mk   | 15 +++++++++++++++
 package/vlc/vlc.mk               |  7 +++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/libdvbpsi/Config.in
 create mode 100644 package/libdvbpsi/libdvbpsi.hash
 create mode 100644 package/libdvbpsi/libdvbpsi.mk

diff --git a/package/Config.in b/package/Config.in
index bc6099d..5abd9d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1015,6 +1015,7 @@ menu "Multimedia"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
+	source "package/libdvbpsi/Config.in"
 	source "package/libdvbsi/Config.in"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
diff --git a/package/libdvbpsi/Config.in b/package/libdvbpsi/Config.in
new file mode 100644
index 0000000..7323466
--- /dev/null
+++ b/package/libdvbpsi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBDVBPSI
+	bool "libdvbpsi"
+	help
+	  libdvbpsi is a simple library designed for decoding and
+	  generation of MPEG TS and DVB PSI tables according to standards
+	  ISO/IEC 13818 and ITU-T H.222.0.
+
+	  http://www.videolan.org/developers/libdvbpsi.html
diff --git a/package/libdvbpsi/libdvbpsi.hash b/package/libdvbpsi/libdvbpsi.hash
new file mode 100644
index 0000000..cf76616
--- /dev/null
+++ b/package/libdvbpsi/libdvbpsi.hash
@@ -0,0 +1,4 @@
+# From http://download.videolan.org/pub/libdvbpsi/1.3.0/libdvbpsi-1.3.0.tar.bz2.md5
+md5	2b217039a1299000c39423441f77e76a	libdvbpsi-1.3.0.tar.bz2
+# From http://download.videolan.org/pub/libdvbpsi/1.3.0/libdvbpsi-1.3.0.tar.bz2.sha256
+sha256	a2fed1d11980662f919bbd1f29e2462719e0f6227e1a531310bd5a706db0a1fe	libdvbpsi-1.3.0.tar.bz2
diff --git a/package/libdvbpsi/libdvbpsi.mk b/package/libdvbpsi/libdvbpsi.mk
new file mode 100644
index 0000000..c45ade0
--- /dev/null
+++ b/package/libdvbpsi/libdvbpsi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libdvbpsi
+#
+################################################################################
+
+LIBDVBPSI_VERSION = 1.3.0
+LIBDVBPSI_SITE = http://download.videolan.org/pub/libdvbpsi/$(LIBDVBPSI_VERSION)
+LIBDVBPSI_SOURCE = libdvbpsi-$(LIBDVBPSI_VERSION).tar.bz2
+LIBDVBPSI_LICENSE = LGPLv2.1+
+LIBDVBPSI_LICENSE_FILES = COPYING
+LIBDVBPSI_AUTORECONF = YES
+LIBDVBPSI_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ca1f09c..ee21c16 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -179,6 +179,13 @@ else
 VLC_CONF_OPTS += --disable-libass
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVBPSI),y)
+VLC_CONF_OPTS += --enable-dvbpsi
+VLC_DEPENDENCIES += libdvbpsi
+else
+VLC_CONF_OPTS += --disable-dvbpsi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 VLC_CONF_OPTS += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
-- 
1.9.1
