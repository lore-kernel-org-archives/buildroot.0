From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:26:32 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/qt5/qt5webengine:
 fix translations target install path
Message-ID: <20200314161600.3E85D8366B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba2b2b755189cfc9dced682ca7ae111c06b35d47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Through the evolution of the qt5webengine package patch ([1], [2])
until the initial commit ([3]) the translations target install
path got mangled resulting in a double trailing qtwebengine_locales
path:
  /usr/translations/qtwebengine_locales/qtwebengine_locales
Instead of:
  /usr/translations/qtwebengine_locales

Fixes the translations runtime access failure resulting in the
following warning:

  WARNING:resource_bundle_qt.cpp(116): locale_file_path.empty() for locale

[1] http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
[2] https://patchwork.ozlabs.org/patch/640633
[3] https://git.buildroot.net/buildroot/commit/?id=89080bac9bc47946a09c1e74f2f872363bf6785b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7bd10f6d7e53452c7693e9ef62ac130d7f91be54)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webengine/qt5webengine.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index a3cfcec26e..e32520c991 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -91,8 +91,8 @@ define QT5WEBENGINE_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
 	cp -dpfr $(STAGING_DIR)/usr/resources/ $(TARGET_DIR)/usr/
-	mkdir -p $(TARGET_DIR)/usr/translations/qtwebengine_locales/
-	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/qtwebengine_locales/
+	mkdir -p $(TARGET_DIR)/usr/translations/
+	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/
 endef
 endif
 
