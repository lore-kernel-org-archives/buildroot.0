From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 20:13:28 +0100
Subject: [Buildroot] [git commit master] mesa3d: Pass LDFLAGS to the build
	config file
Message-ID: <20091206191500.925E0777FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=249f3db9997de195fa0e62e0236f86e977fcced8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #559.

Without the LDFLAGS in the build configuration file
building mesa3d fails with an external toolchain on amd64
machines targeting i686.  The error indicats that libX11
can't be found.

This change passes the --sysroot parameter (along with any
others specified by buildroot for LDFLAGS to the mklib script.

Signed-off-by: Clark Rawlins <clark@bit63.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    3 ++-
 package/x11r7/mesa3d/mesa3d.mk |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index a40fd39..b99f11d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,10 +1,11 @@
 2010.02, Not yet released:
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox, iw,
-	lighttpd, pcre, usbutils
+	lighttpd, mesa, pcre, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#559: mesa3d build fails
 	#749: Bump usbutils package to version 0.86
 	#751: Kernel 2.6 snapshot fetch fail
 	#753: Bump lighttpd package to 1.4.25
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 945765f..fa98bf6 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -49,6 +49,7 @@ $(MESA3D_DIR)/.configured: $(MESA3D_DIR)/.extracted
 		echo "X11_INCLUDES = " && \
 		echo "EXTRA_LIB_PATH = " && \
 		echo "PROGRAM_DIRS =" && \
+		echo "LDFLAGS = $(TARGET_LDFLAGS)" && \
 		echo "MKDEP_OPTIONS = -fdepend -Y$(STAGING_DIR)/usr/include -I$(MESA_GCCINCLUDE)" \
 	) >> $(MESA_CONFIG_FILE)
 	touch $@
-- 
1.6.3.3
