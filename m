From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Aug 2015 12:57:09 +0200
Subject: [Buildroot] [PATCH v2] systemd: Bump version and change hosting
Message-ID: <1438599429-7110-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd seems to do its release using their github repository up from
the 221 version.

Since they use the auto generated release, we can't have a hash file.

We need to use the autogen.sh scripts from systemd, since they don't
provide the Makefile.in file in the 'po' directory, intltoolize which is
called in the autogen.sh scripts will create it for us.
Therefore, it's no longer needed to do AUTORECONF.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
    - Add missing host-auto{conf,make} and host-libtool as dependencies
    - Re-add '0002-build-sys-revert-use-of-ln-relative-option.patch'
---
 package/systemd/systemd.hash |  2 --
 package/systemd/systemd.mk   | 14 ++++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)
 delete mode 100644 package/systemd/systemd.hash

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
deleted file mode 100644
index f746051..0000000
--- a/package/systemd/systemd.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  085e088650afbfc688ccb13459aedb1fbc7c8810358605b076301f472d51cc4f  systemd-221.tar.xz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b62fc08..3cad639 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 221
-SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
-SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
+SYSTEMD_VERSION = 224
+SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
+	host-automake \
+	host-autoconf \
+	host-libtool \
 	host-intltool \
 	libcap \
 	util-linux \
@@ -18,7 +20,6 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf
 
 SYSTEMD_PROVIDES = udev
-SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
@@ -51,6 +52,11 @@ SYSTEMD_CONF_ENV = \
 	CFLAGS="$(SYSTEMD_CFLAGS)" \
 	ac_cv_path_KMOD=/usr/bin/kmod
 
+define SYSTEMD_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+SYSTEMD_PRE_CONFIGURE_HOOKS += SYSTEMD_RUN_AUTOGEN
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
 SYSTEMD_CONF_OPTS += --enable-compat-libs
 else
-- 
2.4.6
