From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon,  3 Sep 2018 08:37:46 -0400
Subject: [Buildroot] [PATCH v1 3/4] qt5virtualkeyboard: fix legal-info with
 5.6
In-Reply-To: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180903123747.5234-4-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5virtualkeyboard 2.0 (shipped with Qt 5.6) doesn't contain any license
files.

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

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index a4c9492a91..ce2dea7a3b 100644
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
-- 
2.11.0
