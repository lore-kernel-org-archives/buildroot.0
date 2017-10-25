From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:09:54 +0200
Subject: [Buildroot] [PATCH v2 04/13] packages: use new $($PKG)_DL_DIR)
	variable
In-Reply-To: <20171025201003.16105-1-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
Message-ID: <20171025201003.16105-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Instead of DL_DIR, the package should now use $(PKG)_DL_DIR to ease the
transition into a new directory structure for DL_DIR.

This commit has been generated with the following scripts:

for i in package/*/*.mk; do
	if ! grep -q "\$(DL_DIR)" ${i}; then
		continue
	fi
	pkg_name="$(basename $(dirname ${i}))"
	raw_pkg_name=$(echo ${pkg_name} | tr [a-z] [A-Z] | tr '-' '_')
	pkg_dl_dir="${raw_pkg_name}_DL_DIR"
	sed -i "s/\$(DL_DIR)/\$($pkg_dl_dir)/" ${i}
done

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 --> v2:
  - from https://github.com/maximeh/buildroot/commit/4de06540893ebdfbfb83716db2a34cfbda1f0c43.patch
---
 package/amd-catalyst/amd-catalyst.mk                 | 2 +-
 package/android-tools/android-tools.mk               | 2 +-
 package/angularjs/angularjs.mk                       | 2 +-
 package/bootstrap/bootstrap.mk                       | 2 +-
 package/cache-calibrator/cache-calibrator.mk         | 2 +-
 package/cracklib/cracklib.mk                         | 2 +-
 package/cryptopp/cryptopp.mk                         | 2 +-
 package/devmem2/devmem2.mk                           | 2 +-
 package/dhrystone/dhrystone.mk                       | 2 +-
 package/doom-wad/doom-wad.mk                         | 2 +-
 package/espeak/espeak.mk                             | 2 +-
 package/fan-ctrl/fan-ctrl.mk                         | 2 +-
 package/gcc/gcc.mk                                   | 2 +-
 package/irrlicht/irrlicht.mk                         | 2 +-
 package/jquery-mobile/jquery-mobile.mk               | 2 +-
 package/jquery-sparkline/jquery-sparkline.mk         | 2 +-
 package/jquery-ui-themes/jquery-ui-themes.mk         | 2 +-
 package/jquery-ui/jquery-ui.mk                       | 2 +-
 package/jquery-validation/jquery-validation.mk       | 2 +-
 package/jquery/jquery.mk                             | 2 +-
 package/libfreeimage/libfreeimage.mk                 | 2 +-
 package/libjson/libjson.mk                           | 2 +-
 package/libsoil/libsoil.mk                           | 2 +-
 package/lsof/lsof.mk                                 | 2 +-
 package/musl-compat-headers/musl-compat-headers.mk   | 2 +-
 package/nmon/nmon.mk                                 | 2 +-
 package/nvidia-driver/nvidia-driver.mk               | 2 +-
 package/openobex/openobex.mk                         | 6 ++++++
 package/opentyrian-data/opentyrian-data.mk           | 2 +-
 package/perl/perl.mk                                 | 2 +-
 package/python-keyring/python-keyring.mk             | 2 +-
 package/python-simplegeneric/python-simplegeneric.mk | 2 +-
 package/rapidxml/rapidxml.mk                         | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk       | 2 +-
 package/sam-ba/sam-ba.mk                             | 2 +-
 package/spidev_test/spidev_test.mk                   | 2 +-
 package/tar/tar.mk                                   | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk               | 2 +-
 package/ti-cgt-pru/ti-cgt-pru.mk                     | 4 ++--
 package/ti-gfx/ti-gfx.mk                             | 4 ++--
 package/ts4900-fpga/ts4900-fpga.mk                   | 2 +-
 package/unscd/unscd.mk                               | 2 +-
 package/urg/urg.mk                                   | 4 +++-
 package/waf/waf.mk                                   | 2 +-
 package/whetstone/whetstone.mk                       | 2 +-
 package/wilc1000-firmware/wilc1000-firmware.mk       | 2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk               | 2 +-
 47 files changed, 56 insertions(+), 48 deletions(-)

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
index 08a4b60845..8d6161125b 100644
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
index 33161f53ae..d9aeeabe62 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -10,7 +10,7 @@ BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
 
 define BOOTSTRAP_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
 	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)/
 	rmdir $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist
 endef
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
index 4b121aef2d..63ab600e01 100644
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
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6bdd6c88e3..82eb21a039 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -314,7 +314,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
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
index 02cfec8074..9c67bf3a87 100644
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
index ef8b8af261..a615973912 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -11,7 +11,7 @@ PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = python software foundation license
 
 define PYTHON_KEYRING_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(DL_DIR)/$(PYTHON_KEYRING_SOURCE)
+	$(UNZIP) -d $(@D) $(PYTHON_KEYRING_DL_DIR)/$(PYTHON_KEYRING_SOURCE)
 	mv $(@D)/keyring-$(PYTHON_KEYRING_VERSION)/* $(@D)
 	$(RM) -r $(@D)/keyring-$(PYTHON_KEYRING_VERSION)
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
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 244ede3ef1..fe107b0bb2 100644
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
index cb2ddc0eca..ad3f5ef763 100644
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
index f923e835dc..9c00801558 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -13,8 +13,8 @@ TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html \
 	PRU_CodeGen_Library_2.1_0222433C-30C1-442d-B5C6-2073BD97F80F.spdx.tag
 
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
2.14.2
