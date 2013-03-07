From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:41 +0100
Subject: [Buildroot] [PATCH 13/32] qt5base: add OpenSSL support
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in  |    8 ++++++++
 package/qt5/qt5base/qt5base.mk |    4 +++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 801ef6f..540c8b2 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -33,6 +33,14 @@ config BR2_PACKAGE_QT5BASE_NETWORK
 	help
 	  This options enables the Qt5Network library.
 
+config BR2_PACKAGE_QT5BASE_NETWORK_OPENSSL
+	bool "OpenSSL support"
+	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_QT5BASE_NETWORK
+	help
+	  This option enables the OpenSSL support in the Qt5Network
+	  library.
+
 config BR2_PACKAGE_QT5BASE_CONCURRENT
 	bool "concurrent module"
 	help
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 33555ae..c30bf48 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -28,7 +28,6 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-nis \
 	-no-libudev \
 	-no-iconv \
-	-no-openssl \
 	-no-fontconfig \
 	-no-gif \
 	-no-libpng \
@@ -82,6 +81,9 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-xcb
 endif
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),-openssl,-no-openssl)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),openssl)
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
-- 
1.7.9.5
