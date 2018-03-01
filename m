From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:36 -0600
Subject: [Buildroot] [next, v2 5/8] cpe-info: update manual for new pkg vars
In-Reply-To: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519881819-51445-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide guidance on setting up the <pkgname>_CPE_ID*
and <pkgname>_CVE_PATCHED variables.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Thomas P
 - Reworded LIBFOO_CVE_PATCHED description

[Matt W
 - Added definition for new preset variables to auto-gen
   the CPE ID
 - Added example LIBFOO_CPE_ID_VENDOR to LIBFOO
---
 docs/manual/adding-packages-generic.txt | 119 ++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 43 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 63ea51b..410e2da 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -24,57 +24,59 @@ system is based on hand-written Makefiles or shell scripts.
 09: LIBFOO_SITE = http://www.foosoftware.org/download
 10: LIBFOO_LICENSE = GPL-3.0+
 11: LIBFOO_LICENSE_FILES = COPYING
-12: LIBFOO_INSTALL_STAGING = YES
-13: LIBFOO_CONFIG_SCRIPTS = libfoo-config
-14: LIBFOO_DEPENDENCIES = host-libaaa libbbb
-15:
-16: define LIBFOO_BUILD_CMDS
-17:	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-18: endef
-19:
-20: define LIBFOO_INSTALL_STAGING_CMDS
-21:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
-22:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
-23:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
-24: endef
-25:
-26: define LIBFOO_INSTALL_TARGET_CMDS
-27:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
-28:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
-29: endef
-30:
-31: define LIBFOO_USERS
-32:	foo -1 libfoo -1 * - - - LibFoo daemon
-33: endef
-34:
-35: define LIBFOO_DEVICES
-36:	/dev/foo  c  666  0  0	42  0  -  -  -
-37: endef
-38:
-39: define LIBFOO_PERMISSIONS
-40:	/bin/foo  f  4755  foo  libfoo	 -  -  -  -  -
-41: endef
-42:
-43: $(eval $(generic-package))
+12: LIBFOO_CPE_ID_VENDOR = foosoftware
+13: LIBFOO_INSTALL_STAGING = YES
+14: LIBFOO_CONFIG_SCRIPTS = libfoo-config
+15: LIBFOO_DEPENDENCIES = host-libaaa libbbb
+16:
+17: define LIBFOO_BUILD_CMDS
+18:	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+19: endef
+20:
+21: define LIBFOO_INSTALL_STAGING_CMDS
+22:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
+23:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
+24:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
+25: endef
+26:
+27: define LIBFOO_INSTALL_TARGET_CMDS
+28:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
+29:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
+30: endef
+31:
+32: define LIBFOO_USERS
+33:	foo -1 libfoo -1 * - - - LibFoo daemon
+34: endef
+35:
+36: define LIBFOO_DEVICES
+37:	/dev/foo  c  666  0  0	42  0  -  -  -
+38: endef
+39:
+40: define LIBFOO_PERMISSIONS
+41:	/bin/foo  f  4755  foo  libfoo	 -  -  -  -  -
+42: endef
+43:
+44: $(eval $(generic-package))
 --------------------------------
 
-The Makefile begins on line 7 to 11 with metadata information: the
+The Makefile begins on line 7 to 12 with metadata information: the
 version of the package (+LIBFOO_VERSION+), the name of the
 tarball containing the package (+LIBFOO_SOURCE+) (xz-ed tarball recommended)
 the Internet location at which the tarball can be downloaded from
-(+LIBFOO_SITE+), the license (+LIBFOO_LICENSE+) and file with the
-license text (+LIBFOO_LICENSE_FILES+). All variables must start with
+(+LIBFOO_SITE+), the license (+LIBFOO_LICENSE+), the file with the
+license text (+LIBFOO_LICENSE_FILES+) and the vendor for vunerability
+analysis (+LIBFOO_CPE_ID_VENDOR+). All variables must start with
 the same prefix, +LIBFOO_+ in this case. This prefix is always the
 uppercased version of the package name (see below to understand where
 the package name is defined).
 
-On line 12, we specify that this package wants to install something to
+On line 13, we specify that this package wants to install something to
 the staging space. This is often needed for libraries, since they must
 install header files and other development files in the staging space.
 This will ensure that the commands listed in the
 +LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
 
-On line 13, we specify that there is some fixing to be done to some
+On line 14, we specify that there is some fixing to be done to some
 of the 'libfoo-config' files that were installed during
 +LIBFOO_INSTALL_STAGING_CMDS+ phase.
 These *-config files are executable shell script files that are
@@ -122,14 +124,14 @@ IMAGEMAGICK_CONFIG_SCRIPTS = \
 --------------------------------
 ================================
 
-On line 14, we specify the list of dependencies this package relies
+On line 15, we specify the list of dependencies this package relies
 on. These dependencies are listed in terms of lower-case package names,
 which can be packages for the target (without the +host-+
 prefix) or packages for the host (with the +host-+) prefix).
 Buildroot will ensure that all these packages are built and installed
 'before' the current package starts its configuration.
 
