From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:12 +0100
Subject: [Buildroot] [PATCH v2 01/13] qt5base: Do not build shared libs if
 BR2_STATIC_LIBS is chosen
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-2-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Traditionlly we configured qt5 to always build shared libraries. This resulted
in many conditionals when setting buildroot to static-libs only, because each
module's target install had to be guarded.
So to avoid this and simplify target install in a subsequent commit, configure
qt to build (and install) only the type of libs which the buildroot defconfig
is set to.
Unfortunately it seems that Qt does not support building both dynamic and static
libs at the same time, so we still set it shared if buildroot asks for both.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5base/qt5base.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e7f6e658f1..a0492418be 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -24,8 +24,15 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-iconv \
 	-system-zlib \
 	-system-pcre \
-	-no-pch \
-	-shared
+	-no-pch
+
+ifeq ($(BR2_SHARED_LIBS),y)
+QT5BASE_CONFIGURE_OPTS += -shared -no-static
+else ifeq ($(BR2_STATIC_LIBS),y)
+QT5BASE_CONFIGURE_OPTS += -no-shared -static
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+QT5BASE_CONFIGURE_OPTS += -shared
+endif
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5BASE_DEPENDENCIES += pcre
-- 
2.21.0
