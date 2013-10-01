From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  1 Oct 2013 17:07:46 +0200
Subject: [Buildroot] [PATCH v3 1/1] psplash: new package
Message-ID: <1380640066-31376-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
Changes v2 -> v3:
  - I've learned reading and the alphabet :-)

Changes v1 -> v2:
  - psplash needs BR2_USE_WCHAR

 package/Config.in          |    1 +
 package/psplash/Config.in  |   30 ++++++++++++++++++++++++++++++
 package/psplash/psplash.mk |   12 ++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/psplash/Config.in
 create mode 100644 package/psplash/psplash.mk

diff --git a/package/Config.in b/package/Config.in
index c6ea66b..da10a23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -160,6 +160,7 @@ source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
 source "package/ocrad/Config.in"
+source "package/psplash/Config.in"
 source "package/sawman/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
diff --git a/package/psplash/Config.in b/package/psplash/Config.in
new file mode 100644
index 0000000..948f31e
--- /dev/null
+++ b/package/psplash/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_PSPLASH
+	bool "psplash"
+	depends on BR2_USE_WCHAR
+	help
+	  PSplash is a userspace graphical boot splash screen for mainly
+	  embedded Linux devices supporting a 16bpp or 32bpp framebuffer.
+	  It has few dependencies (just libc), supports basic images and
+	  text and handles rotation. Its visual look is configurable by
+	  basic source changes.
+
+	  Also included is a 'client' command utility for sending
+	  information to psplash such as boot progress information.
+
+	  Start the drawing process with 'psplash -n&' as early as possible.
+	  Note: psplash creates a FIFO in /tmp for communication with psplash-write.
+
+	  Usage:
+	  * Set progress bar to 50 percent:
+	    psplash-write "PROGRESS 50"
+
+	  * Display message "foobar" above progress bar:
+	    psplash-write "MSG foobar"
+
+	  * Terminate psplash:
+	    psplash-write "QUIT"
+
+	  http://git.yoctoproject.org/cgit/cgit.cgi/psplash/
+
+comment "psplash requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
new file mode 100644
index 0000000..cb1c54a
--- /dev/null
+++ b/package/psplash/psplash.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# psplash
+#
+################################################################################
+
+PSPLASH_VERSION = 0.1
+PSPLASH_SITE = http://downloads.yoctoproject.org/releases/psplash
+PSPLASH_LICENSE = GPLv2+
+PSPLASH_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
