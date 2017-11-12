From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 09:13:26 +0100
Subject: [Buildroot] [PATCH 4/4 v3] package/freerdp: fix build of wayland
 client
In-Reply-To: <cover.1510474387.git.yann.morin.1998@free.fr>
References: <cover.1510474387.git.yann.morin.1998@free.fr>
Message-ID: <fda5340f59b762950ec832ecae9d7893c495a277.1510474387.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, FreeRDP uses pkg-config to find whether wayland is available.
When it is, it gets the CFLAGS and LDFLAGS and so on from pkg-config,
which is OK.

But I also gets the path to the wayland scanner from pkg-config. And
this points to the target one, when we really need the host one.

So we force-feed the correct path as a configure option.

Furthermore, wayland support needs libxkbcommon, so add this missing
dependency as well.

Fixes:
    http://autobuild.buildroot.org/results/bdfe233ade36a56d0f65ef3c3d1698fca548beed/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/Config.in  | 1 +
 package/freerdp/freerdp.mk | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 9dd2505a44..59bc18b672 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -81,6 +81,7 @@ config BR2_PACKAGE_FREERDP_CLIENT_WL
 	bool "wayland client"
 	default y
 	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXKBCOMMON
 
 endif
 
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 458bd5eea7..69a89a190c 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -199,8 +199,10 @@ FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-FREERDP_DEPENDENCIES += wayland
-FREERDP_CONF_OPTS += -DWITH_WAYLAND=ON
+FREERDP_DEPENDENCIES += wayland libxkbcommon
+FREERDP_CONF_OPTS += \
+	-DWITH_WAYLAND=ON \
+	-DWAYLAND_SCANNER=$(HOST_DIR)/bin/wayland-scanner
 else
 FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
 endif
-- 
2.11.0
