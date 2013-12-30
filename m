From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:10:44 +0100
Subject: [Buildroot] [git commit] grub: align splashscreen handling with
	iso9660 code
Message-ID: <20131230231250.2D1E19C2A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cab919bb3aec8270786f6bd460d677a8546c70f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit aligns the Grub handling of the splash screen with what is
done in the ISO9660 code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/grub/grub.mk  |    5 ++++-
 boot/grub/menu.lst |   17 +++++++++++++----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 3be4a74..d22df88 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -82,7 +82,10 @@ GRUB_CONF_OPT = \
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define GRUB_INSTALL_SPLASH
 	cp boot/grub/splash.xpm.gz $(TARGET_DIR)/boot/grub/
-	$(SED) 's/^#splashimage/splashimage/' $(TARGET_DIR)/boot/grub/menu.lst
+endef
+else
+define GRUB_INSTALL_SPLASH
+	$(SED) '/^splashimage/d' $(TARGET_DIR)/boot/grub/menu.lst
 endef
 endif
 
diff --git a/boot/grub/menu.lst b/boot/grub/menu.lst
index 7845fee..a231f7e 100644
--- a/boot/grub/menu.lst
+++ b/boot/grub/menu.lst
@@ -1,7 +1,16 @@
-default=0
-timeout=5
-#splashimage=(hd0,0)/boot/grub/splash.xpm.gz
-hiddenmenu
+default		0
+timeout		10
+
+# Used when no splashimage is used
+color 		cyan/blue white/blue
+
+# Gets enabled/disabled depending on Grub support for splashimage
+splashimage	(hd0,0)/boot/grub/splash.xpm.gz
+
+# Used when a splashimage is enabled
+foreground 	000000
+background 	cccccc
+
 title Buildroot
 	root (hd0,0)
 	kernel /boot/bzImage rw root=/dev/sda1
