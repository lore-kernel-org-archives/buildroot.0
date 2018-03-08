From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Mar 2018 17:42:52 +0100
Subject: [Buildroot] [PATCH 1/1] ncmpc: bump to version 0.29
Message-ID: <20180308164252.10577-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 0.28 ncmpc only supports the meson build.
Therefore, adapt to package infrastructure according to the user manual.

Add a hash for the license file.

Add a nmpc entry for myself in DEVELOPERS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS               |  1 +
 package/ncmpc/ncmpc.hash |  5 ++++-
 package/ncmpc/ncmpc.mk   | 28 +++++++++++++++++++++++++---
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8666a7408c..625fafc686 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -657,6 +657,7 @@ F:	package/libupnp/
 F:	package/libupnp18/
 F:	package/minissdpd/
 F:	package/motion/
+F:	package/ncmpc/
 F:	package/rygel/
 F:	package/safeclib/
 F:	package/tinycbor/
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 82fae1d78c..0e9a4a903c 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 f9a26a3fc869cfdf0a16b0ea3e6512c2fe28a031bbc71b1d24a2bf0bbd3e15d9  ncmpc-0.27.tar.xz
+sha256 ef68a9b67172383ea80ee46579015109433fa058728812d2b0ebede660d85f12  ncmpc-0.29.tar.xz
+
+# Hash for license file:
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 31b4f08d14..0c9dfd4658 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,11 +5,33 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).27
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).29
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
-NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
+NCMPC_DEPENDENCIES = host-meson host-pkgconf libglib2 libmpdclient ncurses
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+NCMPC_CONF_OPTS += \
+	--prefix=/usr \
+	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
+	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
+
+NCMPC_NINJA_OPTS = $(if $(VERBOSE),-v)
+
+define NCMPC_CONFIGURE_CMDS
+	rm -rf $(@D)/build
+	mkdir -p $(@D)/build
+	$(TARGET_MAKE_ENV) meson $(NCMPC_CONF_OPTS) $(@D) $(@D)/build
+endef
+
+define NCMPC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) ninja $(NCMPC_NINJA_OPTS) -C $(@D)/build
+endef
+
+define NCMPC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
+		ninja $(NCMPC_NINJA_OPTS) -C $(@D)/build install
+endef
+
+$(eval $(generic-package))
-- 
2.14.1
