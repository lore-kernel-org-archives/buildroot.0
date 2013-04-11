From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 16:10:51 +0200
Subject: [Buildroot] [git commit] qt5base: support static library building
Message-ID: <20130411151207.63E8E9B59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=186ef9f6f4647ed34b67a3427a5e0e249f0794e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/qt5base.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d22ab66..0d0fb11 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -37,6 +37,14 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+QT5BASE_CONFIGURE_OPTS += -static
+else
+# We apparently can't build both the shared and static variants of the
+# library.
+QT5BASE_CONFIGURE_OPTS += -shared
+endif
+
 ifeq ($(BR2_LARGEFILE),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
 else
@@ -179,10 +187,16 @@ define QT5BASE_INSTALL_TARGET_FONTS
 	fi
 endef
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define QT5BASE_INSTALL_TARGET_CMDS
+	$(QT5BASE_INSTALL_TARGET_FONTS)
+endef
+else
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
 	$(QT5BASE_INSTALL_TARGET_FONTS)
 endef
+endif
 
 $(eval $(generic-package))
