From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 27 Mar 2018 10:57:47 +0200
Subject: [Buildroot] RFC: gst1-plugins-good 1.14: enable-qt config option
Message-ID: <484a4f60-327f-12a8-e90e-206c81d60253@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So the goal here is to optionally get gst1-plugins-good's qt module to
be built (and have the qmlglsink gstreamer element) with Qt and eglfs
platform.

(Keep in mind that the qt-module moved from plugins-bad to plugins-good
during the 1.12 to 1.14 update):

First, a config option for plugin-good's "qt" would be needed. here's
some pseudo-code of what I mean, to make it clea:

config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QT
       bool "qt"
       help
         Qt plugin

(...)

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QT),y)
GST1_PLUGINS_GOOD_CONF_OPTS += --enable-qt
GST1_PLUGINS_GOOD_DEPENDENCIES += qt5
else
GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
endif

------------------
ok. let's ignore that for a second. instead I simply remove --disable-qt
(or say --enable-qt) and build it *after* Qt for now. Then I get:

configure: *** checking feature: Qt elements ***

configure: *** for plug-ins: qt ***

checking for QT... yes

checking for moc-qt5... no

checking for moc... /home/martin/dev/buildroot-2018.02/output/host/bin/moc
checking for rcc-qt5... no

checking for rcc... /home/martin/dev/buildroot-2018.02/output/host/bin/rcc
checking for uic-qt5... no

checking for uic... /home/martin/dev/buildroot-2018.02/output/host/bin/uic
configure: Cannot find QPA

configure: *** These plugins will not be built: qt



But the weird thing is that in config.h I don't get HAVE_QT:
/* Define to enable Qt elements (used by qt). */

/* #undef HAVE_QT */



/* Define if Qt eglfs integration is installed */

/* #undef HAVE_QT_EGLFS */


One relevant path on configure.ac is:

HAVE_QT="yes"
        HAVE_QT_WINDOWING="no"

        QT_VERSION="`$PKG_CONFIG --define-prefix --modversion Qt5Core`"

        QPA_INCLUDE_PATH=`$PKG_CONFIG --variable=includedir
Qt5Core`/QtGui/${QT_VERSION}/QtGui
        AS_IF([test -f
"$PKG_CONFIG_SYSROOT_DIR/$QPA_INCLUDE_PATH/qpa/qplatformnativeinterface.h"],
[
          QT_CFLAGS="$QT_CFLAGS
-I$PKG_CONFIG_SYSROOT_DIR/$QPA_INCLUDE_PATH"
          HAVE_QT_QPA_HEADER="yes"

        ], [AC_MSG_NOTICE([Cannot find QPA])])

But I have
output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/5.9.4/QtGui/qpa/qplatformnativeinterface.h
But if I didn't, I think this shouldn't be the reason this fails...


HAVE_QT_WINDOWING should get yes because I should have EGL.


Do I get something buildroot-specific wrong? Does anybody have such a
configuration working locally?

thanks

                                martin
