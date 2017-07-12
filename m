From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 Jul 2017 02:55:31 +0300
Subject: [Buildroot] [PATCH 4/4] webkitgtk: Ensure that Mesa headers do not
	include X11 headers on Wayland builds
In-Reply-To: <20170712235531.20444-1-aperez@igalia.com>
References: <20170712235531.20444-1-aperez@igalia.com>
Message-ID: <20170712235531.20444-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Defining MESA_EGL_NO_X11_HEADERS avoids the situation in which the Mesa
headers try to include the X11 headers as they may not be present when
building for Wayland.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ef20839f92..09781c2318 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -84,6 +84,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 endif
+WEBKITGTK_CONF_OPTS += \
+	-DCMAKE_C_FLAGS='$(TARGET_CFLAGS) -DMESA_EGL_NO_X11_HEADERS' \
+	-DCMAKE_CXX_FLAGS='$(TARGET_CXXFLAGS) -DMESA_EGL_NO_X11_HEADERS'
 endif
 
 $(eval $(cmake-package))
-- 
2.13.2
