From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Nov 2020 09:40:11 +0100
Subject: [Buildroot] [git commit] package/modem-manager: fix build without
 xsltproc
Message-ID: <20201105082748.5E38E81029@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eb9e3624214a2d57bcb8c03a0d08cb12302749a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8efb52c1a17210dc79cfb61f56a71ffb760ccbe9 added a libxslt
dependency presumably to manage
https://github.com/freedesktop/ModemManager/commit/bbd39a457ce2949dd167f9c2e01eecf6a9e14716

However, this is wrong and build will fail on:

checking for xsltproc... no
configure: error: Please install xsltproc before configuring.

xsltproc is used to generate ModemManager-names.h since, at least,
version 0.7.990 and
https://github.com/freedesktop/ModemManager/commit/365b906a3e1bda05af10f92451a6b6ae60f8b879
However, this file is already available in the official tarball so drop
this unneeded dependency and set ac_cv_prog_XSLTPROC_CHECK to yes

Fixes:
 - http://autobuild.buildroot.org/results/edc755b874ea43d1c009ad76c28f05e18519138e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/Config.in        | 1 -
 package/modem-manager/modem-manager.mk | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 062826fd0a..c4c723776d 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_MODEM_MANAGER
 	select BR2_PACKAGE_DBUS # runtime dependency
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_LIBXSLT
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 53cd0aff9a..372e7da1e4 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -9,9 +9,10 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 libxslt $(TARGET_NLS_DEPENDENCIES)
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
+MODEM_MANAGER_CONF_ENV = ac_cv_prog_XSLTPROC_CHECK=yes
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
