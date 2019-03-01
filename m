From: James Grant <james.grant@jci.com>
Date: Fri, 1 Mar 2019 15:17:12 +1300
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5base: exclude OpenSSL
 functionality for Qt 5.6.x
In-Reply-To: <20190301021712.47698-1-james.grant@jci.com>
References: <20190301021712.47698-1-james.grant@jci.com>
Message-ID: <20190301021712.47698-2-james.grant@jci.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No patch back-porting OpenSSL 1.1.x support to Qt 5.6.x is available.

https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9

Signed-off-by: James Grant <james.grant@jci.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 8c0f5f0c9f..a5ce583327 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -52,8 +52,6 @@ else
 # option '-no-avx512' (available for latest only)
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
-
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 QT5BASE_CONFIGURE_OPTS += -kms
 QT5BASE_DEPENDENCIES += libdrm
@@ -190,8 +188,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+# No OpenSSL 1.1.x support in Qt 5.6.x
+QT5BASE_CONFIGURE_OPTS += -no-openssl
+else
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
+endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
-- 
2.21.0
