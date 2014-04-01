From: jeremie.scheer at armadeus.com <jeremie.scheer@armadeus.com>
Date: Tue,  1 Apr 2014 11:43:19 +0200
Subject: [Buildroot] [PATCH v2] Compile Poppler over Qt
Message-ID: <1396345399-28487-1-git-send-email-jeremie.scheer@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeremie Scheer <jeremie.scheer@armadeus.com>


Signed-off-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
---
 Changes since v1:
  - Remove dependencies that doesn't depend on Qt from Qt package condition

 package/poppler/poppler.mk |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 040327f..386e7b8 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -7,10 +7,18 @@
 POPPLER_VERSION = 0.24.4
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
-POPPLER_DEPENDENCIES = fontconfig
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_CONF_OPT = --with-font-configuration=fontconfig
+POPPLER_INSTALL_STAGING = YES
+
+POPPLER_DEPENDENCIES = fontconfig
+
+ifeq ($(BR2_PACKAGE_QT),y)
+	POPPLER_DEPENDENCIES += qt
+else
+	POPPLER_CONF_OPT += --disable-poppler-qt4
+endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 	POPPLER_CONF_OPT += --enable-cms=lcms2
-- 
1.7.9.5
