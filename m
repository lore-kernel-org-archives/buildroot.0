From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:02 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_03/51=5D_package/dtc=3A_add_option?=
	=?utf-8?q?_to_install_programs?=
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, we only install the libfdt library.

As suggested by Arnout, add an option that also
installs the few dtc programs.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
There is some (minor?) issues wrt the licensing terms.
The libfdt library is dual-licensed GPLv2+/BSD-2c, and the
executables are licensed GPLv2+.

There is no way in BR to properly convey this information.
So I decided to add some explanatory comments in the .mk
file, in retaliation. ;-)
---
 package/dtc/Config.in |   20 ++++++++++++++++++--
 package/dtc/dtc.mk    |   14 +++++++++-----
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index 96225e3..04edab2 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -1,9 +1,25 @@
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
+config BR2_PACKAGE_DTC_BINARY
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
+endif
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index a0e1e35..1ffd341 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -6,25 +6,29 @@
 
 DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
 DTC_SITE            = git://git.jdl.com/software/dtc.git
-DTC_LICENSE         = GPLv2+/BSD-2c
+DTC_LICENSE         = GPLv2+/BSD-2c GPLv2+
 DTC_LICENSE_FILES   = README.license GPL
 # Note: the dual-license only applies to the library.
-#       The DT compiler (dtc) is GPLv2+, but we do not install it.
+#       The DT compiler (dtc) is GPLv2+.
 DTC_INSTALL_STAGING = YES
 
+#?libfdt_install is our own install rule added by our patch
+DTC_BUILD_RULE=$(if $(BR2_PACKAGE_DTC_BINARY),,libfdt)
+DTC_INSTALL_RULE=$(if $(BR2_PACKAGE_DTC_BINARY),install,libfdt_install)
+
 define DTC_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS)    \
 	CFLAGS="$(TARGET_CFLAGS)"   \
-	$(MAKE) -C $(@D) PREFIX=/usr libfdt
+	$(MAKE) -C $(@D) PREFIX=/usr $(DTC_BUILD_RULE)
 endef
 
-#?libfdt_install is our own install rule added by our patch
+# For staging, only the library is needed
 define DTC_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr libfdt_install
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_RULE)
 endef
 
 define DTC_CLEAN_CMDS
-- 
1.7.2.5
