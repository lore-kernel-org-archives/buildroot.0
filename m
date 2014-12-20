From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Dec 2014 19:22:41 +0100
Subject: [Buildroot] [PATCH] package/weston: do not select rpi-userland
Message-ID: <1419099761-32669-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpi-userland is a provider for some virtual packages, so we can not
select it, as instructed in the manual:

    http://nightly.buildroot.org/#_infrastructure_for_virtual_packages

    ---8<---
    If your package really requires a specific provider, then you?ll
    have to make your package depends on this provider; you can not select a
    provider.
    ---8<---

Instead, just depend on it. Remove the comment as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Notes: I choose to remove the comment altogether, because we have no
official solution to tell the user about dependencies to other packages.
---
 package/weston/Config.in | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 5fff5bd..49130b4 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -40,17 +40,10 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 
-comment "RPi compositor needs a toolchain w/ C++, largefile, threads"
-	depends on BR2_arm
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-
+# rpi-userland is an EGL/GLES provider, so we can't select it
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
-	depends on BR2_arm                      # rpi-userland
-	depends on BR2_INSTALL_LIBSTDCPP        # rpi-userland
-	depends on BR2_LARGEFILE                # rpi-userland
-	depends on BR2_TOOLCHAIN_HAS_THREADS    # rpi-userland
-	select BR2_PACKAGE_RPI_USERLAND
+	depends on BR2_PACKAGE_RPI_USERLAND
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 
 endif
-- 
1.9.1
