From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2020 21:50:08 +0100
Subject: [Buildroot] [git commit] package/qt5virtualkeyboard: fix install
 for Qt 5.12.x
Message-ID: <20200117204227.05A5D824EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3645f89922c70b9ebbf31926e6dc7cbbffe2b47a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Qt 5.12.x only handwriting/lipi-toolkit needs 3rdparty parts
installation (with Qt 5.6.x although zn_CZ/pinyin and zh_TW tcime).

Fixes:
  - https://bugs.busybox.net/show_bug.cgi?id=12456

  cp: cannot stat '.../host/arm-buildroot-linux-gnueabihf/sysroot/usr/qtvirtualkeyboard': No such file or directory

Also fix the way we test the variable: we very seldomly use ifdef,
instead we usually test for equality.

Reported-by: Sam Petrocelli <sam.petrocelli@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: also fix the way we test the variable]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 59ee30c2d2..c13fa699a6 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -34,9 +34,9 @@ endif
 endif
 
 ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (pinyin)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
 else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/pinyin/3rdparty/pinyin/NOTICE
@@ -44,9 +44,9 @@ endif
 endif
 
 ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (tcime), BSD-3-Clause (tcime)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
 else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/tcime/3rdparty/tcime/COPYING
@@ -69,7 +69,7 @@ ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION),y)
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
 endif
 
-ifdef QT5VIRTUALKEYBOARD_3RDPARTY_PARTS
+ifeq ($(QT5VIRTUALKEYBOARD_3RDPARTY_PARTS),YES)
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
 	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
 endef
