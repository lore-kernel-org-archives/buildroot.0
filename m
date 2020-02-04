From: Michael Walle <michael@walle.cc>
Date: Tue, 04 Feb 2020 12:48:12 +0100
Subject: [Buildroot] [PATCH v2] autotools: do not overwrite first
 include path
In-Reply-To: <20200204095307.25500-1-heiko.thiery@gmail.com>
References: <20200204095307.25500-1-heiko.thiery@gmail.com>
Message-ID: <3715B266-BD89-4C08-992A-DB323D4CAF80@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 4. Februar 2020 10:53:07 MEZ schrieb Heiko Thiery <heiko.thiery@gmail.com>:
>From: Michael Walle <michael@walle.cc>
>
>The first include path is special in aclocal. For example it is the
>path
>for the --install option. Also, the first include is treated in a
>special way if it doesn't exists. This might be the case if there is
>the
>following construct:
>
>  configure.ac: AC_CONFIG_MACRO_DIR([m4])
>  Makefile.am: ACLOCAL_AMFLAGS="-I m4"
>
>If the package doesn't have local macros, the m4/ directory might not
>exist. aclocal will then just issue a warning instead of aborting the
>execution with a fatal error. See discussion here:
>  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=565663
>
>Don't use the "-I" option in aclocal. Instead use ACLOCAL_PATH to pass
>the system-wide include dirs.
>
>As a side effect this should fix the use of $(ACLOCAL) alone. Up until
>now, $(ACLOCAL) didn't include the ACLOCAL_HOST_DIR system include
>path.
>
>autoreconf will pass the "-I" options to every tool it runs what is
>wrong. So move the argument to each individual tool except aclocal.
>aclocal will now use the values from the ACLOCAL_PATH system-wiede
>variable and buildroot can pass the package's m4 directory as the first
>"-I".
>
>[Heiko:
>
>This patch superseded by patches:
> - https://patchwork.ozlabs.org/patch/1224872/
> - https://patchwork.ozlabs.org/patch/1208274/
>

shouldn't this be in a cover letter?  or the patch comments, ie below the "---" line? 

>With this change the hoooks of the following packages can be
>       remove because they are no longer needed:
>
>    - package/atest
>    - package/bayer2rgb-neon
>    - package/bluez-alsa
>    - package/davici
>    - package/dropwatch
>    - package/gstreamer
>    - package/gstreamer1/gst1-plugins-bayer2rgb-neon
>    - package/gutenprint
>    - package/irqbalance
>    - package/jamvm
>    - package/janus-gateway
>    - package/lcdapi
>    - package/libdmtx
>    - package/libiscsi
>    - package/libpam-nfc
>    - package/libsoundtouch
>    - package/libva-utils
>    - package/ltrace
>    - package/mfoc
>    - package/minicom
>    - package/musl-fts
>    - package/open-lldp
>    - package/openpgm
>    - package/pdbg
>    - package/sdbusplus
>    - package/speexdsp
>    - package/sysprof
>    - package/tesseract-ocr
>]
>
>Signed-off-by: Michael Walle <michael@walle.cc>
>[Heiko: modification in commit log and add the removing of the hooks]
>Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>---
> package/atest/atest.mk                                    | 6 ------
> package/autoconf/autoconf.mk                              | 6 +++---
> package/automake/automake.mk                              | 4 +++-
> package/bayer2rgb-neon/bayer2rgb-neon.mk                  | 6 ------
> package/bluez-alsa/bluez-alsa.mk                          | 6 ------
> package/davici/davici.mk                                  | 5 -----
> package/dropwatch/dropwatch.mk                            | 6 ------
> package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk      | 7 -------
> .../gst1-plugins-bayer2rgb-neon.mk                        | 5 -----
> package/gutenprint/gutenprint.mk                          | 7 -------
> package/irqbalance/irqbalance.mk                          | 7 -------
> package/jamvm/jamvm.mk                                    | 7 -------
> package/janus-gateway/janus-gateway.mk                    | 5 -----
> package/lcdapi/lcdapi.mk                                  | 6 ------
> package/libdmtx/libdmtx.mk                                | 7 -------
> package/libiscsi/libiscsi.mk                              | 6 ------
> package/libpam-nfc/libpam-nfc.mk                          | 6 ------
> package/libsoundtouch/libsoundtouch.mk                    | 5 -----
> package/libva-utils/libva-utils.mk                        | 6 ------
> package/ltrace/ltrace.mk                                  | 5 -----
> package/mfoc/mfoc.mk                                      | 6 ------
> package/minicom/minicom.mk                                | 6 ------
> package/musl-fts/musl-fts.mk                              | 5 -----
> package/open-lldp/open-lldp.mk                            | 8 --------
> package/openpgm/openpgm.mk                                | 8 --------
> package/pdbg/pdbg.mk                                      | 5 -----
> package/sdbusplus/sdbusplus.mk                            | 6 ------
> package/speexdsp/speexdsp.mk                              | 6 ------
> package/sysprof/sysprof.mk                                | 6 ------
> package/tesseract-ocr/tesseract-ocr.mk                    | 7 -------
> 30 files changed, 6 insertions(+), 175 deletions(-)
>
>diff --git a/package/atest/atest.mk b/package/atest/atest.mk
>index 2effda5711..68def46cf9 100644
>--- a/package/atest/atest.mk
>+++ b/package/atest/atest.mk
>@@ -12,10 +12,4 @@ ATEST_DEPENDENCIES = host-pkgconf libev alsa-lib
> # Fetched from Github, with no configure script
> ATEST_AUTORECONF = YES
> 
>-# Autoreconf requires an existing m4 directory
>-define ATEST_PATCH_M4
>-	mkdir -p $(@D)/m4
>-endef
>-ATEST_POST_PATCH_HOOKS += ATEST_PATCH_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/autoconf/autoconf.mk
>b/package/autoconf/autoconf.mk
>index e5f474c72d..336ac59b42 100644
>--- a/package/autoconf/autoconf.mk
>+++ b/package/autoconf/autoconf.mk
>@@ -21,6 +21,6 @@ HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
> $(eval $(host-autotools-package))
> 
> # variables used by other packages
>-AUTOCONF = $(HOST_DIR)/bin/autoconf
>-AUTOHEADER = $(HOST_DIR)/bin/autoheader
>-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)"
>AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)"
>AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf
>-f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
>+AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I
>"$(ACLOCAL_HOST_DIR)"
>+AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I
>"$(ACLOCAL_HOST_DIR)"
>+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)"
>AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)"
>AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf
>-f -i
>diff --git a/package/automake/automake.mk
>b/package/automake/automake.mk
>index 270337712e..89dcaa1293 100644
>--- a/package/automake/automake.mk
>+++ b/package/automake/automake.mk
>@@ -32,4 +32,6 @@ $(eval $(host-autotools-package))
> # variables used by other packages
> AUTOMAKE = $(HOST_DIR)/bin/automake
> ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
>-ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
>+ACLOCAL = $(HOST_DIR)/bin/aclocal
>+ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
>+export ACLOCAL_PATH
>diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk
>b/package/bayer2rgb-neon/bayer2rgb-neon.mk
>index 02651dcfee..34510e7616 100644
>--- a/package/bayer2rgb-neon/bayer2rgb-neon.mk
>+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
>@@ -15,10 +15,4 @@ BAYER2RGB_NEON_AUTORECONF = YES
> 
> BAYER2RGB_NEON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mfpu=neon"
> 
>-define BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
>-	mkdir -p $(@D)/m4
>-endef
>-
>-BAYER2RGB_NEON_PRE_CONFIGURE_HOOKS +=
>BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
>-
> $(eval $(autotools-package))
>diff --git a/package/bluez-alsa/bluez-alsa.mk
>b/package/bluez-alsa/bluez-alsa.mk
>index c5a51ce5d4..6726298f5b 100644
>--- a/package/bluez-alsa/bluez-alsa.mk
>+++ b/package/bluez-alsa/bluez-alsa.mk
>@@ -13,12 +13,6 @@ BLUEZ_ALSA_DEPENDENCIES = alsa-lib bluez5_utils
>libglib2 sbc host-pkgconf
> # git repo, no configure
> BLUEZ_ALSA_AUTORECONF = YES
> 
>-# Autoreconf requires an existing m4 directory
>-define BLUEZ_ALSA_MKDIR_M4
>-	mkdir -p $(@D)/m4
>-endef
>-BLUEZ_ALSA_POST_PATCH_HOOKS += BLUEZ_ALSA_MKDIR_M4
>-
> BLUEZ_ALSA_CONF_OPTS = \
> 	--enable-aplay \
> 	--disable-debug-time \
>diff --git a/package/davici/davici.mk b/package/davici/davici.mk
>index a90eeeefef..5c08bbe0da 100644
>--- a/package/davici/davici.mk
>+++ b/package/davici/davici.mk
>@@ -12,9 +12,4 @@ DAVICI_DEPENDENCIES = strongswan
> DAVICI_INSTALL_STAGING = YES
> DAVICI_AUTORECONF = YES
> 
>-define DAVICI_CREATE_M4
>-	mkdir -p $(@D)/m4
>-endef
>-DAVICI_POST_PATCH_HOOKS += DAVICI_CREATE_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/dropwatch/dropwatch.mk
>b/package/dropwatch/dropwatch.mk
>index 769b4d4d38..c5873ccf76 100644
>--- a/package/dropwatch/dropwatch.mk
>+++ b/package/dropwatch/dropwatch.mk
>@@ -14,12 +14,6 @@ DROPWATCH_LICENSE_FILES = COPYING
> # From git
> DROPWATCH_AUTORECONF = YES
> 
>-# Autoreconf step fails due to missing m4 directory
>-define DROPWATCH_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4
>-endef
>-DROPWATCH_PRE_CONFIGURE_HOOKS += DROPWATCH_CREATE_M4_DIR
>-
> DROPWATCH_CONF_OPTS = --without-bfd
> DROPWATCH_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
> 
>diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
>b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
>index 547d253e88..5933efa533 100644
>--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
>+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
>@@ -37,11 +37,4 @@ else
> GST_FSL_PLUGINS_CONF_OPTS += --disable-x11
> endif
> 
>-# Autoreconf requires an m4 directory to exist
>-define GST_FSL_PLUGINS_PATCH_M4
>-	mkdir -p $(@D)/m4
>-endef
>-
>-GST_FSL_PLUGINS_POST_PATCH_HOOKS += GST_FSL_PLUGINS_PATCH_M4
>-
> $(eval $(autotools-package))
>diff --git
>a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
>b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
>index d6c3c36272..734800a74b 100644
>---
>a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
>+++
>b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
>@@ -20,9 +20,4 @@ GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
> 
> GST1_PLUGINS_BAYER2RGB_NEON_AUTORECONF = YES
> 
>-define GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
>-	mkdir -p $(@D)/m4
>-endef
>-GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_HOOKS +=
>GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
>-
> $(eval $(autotools-package))
>diff --git a/package/gutenprint/gutenprint.mk
>b/package/gutenprint/gutenprint.mk
>index 3465ec8b85..e99d62ca79 100644
>--- a/package/gutenprint/gutenprint.mk
>+++ b/package/gutenprint/gutenprint.mk
>@@ -66,13 +66,6 @@ HOST_GUTENPRINT_CONF_OPTS = \
> 	--disable-testpattern \
> 	--without-cups
> 
>-# Needed by autoreconf
>-define GUTENPRINT_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4local
>-endef
>-GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
>-HOST_GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
>-
> define HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
> 	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/include
> endef
>diff --git a/package/irqbalance/irqbalance.mk
>b/package/irqbalance/irqbalance.mk
>index 16967aa8c0..36e9e42493 100644
>--- a/package/irqbalance/irqbalance.mk
>+++ b/package/irqbalance/irqbalance.mk
>@@ -40,13 +40,6 @@ else
> IRQBALANCE_CONF_OPTS += --without-systemd
> endif
> 
>-# This would be done by the package's autogen.sh script
>-define IRQBALANCE_PRECONFIGURE
>-	mkdir -p $(@D)/m4
>-endef
>-
>-IRQBALANCE_PRE_CONFIGURE_HOOKS += IRQBALANCE_PRECONFIGURE
>-
> define IRQBALANCE_INSTALL_INIT_SYSV
> 	$(INSTALL) -D -m 755 package/irqbalance/S13irqbalance \
> 		$(TARGET_DIR)/etc/init.d/S13irqbalance
>diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
>index 3fcf460bcd..26615ef7a3 100644
>--- a/package/jamvm/jamvm.mk
>+++ b/package/jamvm/jamvm.mk
>@@ -24,11 +24,4 @@ ifeq ($(BR2_arm),y)
> JAMVM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -marm"
> endif
> 
>-# Needed for autoreconf
>-define JAMVM_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4
>-endef
>-
>-JAMVM_POST_PATCH_HOOKS += JAMVM_CREATE_M4_DIR
>-
> $(eval $(autotools-package))
>diff --git a/package/janus-gateway/janus-gateway.mk
>b/package/janus-gateway/janus-gateway.mk
>index b0c01f3173..0d0a22491f 100644
>--- a/package/janus-gateway/janus-gateway.mk
>+++ b/package/janus-gateway/janus-gateway.mk
>@@ -17,11 +17,6 @@ JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson
>libnice \
> # configure.ac.
> JANUS_GATEWAY_AUTORECONF = YES
> 
>-define JANUS_GATEWAY_M4
>-	mkdir -p $(@D)/m4
>-endef
>-JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
>-
> JANUS_GATEWAY_CONF_OPTS = \
> 	--disable-data-channels \
> 	--disable-sample-event-handler
>diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
>index 11eee880a6..f6b14cd2c9 100644
>--- a/package/lcdapi/lcdapi.mk
>+++ b/package/lcdapi/lcdapi.mk
>@@ -11,10 +11,4 @@ LCDAPI_LICENSE_FILES = COPYING
> LCDAPI_AUTORECONF = YES
> LCDAPI_INSTALL_STAGING = YES
> 
>-define LCDAPI_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4
>-endef
>-
>-LCDAPI_POST_PATCH_HOOKS += LCDAPI_CREATE_M4_DIR
>-
> $(eval $(autotools-package))
>diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
>index 39fb8d1a4d..04e089f1f7 100644
>--- a/package/libdmtx/libdmtx.mk
>+++ b/package/libdmtx/libdmtx.mk
>@@ -12,11 +12,4 @@ LIBDMTX_INSTALL_STAGING = YES
> # github tarball does not include configure
> LIBDMTX_AUTORECONF = YES
> 
>-# Create the m4 directory (missing from the archive).
>-# This is required for autoconf.
>-define LIBDMTX_CREATE_M4
>-	mkdir -p $(@D)/m4
>-endef
>-LIBDMTX_PRE_CONFIGURE_HOOKS += LIBDMTX_CREATE_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/libiscsi/libiscsi.mk
>b/package/libiscsi/libiscsi.mk
>index f0b003b347..c8b6ddd123 100644
>--- a/package/libiscsi/libiscsi.mk
>+++ b/package/libiscsi/libiscsi.mk
>@@ -14,10 +14,4 @@ LIBISCSI_AUTORECONF = YES
>LIBISCSI_CONF_OPTS = --disable-examples --disable-werror
>--disable-manpages \
> 	--disable-test-tool --disable-tests
> 
>-# We need to create the m4 directory to make autoreconf work properly.
>-define LIBISCSI_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4
>-endef
>-LIBISCSI_POST_PATCH_HOOKS += LIBISCSI_CREATE_M4_DIR
>-
> $(eval $(autotools-package))
>diff --git a/package/libpam-nfc/libpam-nfc.mk
>b/package/libpam-nfc/libpam-nfc.mk
>index fc283c8777..d4f6d446cf 100644
>--- a/package/libpam-nfc/libpam-nfc.mk
>+++ b/package/libpam-nfc/libpam-nfc.mk
>@@ -19,10 +19,4 @@ LIBPAM_NFC_CONF_OPTS = \
> # libpam breaks with parallel build, but is very fast to build.
> LIBPAM_NFC_MAKE = $(MAKE1)
> 
>-# Autoreconf requires an existing m4 directory
>-define LIBPAM_NFC_MKDIR_M4
>-	mkdir -p $(@D)/m4
>-endef
>-LIBPAM_NFC_PRE_CONFIGURE_HOOKS += LIBPAM_NFC_MKDIR_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/libsoundtouch/libsoundtouch.mk
>b/package/libsoundtouch/libsoundtouch.mk
>index c4ac930be1..fcc2332fad 100644
>--- a/package/libsoundtouch/libsoundtouch.mk
>+++ b/package/libsoundtouch/libsoundtouch.mk
>@@ -12,9 +12,4 @@ LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
> LIBSOUNDTOUCH_AUTORECONF = YES
> LIBSOUNDTOUCH_INSTALL_STAGING = YES
> 
>-define LIBSOUNDTOUCH_CREATE_CONFIG_M4
>-	mkdir -p $(@D)/config/m4
>-endef
>-LIBSOUNDTOUCH_POST_PATCH_HOOKS += LIBSOUNDTOUCH_CREATE_CONFIG_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/libva-utils/libva-utils.mk
>b/package/libva-utils/libva-utils.mk
>index 40b05e4590..ad9acb229b 100644
>--- a/package/libva-utils/libva-utils.mk
>+++ b/package/libva-utils/libva-utils.mk
>@@ -11,10 +11,4 @@ LIBVA_UTILS_LICENSE = MIT
> LIBVA_UTILS_LICENSE_FILES = COPYING
> LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
> 
>-define LIBVA_UTILS_CREATE_M4_DIR
>-	@mkdir -p $(@D)/m4
>-endef
>-
>-LIBVA_UTILS_POST_EXTRACT_HOOKS += LIBVA_UTILS_CREATE_M4_DIR
>-
> $(eval $(autotools-package))
>diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
>index 6dfbb58c35..b71215e43b 100644
>--- a/package/ltrace/ltrace.mk
>+++ b/package/ltrace/ltrace.mk
>@@ -12,11 +12,6 @@ LTRACE_LICENSE = GPL-2.0
> LTRACE_LICENSE_FILES = COPYING
> LTRACE_AUTORECONF = YES
> 
>-define LTRACE_CREATE_CONFIG_M4
>-	mkdir -p $(@D)/config/m4
>-endef
>-LTRACE_POST_PATCH_HOOKS += LTRACE_CREATE_CONFIG_M4
>-
> # ltrace can use libunwind only if libc has backtrace() support
># We don't normally do so for uClibc and we can't know if it's external
># Also ltrace with libunwind support is broken for MIPS so we disable
>it
>diff --git a/package/mfoc/mfoc.mk b/package/mfoc/mfoc.mk
>index 15105a74ab..c4a785212f 100644
>--- a/package/mfoc/mfoc.mk
>+++ b/package/mfoc/mfoc.mk
>@@ -13,10 +13,4 @@ MFOC_DEPENDENCIES = libnfc
> MFOC_AUTORECONF = YES
> MFOC_INSTALL_STAGING = YES
> 
>-# Autoreconf requires an existing m4 directory
>-define MFOC_MKDIR_M4
>-	mkdir -p $(@D)/m4
>-endef
>-MFOC_PRE_CONFIGURE_HOOKS += MFOC_MKDIR_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
>index a86d587b2f..d299dac43d 100644
>--- a/package/minicom/minicom.mk
>+++ b/package/minicom/minicom.mk
>@@ -16,12 +16,6 @@ MINICOM_DEPENDENCIES = ncurses $(if
>$(BR2_ENABLE_LOCALE),,libiconv) \
> # add host-gettext for AM_ICONV macro
> MINICOM_DEPENDENCIES += host-gettext
> 
>-# Autoreconf requires an existing m4 directory
>-define MINICOM_MKDIR_M4
>-	mkdir -p $(@D)/m4
>-endef
>-MINICOM_POST_PATCH_HOOKS += MINICOM_MKDIR_M4
>-
> MINICOM_CONF_OPTS = \
> 	--enable-dfl-port=/dev/ttyS1 \
> 	--enable-lock-dir=/var/lock
>diff --git a/package/musl-fts/musl-fts.mk
>b/package/musl-fts/musl-fts.mk
>index d1999acb17..dd7f1f9ea0 100644
>--- a/package/musl-fts/musl-fts.mk
>+++ b/package/musl-fts/musl-fts.mk
>@@ -13,9 +13,4 @@ MUSL_FTS_LICENSE_FILES = COPYING
> MUSL_FTS_DEPENDENCIES = host-pkgconf
> MUSL_FTS_INSTALL_STAGING = YES
> 
>-define MUSL_FTS_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4
>-endef
>-MUSL_FTS_POST_PATCH_HOOKS += MUSL_FTS_CREATE_M4_DIR
>-
> $(eval $(autotools-package))
>diff --git a/package/open-lldp/open-lldp.mk
>b/package/open-lldp/open-lldp.mk
>index b650aea3c1..c9fd958a4f 100644
>--- a/package/open-lldp/open-lldp.mk
>+++ b/package/open-lldp/open-lldp.mk
>@@ -13,12 +13,4 @@ OPEN_LLDP_LICENSE_FILES = COPYING
> # Fetching from git, need to generate configure/Makefile.in
> OPEN_LLDP_AUTORECONF = YES
> 
>-# Create the m4 directory (missing from the archive).
>-# This is required for autoconf.
>-define OPEN_LLDP_CREATE_M4
>-	mkdir -p $(@D)/m4
>-endef
>-
>-OPEN_LLDP_PRE_CONFIGURE_HOOKS += OPEN_LLDP_CREATE_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
>index 8163982d37..ec293b42df 100644
>--- a/package/openpgm/openpgm.mk
>+++ b/package/openpgm/openpgm.mk
>@@ -12,14 +12,6 @@ OPENPGM_INSTALL_STAGING = YES
> OPENPGM_SUBDIR = openpgm/pgm
> OPENPGM_AUTORECONF = YES
> 
>-# We need to create the m4 directory to make sure that autoreconf will
>-# start calling libtoolize. Otherwise it will start with aclocal and
>it
>-# will fail because the m4 directory doesn't exist.
>-define OPENPGM_CREATE_M4_DIR
>-	mkdir -p $(@D)/$(OPENPGM_SUBDIR)/m4
>-endef
>-OPENPGM_POST_PATCH_HOOKS += OPENPGM_CREATE_M4_DIR
>-
> OPENPGM_CONF_ENV = \
> 	ac_cv_file__proc_cpuinfo=yes \
> 	ac_cv_file__dev_rtc=no \
>diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
>index 1832e235ec..9977a126fb 100644
>--- a/package/pdbg/pdbg.mk
>+++ b/package/pdbg/pdbg.mk
>@@ -13,9 +13,4 @@ PDBG_DEPENDENCIES = host-dtc
> 
> PDBG_MAKE_OPTS = "GIT_SHA1=\"v$(PDBG_VERSION)\""
> 
>-define PDBG_PATCH_M4
>-	mkdir -p $(@D)/m4
>-endef
>-PDBG_POST_PATCH_HOOKS += PDBG_PATCH_M4
>-
> $(eval $(autotools-package))
>diff --git a/package/sdbusplus/sdbusplus.mk
>b/package/sdbusplus/sdbusplus.mk
>index e7a3dc2665..9d3d1e8cf4 100644
>--- a/package/sdbusplus/sdbusplus.mk
>+++ b/package/sdbusplus/sdbusplus.mk
>@@ -22,11 +22,5 @@ SDBUSPLUS_INSTALL_STAGING = YES
> SDBUSPLUS_LICENSE = Apache-2.0
> SDBUSPLUS_LICENSE_FILES = LICENSE
> 
>-define SDBUSPLUS_CREATE_M4
>-	mkdir -p $(@D)/m4
>-endef
>-SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
>-HOST_SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
>-
> $(eval $(autotools-package))
> $(eval $(host-autotools-package))
>diff --git a/package/speexdsp/speexdsp.mk
>b/package/speexdsp/speexdsp.mk
>index f5a46cd9de..901f22b9e6 100644
>--- a/package/speexdsp/speexdsp.mk
>+++ b/package/speexdsp/speexdsp.mk
>@@ -13,10 +13,4 @@ SPEEXDSP_INSTALL_STAGING = YES
> SPEEXDSP_DEPENDENCIES = host-pkgconf
> SPEEXDSP_AUTORECONF = YES
> 
>-# Autoreconf step fails due to missing m4 directory
>-define SPEEXDSP_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4
>-endef
>-SPEEXDSP_PRE_CONFIGURE_HOOKS += SPEEXDSP_CREATE_M4_DIR
>-
> $(eval $(autotools-package))
>diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
>index 033194a533..9823416e3f 100644
>--- a/package/sysprof/sysprof.mk
>+++ b/package/sysprof/sysprof.mk
>@@ -14,10 +14,4 @@ ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
> SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
> endif
> 
>-define SYSPROF_CREATE_M4_DIR
>-	mkdir -p $(@D)/m4
>-endef
>-
>-SYSPROF_POST_PATCH_HOOKS += SYSPROF_CREATE_M4_DIR
>-
> $(eval $(autotools-package))
>diff --git a/package/tesseract-ocr/tesseract-ocr.mk
>b/package/tesseract-ocr/tesseract-ocr.mk
>index 4d2df5cb39..fc083c27f6 100644
>--- a/package/tesseract-ocr/tesseract-ocr.mk
>+++ b/package/tesseract-ocr/tesseract-ocr.mk
>@@ -53,13 +53,6 @@ TESSERACT_OCR_EXTRA_DOWNLOADS = \
>	$(addprefix
>https://github.com/tesseract-ocr/tessdata/raw/$(TESSERACT_OCR_DATA_VERSION)/,\
> 		$(TESSERACT_OCR_DATA_FILES))
> 
>-define TESSERACT_OCR_PRECONFIGURE
>-	# Autoreconf step fails due to missing m4 directory
>-	mkdir -p $(@D)/m4
>-endef
>-
>-TESSERACT_OCR_PRE_CONFIGURE_HOOKS += TESSERACT_OCR_PRECONFIGURE
>-
> # Language data files installation
> define TESSERACT_OCR_INSTALL_LANG_DATA
> 	$(foreach langfile,$(TESSERACT_OCR_DATA_FILES), \
