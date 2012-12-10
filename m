From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:45:11 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_51/52=5D_package/dtc=3A_add_option?=
	=?utf-8?q?_to_install_programs?=
In-Reply-To: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355183112-10735-52-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, we only install the libfdt library.

As suggested by Arnout, add an option that also
installs the few dtc programs.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
dtdiff, a diff for device trees, requires bash.

I did not add a 'depends on bash' (or a 'select' either), because
requiring bash just for that is a bit far-fetched.

Instead, at dtc install time, if bash is selected, dtdiff is installed
as usual to the target rootfs; if bash is not selected, dtdiff is
removed from the target rootfs.
---
 package/dtc/Config.in |   24 ++++++++++++++++++++++--
 package/dtc/dtc.mk    |   29 +++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index 96225e3..1c65a10 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -1,9 +1,29 @@
 config BR2_PACKAGE_DTC
-	bool "dtc"
+	bool "dtc (libfdt)"
 	help
 	  The Device Tree Compiler, dtc, takes as input a device-tree in
 	  a given format and outputs a device-tree in another format.
 	  
-	  Note that only the library is installed for now.
+	  Note that only the library is installed.
+	  If you want the programs, say 'y' here, and to "dtc programs", below.
 	  
 	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
+
+if BR2_PACKAGE_DTC
+
+config BR2_PACKAGE_DTC_PROGRAMS
+	bool "dtc programs"
+	help
+	  Say 'y' here if you also want the programs on the target:
+	    - convert-dtsv0     convert from version 0 to version 1
+	    - dtc               the device tree compiler
+	    - dtdiff            compare two device trees (needs bash)
+	    - fdtdump           print a readable version of a flat device tree
+	    - fdtget            read values from device tree
+	    - fdtput            write a property value to a device tree
+	  
+	  Note: dtdiff requires bash, so if bash is not selected, dtdiff will
+	        be removed from the target file system. Enable bash if you
+	        need dtdiff on the target.
+
+endif
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index a0e1e35..42843d5 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -8,27 +8,44 @@ DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
 DTC_SITE            = git://git.jdl.com/software/dtc.git
 DTC_LICENSE         = GPLv2+/BSD-2c
 DTC_LICENSE_FILES   = README.license GPL
-# Note: the dual-license only applies to the library.
-#       The DT compiler (dtc) is GPLv2+, but we do not install it.
 DTC_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
+DTC_LICENSE        += (for the library), GPLv2+ (for the executables)
+# Use default goal to build everything
+DTC_BUILD_GOAL      =
+DTC_INSTALL_GOAL    = install
+DTC_CLEAN_GOAL      = clean
+else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
+DTC_BUILD_GOAL      = libfdt
+#?libfdt_install is our own install rule added by our patch
+DTC_INSTALL_GOAL    = libfdt_install
+DTC_CLEAN_GOAL      = libfdt_clean
+ifeq ($(BR2_PACKAGE_BASH),)
+DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
+endif
+endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
+
 define DTC_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS)    \
 	CFLAGS="$(TARGET_CFLAGS)"   \
-	$(MAKE) -C $(@D) PREFIX=/usr libfdt
+	$(MAKE) -C $(@D) PREFIX=/usr $(DTC_BUILD_GOAL)
 endef
 
-#?libfdt_install is our own install rule added by our patch
+# For staging, only the library is needed
 define DTC_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr libfdt_install
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
+endef
+define DTC_POST_INSTALL_TARGET_RM_DTDIFF
+	rm -f $(TARGET_DIR)/usr/bin/dtdiff
 endef
 
 define DTC_CLEAN_CMDS
-	$(MAKE) -C $(@D) libfdt_clean
+	$(MAKE) -C $(@D) $(DTC_CLEAN_GOAL)
 endef
 
 $(eval $(generic-package))
-- 
1.7.2.5
