From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:31:59 +0200
Subject: [Buildroot] [git commit branch/next] package/rpi-userland: add
	option to install hello-pi examples
Message-ID: <20150808105642.1383F7FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d705809c7a32d6868a742b790648a65857f21197
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

rpi-userland comes with a set of demo programs that can be useful to
understand how to program HW-accelerated video/3D/fft/... on the RPi.

They can also be used to validate that the hardware is working properly.

[Thomas: explicitly pass ALL_APPS=OFF when
BR2_PACKAGE_RPI_USERLAND_HELLO is disabled.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0005-disable-missing-all-apps.patch            |   30 ++++++++++++++++++++
 package/rpi-userland/Config.in                     |    5 +++
 package/rpi-userland/rpi-userland.mk               |   20 +++++++++++++
 3 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/rpi-userland/0005-disable-missing-all-apps.patch b/package/rpi-userland/0005-disable-missing-all-apps.patch
new file mode 100644
index 0000000..520c7be
--- /dev/null
+++ b/package/rpi-userland/0005-disable-missing-all-apps.patch
@@ -0,0 +1,30 @@
+From 249f6c8b44581083dfb16ebf66bfe94f7c9fb163 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 24 Jul 2015 20:20:33 +0200
+Subject: [PATCH] host-applications: disable missing applications
+
+Those applications are missing from the public rpi-firmware package, so
+do not even try to build them.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ host_applications/linux/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/host_applications/linux/CMakeLists.txt b/host_applications/linux/CMakeLists.txt
+index ea4e016..4a87862 100644
+--- a/host_applications/linux/CMakeLists.txt
++++ b/host_applications/linux/CMakeLists.txt
+@@ -10,9 +10,7 @@ add_subdirectory(apps/smem)
+ add_subdirectory(libs/debug_sym)
+ 
+ if(ALL_APPS)
+- add_subdirectory(apps/vcdbg)
+  # add_subdirectory(apps/smct)
+- add_subdirectory(apps/edid_parser)
+  add_subdirectory(apps/hello_pi)
+ endif()
+ 
+-- 
+1.9.1
+
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 0e88908..9bb2bfc 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -38,6 +38,11 @@ config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
 	  vcfiled is a daemon serving files to VideoCore from the host file
 	  system.
 
+config BR2_PACKAGE_RPI_USERLAND_HELLO
+	bool "hello_pi examples"
+	help
+	  Install the hello-pi examples to test the HW (GPU, camera...)
+
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index e2eadb2..3a31733 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -28,6 +28,26 @@ define RPI_USERLAND_INSTALL_INIT_SYSTEMD
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
+
+RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
+
+define RPI_USERLAND_EXTRA_LIBS_TARGET
+	$(INSTALL) -m 0644 -D \
+		$(@D)/build/lib/libilclient.so \
+		$(TARGET_DIR)/usr/lib/libilcient.so
+endef
+RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_EXTRA_LIBS_TARGET
+
+define RPI_USERLAND_EXTRA_LIBS_STAGING
+	$(INSTALL) -m 0644 -D \
+		$(@D)/build/lib/libilclient.so \
+		$(STAGING_DIR)/usr/lib/libilcient.so
+endef
+RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_EXTRA_LIBS_STAGING
+
+endif # BR2_PACKAGE_RPI_USERLAND_HELLO
+
 define RPI_USERLAND_POST_TARGET_CLEANUP
 	rm -f $(TARGET_DIR)/etc/init.d/vcfiled
 	rm -f $(TARGET_DIR)/usr/share/install/vcfiled
