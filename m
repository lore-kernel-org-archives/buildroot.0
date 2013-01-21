From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 21 Jan 2013 15:11:46 +0200
Subject: [Buildroot] [PATCH] pkg-infra: add documentation for
	<pkg>_CONFIG_FIXUP variable
Message-ID: <1358773906-30653-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 docs/manual/adding-packages-generic.txt |   96 ++++++++++++++++++++++--------
 1 files changed, 70 insertions(+), 26 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 7b8561a..3b61031 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -25,31 +25,32 @@ system is based on hand-written Makefiles or shell scripts.
 09: LIBFOO_LICENSE = GPLv3+
 10: LIBFOO_LICENSE_FILES = COPYING
 11: LIBFOO_INSTALL_STAGING = YES
-12: LIBFOO_DEPENDENCIES = host-libaaa libbbb
-13:
-14: define LIBFOO_BUILD_CMDS
-15:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
-16: endef
-17:
-18: define LIBFOO_INSTALL_STAGING_CMDS
-19:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
-20:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
-21:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
-22: endef
-23:
-24: define LIBFOO_INSTALL_TARGET_CMDS
-25:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
-26:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
-27: endef
-28:
-29: define LIBFOO_DEVICES
-30:	/dev/foo  c  666  0  0	42  0  -  -  -
-31: endef
-32:
-33: define LIBFOO_PERMISSIONS
-34:	/bin/foo  f  4755  0  0	 -  -  -  -  -
-35: endef
-36:
+12: LIBFOO_CONFIG_FIXUP = libfoo-config
+13: LIBFOO_DEPENDENCIES = host-libaaa libbbb
+14:
+15: define LIBFOO_BUILD_CMDS
+16:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+17: endef
+18:
+19: define LIBFOO_INSTALL_STAGING_CMDS
+20:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
+21:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
+22:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
+23: endef
+24:
+25: define LIBFOO_INSTALL_TARGET_CMDS
+26:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
+27:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
+28: endef
+29:
+30: define LIBFOO_DEVICES
+31:	/dev/foo  c  666  0  0	42  0  -  -  -
+32: endef
+33:
+34: define LIBFOO_PERMISSIONS
+35:	/bin/foo  f  4755  0  0	 -  -  -  -  -
+36: endef
+37:
 37: $(eval $(generic-package))
 --------------------------------
 
@@ -69,7 +70,45 @@ install header files and other development files in the staging space.
 This will ensure that the commands listed in the
 +LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
 
-On line 12, we specify the list of dependencies this package relies
+On line 12, we specify that there is some fixing to be done to some
+of the 'libfoo-config' files that were installed during 
++LIBFOO_INSTALL_STAGING_CMDS+ phase.
+These *-config files are executable shell script files that are 
+located in '$(STAGING_DIR)/usr/bin' directory and are executed 
+by other 3rd party packages to find out the location and the linking 
+flags of this particular package.
+
+The problem is that all these *-config files by default give wrong,
+host system linking flags that are unsuitable for cross-compiling.
+ 
+For example: 	'-I/usr/include' vs. '-I$(STAGING_DIR)/usr/include' 
+or: 		'-L/usr/lib' vs. '-L$(STAGING_DIR)/usr/lib'
+
+So some sed magic is done to these scripts to make them give correct
+flags.
+The argument to be given to +LIBFOO_CONFIG_FIXUP+ is the file name(s)
+of the shell script(s) needing fixing. All these names are relative to
+'$(STAGING_DIR)/usr/bin' and if needed multiple names can be given.
+
+Example 1:
+
+Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
+
+So it's fixup would be:
+
+DIVINE_CONFIG = divine-config
+
+Example 2:
+
+Package imagemagick installs the following scripts:
+'$(STAGING_DIR)/usr/bin/{Magick,Magick++,MagickCore,MagickWand,Wand}-config'
+
+So it's fixup would be:
+
+IMAGEMAGICK_CONFIG_FIXUP = Magick-config Magick++-config \
+			   MagickCore-config MagickWand-config Wand-config
+
+On line 13, we specify the list of dependencies this package relies
 on. These dependencies are listed in terms of lower-case package names,
 which can be packages for the target (without the +host-+
 prefix) or packages for the host (with the +host-+) prefix).
@@ -240,6 +279,11 @@ information is (assuming the package name is +libfoo+) :
   variables are executed to install the package into the staging
   directory.
 
+* +LIBFOO_CONFIG_FIXUP+ lists the names of the files in 
+  '$(STAGING_DIR)/usr/bin' that need some special fixing to make them
+  cross-compiling friendly. Multiple file names separated by space can be
+  given and all are relative to '$(STAGING_DIR)/usr/bin'.
+
 * +LIBFOO_INSTALL_TARGET+ can be set to +YES+ (default) or +NO+. If
   set to +YES+, then the commands in the +LIBFOO_INSTALL_TARGET_CMDS+
   variables are executed to install the package into the target
-- 
1.7.7.6
