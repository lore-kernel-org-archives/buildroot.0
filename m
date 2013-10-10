From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 23:05:23 +0200
Subject: [Buildroot] [PATCH 6/8] package/weston: introduce infrastructure to
	select other compositors
In-Reply-To: <cover.1381438785.git.yann.morin.1998@free.fr>
References: <cover.1381438785.git.yann.morin.1998@free.fr>
Message-ID: <01d45ccecde19cadeea3d90e0842023b1a90ff8f.1381438785.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 56eb135..0f168ac 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -14,8 +14,6 @@ config BR2_PACKAGE_WESTON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
-	# Make sure at least one backend is selected
-	select BR2_PACKAGE_WESTON_FBDEV
 	help
 	  Weston is the reference implementation of a Wayland
 	  compositor, and a useful compositor in its own right.
@@ -26,7 +24,16 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
+# These two options make sure at least one compositor is selected.
+config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+	bool
+config BR2_PACKAGE_WESTON_NEEDS_ONE_COMPOSITOR
+	def_bool y
+	depends on ! BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+	select BR2_PACKAGE_WESTON_FBDEV
+
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
+	default y
 
 endif
-- 
1.8.1.2
