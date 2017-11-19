From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Nov 2017 16:48:52 -0500
Subject: [Buildroot] [PATCH 1/1] freerdp: fix wayland client dependency
 chain failure
Message-ID: <20171119214852.27459-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the wayland client is selected, freerdp depends on libxkbcommon without
depending on it in the mk file.

Fixes:
http://autobuild.buildroot.net/results/dc3/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd
Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 69a89a190c..29c35164c3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -207,6 +207,10 @@ else
 FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),y)
+FREERDP_DEPENDENCIES += libxkbcommon
+endif
+
 #---------------------------------------
 # Post-install hooks to cleanup and install missing stuff
 
-- 
2.14.3
