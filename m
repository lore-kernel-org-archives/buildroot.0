From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Feb 2020 12:42:44 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-PLwoAkfIa7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #11 from Peter Seiderer <ps.report@gmx.net> ---
Yes, seems to be fixed with the Qt-5.14.1 update, one difference I see is:

    $ diff -u
build_qt_5_12_7/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5OpenGLExtensions.prl
build_qt_5_14_1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5OpenGLExtensions.prl
    ---
build_qt_5_12_7/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5OpenGLExtensions.prl
  2020-02-17 12:28:55.931270726 +0100
    +++
build_qt_5_14_1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5OpenGLExtensions.prl
  2020-02-17 13:25:00.047405910 +0100
@@ -1,6 +1,7 @@
    -QMAKE_PRL_BUILD_DIR =
/.../build_qt_5_12_7/build/qt5base-5.12.7/src/openglextensions
    +QMAKE_PRL_BUILD_DIR =
/.../build_qt_5_4_1/build/qt5base-5.14.1/src/openglextensions
    [...]
    -QMAKE_PRL_VERSION = 5.12.7
    -QMAKE_PRL_LIBS = -latomic $$[QT_INSTALL_LIBS]/libQt5Gui.so
$$[QT_INSTALL_LIBS]/libQt5Core.so -lpthread $$[QT_INSTALL_LIBS]/libGLESv2.so
-lrt -lpthread -ldl

    +QMAKE_PRL_VERSION = 5.14.1
    +QMAKE_PRL_LIBS = -latomic $$[QT_INSTALL_LIBS]/libQt5Gui.so
$$[QT_INSTALL_LIBS]/libQt5Core.so -lpthread -L$$[QT_INSTALL_LIBS] -lGLESv2
-lGLESv1_CM -lrt -lpthread -ldl

-- 
You are receiving this mail because:
You are on the CC list for the bug.
