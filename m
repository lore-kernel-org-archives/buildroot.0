From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 19 Mar 2017 09:07:53 +0100
Subject: [Buildroot] [PATCH v2 2/2] tesseract-ocr: new package
In-Reply-To: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1489910873-8450-3-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Changes  v2 (following review by Thomas P.)
- Added language data files support inside main package instead of
specific package for each of them
- Explicitly selected PNG, JPEG and TIFF libraries as dependencies
- Added DEVELOPERS file change
- Fixed indentation issues
- Added extra comments
- Added limitations found using test-pkg script
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/tesseract-ocr/Config.in          | 44 ++++++++++++++++++++
 package/tesseract-ocr/tesseract-ocr.hash |  8 ++++
 package/tesseract-ocr/tesseract-ocr.mk   | 69 ++++++++++++++++++++++++++++++++
 5 files changed, 123 insertions(+)
 create mode 100644 package/tesseract-ocr/Config.in
 create mode 100644 package/tesseract-ocr/tesseract-ocr.hash
 create mode 100644 package/tesseract-ocr/tesseract-ocr.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8802fc7..bdc93d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -589,6 +589,7 @@ F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
 F:	package/ocrad/
+F:	package/tesseract-ocr/
 F:	package/webp/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index ed48058..66c87d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,6 +244,7 @@ comment "Graphic applications"
 	source "package/mesa3d-demos/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/tesseract-ocr/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui06/Config.in"
diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
new file mode 100644
index 0000000..4fd0668
--- /dev/null
+++ b/package/tesseract-ocr/Config.in
@@ -0,0 +1,44 @@
+comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8 & dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+        !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS
+
+menuconfig BR2_PACKAGE_TESSERACT_OCR
+	bool "tesseract-ocr"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LEPTONICA
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_TIFF
+	help
+	  Tesseract is an OCR (Optical Character Recognition) engine,
+	  It can be used directly, or (for programmers) using an API.
+	  It supports a wide variety of languages.
+
+	  https://github.com/tesseract-ocr/tesseract
+
+if BR2_PACKAGE_TESSERACT_OCR
+comment "tesseract-ocr languages support"
+
+config BR2_PACKAGE_TESSERACT_OCR_LANG_ENG
+	bool "English"
+
+config BR2_PACKAGE_TESSERACT_OCR_LANG_FRA
+	bool "French"
+
+config BR2_PACKAGE_TESSERACT_OCR_LANG_GER
+	bool "German"
+
+config BR2_PACKAGE_TESSERACT_OCR_LANG_SPA
+	bool "Spanish"
+
+config BR2_PACKAGE_TESSERACT_OCR_LANG_CHI_SIM
+	bool "Simplified Chinese"
+
+config BR2_PACKAGE_TESSERACT_OCR_LANG_CHI_TRA
+	bool "Traditional Chinese"
+endif
diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
new file mode 100644
index 0000000..9bb5b52
--- /dev/null
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -0,0 +1,8 @@
+# locally computed
+sha256  3fe83e06d0f73b39f6e92ed9fc7ccba3ef734877b76aa5ddaaa778fac095d996  tesseract-ocr-3.05.00.tar.gz
+sha256  c0515c9f1e0c79e1069fcc05c2b2f6a6841fb5e1082d695db160333c1154f06d  eng.traineddata
+sha256  86afb23ad146467f263e8ade56fd3951b1cc28f8c4eebc34f993d3c02d88a7ab  fra.traineddata
+sha256  cb7eb42a7e972cec7ef904fe81825d7b547c46df684c814fdb11a930b13bca3a  deu.traineddata
+sha256  f23985996bbcfe2b57864ccb082783c1c74c87429f04411a04a6ba4d3da2efda  spa.traineddata
+sha256  323ae74d4a2ff49e932dbb4d6282fe0e67ddfafda075ec85803ecd077207454c  chi_sim.traineddata
+sha256  774d566bd0b36e4b6c07415dfa5b6b57feb2575b1f5f231d7fe01a52dac5dd0e  chi_tra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
new file mode 100644
index 0000000..5ddacda
--- /dev/null
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# tesseract-ocr
+#
+################################################################################
+
+TESSERACT_OCR_VERSION = 3.05.00
+TESSERACT_OCR_DATA_VERSION = 3.04.00
+TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
+TESSERACT_OCR_LICENSE = Apache-2.0
+TESSERACT_OCR_LICENSE_FILES = COPYING
+
+# Source from github, no configure script provided
+TESSERACT_OCR_AUTORECONF = YES
+
+TESSERACT_OCR_DEPENDENCIES += leptonica jpeg libpng tiff
+
+TESSERACT_OCR_INSTALL_STAGING = YES
+
+TESSERACT_OCR_CONF_ENV += \
+	LIBLEPT_HEADERSDIR=$(STAGING_DIR)/usr/include/leptonica
+
+# Language data files download
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_ENG),y)
+TESSERACT_OCR_DATA_FILES += eng.traineddata
+endif
+
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_FRA),y)
+TESSERACT_OCR_DATA_FILES += fra.traineddata
+endif
+
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_DEU),y)
+TESSERACT_OCR_DATA_FILES += deu.traineddata
+endif
+
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_SPA),y)
+TESSERACT_OCR_DATA_FILES += spa.traineddata
+endif
+
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_CHI_SIM),y)
+TESSERACT_OCR_DATA_FILES += chi_sim.traineddata
+endif
+
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_CHI_TRA),y)
+TESSERACT_OCR_DATA_FILES += chi_tra.traineddata
+endif
+
+TESSERACT_OCR_EXTRA_DOWNLOADS = \
+	$(addprefix https://github.com/tesseract-ocr/tessdata/raw/$(TESSERACT_OCR_DATA_VERSION)/,\
+		$(TESSERACT_OCR_DATA_FILES))
+
+define TESSERACT_OCR_PRECONFIGURE
+	# Autoreconf step fails due to missing m4 directory
+	mkdir -p $(@D)/m4
+endef
+
+TESSERACT_OCR_PRE_CONFIGURE_HOOKS += TESSERACT_OCR_PRECONFIGURE
+
+# Language data files installation
+define TESSERACT_OCR_INSTALL_LANG_DATA
+	$(foreach langfile,$(TESSERACT_OCR_DATA_FILES), \
+		$(INSTALL) -D -m 0644 $(DL_DIR)/$(langfile) \
+			$(TARGET_DIR)/usr/share/tessdata/$(langfile)
+	)
+endef
+
+TESSERACT_OCR_POST_INSTALL_TARGET_HOOKS += TESSERACT_OCR_INSTALL_LANG_DATA
+
+$(eval $(autotools-package))
-- 
2.5.0
