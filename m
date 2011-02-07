From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Feb 2011 18:18:00 +0100
Subject: [Buildroot] [PATCH 1/1] qt: move host programs and specs in HOST_DIR
In-Reply-To: <cover.1297099060.git.thomas.petazzoni@free-electrons.com>
References: <cover.1297099060.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fc21c0b4bcdd6d940a323c5d394d1e285aa3ec4e.1297099060.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt build system installs all host programs (uic, rcc, moc, qmake,
etc.) in the same base directory as the headers and libraries, but
that's not great for Buildroot.

So we now move the host programs and the mkspecs files to the
$(HOST_DIR), and create a qt.conf, which tells qmake where everything
is located.

Tested with Qmake and Cmake as build system for a simple Qt
application.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6eb31bc..3857087 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -536,8 +536,24 @@ $(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured
 	$(MAKE) -C $(QT_TARGET_DIR)
 	touch $@
 
-$(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled
+$(HOST_DIR)/usr/bin/qt.conf:
+	mkdir -p $(dir $@)
+	echo "[Paths]" > $@
+	echo "Prefix=$(HOST_DIR)/usr" >> $@
+	echo "Headers=$(STAGING_DIR)/usr/include" >> $@
+	echo "Libraries=$(STAGING_DIR)/usr/lib" >> $@
+	echo "Data=$(HOST_DIR)/usr" >> $@
+	echo "Binaries=$(HOST_DIR)/usr/bin" >> $@
+
+$(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled $(HOST_DIR)/usr/bin/qt.conf
 	$(MAKE) -C $(QT_TARGET_DIR) install
+	# Move host programs and spec files to the host directory. The
+	# generated qt.conf file will tell qmake where everything is.
+	mv $(addprefix $(STAGING_DIR)/usr/bin/,moc rcc qmake lrelease) $(HOST_DIR)/usr/bin
+ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
+	mv $(STAGING_DIR)/usr/bin/uic $(HOST_DIR)/usr/bin
+endif
+	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
 
 qt-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
-- 
1.7.0.4
