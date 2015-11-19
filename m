From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 23:59:34 +0100
Subject: [Buildroot] package qt5base build failed if using
	QT5BASE_OVERRIDE_SRCDIR
In-Reply-To: <tencent_0DB9B313288D1F8F3BBBF005@qq.com> (=?utf-8?B?Iua1gQ==?=
 =?utf-8?B?5pif5peg55eVIidz?= message
 of "Thu, 19 Nov 2015 19:40:29 +0800")
References: <tencent_0DB9B313288D1F8F3BBBF005@qq.com>
Message-ID: <87egfl7fzd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "????" == ????  <jordon.wu@gmail.com> writes:

 > Hi,
 > Buildroot will failed if I using QT5BASE_OVERRIDE_SRCDIR to specify qt5base to local path. error log as below.


 > It seems qt5base patch not applied while using
 > QT5BASE_OVERRIDE_SRCDIR.  How to resolved this issue if I must to
 > using QT5BASE_OVERRIDE_SRCDIR to specify qt5base to local path ?

It is because of a bug in the qt5base package. It uses a patch file to
add an essential build configuration file to the sources, and patches
are not applied to the sources when OVERRIDE_SRCDIR is used.

I will have a look at fixing this tomorrow, but a quick workaround for
now is to apply package/qt5/qt5base/0002-mkspecs-files.patch to your
override srcdir (/home/vmuser/buildroot-imx/qtbase-opensource-src-5.5.0).

 > ======================================================================
 > vmuser at ubuntu14:~/buildroot-imx/buildroot$ make qt5base-rebuild
 > rm -f /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom/.stamp_rsynced
 > rm -f /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom/.stamp_staging_installed
 > rm -f /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom/.stamp_target_installed
 > rm -f /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom/.stamp_images_installed
 > rm -f /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom/.stamp_host_installed
 > rm -f /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom/.stamp_built
 >>>> qt5base custom Syncing from source dir /home/vmuser/buildroot-imx/qtbase-opensource-src-5.5.0
 > rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude
 > .hg --exclude .bzr --exclude CVS
 > /home/vmuser/buildroot-imx/qtbase-opensource-src-5.5.0/
 > /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom
 >>>> qt5base custom Configuring
 > (cd /home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom;
 > PATH="/home/vmuser/buildroot-imx/buildroot/output/host/bin:/home/vmuser/buildroot-imx/buildroot/output/host/sbin:/home/vmuser/buildroot-imx/buildroot/output/host/usr/bin:/home/vmuser/buildroot-imx/buildroot/output/host/usr/sbin:/home/vmuser/bin:/home/vmuser/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
 > PKG_CONFIG="/home/vmuser/buildroot-imx/buildroot/output/host/usr/bin/pkg-config"
 > PKG_CONFIG_LIBDIR="/home/vmuser/buildroot-imx/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig"
 > PKG_CONFIG_SYSROOT_DIR="/home/vmuser/buildroot-imx/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot"
 > MAKEFLAGS=" --no-print-directory -j8" ./configure -v -prefix /usr
 > -hostprefix /home/vmuser/buildroot-imx/buildroot/output/host/usr
 > -headerdir /usr/include/qt5 -sysroot
 > /home/vmuser/buildroot-imx/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
 > -plugindir /usr/lib/qt/plugins -examplesdir /usr/lib/qt/examples
 > -no-rpath -nomake tests -device buildroot -device-option
 > CROSS_COMPILE="/home/vmuser/buildroot-imx/buildroot/output/host/usr/bin/arm-linux-gnueabihf-"
 > -device-option BR_COMPILER_CFLAGS="-D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
 > -DENABLE_MX6_WORKAROUND" -device-option
 > BR_COMPILER_CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Os -DENABLE_MX6_WORKAROUND" -optimized-qmake
 > -no-kms -no-cups -no-nis -no-iconv -system-zlib -system-pcre -no-pch
 > -shared -release -largefile -opensource -confirm-license -no-sql-mysql
 > -no-sql-psql -no-sql-sqlite -no-gui -no-widgets -no-linuxfb
 > -no-directfb -no-xcb -no-opengl -no-eglfs -no-openssl -no-fontconfig
 > -no-gif -no-libjpeg -no-libpng -no-dbus -no-tslib -glib -no-icu
 > -nomake examples -gstreamer 1.0 )
 > Error: No device matching 'buildroot'
 > make[1]: *** [/home/vmuser/buildroot-imx/buildroot/output/build/qt5base-custom/.stamp_configured] Error 101
 > make: *** [_all] Error 2
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
