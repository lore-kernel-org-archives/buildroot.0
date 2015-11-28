From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 18:21:18 +0100
Subject: [Buildroot] [git commit] infozip: rename to zip
Message-ID: <20151201232123.C0A6581D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0c9470451b23989fe7b298d30352760b1513c37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently have a package named "infozip" for Info-Zip's Zip.

With the upcoming addition of a package the Info-Zip's UnZip the name
is becoming ambiguous. Rename it to the more specific name "zip".

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Jan Pedersen <jp@jp-embedded.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   | 12 ++++++++
 package/Config.in                                  |  2 +-
 ...emove-Check-C-compiler-type-optimization-.patch |  0
 .../0002-configure-Don-t-use-host-CPP.patch        |  0
 ...003-Makefile-Use-CFLAGS-from-command-line.patch |  0
 ...4-configure-use-LDFLAGS-from-command-line.patch |  0
 ...-unix-configure-remove-GID-UID-size-check.patch |  0
 ...figure-borrow-the-LFS-test-from-autotools.patch |  0
 package/{infozip => zip}/Config.in                 |  4 +--
 package/{infozip/infozip.hash => zip/zip.hash}     |  0
 package/{infozip/infozip.mk => zip/zip.mk}         | 32 +++++++++++-----------
 11 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c5b8223..2bbf2ed 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -105,6 +105,18 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2016.02"
+
+config BR2_PACKAGE_INFOZIP
+	bool "infozip option has been renamed to zip"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ZIP
+	help
+	  Info-Zip's Zip package has been renamed from infozip to zip,
+	  to avoid ambiguities with Info-Zip's UnZip which has been added
+	  in the unzip package.
+
+###############################################################################
 comment "Legacy options removed in 2015.11"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL
diff --git a/package/Config.in b/package/Config.in
index 988fe84..9e3494a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -51,11 +51,11 @@ menu "Compressors and decompressors"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/gzip/Config.in"
 endif
-	source "package/infozip/Config.in"
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
 	source "package/xz/Config.in"
+	source "package/zip/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
diff --git a/package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch b/package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
similarity index 100%
rename from package/infozip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
rename to package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch
diff --git a/package/infozip/0002-configure-Don-t-use-host-CPP.patch b/package/zip/0002-configure-Don-t-use-host-CPP.patch
similarity index 100%
rename from package/infozip/0002-configure-Don-t-use-host-CPP.patch
rename to package/zip/0002-configure-Don-t-use-host-CPP.patch
diff --git a/package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch b/package/zip/0003-Makefile-Use-CFLAGS-from-command-line.patch
similarity index 100%
rename from package/infozip/0003-Makefile-Use-CFLAGS-from-command-line.patch
rename to package/zip/0003-Makefile-Use-CFLAGS-from-command-line.patch
diff --git a/package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch b/package/zip/0004-configure-use-LDFLAGS-from-command-line.patch
similarity index 100%
rename from package/infozip/0004-configure-use-LDFLAGS-from-command-line.patch
rename to package/zip/0004-configure-use-LDFLAGS-from-command-line.patch
diff --git a/package/infozip/0005-unix-configure-remove-GID-UID-size-check.patch b/package/zip/0005-unix-configure-remove-GID-UID-size-check.patch
similarity index 100%
rename from package/infozip/0005-unix-configure-remove-GID-UID-size-check.patch
rename to package/zip/0005-unix-configure-remove-GID-UID-size-check.patch
diff --git a/package/infozip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch b/package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch
similarity index 100%
rename from package/infozip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch
rename to package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch
diff --git a/package/infozip/Config.in b/package/zip/Config.in
similarity index 88%
rename from package/infozip/Config.in
rename to package/zip/Config.in
index cfd7533..4b6360a 100644
--- a/package/infozip/Config.in
+++ b/package/zip/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_INFOZIP
-	bool "infozip"
+config BR2_PACKAGE_ZIP
+	bool "zip"
 	help
 	  Zip is a compression and file packaging/archive utility.
 	  Although highly compatible both with PKWARE's PKZIP and
diff --git a/package/infozip/infozip.hash b/package/zip/zip.hash
similarity index 100%
rename from package/infozip/infozip.hash
rename to package/zip/zip.hash
diff --git a/package/infozip/infozip.mk b/package/zip/zip.mk
similarity index 66%
rename from package/infozip/infozip.mk
rename to package/zip/zip.mk
index e57f7e1..5338f88 100644
--- a/package/infozip/infozip.mk
+++ b/package/zip/zip.mk
@@ -1,51 +1,51 @@
 ################################################################################
 #
-# infozip
+# zip
 #
 ################################################################################
 
-INFOZIP_VERSION = 30
-INFOZIP_SOURCE = zip$(INFOZIP_VERSION).tgz
-INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
-INFOZIP_LICENSE = Info-ZIP
-INFOZIP_LICENSE_FILES = LICENSE
+ZIP_VERSION = 30
+ZIP_SOURCE = zip$(ZIP_VERSION).tgz
+ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
+ZIP_LICENSE = Info-ZIP
+ZIP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-INFOZIP_DEPENDENCIES += bzip2
+ZIP_DEPENDENCIES += bzip2
 endif
 
 # Infozip's default CFLAGS.
-INFOZIP_CFLAGS = -I. -DUNIX
+ZIP_CFLAGS = -I. -DUNIX
 
 # Disable the support of 16-bit UIDs/GIDs, the test in unix/configure was
 # removed since it can't work for cross-compilation.
-INFOZIP_CFLAGS += -DUIDGID_NOT_16BIT
+ZIP_CFLAGS += -DUIDGID_NOT_16BIT
 
 # infozip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
 # necessary, redefining it on the command line causes some warnings.
-INFOZIP_TARGET_CFLAGS = \
+ZIP_TARGET_CFLAGS = \
 	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
 
-define INFOZIP_BUILD_CMDS
+define ZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(INFOZIP_TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
+		CFLAGS="$(ZIP_TARGET_CFLAGS) $(ZIP_CFLAGS)" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
 
-define INFOZIP_INSTALL_TARGET_CMDS
+define ZIP_INSTALL_TARGET_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
 		prefix=$(TARGET_DIR)/usr
 endef
 
-define HOST_INFOZIP_BUILD_CMDS
+define HOST_ZIP_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(HOST_CFLAGS) $(INFOZIP_CFLAGS)" \
+		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
 		AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
 
-define HOST_INFOZIP_INSTALL_CMDS
+define HOST_ZIP_INSTALL_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
 		prefix=$(HOST_DIR)/usr
 endef
