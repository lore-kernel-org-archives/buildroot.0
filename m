From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:27:06 +0200
Subject: [Buildroot] [git commit] qt: make installation of translation files
	optional
Message-ID: <20140803083010.3DB049D37B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ff329412f490dc916bab3377073ef5950a46298
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e introduced the
installation of the binary .qm translation files, unconditionally.
This patch introduces an option to disable this behavior, saving
almost 8MB of space.

[Thomas: rename option to BR2_PACKAGE_QT_TRANSLATION_FILES instead of
BR2_PACKAGE_QT_INSTALL_TRANSLATION_FILES, and move its definition
around the installation of examples/demos rather than in the middle of
the options for the different modules.]

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in |    7 +++++++
 package/qt/qt.mk     |    2 ++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 0a21e93..93751cd 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -28,6 +28,13 @@ config BR2_PACKAGE_QT_DEMOS
 	help
 	  If unsure, say N.
 
+config BR2_PACKAGE_QT_TRANSLATION_FILES
+	bool "Install translation files"
+	default y
+	help
+	  Install binary .qm translation files.
+	  If unsure, say y.
+
 config BR2_PACKAGE_QT_EXAMPLES
 	bool "Compile and install Qt examples (with code)"
 	select BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 82a5509..880e835 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -670,12 +670,14 @@ define QT_INSTALL_TARGET_POWERVR
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT_TRANSLATION_FILES),y)
 define QT_INSTALL_TARGET_TRANSLATIONS
 	if [ -d $(STAGING_DIR)/usr/share/qt/translations/ ] ; then \
 		mkdir -p $(TARGET_DIR)/usr/share/qt/translations ; \
 		cp -dpfr $(STAGING_DIR)/usr/share/qt/translations/* $(TARGET_DIR)/usr/share/qt/translations ; \
 	fi
 endef
+endif
 
 define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_LIBS)
