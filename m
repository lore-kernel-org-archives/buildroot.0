From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Nov 2017 14:04:05 +0100
Subject: [Buildroot] [git commit] package/freerdp: fix dependency on walyand
Message-ID: <20171126125820.2620880FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f79cc7dc157e885b879637d428971ce89777f85c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, wayland support is enabled when the wayland package is
enabled, not when the FreeRDP wayland client is enabled.

But the dependency on libxkbcomon is only enforced from Config.in
when the FreeRDP wayland client is enabled., but is added to build
dependencies when the wayland package is enabled.

As such, we can end up in a situation where the FreeRDP wayland
client is disabled, the wayland package is enabled, and the
libxkbcommon package is also disabled, which casues the build to
fail with:

    Makefile:539: *** libxkbcommon is in the dependency chain of
    freerdp that has added it to its _DEPENDENCIES variable without
    selecting it or depending on it from Config.in.  Stop.

Change the build dependency to actually be on the FreeRDP client
being enabled.

Fixes;
    http://autobuild.buildroot.net/results/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 69a89a1..0ceef57 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -198,7 +198,7 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),y)
 FREERDP_DEPENDENCIES += wayland libxkbcommon
 FREERDP_CONF_OPTS += \
 	-DWITH_WAYLAND=ON \
