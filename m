From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 22:58:02 +0200
Subject: [Buildroot] [git commit] qt5virtualkeyboard: fix legal-info with 5.6
Message-ID: <20180905205801.14939828C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b63fb1de164e728983d5eb2ab3446e7ec4e90cf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5virtualkeyboard 2.0 (shipped with Qt 5.6) doesn't contain any
"main" license files with the GPLv3 license text.

Conditionally remove LICENSE.GPL3 from QT5VIRTUALKEYBOARD_LICENSE_FILES
when Qt major version is set to 5.6.

Fixes:

	>>> qt5virtualkeyboard 2.0 Collecting legal info
	sha256sum: /home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/LICENSE.GPL3: No such file or directory
	ERROR: LICENSE.GPL3 has wrong sha256 hash:
	ERROR: expected: 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
	ERROR: got     :
	ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Also, the lipi-toolkit has a different filename between both supported
Qt major version (5.6 and latest).

Conditionally set the license in QT5VIRTUALKEYBOARD_LICENSE_FILES for
lipi-toolkit according to the Qt major version used.

Fixes:
	>>> qt5virtualkeyboard 2.0 Collecting legal info
	ERROR: No hash found for src/virtualkeyboard/3rdparty/openwnn/NOTICE
	ERROR: No hash found for src/virtualkeyboard/3rdparty/pinyin/NOTICE
	ERROR: No hash found for src/virtualkeyboard/3rdparty/tcime/COPYING
	sha256sum: /home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt: No such file or directory
	ERROR: src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt has wrong sha256 hash:
	ERROR: expected: 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10
	ERROR: got     :
	ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
[Thomas: add hash for lipi-toolkit license file, tweak commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash | 1 +
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index bb916c06d3..8d70cd803d 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -7,3 +7,4 @@ sha256 5b330dcc770976a2cfb8d85711d72a57c9764c1a9efb889c91e81f6071bbbf9b  qtvirtu
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
 sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
+sha256 6148d2793ca4e62ba3935a27bd3e46971a5d7c871dbe8f2687a867bd2c2589fb src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index cbe24d27dc..8d26394c96 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -16,7 +16,9 @@ QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
 QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
 
 QT5VIRTUALKEYBOARD_LICENSE = GPL-3.0
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
+endif
 
 QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
 ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
@@ -44,8 +46,12 @@ ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING),y)
 QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
+else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
 endif
+endif
 
 ifdef QT5VIRTUALKEYBOARD_3RDPARTY_PARTS
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
