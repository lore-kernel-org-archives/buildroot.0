From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:50:02 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: use -O2 build
	optimization level
Message-ID: <20160506135113.944BE802FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5500211e201f84b6e2ce0dd5ff3013fb92628860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xorg server is somewhat sensitive to certain gcc versions combined
with -Os, particularly for ARM and MIPS, typically in the form of the
following symptom/error:

(EE) Segmentation fault at address 0x0
(EE)
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting

Force -O2 to work around this problem - for a target rootfs that uses
X11 the tradeoff is minimal since a sample/test image for qemu vexpress
with X11 + xinit + xterm + twm + xclock + gtk2 with demos is 60+ MB.

And it's less complicated than trying to find all of the bad
combinations.

Fixes bug #8436.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: add comment in .mk file, add reference to bug.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 617bcbc..31f6d0d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -56,13 +56,16 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	mcookie 			\
 	host-pkgconf
 
+# We force -O2 regardless of the optimization level chosen by the
+# user, as the X.org server is known to trigger some compiler bugs at
+# -Os on several architectures.
 XSERVER_XORG_SERVER_CONF_OPTS = \
 	--disable-config-hal \
 	--disable-xnest \
 	--disable-xephyr \
 	--disable-dmx \
 	--with-builder-addr=buildroot at buildroot.org \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
 	--with-fontrootdir=/usr/share/fonts/X11/ \
 	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
