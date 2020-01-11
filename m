From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Jan 2020 22:48:43 +0000
Subject: [Buildroot] [Bug 12456] New: qtvirtualkeyboard: No such file or
 directory
Message-ID: <bug-12456-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12456

            Bug ID: 12456
           Summary: qtvirtualkeyboard: No such file or directory
           Product: buildroot
           Version: 2019.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sam.petrocelli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8331
  --> https://bugs.busybox.net/attachment.cgi?id=8331&action=edit
Comparing the output of an older version of buildroot (approx two years old)
with 2019.11

>>> qt5virtualkeyboard 5.12.5 Installing to target
mkdir -p
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/target/usr/lib/qt/plugins/platforminputcontexts
cp -dpfr
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/target/usr/lib/qt/plugins/platforminputcontexts
cp -dpf
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5VirtualKeyboard*.so.*
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/target/usr/lib
mkdir -p
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/target/usr/qml/QtQuick
cp -dpfr
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/qml/QtQuick/VirtualKeyboard
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/target/usr/qml/QtQuick/
cp -dpfr
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/qtvirtualkeyboard
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/target/usr
cp: cannot stat
'/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/qtvirtualkeyboard':
No such file or directory
make[1]: *** [package/pkg-generic.mk:335:
/home/spetroce/code/src/Buildroot-Toolchain-Release/Toolchain/morepork-build-root/output/build/qt5virtualkeyboard-5.12.5/.stamp_target_installed]
Error 1
make: *** [Makefile:84: _all] Error 2


Commenting the following lines within qt5virtualkeyboard.mk results in a
successful build.

ifdef QT5VIRTUALKEYBOARD_3RDPARTY_PARTS
define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
  cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
endef
endif

I have the following set in my defconfig file:
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
BR2_PACKAGE_QT5TOOLS=y
BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS=y
BR2_PACKAGE_QT5VIRTUALKEYBOARD=y
BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS="all"

I have no problems with this on an older version (it's a fork of buildroot that
is approximately 2 years old) of buildroot, but when using the 2019.11 branch I
run into the error described above. I attached a text file that contains a find
output for the qtvirtualkeyboard dict files on both the older and 2019.11
buildroots.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
