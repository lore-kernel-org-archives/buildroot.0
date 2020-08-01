From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  1 Aug 2020 16:20:35 +0200
Subject: [Buildroot] [PATCHv3 5/5] package/efl: keep X11 input 2.2+ enabled
In-Reply-To: <20200801142035.4060526-1-romain.naour@gmail.com>
References: <20200801142035.4060526-1-romain.naour@gmail.com>
Message-ID: <20200801142035.4060526-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since efl 1.23, X11 input 2.2+ has been enabled by default [1].

From [2]:
"It would be a pretty unusual system to have x and no xinput2.2 support."

While at it, enable explicitely X11 input 2 (enabled by default).

[1] https://git.enlightenment.org/core/efl.git/commit/?id=cf005ac54abdea843e5731765e41e5088275249f
[2] https://sourceforge.net/p/enlightenment/mailman/message/37065780/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 0ffbcf9f07..6dc38b1626 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -28,7 +28,6 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 # Configure options:
 # elua=true: build elua for the target.
 # sdl=false: disable sdl2 support.
-# xinput22=false: disable X11 XInput v2.2+ support.
 # embedded-lz4=false: use liblz4 from lz4 package.
 # network-backend=none: disable connman networkmanager.
 EFL_CONF_OPTS = \
@@ -43,8 +42,7 @@ EFL_CONF_OPTS = \
 	-Dnetwork-backend=none \
 	-Dpixman=false \
 	-Dsdl=false \
-	-Dvnc-server=false \
-	-Dxinput22=false
+	-Dvnc-server=false
 
 EFL_BINDINGS = luajit
 
@@ -154,7 +152,9 @@ EFL_CONF_OPTS += -Dfb=false
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
-EFL_CONF_OPTS += -Dx11=true
+EFL_CONF_OPTS += -Dx11=true \
+	-Dxinput2=true \
+	-Dxinput22=true
 
 EFL_DEPENDENCIES += \
 	xlib_libX11 \
-- 
2.25.4
