Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C0981361;
	Sat, 12 Feb 2022 17:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7lerbau8tch; Sat, 12 Feb 2022 17:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840C881332;
	Sat, 12 Feb 2022 17:13:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 315F61BF580
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 17:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DCD1402E9
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 17:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxOKchlup6Qm for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 17:13:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40C0C40259
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 17:13:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DCB5F8215C; Sat, 12 Feb 2022 17:06:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 18:11:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 695b21d6a16ab2033e8bdc86a5df38880e5aecda
X-Git-Newrev: 7227d005d2435ec7b38995a6247d233ddb5ba365
X-Patchwork-Hint: ignore
Message-Id: <20220212170619.DCB5F8215C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8459107994358004551=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8459107994358004551==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7227d005d2435ec7b38995a6247d233ddb5ba365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr:
  - only depend on libx11-xlib or libexpoxy if actually enabled
  - simplify qt5 dependency
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...e-Werror-and-Wfatal-errors-compiler-comma.patch | 37 +++++++++++++++++
 package/libcamera-apps/Config.in                   | 29 +++++++++++++
 package/libcamera-apps/libcamera-apps.hash         |  3 ++
 package/libcamera-apps/libcamera-apps.mk           | 48 ++++++++++++++++++++++
 6 files changed, 119 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b36f42e274..9e3142d8a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2283,6 +2283,7 @@ F:	package/gstreamer1/gst1-devtools/
 F:	package/gstreamer1/gst1-interpipe/
 F:	package/gstreamer1/gstreamer1-editing-services/
 F:	package/iwd/
+F:	package/libcamera-apps/
 F:	package/libevdev/
 F:	package/libuev/
 F:	package/log4cplus/
diff --git a/package/Config.in b/package/Config.in
index 314a17a6db..10209d84d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1738,6 +1738,7 @@ menu "Multimedia"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libcamera/Config.in"
+	source "package/libcamera-apps/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
diff --git a/package/libcamera-apps/0001-cmake-remove-Werror-and-Wfatal-errors-compiler-comma.patch b/package/libcamera-apps/0001-cmake-remove-Werror-and-Wfatal-errors-compiler-comma.patch
new file mode 100644
index 0000000000..988d89cca3
--- /dev/null
+++ b/package/libcamera-apps/0001-cmake-remove-Werror-and-Wfatal-errors-compiler-comma.patch
@@ -0,0 +1,37 @@
+From 6bd733b52f0b4039407c676cd3126a9e2f79456b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 5 Feb 2021 18:24:08 +0100
+Subject: [PATCH] cmake: remove -Werror and -Wfatal-errors compiler command
+ line option
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes (with bootlin-riscv64-musl toolchain):
+
+  .../build/libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5/core/libcamera_app.cpp:30:22: error: overflow in conversion from ‘long unsigned int’ to ‘int’ changes value from ‘2154321408’ to ‘-2140645888’ [-Werror=overflow]
+     30 |  int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
+        |                      ^~~~~~~~~~~~~~~
+  cc1plus: all warnings being treated as errors
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 748c6dd..1ca1e39 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -11,7 +11,7 @@ endif()
+ 
+ set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
+ set (CMAKE_CXX_STANDARD 17)
+-add_compile_options(-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new -Werror -Wfatal-errors)
++add_compile_options(-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new)
+ add_definitions(-D_FILE_OFFSET_BITS=64)
+ 
+ if (CMAKE_COMPILER_IS_GNUCXX)
+-- 
+2.34.1
+
diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
new file mode 100644
index 0000000000..a1affc2d23
--- /dev/null
+++ b/package/libcamera-apps/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_LIBCAMERA_APPS
+	bool "libcamera-apps"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
+	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
+	depends on !BR2_STATIC_LIBS # gnutls/libcamera
+	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCAMERA
+	select BR2_PACKAGE_LIBEXIF
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+	select BR2_PACKAGE_LIBEPOXY if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
+	help
+	  This is a small suite of libcamera-based apps that aim to copy
+	  the functionality of the existing "raspicam" apps.
+
+	  https://github.com/raspberrypi/libcamera-apps
+
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
new file mode 100644
index 0000000000..2dbb74d463
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  611aec06dd24de6586580164d9b7c55da0698ac4cf129944b2fc41fe67210597  libcamera-apps-2d1009e3badcc8047361ff81149ad6cba3b911b5.tar.gz
+sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
new file mode 100644
index 0000000000..210d4e1e52
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# libcamera-apps
+#
+################################################################################
+
+LIBCAMERA_APPS_VERSION = 2d1009e3badcc8047361ff81149ad6cba3b911b5
+LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_LICENSE = BSD-2-Clause
+LIBCAMERA_APPS_LICENSE_FILES = license.txt
+LIBCAMERA_APPS_DEPENDENCIES = \
+	host-pkgconf \
+	boost \
+	jpeg \
+	libcamera \
+	libexif \
+	libpng \
+	tiff
+
+LIBCAMERA_APPS_CONF_OPTS = \
+	-DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled \
+	-DENABLE_OPENCV=0 \
+	-DENABLE_TFLITE=0
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+LIBCAMERA_APPS_DEPENDENCIES += libdrm
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
+else
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBCAMERA_APPS_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
+	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=1
+else
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=0
+endif
+
+ifeq ($(BR2_PACKAGE_QT5),y)
+LIBCAMERA_APPS_DEPENDENCIES += qt5base
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=1
+else
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=0
+endif
+
+$(eval $(cmake-package))

--===============8459107994358004551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8459107994358004551==--
