From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:13:42 +0200
Subject: [Buildroot] [git commit] package/libqmi: bump version to 1.28.2
Message-ID: <20210328194905.4949D802D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53baf80834bf70839a9baea6f6352f1c9e594933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libqrtr-glib is now optional dependency (since libqmi >= 1.28.0)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqmi/libqmi.hash |  2 +-
 package/libqmi/libqmi.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 1304a072e2..8cf25f486a 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  a71963bb1097a42665287e40a9a36f95b8f9d6d6a4b7a5de22d660328af97cb9  libqmi-1.26.6.tar.xz
+sha256  8c8c3ee719874d2529bce9b35b028fe435b36f003979a360d3ad0938449db783  libqmi-1.28.2.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 6b5ccfcdea..b02312d702 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.26.6
+LIBQMI_VERSION = 1.28.2
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
@@ -33,6 +33,14 @@ else
 LIBQMI_CONF_OPTS += --disable-mbim-qmux
 endif
 
+# if libqrtr-glib available, enable support for QMI over QRTR
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+LIBQMI_DEPENDENCIES += libqrtr-glib
+LIBQMI_CONF_OPTS += --enable-qrtr
+else
+LIBQMI_CONF_OPTS += --disable-qrtr
+endif
+
 # if ModemManager available, enable MM runtime check in
 # qmi-firmware-update (note that we don't need to build-depend on
 # anything else)
