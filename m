From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 19:03:05 +0100
Subject: [Buildroot] [git commit] package/psplash: bump to revision fd33a9b
Message-ID: <20200309140905.5024C81298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=113701d5900997e8408d34f06c3001ae97f184f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

66c8f65 Makefile.am: use BUILT_SOURCES instead of BUILD_SOURCES
f7a354d Generate image headers from their PNG source, while still including them in dist tarball
983837e Import png source for images, extracted from headers
3bd1557 Cleanup poky logo
773a397 Add configure flags for fullscreen logo and no startup message
2913c24 Double buffering support
8188d68 Support --with-font configure option to use other font headers
88c4b71 Add SPDX License information to files, drop boilerplate
904f4aa add systemd support
e94bd11 process consecutive commands
568f28e use /run for communication FIFO
ee053e0 add recovered bar.png
2015f70 Fix text width calculation.

Also:
 - remove the 'psplash-quit.service' unit file
 - add 'psplash-systemd.service' to use the new systemd support in psplash

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/psplash/psplash-quit.service    | 11 -----------
 package/psplash/psplash-start.service   |  3 +--
 package/psplash/psplash-systemd.service | 12 ++++++++++++
 package/psplash/psplash.hash            |  2 +-
 package/psplash/psplash.mk              | 14 +++++++++++---
 5 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/package/psplash/psplash-quit.service b/package/psplash/psplash-quit.service
deleted file mode 100644
index 14bd4994b5..0000000000
--- a/package/psplash/psplash-quit.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Terminate Psplash Boot Screen
-After=psplash-start.service
-
-[Service]
-Type=oneshot
-ExecStart=/usr/bin/psplash-write QUIT
-TimeoutSec=20
-
-[Install]
-WantedBy=multi-user.target
diff --git a/package/psplash/psplash-start.service b/package/psplash/psplash-start.service
index 2de3cfce22..b97e883e54 100644
--- a/package/psplash/psplash-start.service
+++ b/package/psplash/psplash-start.service
@@ -1,8 +1,7 @@
 [Unit]
 Description=Starts Psplash Boot screen
-Wants=systemd-vconsole-setup.service
-After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.service
 DefaultDependencies=no
+RequiresMountsFor=/run
 
 [Service]
 ExecStart=/usr/bin/psplash -n
diff --git a/package/psplash/psplash-systemd.service b/package/psplash/psplash-systemd.service
new file mode 100644
index 0000000000..249aa54039
--- /dev/null
+++ b/package/psplash/psplash-systemd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Start psplash-systemd progress communication helper
+DefaultDependencies=no
+After=systemd-start.service
+Requires=psplash-start.service
+RequiresMountsFor=/run
+
+[Service]
+ExecStart=/usr/bin/psplash-systemd
+
+[Install]
+WantedBy=sysinit.target
diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index c8865697c4..46d5e12ceb 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 aaddb20ef892dfb03d4e046cc634159bbcdfe555f7291652dde2b7d4cf491289  psplash-5b3c1cc28f5abdc2c33830150b48b278cc4f7bca.tar.gz
+sha256 0042192bf94be4f5792d9ff6b7a2ddff77c79e51274745180d14be5815b3a0f4  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c.tar.gz
 sha256 f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 3dd2f4d579..39fcc2235f 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,18 +4,26 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = 5b3c1cc28f5abdc2c33830150b48b278cc4f7bca
+PSPLASH_VERSION = fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPL-2.0+
 PSPLASH_LICENSE_FILES = COPYING
 PSPLASH_AUTORECONF = YES
+PSPLASH_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PSPLASH_DEPENDENCIES += systemd
+PSPLASH_CONF_OPTS += --with-systemd
+else
+PSPLASH_CONF_OPTS += --without-systemd
+endif
 
 define PSPLASH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
 
-	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/psplash-quit.service
+	$(INSTALL) -D -m 644 package/psplash/psplash-systemd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/psplash-systemd.service
 endef
 
 $(eval $(autotools-package))
