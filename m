From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Oct 2015 21:28:26 +0200
Subject: [Buildroot] [PATCH v3] libv4l: bump version to 1.8.0
Message-ID: <1444678106-24045-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add qt, qt5base/qt5gui/qt5widgets dependency for qv4l2
  (qt dependency was missing, qt5 support was added since 1.8.0)

- fix fix moc/rcc/uic detection in case host versions
  of moc-qt5, rcc-qt5 or uic-qt5 are present

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - fix qt/qt5 enable/disable/dependency logic (suggested by Thomas Petazzoni)
  - fix moc/rcc/uic detection (protect against host version selection)

Changes v1 -> v2:
  - fix typo in commit comment (depndency vs. dependency)
---
 package/libv4l/libv4l.hash |  2 +-
 package/libv4l/libv4l.mk   | 21 ++++++++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 3371d34..1395eda 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 164abf5c1befcd27e8e6ef824a82d4015bdfb5d99ae82daa00e77d895ff9864c  v4l-utils-1.6.3.tar.bz2
+sha256 50c7be033636d878e902dad0a207fc9f6d831bec27f1b410f1102acddaa5565e  v4l-utils-1.8.0.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index edb2a36..66902c6 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.6.3
+LIBV4L_VERSION = 1.8.0
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
@@ -43,6 +43,25 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 # clock_gettime is used, which is provided by librt for glibc < 2.17
 LIBV4L_LIBS += -lrt
+ifeq ($(BR2_PACKAGE_QT5),y)
+ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
+LIBV4L_CONF_OPTS += --enable-qv4l2
+LIBV4L_DEPENDENCIES += qt5base
+# protect against host version detection of moc-qt5/rcc-qt5/uic-qt5
+LIBV4L_CONF_ENV += ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc
+LIBV4L_CONF_ENV += ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc
+LIBV4L_CONF_ENV += ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
+else
+LIBV4L_CONF_OPTS += --disable-qv4l2
+endif
+else ifeq ($(BR2_PACKAGE_QT),y)
+ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
+LIBV4L_CONF_OPTS += --enable-qv4l2
+LIBV4L_DEPENDENCIES += qt
+else
+LIBV4L_CONF_OPTS += --disable-qv4l2
+endif
+endif
 else
 LIBV4L_CONF_OPTS += --disable-v4l-utils
 endif
-- 
2.1.4
