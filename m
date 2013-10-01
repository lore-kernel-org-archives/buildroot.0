From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:19:42 +0200
Subject: [Buildroot] [git commit] psplash: new package
Message-ID: <20131001192013.0C2F79B7EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12913f000851c7aef4af8e27bf10877736e85f1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/psplash/Config.in  |   31 +++++++++++++++++++++++++++++++
 package/psplash/psplash.mk |   12 ++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

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
index 0000000..73fcfee
--- /dev/null
+++ b/package/psplash/Config.in
@@ -0,0 +1,31 @@
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
+	  Note: psplash creates a FIFO in /tmp for communication with
+	  psplash-write.
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
