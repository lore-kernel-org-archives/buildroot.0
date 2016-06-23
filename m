From: Yann E. MORIN <yann.morin@orange.com>
Date: Thu, 23 Jun 2016 09:05:15 +0200
Subject: [Buildroot] [PATCH] package/qt5base: add optional dependency on udev
Message-ID: <1466665515-26237-1-git-send-email-yann.morin@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt5 can optionally enable udev support, especially to enumerate input
devices dynamically. Without udev, devices are not properly enumerated,
and any device that is not present at launch time is never seen (there
is no support for hotplug, that is).

Currently, Qt5base has no explicit dependency on udev, so it will all
depend on the build order. Sometimes, a package that requires udev will
be built before qt5base and Qt5 will have support for udev, sometime no
such package is built before qt5base and Qt5 will not have support for
udev.

Add an explicit dependency on udev, but only if it is enabled.

Note: this only really requires libudev, but we do not yet have a
separate libudev; we still only have a udev provider (be it eudev or
systemd).

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Cedric Chedaleux <cedric.chedaleux@orange.com>
---
 package/qt5/qt5base/qt5base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c4b9a54..248abb9 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -53,6 +53,11 @@ ifneq ($(QT5BASE_CONFIG_FILE),)
 QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
+# For libudev
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT5BASE_DEPENDENCIES += udev
+endif
+
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
-- 
1.9.1
