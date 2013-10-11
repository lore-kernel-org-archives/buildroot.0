From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2013 23:00:11 +0200
Subject: [Buildroot] [PATCH 1/3] weston: improve selection of compositor
Message-ID: <1381525213-14034-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The way the compositor was selected in Config.in was counter-intuitive,
because the fbdev backend is selected by default even if a different one
is available.

Instead, select the fbdev backend only if no other one was selected by
the user.

Also re-ordered the compositor options, putting fbdev last. This is more
natural when the user wants to select both backends: after selecting the
RPi backend, the fbdev is automatically unselected but the user can move
one line down to select it again.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/weston/Config.in | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 4532c28..fd48fb3 100644
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
@@ -24,17 +26,9 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
-# These two options make sure at least one compositor is selected.
+# Helper to make sure at least one compositor is selected.
 config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	bool
-config BR2_PACKAGE_WESTON_NEEDS_ONE_COMPOSITOR
-	def_bool y
-	depends on ! BR2_PACKAGE_WESTON_HAS_COMPOSITOR
-	select BR2_PACKAGE_WESTON_FBDEV
-
-config BR2_PACKAGE_WESTON_FBDEV
-	bool "fbdev compositor"
-	default y
 
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
@@ -45,4 +39,7 @@ config BR2_PACKAGE_WESTON_RPI
 	select BR2_PACKAGE_RPI_USERLAND
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 
+config BR2_PACKAGE_WESTON_FBDEV
+	bool "fbdev compositor"
+
 endif
-- 
1.8.4.rc3