-The rest of the Makefile, lines 16..29, defines what should be done
+The rest of the Makefile, lines 17..29, defines what should be done
 at the different steps of the package configuration, compilation and
 installation.
 +LIBFOO_BUILD_CMDS+ tells what steps should be performed to
@@ -142,16 +144,16 @@ All these steps rely on the +$(@D)+ variable, which
 contains the directory where the source code of the package has been
 extracted.
 
-On lines 31..43, we define a user that is used by this package (e.g.
+On lines 32..44, we define a user that is used by this package (e.g.
 to run a daemon as non-root) (+LIBFOO_USERS+).
 
-On line 35..37, we define a device-node file used by this package
+On line 36..38, we define a device-node file used by this package
 (+LIBFOO_DEVICES+).
 
-On line 39..41, we define the permissions to set to specific files
+On line 40..42, we define the permissions to set to specific files
 installed by this package (+LIBFOO_PERMISSIONS+).
 
-Finally, on line 43, we call the +generic-package+ function, which
+Finally, on line 44, we call the +generic-package+ function, which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
@@ -453,6 +455,37 @@ information is (assuming the package name is +libfoo+) :
   FLAT binary format is only 4k bytes. If the application consumes more stack,
   append the required number here.
 
+* +LIBFOO_CPE_ID_VENDOR+
+  This variable is optional. If it is not defined, +unknown+ will appear in
+  the +CPI ID+ field of the manifest file for this package.  This variable
+  is used by the package infrastructure to determine if it should include
+  a CPE information for the respective package.  Eventually when all
+  packages include CPE info, this can be cleaned up in the packages which
+  use the common vendoring and package naming sceme.
+
+* +LIBFOO_CPE_ID_NAME+
+  This variable is optional. By default it's set to the package's name.
+
+* +LIBFOO_CPE_ID_VERSION+
+  This variable is optional. By default it's set to the package's version.
+
+* +LIBFOO_CPE_ID+ is optional, as the package infrastructure hangles the
+  default case of a single package's Common Product Enumeration (CPE)
+  identification string. If a package has more then one CPE, a
+  space-separated list can be defined to the respective package.
+  +make cpe-info+ copies all of these into a +cpe-manifest.csv+ file.
+  To identify a package's possible CPE(s), the National Vunerability
+  Database can be searched at https://nvd.nist.gov/products/cpe/search.
+
+* +LIBFOO_CVE_PATCHED+ is a space-separated list of the package's Common
+  Vunerability Enumeration (CVE) identification strings. This list
+  enumerates CVEs which are fixed by patches added in Buildroot. This
+  allows the CPE reporting to provide additional detail on CVEs which
+  have been fixed, even if Buildroot is not yet using an updated upstream
+  release including the fix. This variable is optional. If it is not
+  defined, the +CVE PATCHED+ field will appear empty in the manifest
+  file for this package.
+
 The recommended way to define these variables is to use the following
 syntax:
 
-- 
1.9.1
