From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 19:34:21 +0200
Subject: [Buildroot] [git commit] package/fxload: re-enable package on
 microblaze
Message-ID: <20190622175042.64B70802F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f00d6ddf5081b0c366827803915ccf9cf9697cf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building fxload on Microblaze with gcc < 8.x and optimization enabled
fails with:

  Error: operation combines symbols in different segments

This is due to gcc bug 63261
(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261).

To work around this, the fxload package has a !BR2_microblaze
dependency. However, gcc bug 63261 only triggers when optimization is
enabled, so a better work around is to pass -O0, which is what we do
in other Buildroot packages to work around this bug.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_63261, and
re-enables fxload on Microblaze.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fxload/Config.in | 4 ----
 package/fxload/fxload.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/fxload/Config.in b/package/fxload/Config.in
index 88cc6d1e5f..f4d6ef54f5 100644
--- a/package/fxload/Config.in
+++ b/package/fxload/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_FXLOAD
 	bool "fxload"
-	# Hits gcc PR63261 on Microblaze with debugging symbols
-	# enabled. Since this package is unlikely to be useful on
-	# Microblaze, just disable it on this architecture.
-	depends on !BR2_microblaze
 	help
 	  This program is conveniently able to download firmware into
 	  FX, FX2, and FX2LP EZ-USB devices, as well as the original
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index 94b11d0f1e..d3d654a4b4 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -9,8 +9,15 @@ FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FX
 FXLOAD_LICENSE = GPL-2.0+
 FXLOAD_LICENSE_FILES = COPYING
 
+FXLOAD_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_63261),y)
+FXLOAD_CFLAGS += -O0
+endif
+
 define FXLOAD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(FXLOAD_CFLAGS)" -C $(@D) all
 endef
 
 define FXLOAD_INSTALL_TARGET_CMDS
