From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 23:44:22 +0100
Subject: [Buildroot] [git commit] package/opencv3: fix
 OPENCV3_CLEAN_INSTALL_{DOC, CMAKE}
Message-ID: <20201103223140.19A0880E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436f4804b2cad2423aa7a54a97de803a5f889f65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opencv3 does not install anything in $(TARGET_DIR)/usr/share/OpenCV/doc
so drop OPENCV3_CLEAN_INSTALL_DOC

However it installs its licence files in
$(TARGET_DIR)/usr/share/licenses/opencv3 so add
OPENCV3_CLEAN_INSTALL_LICENSE

Moreover, the cmake hook does not catch all cmake files and missed the
valgrind files so update OPENCV3_CLEAN_INSTALL_CMAKE and add
OPENCV3_CLEAN_INSTALL_VALGRIND to delete those files:
OpenCVConfig.cmake  OpenCVConfig-version.cmake  OpenCVModules.cmake  OpenCVModules-release.cmake  valgrind_3rdparty.supp  valgrind.supp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/opencv3.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 8cd28cbf0c..3e3e5987a5 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -345,16 +345,21 @@ OPENCV3_CONF_OPTS += \
 endif
 
 # Installation hooks:
-define OPENCV3_CLEAN_INSTALL_DOC
-	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
+define OPENCV3_CLEAN_INSTALL_LICENSE
+	$(RM) -fr $(TARGET_DIR)/usr/share/licenses/opencv3
 endef
-OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_DOC
+OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_LICENSE
 
 define OPENCV3_CLEAN_INSTALL_CMAKE
-	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
+	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCV*.cmake
 endef
 OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_CMAKE
 
+define OPENCV3_CLEAN_INSTALL_VALGRIND
+	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/valgrind*
+endef
+OPENCV3_POST_INSTALL_TARGET_HOOKS += OPENCV3_CLEAN_INSTALL_VALGRIND
+
 ifneq ($(BR2_PACKAGE_OPENCV3_INSTALL_DATA),y)
 define OPENCV3_CLEAN_INSTALL_DATA
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
