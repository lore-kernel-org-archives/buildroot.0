From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 22:42:58 +0100
Subject: [Buildroot] [git commit] qt: ensure that target dir exists before
	installing there
Message-ID: <20140326214648.E8DFD9C364@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ac91f8fc202c3b63463577564e1bbb9ec5483aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All of qt.mk's target installs ensure that their destinations exist,
except for /usr/lib.  So do the same for /usr/lib, for consistency,
and in case some combination of custom fs skeleton plus dependency
on Qt leads to installing without a pre-existing /usr/lib directory.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
