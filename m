From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:47:22 +0200
Subject: [Buildroot] [git commit] pakage/rpi-userland: add and install our
	bcm_host.pc
Message-ID: <20131006184800.27C9196CB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19b4a6f4e08fdf7b698e4be735328cb69c40020d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows pkg-config-aware packages to include headers from, and
link against Broadcom VideoCore host API library.

bcm_host.pc copied almost as-is from:
    http://cgit.collabora.com/git/user/pq/android-pc-files.git/tree/pkgconfig?h=raspberrypi
with only a fix to the prefix (we're using /usr).

[Peter: s/TARGET/STAGING/]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/bcm_host.pc     |   11 +++++++++++
 package/rpi-userland/rpi-userland.mk |    7 ++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/bcm_host.pc b/package/rpi-userland/bcm_host.pc
new file mode 100644
index 0000000..28bbe96
--- /dev/null
+++ b/package/rpi-userland/bcm_host.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: bcm_host
+Description: Broadcom VideoCore host API library
+Version: 1
+Libs: -L${libdir} -lbcm_host -lvcos -lvchiq_arm
+Cflags: -I${includedir} -I${includedir}/interface/vmcs_host/linux -I${includedir}/interface/vcos/pthreads -DUSE_VCHIQ_ARM
+
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index c3ea43a..cc032bf 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -14,7 +14,12 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 define RPI_USERLAND_POST_TARGET_CLEANUP
     rm -Rf $(TARGET_DIR)/usr/src
 endef
-
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
 
+define RPI_USERLAND_POST_STAGING_PC_FILE
+	install -D -m 0644 package/rpi-userland/bcm_host.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/bcm_host.pc
+endef
+RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_POST_STAGING_PC_FILE
+
 $(eval $(cmake-package))
