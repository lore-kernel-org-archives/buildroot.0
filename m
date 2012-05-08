From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 00:26:21 +0200
Subject: [Buildroot] [git commit] Add support to generate locale data
Message-ID: <20120508223206.2E11796C78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aebf199ff034460c817782c1b14ec4e8c75a8959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to use locale support on a Linux system, you need locale data
to be present:

 * on a (e)glibc based system, this data is typically in the
   /usr/lib/locale/locale-archive file, which can be created and
   extended using the localedef program

 * on an uClibc based system, the set of supported locales is defined
   at build time by an uClibc configuration option.

This patch implements generating locale data for the following cases:

 * Internal toolchain

 * External toolchain based on (e)glibc. uClibc external toolchains
   are not supported, because with uClibc, the set of supported
   locales is defined at build time. CodeSourcery and Linaro
   toolchains have been tested, Crosstool-NG toolchains are believed
   to work properly as well.

 * Toolchains built using the Crosstool-NG backend, but only (e)glibc
   toolchains.

This feature was runtime tested with internal uClibc toolchain,
CodeSourcery ARM toolchain and Linaro ARM toolchain, thanks to a
simple C program that shows the data and a gettext translated message.

Note that this option differs from the "purge locales" option, which
is responsible for removing translation files and other locale stuff
installed by packages. At some point in the future, we may want to
clarify the respective roles of those options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                      |   33 +++++++++++++++++++++++++++++++++
 toolchain/toolchain-common.in |   18 ++++++++++++++++++
 toolchain/uClibc/uclibc.mk    |   11 ++++++++++-
 3 files changed, 61 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index a7625ba..1d7973e 100644
--- a/Makefile
+++ b/Makefile
@@ -239,6 +239,9 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 # packages compiled for the host go here
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
+# locales to generate
+GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
+
 # stamp (dependency) files go here
 STAMP_DIR:=$(BASE_DIR)/stamps
 
@@ -296,6 +299,12 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
 
+ifneq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_CTNG_eglibc)$(BR2_TOOLCHAIN_CTNG_glibc),)
+ifneq ($(GENERATE_LOCALE),)
+TARGETS+=target-generatelocales
+endif
+endif
+
 include fs/common.mk
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
@@ -446,6 +455,30 @@ target-purgelocales:
 	done
 endif
 
+ifneq ($(GENERATE_LOCALE),)
+# Generate locale data. Basically, we call the localedef program
+# (built by the host-localedef package) for each locale. The input
+# data comes preferably from the toolchain, or if the toolchain does
+# not have them (Linaro toolchains), we use the ones available on the
+# host machine.
+target-generatelocales: host-localedef
+	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
+	$(Q)for locale in $(GENERATE_LOCALE) ; do \
+		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
+		charmap=`echo $${locale} | cut -f2 -d'.'` ; \
+		if test -z "$${charmap}" ; then \
+			charmap="UTF-8" ; \
+		fi ; \
+		echo "Generating locale $${inputfile}.$${charmap}" ; \
+		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
+		$(HOST_DIR)/usr/bin/localedef \
+			--prefix=$(TARGET_DIR) \
+			--`echo $(BR2_ENDIAN) | tr [A-Z] [a-z]`-endian \
+			-i $${inputfile} -f $${charmap} \
+			$${locale} ; \
+	done
+endif
+
 source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index fb87a88..cc7b4de 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -58,6 +58,24 @@ config BR2_ENABLE_LOCALE_WHITELIST
 	  will be available on the target - That purely depends on the
 	  support for that locale in the selected packages.
 
+config BR2_GENERATE_LOCALE
+	string "Generate locale data"
+	default ""
+	# Pre-built uClibc external toolchains and uClibc toolchains
+	# built by the Crosstool-NG backend cannot be supported,
+	# because the list of locales to support must be defined at
+	# build time.
+	depends on \
+		BR2_TOOLCHAIN_BUILDROOT      || \
+		BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		BR2_TOOLCHAIN_CTNG_eglibc    || \
+		BR2_TOOLCHAIN_CTNG_glibc
+	help
+	  Generate support for a list of locales. Locales can be
+	  specified with or without encoding, when no encoding is
+	  specified, UTF-8 is assumed. Examples of locales: en_US,
+	  fr_FR.UTF-8.
+
 # glibc and eglibc directly include gettext, so a separatly compiled
 # gettext isn't needed and shouldn't be built to avoid conflicts. Some
 # packages always need gettext, other packages only need gettext when
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 32cbe46..0728135 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -66,6 +66,15 @@ endif
 UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_ARM_TYPE))
 UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_SPARC_TYPE))
 
+ifeq ($(GENERATE_LOCALE),)
+# We need at least one locale
+UCLIBC_LOCALES = en_US
+else
+# Strip out the encoding part of locale names, if any
+UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
+		   $(firstword $(subst .,$(space),$(locale))))
+endif
+
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(call DOWNLOAD,$(UCLIBC_SITE)/$(UCLIBC_SOURCE))
 
@@ -309,7 +318,7 @@ else
 	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\n# UCLIBC_BUILD_ALL_LOCALE is not set\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="en_US"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\n# UCLIBC_BUILD_ALL_LOCALE is not set\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="$(UCLIBC_LOCALES)"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
