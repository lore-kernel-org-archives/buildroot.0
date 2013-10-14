From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 19:13:27 +0200
Subject: [Buildroot] [PATCH 1/4] weston: improve selection of compositor
In-Reply-To: <cover.1381770790.git.yann.morin.1998@free.fr>
References: <cover.1381770790.git.yann.morin.1998@free.fr>
Message-ID: <87d0cdc19da1adb5a2d1fb92ae8cd99287594968.1381770790.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The way the compositor was selected in Config.in was counter-intuitive,
because the fbdev backend is selected by default even if a different one
is available.

Instead, select the fbdev backend only if no other one was selected by
the user.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998 at free.fr: don't reorder entries, keep alphabetical sort]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 4532c28..2cd5ced 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_WESTON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
+	# Make sure at least one compositor is selected.
+	select BR2_PACKAGE_WESTON_FBDEV if !BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	help
 	  Weston is the reference implementation of a Wayland
 	  compositor, and a useful compositor in its own right.
@@ -24,17 +26,12 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
-# These two options make sure at least one compositor is selected.
+# Helper to make sure at least one compositor is selected.
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
-config BR2_PACKAGE_WESTON_NEEDS_ONE_COMPOSITOR
-	def_bool y
-	depends on ! BR2_PACKAGE_WESTON_HAS_COMPOSITOR
-	select BR2_PACKAGE_WESTON_FBDEV
 
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
-	default y
 
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
-- 
1.8.1.2
