From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 18:02:01 +0200
Subject: [Buildroot] [git commit] package/qt5base: add optional dependency
	on udev
Message-ID: <20160624160215.0FD8681EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf7b73ac463f017a7137c58c1d1ad7101da46444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: drop comment, as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c4b9a54..6378b5a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -53,6 +53,10 @@ ifneq ($(QT5BASE_CONFIG_FILE),)
 QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT5BASE_DEPENDENCIES += udev
+endif
+
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
