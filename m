From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 18:00:50 +0100
Subject: [Buildroot] [git commit] perl-db-file: remove this package
Message-ID: <20161227170105.E4BD88179C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8546ff31c58b2501a69e49bc0f27a4ffa1d2ae08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The module DB_File (Berkeley DB wrapper) is a Perl core module.
Long time ago, its build as a core module was broken.
Since perl-cross-1.0.2, this issue is fixed.
So, this package which build DB_File as CPAN module, becomes useless.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                       |  9 +++++++++
 package/Config.in                      |  1 -
 package/perl-db-file/Config.in         | 11 -----------
 package/perl-db-file/perl-db-file.hash |  3 ---
 package/perl-db-file/perl-db-file.mk   | 22 ----------------------
 5 files changed, 9 insertions(+), 37 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cdadbd8..20445b8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_PACKAGE_PERL_DB_FILE
+	bool "perl-db-file removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_PERL
+	help
+	  DB_File can be built as a core Perl module, so the separate
+	  perl-db-file package has been removed.
+
 config BR2_KERNEL_HEADERS_4_7
 	bool "kernel headers version 4.7.x are no longer supported"
 	select BR2_KERNEL_HEADERS_4_4
diff --git a/package/Config.in b/package/Config.in
index f2103b5..18818fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,7 +579,6 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
-	source "package/perl-db-file/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-sha1/Config.in"
 	source "package/perl-encode-detect/Config.in"
diff --git a/package/perl-db-file/Config.in b/package/perl-db-file/Config.in
deleted file mode 100644
index f07e5df..0000000
--- a/package/perl-db-file/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_PERL_DB_FILE
-	bool "perl-db-file"
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_BERKELEYDB
-	help
-	  Perl5 access to Berkeley DB version 1.x or 2.x.
-
-	  https://metacpan.org/release/DB_File
-
-comment "perl-db-file needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/perl-db-file/perl-db-file.hash b/package/perl-db-file/perl-db-file.hash
deleted file mode 100644
index df0113c..0000000
--- a/package/perl-db-file/perl-db-file.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    0ae7910cabc31a44e50b713a8a475514 DB_File-1.835.tar.gz
-sha256 41206f39a1bac49db8c1595e300b04c70e1393b2d78ccb9ef15c5c0b81037cfc DB_File-1.835.tar.gz
diff --git a/package/perl-db-file/perl-db-file.mk b/package/perl-db-file/perl-db-file.mk
deleted file mode 100644
index 3db8c56..0000000
--- a/package/perl-db-file/perl-db-file.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# perl-db-file
-#
-################################################################################
-
-PERL_DB_FILE_VERSION = 1.835
-PERL_DB_FILE_SOURCE = DB_File-$(PERL_DB_FILE_VERSION).tar.gz
-PERL_DB_FILE_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PM/PMQS
-PERL_DB_FILE_DEPENDENCIES = berkeleydb
-PERL_DB_FILE_LICENSE = Artistic or GPLv1+
-PERL_DB_FILE_LICENSE_FILES = README
-
-define PERL_DB_FILE_FIX_CONFIG_IN
-	$(SED) 's%^INCLUDE.*%INCLUDE = $(STAGING_DIR)/usr/include%' \
-		$(@D)/config.in
-	$(SED) 's%^LIB.*%LIB = $(STAGING_DIR)/usr/lib%' \
-		$(@D)/config.in
-endef
-PERL_DB_FILE_POST_PATCH_HOOKS += PERL_DB_FILE_FIX_CONFIG_IN
-
-$(eval $(perl-package))
