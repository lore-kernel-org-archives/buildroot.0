From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:24 +0100
Subject: [Buildroot] [PATCH v2 13/13] qt5: Fix pkgconfig search path for
 per-package infrastructure
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-14-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Per default qmake uses the pkg-config binary and search path detected by qt5base
and set in mkspecs/qconfig.pri. For per-package infra, this leads to packages
not contained in qt5base not being detected.
To overcome this, set the correct pathes in the global QMAKE variable.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 15ca188c8c..15a98ce4ab 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -33,4 +33,6 @@ define QT5_QTCONF_FIXUP
 endef
 
 # Variable for other Qt applications to use
-QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ -qtconf $(@D)/qt.conf
+QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ -qtconf $(@D)/qt.conf \
+	PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
+	PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig
-- 
2.21.0
