From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 7 Aug 2011 17:21:20 +0200
Subject: [Buildroot] Qt: broken target install rules?
Message-ID: <CAHXCMMLdL=1vDp5vTYeYX5KrtHu-2hPPxWH2-TkxGRA3Jo4i0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Does anyone know a bit about Qt and its default libraries?

My case:
first, I run a build disabling Qt (make clean, configure a new "light"
target without Qt),
then i enabled a minimal config. for  Qt,
and lastly i checked what was installed in the target dir. and in the
staging tree.

Some differences appear in what is installed in the staging and in the target:

z$ diff -purN staging-qt-{none.txt,minimal.txt} | grep ".so.4.7.3$"
+./usr/lib/libQtSql.so.4.7.3
+./usr/lib/libQtCore.so.4.7.3
+./usr/lib/libQtXml.so.4.7.3
+./usr/lib/libQtNetwork.so.4.7.3
+./usr/lib/libQtTest.so.4.7.3
z$ diff -purN target-qt-{none.txt,minimal.txt} | grep ".so.4.7.3$"
+./usr/lib/libQtCore.so.4.7.3
z$

Does anyone know why Qt builds and installs libQtSql, libQtXml and
libQtNetwork, whatever they were enabled or not in the menuconfig?

BTW, Qt also builds libQtTest that is not installed in the target. Any
specific reason for that?

That's a bit annoying when other programs link against some libs that
are in the staging tree but not in the target one...

Here is the diff between the 2 .config:
(FYI, I rebase my branch on 2011.08 rc1 branch.)

z$ diff -purN config-qt-{none.config,minimal.config}
--- config-qt-none.config	2011-08-07 12:29:17.215186534 +0200
+++ config-qt-minimal.config	2011-08-07 13:08:11.163186836 +0200
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Buildroot 2011.08-rc1-00001-g001e50d Configuration
-# Sun Aug  7 12:28:39 2011
+# Sun Aug  7 13:07:56 2011
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_arm=y
@@ -291,11 +291,42 @@ BR2_PACKAGE_STRACE=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QT is not set
-# BR2_PACKAGE_QT_SHARED is not set
+BR2_PACKAGE_QT=y
+# BR2_PACKAGE_QT_DEBUG is not set
+# BR2_PACKAGE_QT_DEMOS is not set
+BR2_PACKAGE_QT_SHARED=y
 # BR2_PACKAGE_QT_STATIC is not set
+BR2_PACKAGE_QT_LICENSE_APPROVED=y
+BR2_PACKAGE_QT_CONFIG_FILE=""
+# BR2_PACKAGE_QT_GUI_MODULE is not set
+# BR2_PACKAGE_QT_NOFREETYPE is not set
+# BR2_PACKAGE_QT_QTFREETYPE is not set
+# BR2_PACKAGE_QT_SYSTEMFREETYPE is not set
+# BR2_PACKAGE_QT_NOJPEG is not set
+# BR2_PACKAGE_QT_SYSTEMJPEG is not set
+# BR2_PACKAGE_QT_QTJPEG is not set
+# BR2_PACKAGE_QT_NOPNG is not set
+# BR2_PACKAGE_QT_SYSTEMPNG is not set
+# BR2_PACKAGE_QT_QTPNG is not set
+# BR2_PACKAGE_QT_NOTIFF is not set
+# BR2_PACKAGE_QT_SYSTEMTIFF is not set
+# BR2_PACKAGE_QT_QTTIFF is not set
 # BR2_PACKAGE_QT_QTZLIB is not set
-# BR2_PACKAGE_QT_SYSTEMZLIB is not set
+BR2_PACKAGE_QT_SYSTEMZLIB=y
+# BR2_PACKAGE_QT_SQL_MODULE is not set
+
+#
+# Qt Dbus module not available (needs dbus)
+#
+# BR2_PACKAGE_QT_XML is not set
+# BR2_PACKAGE_QT_NETWORK is not set
+
+#
+# WebKit needs shared library/gui/network support
+#
+# BR2_PACKAGE_QT_JAVASCRIPTCORE is not set
+# BR2_PACKAGE_QT_STL is not set
+# BR2_PACKAGE_QT_SCRIPT is not set
 # BR2_PACKAGE_XORG7 is not set

 #
z$


Regards,

Sam
