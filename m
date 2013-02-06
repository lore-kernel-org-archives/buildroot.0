From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 00:10:14 +0100
Subject: [Buildroot] [PATCH 1/5] package: rename <pkg>_CONFIG_FIXUP to
	<pkg>_CONFIG_SCRIPTS
In-Reply-To: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360192218-30930-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit renames the newly introduced <pkg>_CONFIG_FIXUP variable
to <pkg>_CONFIG_SCRIPTS, for two reasons:

 * <pkg>_CONFIG_SCRIPTS will not only "fixup" the scripts in
   $(STAGING_DIR)/usr/bin, but also remove them from
   $(TARGET_DIR)/usr/bin. So it is not only about doing a "fixup".

 * On the principle, it is strange that the variable carries an
   indication of the action that will take place on those files. It
   should rather be named to say "Here are the <foo>-config scripts",
   and let the package infrastructure decide if it should fix them up,
   remove them, etc.

This commit also updates the documentation accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |   17 +++++++++--------
 package/libpcap/libpcap.mk              |    2 +-
 package/pkg-generic.mk                  |    4 ++--
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 41a94d7..13d200d 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -25,7 +25,7 @@ system is based on hand-written Makefiles or shell scripts.
 09: LIBFOO_LICENSE = GPLv3+
 10: LIBFOO_LICENSE_FILES = COPYING
 11: LIBFOO_INSTALL_STAGING = YES
-12: LIBFOO_CONFIG_FIXUP = libfoo-config
+12: LIBFOO_CONFIG_SCRIPTS = libfoo-config
 13: LIBFOO_DEPENDENCIES = host-libaaa libbbb
 14:
 15: define LIBFOO_BUILD_CMDS
@@ -86,7 +86,7 @@ or:		'-L/usr/lib' instead of '-L$(STAGING_DIR)/usr/lib'
 
 So some sed magic is done to these scripts to make them give correct
 flags.
-The argument to be given to +LIBFOO_CONFIG_FIXUP+ is the file name(s)
+The argument to be given to +LIBFOO_CONFIG_SCRIPTS+ is the file name(s)
 of the shell script(s) needing fixing. All these names are relative to
 '$(STAGING_DIR)/usr/bin' and if needed multiple names can be given.
 
@@ -96,7 +96,7 @@ Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
 
 So it's fixup would be:
 
-DIVINE_CONFIG = divine-config
+DIVINE_CONFIG_SCRIPTS = divine-config
 
 Example 2:
 
@@ -105,8 +105,9 @@ Package imagemagick installs the following scripts:
 
 So it's fixup would be:
 
-IMAGEMAGICK_CONFIG_FIXUP = Magick-config Magick++-config \
-			   MagickCore-config MagickWand-config Wand-config
+IMAGEMAGICK_CONFIG_SCRIPTS = \
+   Magick-config Magick++-config \
+   MagickCore-config MagickWand-config Wand-config
 
 On line 13, we specify the list of dependencies this package relies
 on. These dependencies are listed in terms of lower-case package names,
@@ -284,10 +285,10 @@ information is (assuming the package name is +libfoo+) :
   variables are executed to install the package into the target
   directory.
 
-* +LIBFOO_CONFIG_FIXUP+ lists the names of the files in
+* +LIBFOO_CONFIG_SCRIPTS+ lists the names of the files in
   '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
-  cross-compiling friendly. Multiple file names separated by space can be
-  given and all are relative to '$(STAGING_DIR)/usr/bin'.
+  cross-compiling friendly. Multiple file names separated by space can
+  be given and all are relative to '$(STAGING_DIR)/usr/bin'.
 
 * +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
   when using the static device table. The syntax to use is the
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 5be61bf..06aec0f 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -24,7 +24,7 @@ LIBPCAP_DEPENDENCIES = zlib
 LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
-LIBPCAP_CONFIG_FIXUP = pcap-config
+LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 LIBPCAP_CONF_OPT += --enable-canusb
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 19a115e..066b6c8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -128,12 +128,12 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call MESSAGE,"Installing to staging directory")
 	$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
-	$(Q)if test -n "$($(PKG)_CONFIG_FIXUP)" ; then \
+	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
 				-e "s,-I/usr/,-I$(STAGING_DIR)/usr/,g" \
 				-e "s,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
-				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_FIXUP)) ;\
+				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
 	$(Q)touch $@
 
-- 
1.7.9.5
