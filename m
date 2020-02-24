From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 24 Feb 2020 17:52:55 -0300
Subject: [Buildroot] [PATCH] package/eudev: add openrc init support
Message-ID: <20200224205255.9138-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use the Gentoo scripts for openrc.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/eudev/eudev.hash |  1 +
 package/eudev/eudev.mk   | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index e6a319ac44..24886e4156 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,5 +1,6 @@
 # From http://dev.gentoo.org/~blueness/eudev/
 md5 dedfb1964f6098fe9320de827957331f  eudev-3.2.9.tar.gz
 # Locally calculated
+sha256 b206f72c93cd2e51ed59061931918a9c23c3c1f7e6caffacc9d4f8915a42c30a  udev-gentoo-scripts-33.tar.bz2
 sha256 89618619084a19e1451d373c43f141b469c9fd09767973d73dd268b92074d4fc  eudev-3.2.9.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 99b5befd09..8b19eebb8a 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -10,6 +10,18 @@ EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
+ifeq ($(BR2_INIT_OPENRC),y)
+EUDEV_OPENRC_INIT_VERSION = 33
+EUDEV_OPENRC_INIT = udev-gentoo-scripts-$(EUDEV_OPENRC_INIT_VERSION).tar.bz2
+EUDEV_EXTRA_DOWNLOADS = https://gitweb.gentoo.org/proj/udev-gentoo-scripts.git/snapshot/$(EUDEV_OPENRC_INIT)
+define EUDEV_OPENRC_INIT_EXTRACT
+	$(call suitable-extractor,$(notdir $(EUDEV_OPENRC_INIT))) \
+		$(EUDEV_DL_DIR)/$(notdir $(EUDEV_OPENRC_INIT)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
+endef
+EUDEV_POST_EXTRACT_HOOKS += EUDEV_OPENRC_INIT_EXTRACT
+endif
+
 EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--sbindir=/sbin \
@@ -48,6 +60,14 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
+define EUDEV_INSTALL_INIT_OPENRC
+	$(MAKE1) -C $(@D)/udev-gentoo-scripts-$(EUDEV_OPENRC_INIT_VERSION) \
+		install DESTDIR=$(TARGET_DIR)
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/runlevels/sysinit
+	ln -s -f /etc/init.d/udev-settle /etc/init.d/udev-trigger \
+		$(TARGET_DIR)/etc/runlevels/sysinit
+endef
+
 # Required by default rules for input devices
 define EUDEV_USERS
 	- - input -1 * - - - Input device group
-- 
2.18.2
