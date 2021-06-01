From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Jun 2021 08:06:08 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/icu: Add support to
 generate a subset of ICU data
Message-ID: <20210601060608.5531-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent versions of ICU (64+) provide a tool for configuring ICU locale
data file with finer granularity [1].

Default generated size for libicudata.so is ~27M, which is quite large
for embedded systems and all of them may not even need all locale data.

This patch adds support for a custom data filter file in json format to
reduce the size of libicudata.so, e.g.

{
  "localeFilter": {
    "filterType": "language",
    "includelist": [
      "en",
      "de",
      "it"
    ]
  }
}

would only generate the locale data for english/german/italian.

This would reduce the size of libicudata.so to 12M.

[1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/buildtool.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: switch ICU_COPY_CUSTOM_DATA to ICU_PRE_CONFIGURE_HOOKS to fix
    parallel build issues

 package/icu/Config.in |  9 +++++++++
 package/icu/icu.hash  |  1 +
 package/icu/icu.mk    | 24 +++++++++++++++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index b0c9eac83d..564e509fa0 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -25,6 +25,15 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 	  provided by buildroot.
 	  Leave empty to not use this functionality.
 
+config BR2_PACKAGE_ICU_DATA_FILTER_FILE
+	string "Path to custom data configuration file"
+	help
+	  The ICU Data Build Tool enables you to write a configuration
+	  file that specifies what features and locales to include in a
+	  custom data bundle:
+	  https://github.com/unicode-org/icu/blob/main/docs/userguide/icu_data/buildtool.md
+	  Leave empty to not use this functionality.
+
 endif
 
 comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.9, host gcc >= 4.9"
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 5ed7cc4217..ab0a642259 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745  icu4c-69_1-src.tgz
+sha256  4fc2d8cfc3343673123586fca3967404abd4e346fba5515829204533b3bae4bf  icu4c-69_1-data.zip
 sha256  7915b19db903070778581ae05d8bf4ea241b34a05deb51ca4f5cbb15ea1cbba3  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 0a17c61462..3acc0d266e 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,8 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 69-1
+ICU_VERSION_MAJOR = 69
+ICU_VERSION = $(ICU_VERSION_MAJOR)-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
@@ -56,6 +57,27 @@ endef
 ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
 endif
 
+ICU_DATA_FILTER_FILE = $(call qstrip,$(BR2_PACKAGE_ICU_DATA_FILTER_FILE))
+
+ifneq ($(ICU_DATA_FILTER_FILE),)
+HOST_ICU_DATA_SOURCE = $(subst src.tgz,data.zip,$(ICU_SOURCE))
+HOST_ICU_EXTRA_DOWNLOADS += $(HOST_ICU_SITE)/$(HOST_ICU_DATA_SOURCE)
+
+define HOST_ICU_EXTRACT_DATA
+	rm -rf $(@D)/$(HOST_ICU_SUBDIR)/data
+	$(UNZIP) $(ICU_DL_DIR)/$(HOST_ICU_DATA_SOURCE) -d $(@D)/$(HOST_ICU_SUBDIR)
+endef
+HOST_ICU_POST_EXTRACT_HOOKS += HOST_ICU_EXTRACT_DATA
+
+HOST_ICU_CONF_ENV = ICU_DATA_FILTER_FILE=$(ICU_DATA_FILTER_FILE)
+HOST_ICU_CONF_OPTS += --with-data-packaging=archive
+
+define ICU_COPY_CUSTOM_DATA
+	$(INSTALL) -D -m 644 $(HOST_ICU_DIR)/$(HOST_ICU_SUBDIR)/data/out/icudt$(ICU_VERSION_MAJOR)l.dat $(@D)/$(ICU_SUBDIR)/data/in/
+endef
+ICU_PRE_CONFIGURE_HOOKS += ICU_COPY_CUSTOM_DATA
+endif
+
 define ICU_REMOVE_DEV_FILES
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,derb genbrk gencfu gencnval gendict genrb icuinfo makeconv uconv)
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,genccode gencmn gennorm2 gensprep icupkg)
-- 
2.29.2
