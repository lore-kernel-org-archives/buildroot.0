From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 21 Mar 2019 22:00:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-19
In-Reply-To: <20190320070050.3030222C6B@silver.osuosl.org>
References: <20190320070050.3030222C6B@silver.osuosl.org>
Message-ID: <20190321220012.64918245@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Mar 2019 07:00:43 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Build statistics for 2019-03-19
> ===============================

[...]

> Results for branch 'master'
> ===========================

>       xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/42c39af1d90ccd16198c9ea520bb14e2957028c3 |     
>          arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/487adfc643b9e4a92d57fb769887aac4d096eced |     

From the build log:

  make[1]: Entering directory '/home/buildroot/autobuild/instance-1/output/build/qt5enginio-1.6.3'
  Some of the required modules (contains(QT_CONFIG, ssl) | contains(QT_CONFIG, openssl) | contains(QT_CONFIG, openssl-linked)) are not available.
  Skipped.

[...]

  cp -dpf /home/buildroot/autobuild/instance-1/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libEnginio.so.* /home/buildroot/autobuild/instance-1/output/target/usr/lib
  cp: cannot stat '/home/buildroot/autobuild/instance-1/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libEnginio.so.*': No such file or directory
  package/pkg-generic.mk:331: recipe for target '/home/buildroot/autobuild/instance-1/output/build/qt5enginio-1.6.3/.stamp_target_installed' failed


For an correct build qt5engineio depends on Qt OpenSSL support.

Since the bump of opessl to 1.1.x and commit 'package/qt5/qt5base: exclude OpenSSL
functionality for Qt 5.6.x' ([1]) and 'package/qt5/qt5base: build Qt 5.6 with
LibreSSL if present' ([2]) Qt is build without OpenSSL support in case
of

   R2_PACKAGE_QT5_VERSION_5_6 && !BR2_PACKAGE_LIBRESSL


Tried to fix it with the following patch (and some variations of it):

--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5ENGINIO
        bool "qt5enginio"
+       depends on BR2_PACKAGE_QT5_VERSION_LATEST || BR2_PACKAGE_LIBRESSL
        select BR2_PACKAGE_OPENSSL
        select BR2_PACKAGE_QT5BASE
        select BR2_PACKAGE_QT5BASE_GUI
@@ -15,3 +16,6 @@ config BR2_PACKAGE_QT5ENGINIO
          5.6 and not recommended for new design.
 
          http://doc.qt.io/archives/qt-5.5/enginio-index.html
+
+comment "qt5enginio needs libressl OpenSSL support with Qt 5.6"
+       depends on !BR2_PACKAGE_QT5_VERSION_LATEST && !BR2_PACKAGE_LIBRESSL


But all resulted in a recursive dependency detected error...

Any hints on how to fix this without recursive dependency?

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/package/qt5?id=c110e48cecde6f543da18388322907b05b25e7d2
[2] https://git.buildroot.net/buildroot/commit/package/qt5?id=a55aca6a3d565c4fea31e410a8b7f009639f59df
