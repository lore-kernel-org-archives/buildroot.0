From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Mar 2018 09:01:22 +0100
Subject: [Buildroot] [git commit] libmpdclient: bump to version 2.14
Message-ID: <20180308080758.CFF20827C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cd9c2ddf533f480d5fc502493c04dd7d82ccc9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 2.13 libmpdclient only supports the meson build.
Therefore, adapt to package infrastructure according to the user manual.

Also add a hash for the license file.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmpdclient/libmpdclient.hash |  5 +++--
 package/libmpdclient/libmpdclient.mk   | 32 +++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 2fd20a41fb..eb32786419 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,2 +1,3 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.10.tar.xz.sig, sha256 locally computed
-sha256 4f08cde82dae70895f8e4532a6e9b54b201efd5591c6b5d6834895807ed2ff82  libmpdclient-2.10.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.14.tar.xz.sig, sha256 locally computed
+sha256  0a84e2791bfe3077cf22ee1784c805d5bb550803dffe56a39aa3690a38061372  libmpdclient-2.14.tar.xz
+sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 691aba9f71..5574bde948 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,12 +5,38 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).10
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).14
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
-LIBMPDCLIENT_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBMPDCLIENT_INSTALL_STAGING = YES
 LIBMPDCLIENT_LICENSE = BSD-3-Clause
 LIBMPDCLIENT_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+LIBMPDCLIENT_CONF_OPTS += \
+	--prefix=/usr \
+	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
+	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
+
+LIBMPDCLIENT_NINJA_OPTS = $(if $(VERBOSE),-v)
+
+define LIBMPDCLIENT_CONFIGURE_CMDS
+	rm -rf $(@D)/build
+	mkdir -p $(@D)/build
+	$(TARGET_MAKE_ENV) meson $(LIBMPDCLIENT_CONF_OPTS) $(@D) $(@D)/build
+endef
+
+define LIBMPDCLIENT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build
+endef
+
+define LIBMPDCLIENT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
+		ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build install
+endef
+
+define LIBMPDCLIENT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) \
+		ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build install
+endef
+
+$(eval $(generic-package))
