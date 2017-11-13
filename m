From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:26:16 +0100
Subject: [Buildroot] [git commit] package/freerdp: fix build of wayland
 client
Message-ID: <20171113202301.626A0800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2824fba2f2f4df6c1e0273fa546a203d1e6d5ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/Config.in  | 1 +
 package/freerdp/freerdp.mk | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 9dd2505..59bc18b 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -81,6 +81,7 @@ config BR2_PACKAGE_FREERDP_CLIENT_WL
 	bool "wayland client"
 	default y
 	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXKBCOMMON
 
 endif
 
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 458bd5e..69a89a1 100644
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
