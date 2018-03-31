From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:23:57 +0200
Subject: [Buildroot] [v3 03/13] packages: use new $($PKG)_DL_DIR) variable
In-Reply-To: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180331142407.9522-3-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of DL_DIR, the package should now use $(PKG)_DL_DIR to ease the
transition into a new directory structure for DL_DIR.

This commit has been generated with the following scripts:

for i in $(find . -iname "*.mk"); do
	if ! grep -q "\$(DL_DIR)" ${i}; then
		continue
	fi
	pkg_name="$(basename $(dirname ${i}))"
	[ "${pkg_name}" = "package" ] && continue
	raw_pkg_name=$(echo ${pkg_name} | tr [a-z] [A-Z] | tr '-' '_')
	pkg_dl_dir="${raw_pkg_name}_DL_DIR"
	sed -i "s/\$(DL_DIR)/\$($pkg_dl_dir)/" ${i}
done

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 boot/at91bootstrap/at91bootstrap.mk                                 | 2 +-
 package/amd-catalyst/amd-catalyst.mk                                | 2 +-
 package/android-tools/android-tools.mk                              | 2 +-
 package/angularjs/angularjs.mk                                      | 2 +-
 package/bootstrap/bootstrap.mk                                      | 4 +++-
 package/cache-calibrator/cache-calibrator.mk                        | 2 +-
 package/cargo/cargo.mk                                              | 4 ++--
 package/cracklib/cracklib.mk                                        | 2 +-
 package/cryptopp/cryptopp.mk                                        | 2 +-
 package/devmem2/devmem2.mk                                          | 2 +-
 package/dhrystone/dhrystone.mk                                      | 2 +-
 package/doom-wad/doom-wad.mk                                        | 2 +-
 package/espeak/espeak.mk                                            | 2 +-
 package/fan-ctrl/fan-ctrl.mk                                        | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk                  | 2 +-
 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk          | 2 +-
 package/freescale-imx/imx-codec/imx-codec.mk                        | 2 +-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk                    | 2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk                    | 2 +-
 package/freescale-imx/imx-parser/imx-parser.mk                      | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk                            | 2 +-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk                    | 2 +-
 package/freescale-imx/libz160/libz160.mk                            | 2 +-
 package/gcc/gcc.mk                                                  | 2 +-
 package/irrlicht/irrlicht.mk                                        | 2 +-
 package/jquery-mobile/jquery-mobile.mk                              | 2 +-
 package/jquery-sparkline/jquery-sparkline.mk                        | 2 +-
 package/jquery-ui-themes/jquery-ui-themes.mk                        | 2 +-
 package/jquery-ui/jquery-ui.mk                                      | 2 +-
 package/jquery-validation/jquery-validation.mk                      | 2 +-
 package/jquery/jquery.mk                                            | 2 +-
 package/kodi/kodi.mk                                                | 6 +++---
 package/libb64/libb64.mk                                            | 2 +-
 package/libfreeimage/libfreeimage.mk                                | 2 +-
 package/libjson/libjson.mk                                          | 2 +-
 package/libsoil/libsoil.mk                                          | 2 +-
 package/lsof/lsof.mk                                                | 2 +-
 package/musl-compat-headers/musl-compat-headers.mk                  | 2 +-
 package/nmon/nmon.mk                                                | 2 +-
 package/nvidia-driver/nvidia-driver.mk                              | 2 +-
 .../nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk   | 2 +-
 package/openobex/openobex.mk                                        | 6 ++++++
 package/opentyrian-data/opentyrian-data.mk                          | 2 +-
 package/perl/perl.mk                                                | 2 +-
 package/python-keyring/python-keyring.mk                            | 1 -
 package/python-pytz/python-pytz.mk                                  | 2 +-
 package/python-simplegeneric/python-simplegeneric.mk                | 2 +-
 package/rapidxml/rapidxml.mk                                        | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk                      | 2 +-
 package/rust-bin/rust-bin.mk                                        | 2 +-
 package/sam-ba/sam-ba.mk                                            | 2 +-
 package/spidev_test/spidev_test.mk                                  | 2 +-
 package/tar/tar.mk                                                  | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk                              | 2 +-
 package/ti-cgt-pru/ti-cgt-pru.mk                                    | 4 ++--
 package/ti-gfx/ti-gfx.mk                                            | 4 ++--
 package/ts4900-fpga/ts4900-fpga.mk                                  | 2 +-
 package/unscd/unscd.mk                                              | 2 +-
 package/urg/urg.mk                                                  | 4 +++-
 package/waf/waf.mk                                                  | 2 +-
 package/whetstone/whetstone.mk                                      | 2 +-
 package/wilc1000-firmware/wilc1000-firmware.mk                      | 2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk                              | 2 +-
 63 files changed, 76 insertions(+), 67 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index f6550588d3..c68b56b6ec 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -17,7 +17,7 @@ AT91BOOTSTRAP_INSTALL_IMAGES = YES
 AT91BOOTSTRAP_INSTALL_TARGET = NO
 
 define AT91BOOTSTRAP_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(AT91BOOTSTRAP_DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
 	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
 endef
diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index b9396e11fa..d864095c31 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -17,7 +17,7 @@ AMD_CATALYST_ARCH_DIR = $(@D)/arch/x86$(AMD_CATALYST_SUFFIX)
 AMD_CATALYST_LIB_SUFFIX = $(if $(BR2_x86_64),64)
 
 define AMD_CATALYST_EXTRACT_CMDS
-	unzip -q $(DL_DIR)/$(AMD_CATALYST_SOURCE) -d $(@D)
+	unzip -q $(AMD_CATALYST_DL_DIR)/$(AMD_CATALYST_SOURCE) -d $(@D)
 	$(SHELL) $(@D)/AMD-Catalyst-$(AMD_CATALYST_VERSION)-Linux-installer-$(AMD_CATALYST_VERBOSE_VER)-x86.x86_64.run --extract $(@D)
 endef
 
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index f6c6913a68..11e0a15a7f 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -15,7 +15,7 @@ ANDROID_TOOLS_LICENSE_FILES = debian/copyright
 # Extract the Debian tarball inside the sources
 define ANDROID_TOOLS_DEBIAN_EXTRACT
 	$(call suitable-extractor,$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
-		$(DL_DIR)/$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
+		$(ANDROID_TOOLS_DL_DIR)/$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
 		$(TAR) -C $(@D) $(TAR_OPTIONS) -
 endef
 
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 60702a26d2..a941bc3828 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -12,7 +12,7 @@ ANGULARJS_LICENSE = MIT
 ANGULARJS_LICENSE_FILES = angular.js
 
 define ANGULARJS_EXTRACT_CMDS
-	unzip $(DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
+	unzip $(ANGULARJS_DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
 	mv $(@D)/angular-$(ANGULARJS_VERSION)/* $(@D)
 	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
 endef
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 61d6c826fc..50cdc322e4 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -11,7 +11,9 @@ BOOTSTRAP_LICENSE = MIT
 BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
 
 define BOOTSTRAP_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)/
+	rmdir $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
diff --git a/package/cache-calibrator/cache-calibrator.mk b/package/cache-calibrator/cache-calibrator.mk
index 6f12d119ef..203732e4f7 100644
--- a/package/cache-calibrator/cache-calibrator.mk
+++ b/package/cache-calibrator/cache-calibrator.mk
@@ -10,7 +10,7 @@ CACHE_CALIBRATOR_LICENSE = Cache calibrator license
 CACHE_CALIBRATOR_LICENSE_FILES = calibrator.c.license
 
 define CACHE_CALIBRATOR_EXTRACT_CMDS
-	cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(@D)
+	cp $(CACHE_CALIBRATOR_DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(@D)
 endef
 
 define CACHE_CALIBRATOR_EXTRACT_LICENSE
diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index 3fd088d727..36b2718e90 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -37,7 +37,7 @@ HOST_CARGO_HOME = $(HOST_DIR)/share/cargo
 define HOST_CARGO_EXTRACT_DEPS
 	@mkdir -p $(@D)/vendor
 	$(call suitable-extractor,$(CARGO_DEPS_SOURCE)) \
-		$(DL_DIR)/$(CARGO_DEPS_SOURCE) | \
+		$(CARGO_DL_DIR)/$(CARGO_DEPS_SOURCE) | \
 		$(TAR) --strip-components=1 -C $(@D)/vendor $(TAR_OPTIONS) -
 endef
 
@@ -46,7 +46,7 @@ HOST_CARGO_POST_EXTRACT_HOOKS += HOST_CARGO_EXTRACT_DEPS
 define HOST_CARGO_EXTRACT_INSTALLER
 	@mkdir -p $(@D)/src/rust-installer
 	$(call suitable-extractor,$(CARGO_INSTALLER_SOURCE)) \
-		$(DL_DIR)/$(CARGO_INSTALLER_SOURCE) | \
+		$(CARGO_DL_DIR)/$(CARGO_INSTALLER_SOURCE) | \
 		$(TAR) --strip-components=1 -C $(@D)/src/rust-installer $(TAR_OPTIONS) -
 endef
 
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 2fa3d3b4ea..aeee60d1e7 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -29,7 +29,7 @@ HOST_CRACKLIB_CONF_OPTS += --without-python --without-zlib
 
 ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
 CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).gz
-CRACKLIB_DICT_SOURCE = $(DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).gz
+CRACKLIB_DICT_SOURCE = $(CRACKLIB_DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).gz
 else
 CRACKLIB_DICT_SOURCE = $(@D)/dicts/cracklib-small
 endif
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index d7aabf04b8..6da39b09f2 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -12,7 +12,7 @@ CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
 
 define HOST_CRYPTOPP_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
+	$(UNZIP) $(CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
 endef
 
 HOST_CRYPTOPP_MAKE_OPTS = \
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index eb92db6098..044e6fa596 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -11,7 +11,7 @@ DEVMEM2_LICENSE = GPL-2.0+
 DEVMEM2_LICENSE_FILES = devmem2.c.license
 
 define DEVMEM2_EXTRACT_CMDS
-	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+	cp $(DEVMEM2_DL_DIR)/$($(PKG)_SOURCE) $(@D)/
 endef
 
 define DEVMEM2_EXTRACT_LICENSE
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index c0bca9895d..d54c8d94e8 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -9,7 +9,7 @@ DHRYSTONE_SOURCE = dhry-c
 DHRYSTONE_SITE = http://www.netlib.org/benchmark
 
 define DHRYSTONE_EXTRACT_CMDS
-	(cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE))
+	(cd $(@D) && $(SHELL) $(DHRYSTONE_DL_DIR)/$($(PKG)_SOURCE))
 	$(Q)cp package/dhrystone/Makefile $(@D)/
 endef
 
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index d3ac731bd5..f348fc2207 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -11,7 +11,7 @@ DOOM_WAD_SOURCE = doom$(subst .,,$(DOOM_WAD_VERSION))s.zip
 DOOM_WAD_SITE = http://www.jbserver.com/downloads/games/doom/misc/shareware
 
 define DOOM_WAD_EXTRACT_CMDS
-	$(UNZIP) -p $(DL_DIR)/$($(PKG)_SOURCE) 'DOOMS_19.[12]' > \
+	$(UNZIP) -p $(DOOM_WAD_DL_DIR)/$($(PKG)_SOURCE) 'DOOMS_19.[12]' > \
 		$(@D)/doom-$(DOOM_WAD_VERSION).zip
 	$(UNZIP) -d $(@D) $(@D)/doom-$(DOOM_WAD_VERSION).zip DOOM1.WAD
 endef
diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 226f17fc05..aa0b5b0716 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -21,7 +21,7 @@ ESPEAK_DEPENDENCIES = pulseaudio
 endif
 
 define ESPEAK_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(ESPEAK_SOURCE)
+	$(UNZIP) -d $(@D) $(ESPEAK_DL_DIR)/$(ESPEAK_SOURCE)
 	mv $(@D)/espeak-$(ESPEAK_VERSION)-source/* $(@D)
 	$(RM) -r $(@D)/espeak-$(ESPEAK_VERSION)-source
 endef
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
index 53533a8a17..81a52f1e9f 100644
--- a/package/fan-ctrl/fan-ctrl.mk
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -12,7 +12,7 @@ FAN_CTRL_LICENSE = GPL-2.0+
 FAN_CTRL_LICENSE_FILES = fan-ctrl.c
 
 define FAN_CTRL_EXTRACT_CMDS
-	cp $(DL_DIR)/$(FAN_CTRL_SOURCE) $(@D)/fan-ctrl.c
+	cp $(FAN_CTRL_DL_DIR)/$(FAN_CTRL_SOURCE) $(@D)/fan-ctrl.c
 endef
 
 define FAN_CTRL_BUILD_CMDS
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 630afcaa37..d5387b38da 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -15,7 +15,7 @@ FIRMWARE_IMX_REDISTRIBUTE = NO
 FIRMWARE_IMX_BLOBS = sdma vpu
 
 define FIRMWARE_IMX_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(FIRMWARE_IMX_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
index 44a6b4c7d2..5586073712 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
@@ -23,7 +23,7 @@ GPU_AMD_BIN_MX51_LICENSE_FILES = EULA
 GPU_AMD_BIN_MX51_REDISTRIBUTE = NO
 
 define GPU_AMD_BIN_MX51_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(GPU_AMD_BIN_MX51_DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE))
 endef
 
 # Upstream headers need to be compiled with -D_LINUX. It is more convenient
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index ea4d90110f..784c1fa4a9 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -26,7 +26,7 @@ IMX_CODEC_CONF_OPTS += --enable-vpu
 endif
 
 define IMX_CODEC_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_CODEC_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_CODEC_DL_DIR)/$(IMX_CODEC_SOURCE))
 endef
 
 # FIXME The Makefile installs both the arm9 and arm11 versions of the
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 0c92b826c4..aafd70dc9d 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -15,7 +15,7 @@ IMX_GPU_G2D_LICENSE_FILES = EULA COPYING
 IMX_GPU_G2D_REDISTRIBUTE = NO
 
 define IMX_GPU_G2D_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_GPU_G2D_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_G2D_DL_DIR)/$(IMX_GPU_G2D_SOURCE))
 endef
 
 define IMX_GPU_G2D_INSTALL_STAGING_CMDS
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index a9f8b9d9bd..0dc2072984 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -26,7 +26,7 @@ IMX_GPU_VIV_DEPENDENCIES += xlib_libXdamage xlib_libXext xlib_libXfixes
 endif
 
 define IMX_GPU_VIV_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_GPU_VIV_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
 # Instead of building, we fix up the inconsistencies that exist
diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index d79a4444c8..11536e5024 100644
--- a/package/freescale-imx/imx-parser/imx-parser.mk
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -24,7 +24,7 @@ IMX_PARSER_CONF_OPTS += --enable-fsw
 endif
 
 define IMX_PARSER_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_PARSER_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_PARSER_DL_DIR)/$(IMX_PARSER_SOURCE))
 endef
 
 # The Makefile installs several versions of the libraries, but we only
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index e3a1ee661d..2bcfe53eba 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -21,7 +21,7 @@ IMX_VPU_LICENSE_FILES = EULA COPYING
 IMX_VPU_REDISTRIBUTE = NO
 
 define IMX_VPU_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_VPU_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_DL_DIR)/$(IMX_VPU_SOURCE))
 endef
 
 define IMX_VPU_BUILD_CMDS
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index 7cbf7784c9..edba87279f 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -15,7 +15,7 @@ IMX_VPUWRAP_LICENSE_FILES = EULA COPYING
 IMX_VPUWRAP_REDISTRIBUTE = NO
 
 define IMX_VPUWRAP_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_VPUWRAP_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPUWRAP_DL_DIR)/$(IMX_VPUWRAP_SOURCE))
 endef
 
 $(eval $(autotools-package))
diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
index af43b1859d..5b1feeb441 100644
--- a/package/freescale-imx/libz160/libz160.mk
+++ b/package/freescale-imx/libz160/libz160.mk
@@ -15,7 +15,7 @@ LIBZ160_LICENSE_FILES = EULA
 LIBZ160_REDISTRIBUTE = NO
 
 define LIBZ160_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBZ160_SOURCE))
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(LIBZ160_DL_DIR)/$(LIBZ160_SOURCE))
 endef
 
 define LIBZ160_INSTALL_STAGING_CMDS
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 27fc1e987c..f42f36a967 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -316,7 +316,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(GCC_DL_DIR)/$(GCC_SOURCE)
 
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned
 # and unversioned patches unconditionally. Moreover, to facilitate the
diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
index ccd1045ca0..a1e190d98d 100644
--- a/package/irrlicht/irrlicht.mk
+++ b/package/irrlicht/irrlicht.mk
@@ -25,7 +25,7 @@ IRRLICHT_SUBDIR = source/Irrlicht
 IRRLICHT_DEPENDENCIES = libgl xlib_libXxf86vm
 
 define IRRLICHT_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(IRRLICHT_SOURCE)
+	$(UNZIP) -d $(@D) $(IRRLICHT_DL_DIR)/$(IRRLICHT_SOURCE)
 	mv $(@D)/irrlicht-$(IRRLICHT_VERSION)/* $(@D)
 	$(RM) -r $(@D)/irrlicht-$(IRRLICHT_VERSION)
 endef
diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
index 1067952904..1171e60d0a 100644
--- a/package/jquery-mobile/jquery-mobile.mk
+++ b/package/jquery-mobile/jquery-mobile.mk
@@ -10,7 +10,7 @@ JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
 JQUERY_MOBILE_LICENSE = MIT
 
 define JQUERY_MOBILE_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
+	$(UNZIP) -d $(@D) $(JQUERY_MOBILE_DL_DIR)/$(JQUERY_MOBILE_SOURCE)
 endef
 
 JQUERY_MOBILE_INSTALLED_FILES = \
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index 165c2fa99c..683d84f4aa 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -10,7 +10,7 @@ JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
 JQUERY_SPARKLINE_LICENSE = BSD-3-Clause
 
 define JQUERY_SPARKLINE_EXTRACT_CMDS
-	cp $(DL_DIR)/$(JQUERY_SPARKLINE_SOURCE) $(@D)
+	cp $(JQUERY_SPARKLINE_DL_DIR)/$(JQUERY_SPARKLINE_SOURCE) $(@D)
 endef
 
 define JQUERY_SPARKLINE_INSTALL_TARGET_CMDS
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index cd3dab6d87..5108389a77 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -12,7 +12,7 @@ JQUERY_UI_THEMES_LICENSE_FILES = MIT-LICENSE.txt
 JQUERY_UI_THEMES_DEPENDENCIES = jquery-ui
 
 define JQUERY_UI_THEMES_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_UI_THEMES_SOURCE)
+	$(UNZIP) -d $(@D) $(JQUERY_UI_THEMES_DL_DIR)/$(JQUERY_UI_THEMES_SOURCE)
 	mv $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)/* $(@D)
 	$(RM) -r $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)
 endef
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index d829d6241b..9284e683f1 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -14,7 +14,7 @@ JQUERY_UI_LICENSE = MIT
 JQUERY_UI_LICENSE_FILES = MIT-LICENSE.txt
 
 define JQUERY_UI_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_UI_SOURCE)
+	$(UNZIP) -d $(@D) $(JQUERY_UI_DL_DIR)/$(JQUERY_UI_SOURCE)
 	mv $(@D)/jquery-ui-$(JQUERY_UI_VERSION)/* $(@D)
 	$(RM) -r $(@D)/jquery-ui-$(JQUERY_UI_VERSION)
 endef
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 10d2a92afc..a8c2897983 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -11,7 +11,7 @@ JQUERY_VALIDATION_LICENSE = MIT
 JQUERY_VALIDATION_LICENSE_FILES = README.md
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
+	$(UNZIP) -d $(@D) $(JQUERY_VALIDATION_DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
 endef
 
 define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 363ee09633..f75eded8b3 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -10,7 +10,7 @@ JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
 
 define JQUERY_EXTRACT_CMDS
-	cp $(DL_DIR)/$(JQUERY_SOURCE) $(@D)
+	cp $(JQUERY_DL_DIR)/$(JQUERY_SOURCE) $(@D)
 endef
 
 define JQUERY_INSTALL_TARGET_CMDS
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 93f4dd4b31..739850d670 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -69,9 +69,9 @@ KODI_CONF_OPTS += \
 	-DDEPENDS_PATH=$(@D) \
 	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
-	-DLIBDVDCSS_URL=$(DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
-	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
-	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
+	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
+	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
+	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
diff --git a/package/libb64/libb64.mk b/package/libb64/libb64.mk
index 4dea9593a0..ed6d3cf4b4 100644
--- a/package/libb64/libb64.mk
+++ b/package/libb64/libb64.mk
@@ -14,7 +14,7 @@ LIBB64_INSTALL_STAGING = YES
 LIBB64_INSTALL_TARGET = NO
 
 define LIBB64_EXTRACT_CMDS
-	unzip $(DL_DIR)/$(LIBB64_SOURCE) -d $(BUILD_DIR)
+	unzip $(LIBB64_DL_DIR)/$(LIBB64_SOURCE) -d $(BUILD_DIR)
 endef
 
 define LIBB64_BUILD_CMDS
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index 0ca23933a6..e0aa1f0ae8 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -12,7 +12,7 @@ LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
 LIBFREEIMAGE_INSTALL_STAGING = YES
 
 define LIBFREEIMAGE_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(LIBFREEIMAGE_SOURCE) -d $(@D)
+	$(UNZIP) $(LIBFREEIMAGE_DL_DIR)/$(LIBFREEIMAGE_SOURCE) -d $(@D)
 	mv $(@D)/FreeImage/* $(@D)
 	rmdir $(@D)/FreeImage
 endef
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index 74224ba657..d04ddc40f3 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -23,7 +23,7 @@ endif
 LIBJSON_MAKE_OPTS += BUILD_TYPE= CXXFLAGS="$(LIBJSON_CXXFLAGS)"
 
 define LIBJSON_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
+	$(UNZIP) -d $(@D) $(LIBJSON_DL_DIR)/$(LIBJSON_SOURCE)
 	mv $(@D)/libjson/* $(@D)
 	$(RM) -r $(@D)/libjson
 	$(SED) '/ldconfig/d' $(@D)/makefile
diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
index efa67d9eee..2945edd8dd 100644
--- a/package/libsoil/libsoil.mk
+++ b/package/libsoil/libsoil.mk
@@ -14,7 +14,7 @@ LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
 LIBSOIL_MAKEFILE = ../projects/makefile/alternate_Makefile.txt
 
 define LIBSOIL_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBSOIL_SOURCE)
+	$(UNZIP) -d $(@D) $(LIBSOIL_DL_DIR)/$(LIBSOIL_SOURCE)
 	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
 endef
 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index e5cd4bce6e..0dc8e2de2f 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -32,7 +32,7 @@ endif
 
 # The .tar.bz2 contains another .tar, which contains the source code.
 define LSOF_EXTRACT_CMDS
-	$(call suitable-extractor,$(LSOF_SOURCE)) $(DL_DIR)/$(LSOF_SOURCE) | \
+	$(call suitable-extractor,$(LSOF_SOURCE)) $(LSOF_DL_DIR)/$(LSOF_SOURCE) | \
 		$(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
 	$(TAR) --strip-components=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
 endef
diff --git a/package/musl-compat-headers/musl-compat-headers.mk b/package/musl-compat-headers/musl-compat-headers.mk
index 91f5074ef6..1cfa894879 100644
--- a/package/musl-compat-headers/musl-compat-headers.mk
+++ b/package/musl-compat-headers/musl-compat-headers.mk
@@ -20,7 +20,7 @@ MUSL_COMPAT_HEADERS_INSTALL_STAGING = YES
 
 # Copying both headers so legal-info finds them (they are _LICENSE_FILES)
 define MUSL_COMPAT_HEADERS_EXTRACT_CMDS
-	$(INSTALL) -m 0644 -D $(DL_DIR)/$(notdir $(MUSL_COMPAT_HEADERS_QUEUE_H)) $(@D)/queue.h
+	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_DL_DIR)/$(notdir $(MUSL_COMPAT_HEADERS_QUEUE_H)) $(@D)/queue.h
 	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_PKGDIR)/cdefs.h $(@D)/cdefs.h
 endef
 
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index f561d6dcc0..f7edd66a26 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -13,7 +13,7 @@ NMON_DEPENDENCIES = ncurses
 NMON_CFLAGS = $(TARGET_CFLAGS) -D JFS -D GETUSER -D LARGEMEM -D DEBIAN
 
 define NMON_EXTRACT_CMDS
-	cp $(DL_DIR)/$(NMON_SOURCE) $(@D)
+	cp $(NMON_DL_DIR)/$(NMON_SOURCE) $(@D)
 endef
 
 define NMON_BUILD_CMDS
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index e56661059f..404fa881ec 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -144,7 +144,7 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == y
 # virtually everywhere, and it is fine enough to provide useful options.
 # Except it can't extract into an existing (even empty) directory.
 define NVIDIA_DRIVER_EXTRACT_CMDS
-	$(SHELL) $(DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only --target \
+	$(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --extract-only --target \
 		$(@D)/tmp-extract
 	chmod u+w -R $(@D)
 	mv $(@D)/tmp-extract/* $(@D)/tmp-extract/.manifest $(@D)
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
index 5514643416..2885021c58 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
@@ -15,7 +15,7 @@ NVIDIA_TEGRA23_CODECS_REDISTRIBUTE = NO
 define NVIDIA_TEGRA23_CODECS_EXTRACT_CMDS
 	$(INSTALL) -d $(@D)
 	$(call suitable-extractor,$(NVIDIA_TEGRA23_CODECS_SOURCE)) \
-		$(DL_DIR)/$(NVIDIA_TEGRA23_CODECS_SOURCE) | \
+		$(NVIDIA_TEGRA23_CODECS_DL_DIR)/$(NVIDIA_TEGRA23_CODECS_SOURCE) | \
 	$(TAR) --strip-components=0 -C $(@D) $(TAR_OPTIONS) -
 	$(INSTALL) -d $(@D)/restricted_codecs
 	$(call suitable-extractor,$(@D)/restricted_codecs.tbz2) \
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index ea41f65a80..c19780110c 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -19,6 +19,12 @@ ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 OPENOBEX_DEPENDENCIES += bluez_utils
 endif
 
+define OPENOBEX_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(OPENOBEX_DL_DIR)/$(OPENOBEX_SOURCE)
+	mv $(@D)/openobex-$(OPENOBEX_VERSION)-Source/* $(@D)
+	$(RM) -r $(@D)/openobex-$(OPENOBEX_VERSION)-Source
+endef
+
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 OPENOBEX_DEPENDENCIES += bluez5_utils
 endif
diff --git a/package/opentyrian-data/opentyrian-data.mk b/package/opentyrian-data/opentyrian-data.mk
index 4b879df1c3..9e38b61bfa 100644
--- a/package/opentyrian-data/opentyrian-data.mk
+++ b/package/opentyrian-data/opentyrian-data.mk
@@ -10,7 +10,7 @@ OPENTYRIAN_DATA_SOURCE = tyrian21.zip
 OPENTYRIAN_DATA_LICENSE = Freeware
 
 define OPENTYRIAN_DATA_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(OPENTYRIAN_DATA_SOURCE)
+	$(UNZIP) -d $(@D) $(OPENTYRIAN_DATA_DL_DIR)/$(OPENTYRIAN_DATA_SOURCE)
 endef
 
 define OPENTYRIAN_DATA_INSTALL_TARGET_CMDS
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 58bf3eb6ae..c47367b9da 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -24,7 +24,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 # as a separate package. Instead, it is downloaded and extracted
 # together with perl
 define PERL_CROSS_EXTRACT
-	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
+	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 27db2802ed..8ac18ae052 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -6,7 +6,6 @@
 
 PYTHON_KEYRING_VERSION = 10.5.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://pypi.python.org/packages/42/2e/51bd1739fe335095a2174db3f2f230346762e7e572471059540146a521f6
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 6e130a6b2f..1d3603389b 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -12,7 +12,7 @@ PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
 
 define PYTHON_PYTZ_EXTRACT_CMDS
-	unzip $(DL_DIR)/$(PYTHON_PYTZ_SOURCE) -d $(@D)
+	unzip $(PYTHON_PYTZ_DL_DIR)/$(PYTHON_PYTZ_SOURCE) -d $(@D)
 	mv $(@D)/pytz-$(PYTHON_PYTZ_VERSION)/* $(@D)
 	rmdir $(@D)/pytz-$(PYTHON_PYTZ_VERSION)
 endef
diff --git a/package/python-simplegeneric/python-simplegeneric.mk b/package/python-simplegeneric/python-simplegeneric.mk
index cc84320428..d3bfa69a7e 100644
--- a/package/python-simplegeneric/python-simplegeneric.mk
+++ b/package/python-simplegeneric/python-simplegeneric.mk
@@ -16,7 +16,7 @@ PYTHON_SIMPLEGENERIC_LICENSE = ZPL-2.1
 PYTHON_SIMPLEGENERIC_SETUP_TYPE = setuptools
 
 define PYTHON_SIMPLEGENERIC_EXTRACT_CMDS
-	unzip $(DL_DIR)/$(PYTHON_SIMPLEGENERIC_SOURCE) -d $(@D)
+	unzip $(PYTHON_SIMPLEGENERIC_DL_DIR)/$(PYTHON_SIMPLEGENERIC_SOURCE) -d $(@D)
 	mv $(@D)/simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION)/* $(@D)
 	rmdir $(@D)/simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION)
 endef
diff --git a/package/rapidxml/rapidxml.mk b/package/rapidxml/rapidxml.mk
index 2bec8fe1f2..9d034d8205 100644
--- a/package/rapidxml/rapidxml.mk
+++ b/package/rapidxml/rapidxml.mk
@@ -15,7 +15,7 @@ RAPIDXML_INSTALL_TARGET = NO
 RAPIDXML_INSTALL_STAGING = YES
 
 define RAPIDXML_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(RAPIDXML_SOURCE)
+	$(UNZIP) -d $(@D) $(RAPIDXML_DL_DIR)/$(RAPIDXML_SOURCE)
 	mv $(@D)/rapidxml-$(RAPIDXML_VERSION)/* $(@D)/
 	rmdir $(@D)/rapidxml-$(RAPIDXML_VERSION)
 endef
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 6c855a8e14..83473d5bb9 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -12,7 +12,7 @@ RPI_WIFI_FIRMWARE_SITE = https://raw.githubusercontent.com/RPi-Distro/firmware-n
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 
 define RPI_WIFI_FIRMWARE_EXTRACT_CMDS
-	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+	cp $(RPI_WIFI_FIRMWARE_DL_DIR)/$($(PKG)_SOURCE) $(@D)/
 endef
 
 define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index cd5844b115..759d468304 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -22,7 +22,7 @@ HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAM
 define HOST_RUST_BIN_LIBSTD_EXTRACT
 	mkdir -p $(@D)/std
 	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
-		$(call suitable-extractor,$(f)) $(DL_DIR)/$(f) | \
+		$(call suitable-extractor,$(f)) $(RUST_BIN_DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
 	cd $(@D)/rustc/lib/rustlib; \
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index a7941459c7..acc03a3b6b 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -13,7 +13,7 @@ SAM_BA_LICENSE_FILES = doc/license.txt tcl_lib/boards.tcl \
 		applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
 
 define HOST_SAM_BA_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(SAM_BA_DL_DIR)/$(SAM_BA_SOURCE)
 	mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
 	rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
 endef
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 1d657803b4..bf8170cd2c 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -32,7 +32,7 @@ endef
 SPIDEV_TEST_POST_PATCH_HOOKS += SPIDEV_ADD_LINUX_IOCTL
 
 define SPIDEV_TEST_EXTRACT_CMDS
-	cp $(DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
+	cp $(SPIDEV_TEST_DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
 endef
 
 define SPIDEV_TEST_BUILD_CMDS
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 92b6e9eaa5..9942e77737 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -40,7 +40,7 @@ HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
 define HOST_TAR_EXTRACT_CMDS
 	mkdir -p $(@D)
 	cd $(@D) && \
-		$(call suitable-extractor,$(HOST_TAR_SOURCE)) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i --preserve-modification-time
+		$(call suitable-extractor,$(HOST_TAR_SOURCE)) $(TAR_DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i --preserve-modification-time
 	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
 	rmdir $(@D)/tar-$(TAR_VERSION)
 endef
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 9e315b239a..919a4360ed 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -62,7 +62,7 @@ TESSERACT_OCR_PRE_CONFIGURE_HOOKS += TESSERACT_OCR_PRECONFIGURE
 # Language data files installation
 define TESSERACT_OCR_INSTALL_LANG_DATA
 	$(foreach langfile,$(TESSERACT_OCR_DATA_FILES), \
-		$(INSTALL) -D -m 0644 $(DL_DIR)/$(langfile) \
+		$(INSTALL) -D -m 0644 $(TESSERACT_OCR_DL_DIR)/$(langfile) \
 			$(TARGET_DIR)/usr/share/tessdata/$(langfile)
 	)
 endef
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index 0b9a64b3c9..df3b97bef5 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -13,8 +13,8 @@ TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.2.x_manifest.html \
 	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
 
 define HOST_TI_CGT_PRU_EXTRACT_CMDS
-	chmod +x $(DL_DIR)/$(TI_CGT_PRU_SOURCE)
-	$(DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
+	chmod +x $(TI_CGT_PRU_DL_DIR)/$(TI_CGT_PRU_SOURCE)
+	$(TI_CGT_PRU_DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
 	mv $(@D)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)/* $(@D)
 	rmdir $(@D)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)/
 endef
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 428878a08b..9fad553780 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -94,8 +94,8 @@ TI_GFX_HDR_DIRS = OGLES2/EGL OGLES2/EWS OGLES2/GLES2 OGLES2/KHR \
 	OGLES/GLES bufferclass_ti/ pvr2d/ wsegl/
 
 define TI_GFX_EXTRACT_CMDS
-	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
-	printf "Y\nY\n qY\n\n" | $(DL_DIR)/$(TI_GFX_SOURCE) \
+	chmod +x $(TI_GFX_DL_DIR)/$(TI_GFX_SOURCE)
+	printf "Y\nY\n qY\n\n" | $(TI_GFX_DL_DIR)/$(TI_GFX_SOURCE) \
 		--prefix $(@D) \
 		--mode console
 endef
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
index ed951b8c8f..7bb62a3984 100644
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -11,7 +11,7 @@ TS4900_FPGA_SITE = ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-
 # https://github.com/embeddedarm/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
 
 define TS4900_FPGA_EXTRACT_CMDS
-	cp $(DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
+	cp $(TS4900_FPGA_DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
 endef
 
 define TS4900_FPGA_INSTALL_TARGET_CMDS
diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
index f0eb5d6ad6..36f2de271b 100644
--- a/package/unscd/unscd.mk
+++ b/package/unscd/unscd.mk
@@ -11,7 +11,7 @@ UNSCD_LICENSE = GPL-2.0
 UNSCD_LICENSE_FILES = $(UNSCD_SOURCE)
 
 define UNSCD_EXTRACT_CMDS
-	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+	cp $(UNSCD_DL_DIR)/$($(PKG)_SOURCE) $(@D)/
 endef
 
 define UNSCD_BUILD_CMDS
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 966627fe36..1346079893 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -25,7 +25,9 @@ endif
 URG_CONFIG_SCRIPTS = c_urg-config urg-config
 
 define URG_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(URG_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(URG_DL_DIR)/$(URG_SOURCE)
+	test -d $(URG_DIR) || \
+		mv $(BUILD_DIR)/$(subst .zip,,$(URG_SOURCE)) $(URG_DIR)
 endef
 
 $(eval $(autotools-package))
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index e7ac891b39..639c26a3b0 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -9,7 +9,7 @@ WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io/
 
 define HOST_WAF_EXTRACT_CMDS
-	$(INSTALL) -D -m 0755 $(DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
+	$(INSTALL) -D -m 0755 $(WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
 endef
 
 define HOST_WAF_INSTALL_CMDS
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index d9b45638c5..3b6ec3419b 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -9,7 +9,7 @@ WHETSTONE_SOURCE = whetstone.c
 WHETSTONE_SITE = http://www.netlib.org/benchmark
 
 define WHETSTONE_EXTRACT_CMDS
-	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+	cp $(WHETSTONE_DL_DIR)/$($(PKG)_SOURCE) $(@D)/
 endef
 
 define WHETSTONE_BUILD_CMDS
diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc1000-firmware/wilc1000-firmware.mk
index 5dcf19045b..6f504d67a0 100644
--- a/package/wilc1000-firmware/wilc1000-firmware.mk
+++ b/package/wilc1000-firmware/wilc1000-firmware.mk
@@ -11,7 +11,7 @@ WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
 WILC1000_FIRMWARE_LICENSE = PROPRIETARY
 
 define WILC1000_FIRMWARE_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(WILC1000_FIRMWARE_DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
 	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
 	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
 endef
diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
index 3648c63654..c523e04f45 100644
--- a/package/zynq-boot-bin/zynq-boot-bin.mk
+++ b/package/zynq-boot-bin/zynq-boot-bin.mk
@@ -12,7 +12,7 @@ ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
 HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
 
 define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
-	cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
+	cp $(ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
 endef
 
 define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
-- 
2.16.2
