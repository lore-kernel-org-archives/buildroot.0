From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:16 +0200
Subject: [Buildroot] [PATCH 20/25] Remove BR2_ENABLE_LOCALE_PREGENERATED
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6c969c00b553924184fe15d526d60daf23984924.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option is marked broken since october 2009, and even the uClibc
configuration help text says that using pregenerated locales is highly
discouraged.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in.2      |   10 ----------
 toolchain/uClibc/uclibc.mk |   21 +--------------------
 2 files changed, 1 insertions(+), 30 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 17830c0..f04f18a 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -35,16 +35,6 @@ config BR2_ENABLE_LOCALE
 	  If you have an external binary toolchain that has been 
 	  built with locale/i18n support then enable this option.
 
-config BR2_ENABLE_LOCALE_PREGENERATED
-	bool "Use pregenerated locale data?"
-	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_BUILDROOT && BROKEN # tarball missing
-	help
-	  Instead of generating the locale data locally you can optionally
-	  download a pregenerated set of locales.
-
-	  Say N here unless your buildhost lacks locale support and you
-	  desparately want to use internationalization on your target.
-
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index ddeb395..a9ee609 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -68,20 +68,8 @@ UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_SPARC_TYPE))
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(call DOWNLOAD,$(UCLIBC_SITE),$(UCLIBC_SOURCE))
 
-ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED),)
-UCLIBC_SITE_LOCALE:=http://www.uclibc.org/downloads
-UCLIBC_SOURCE_LOCALE:=uClibc-locale-030818.tgz
-
-$(DL_DIR)/$(UCLIBC_SOURCE_LOCALE):
-	$(call DOWNLOAD,$(UCLIBC_SITE_LOCALE),$(UCLIBC_SOURCE_LOCALE))
-
-UCLIBC_LOCALE_DATA:=$(DL_DIR)/$(UCLIBC_SOURCE_LOCALE)
-else
-UCLIBC_LOCALE_DATA=
-endif
-
 uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
-$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
+$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
 	mkdir -p $(TOOLCHAIN_DIR)
 	rm -rf $(UCLIBC_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
@@ -97,9 +85,6 @@ else
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
 endif
-ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED),)
-	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
-endif
 	touch $@
 
 
@@ -329,11 +314,7 @@ else
 	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
-ifeq ($(BR2_ENABLE_LOCALE_PREGENERATED),y)
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
-else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
-endif
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-- 
1.6.3.3
