From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 15:39:10 +0200
Subject: [Buildroot] [git commit] perl-dbd-mysql: new package
Message-ID: <20180911133819.97E5E83D84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb9d958444e5725094db7725988ece8c5304fc7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: properly propagate BR2_PACKAGE_MYSQL dependencies]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/perl-dbd-mysql/Config.in           | 17 +++++++++++++++++
 package/perl-dbd-mysql/perl-dbd-mysql.hash |  6 ++++++
 package/perl-dbd-mysql/perl-dbd-mysql.mk   | 15 +++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b05564dd44..8c43ce1b17 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -492,6 +492,7 @@ F:	package/perl-class-std-fast/
 F:	package/perl-data-optlist/
 F:	package/perl-data-uuid/
 F:	package/perl-date-manip/
+F:	package/perl-dbd-mysql/
 F:	package/perl-dbi/
 F:	package/perl-device-serialport/
 F:	package/perl-file-slurp/
diff --git a/package/Config.in b/package/Config.in
index fb4d328846..046ddd5310 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -678,6 +678,7 @@ menu "Perl libraries/modules"
 	source "package/perl-data-uuid/Config.in"
 	source "package/perl-date-manip/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
+	source "package/perl-dbd-mysql/Config.in"
 	source "package/perl-dbi/Config.in"
 	source "package/perl-device-serialport/Config.in"
 	source "package/perl-digest-hmac/Config.in"
diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
new file mode 100644
index 0000000000..f6cc3f99e4
--- /dev/null
+++ b/package/perl-dbd-mysql/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PERL_DBD_MYSQL
+	bool "perl-dbd-mysql"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP # mysql
+	depends on BR2_USE_MMU # mysql
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	select BR2_PACKAGE_PERL_DBI
+	select BR2_PACKAGE_MYSQL
+	help
+	  A MySQL driver for the Perl5 Database Interface (DBI)
+
+	  http://dbi.perl.org/
+
+comment "perl-dbd-mysql needs a toolchain w/ dynamic library, C++, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.hash b/package/perl-dbd-mysql/perl-dbd-mysql.hash
new file mode 100644
index 0000000000..51de476095
--- /dev/null
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    bdf4f4d899b8af29ebd8ebfb7438d05f DBD-mysql-4.046.tar.gz
+sha256 6165652ec959d05b97f5413fa3dff014b78a44cf6de21ae87283b28378daf1f7 DBD-mysql-4.046.tar.gz
+
+# computed by scancpan
+sha256 7a9ba29702b957805cfa8aa63bca43175625824263232dbade0010d385ab888c LICENSE
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk b/package/perl-dbd-mysql/perl-dbd-mysql.mk
new file mode 100644
index 0000000000..560b97b827
--- /dev/null
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-dbd-mysql
+#
+################################################################################
+
+PERL_DBD_MYSQL_VERSION = 4.046
+PERL_DBD_MYSQL_SOURCE = DBD-mysql-$(PERL_DBD_MYSQL_VERSION).tar.gz
+PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPTTOFU
+PERL_DBD_MYSQL_DEPENDENCIES = host-perl-dbi perl-dbi mysql
+PERL_DBD_MYSQL_CONF_OPTS = --mysql_config=$(STAGING_DIR)/usr/bin/mysql_config
+PERL_DBD_MYSQL_LICENSE = Artistic or GPL-1.0+
+PERL_DBD_MYSQL_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
