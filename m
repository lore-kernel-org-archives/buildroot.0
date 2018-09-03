From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon,  3 Sep 2018 08:37:43 -0400
Subject: [Buildroot] [PATCH v1 0/4] qt5virtualkeyboard: fix build issues
 with 5.6
Message-ID: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch serie fixes three build issues with Qt 5.6. It also sets the license
hashes of third-parties that are missing (5.6 and latest).

The first patch fixes the issue reported by the autobuilder [1]. The commit
adapts the patch 0001-remove-weird-install-path-for-example.patch to make it
appliable. 

	>>> qt5virtualkeyboard 2.0 Patching

	Applying 0001-remove-weird-install-path-for-example.patch using patch: 
	patching file examples/virtualkeyboard/basic/basic.pro
	Hunk #1 FAILED at 7.
	1 out of 1 hunk FAILED -- saving rejects to file examples/virtualkeyboard/basic/basic.pro.rej
	make: *** [/home/test/autobuild/run/instance-2/output/build/qt5virtualkeyboard-2.0/.stamp_patched] Error 1
	make: Leaving directory `/home/test/autobuild/run/instance-2/buildroot'

The second patch fixes the following build issue that appeared after the first
patch is applied. Qt 5.6 and latest versions have a different location for the
QML plugin. The commit differentiates installation of the QML plugin according
to the Qt major version in use.

	>>> qt5virtualkeyboard 2.0 Installing to target
	mkdir -p /home/users/gportay/src/buildroot/output/target/usr/lib/qt/plugins/platforminputcontexts
	cp -dpfr /home/users/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/qt/plugins/platforminputcontexts/libqtv
	cp -dpfr /home/users/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard /home/users/gpo
	cp: cannot stat '/home/users/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard': No su
	package/pkg-generic.mk:310: recipe for target '/home/users/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_install
	make: *** [/home/users/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_installed] Error 1

The third patch fixes the legal-info issue below. QtVirtualKeyboard 2.0
(shipped with Qt 5.6) doesn't contain any license files. The commit removes
licenses from QT5VIRTUALKEYBOARD_LICENSE_FILES when Qt major version is set to
5.6.

	>>> qt5virtualkeyboard 2.0 Collecting legal info
	sha256sum: /home/users/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/LICENSE.GPL3: No such file or directory
	ERROR: LICENSE.GPL3 has wrong sha256 hash:
	ERROR: expected: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
	ERROR: got     :
	ERROR: Incomplete download, or man-in-the-middle (MITM) attack

The last patch adds the license hashes of 3rd-parties that were missing (for
5.6 and latest).

[1]: http://autobuild.buildroot.net/results/ecfe70fb6a9abdc7578856453eba1acbc441ba17/

Regards,
Ga?l PORTAY (4):
  qt5virtualkeyboard: fix example build issue with 5.6
  qt5virtualkeyboard: fix target install issue with 5.6
  qt5virtualkeyboard: fix legal-info with 5.6
  qt5virtualkeyboard: add hashes of 3rd-party licenses

 .../0001-remove-weird-install-path-for-example.patch   |  6 +++---
 .../qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash |  5 +++++
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  3 +++
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 18 +++++++++++++++++-
 4 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash

-- 
2.11.0
