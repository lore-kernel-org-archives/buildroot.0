From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 24 Mar 2014 21:05:17 -0400
Subject: [Buildroot] [PATCH 1/1] qt: ensure that target dir exists before
	installing there
Message-ID: <1395709517-1886-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All of qt.mk's target installs ensure that their destinations exist,
except for /usr/lib.  So do the same for /usr/lib, for consistency,
and in case some combination of custom fs skeleton plus dependency
on Qt leads to installing without a pre-existing /usr/lib directory.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/qt/qt.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index bc329f0..507e0db 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -625,6 +625,7 @@ endef
 # Library installation
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 define QT_INSTALL_TARGET_LIBS
+	mkdir -p $(TARGET_DIR)/usr/lib
 	for lib in $(QT_INSTALL_LIBS); do \
 		cp -dpf $(STAGING_DIR)/usr/lib/lib$${lib}.so.* $(TARGET_DIR)/usr/lib ; \
 	done
-- 
1.7.9.5
