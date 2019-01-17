From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 22:52:41 +0100
Subject: [Buildroot] [git commit] package/pkg-meson: support per-package
 directories
Message-ID: <20190117215444.D164A8E00F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d882b71a8c0c87b0ccdea7ad620a8f44c33fcb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, package/meson/meson.mk generates a single global
cross-compilation.conf file, with the path to the compiler, cflags,
ldflags, and various other details. This file is then used when
building all meson-based packages.

This causes two problems:

 - It is not compatible with per-package directories, because with
   per-package folders, we need to use a different compiler, and
   possibly CFLAGS/LDFLAGS for each package.

 - It is not possible to define per package CFLAGS. Indeed, when
   cross-compiling, meson doesn't support passing CFLAGS through the
   environment, only the CFLAGS from cross-compilation.conf are taken
   into account.

For this reason, this commit:

 - Introduces a per-package cross-compilation.conf, which is generated
   by the pkg-meson infrastructure in the "configure" step right
   before calling meson. The file is generated in $(@D)/build/, and
   because it is generated within a given package "configure" step,
   the compiler path is the one of this package.

 - Keeps the global cross-compilation.conf in $(HOST_DIR)/etc/meson/,
   for the SDK use-case of Buildroot. Since we want the final and
   global values of the compiler path, CFLAGS and LDFLAGS, generating
   this global cross-compilation.conf is moved to a
   TARGET_FINALIZE_HOOKS. If we were keeping this as a
   HOST_MESON_POST_INSTALL_HOOKS, it would contain values specific to
   the host-meson package.

For now, we don't yet support per-package CFLAGS/LDFLAGS, but having
such per-package cross-compilation.conf is a necessary preparation to
achieve this goal.

This commit has been tested by building all Buildroot packages that
use meson: json-glib, systemd, enlightenment, at-spi2-core, ncmpc,
libmpdclient and ncmpc.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas:
 - add extended commit log
 - in pkg-meson.mk, re-use variables defined in meson.mk to do the
   replacement of CFLAGS/LDFLAGS/CXXFLAGS
 - move the generation of the global cross-compilation.conf to a
   TARGET_FINALIZE_HOOKS
 - testing with per-package folders]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.mk |  4 +++-
 package/pkg-meson.mk   | 12 +++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 5ac9a1d91b..d76541cc93 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -49,6 +49,8 @@ HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_C
 HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
 HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
 
+# Generate a Meson cross-compilation.conf suitable for use with the
+# SDK
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
@@ -63,6 +65,6 @@ define HOST_MESON_INSTALL_CROSS_CONF
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
 
-HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
+TARGET_FINALIZE_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
 
 $(eval $(host-python-package))
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0588660dbf..256e5645e4 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -64,12 +64,22 @@ ifeq ($(4),target)
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
+	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
+	    -e "s%@TARGET_ARCH@%$$(ARCH)%g" \
+	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
+	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
+	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
+	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
+	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
+	    package/meson/cross-compilation.conf.in \
+	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-		--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
+		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
