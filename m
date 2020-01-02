From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu,  2 Jan 2020 11:43:46 +0000
Subject: [Buildroot] [PATCH 1/2] package/perl-dbd-mysql: bump to version
 4.050
Message-ID: <20200102114347.2403649-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

version 4.046_01 fixes compiling against mariadb and also introduces a patch
that brakes with cross compiling, see patch 0001.
Also the buildroot host-perl ModuleManager gets somthing wrong looking for
libraries. Instead of checking in the build sysroot, it looks in the host
systems /lib, /usr/lib, etc.  For a successful build, the host system will
also need the matching mysql libraries installed.  Running ldd on mysql.so
should show libmysqlclient, and libmariadb for MariaDB. If the result spits
out an error about missing libraries, this is the reason.
This is probably the only builtroot package where this is an issue.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 ...001-Allow-cross-compile-on-buildroot.patch | 46 +++++++++++++++++++
 package/perl-dbd-mysql/perl-dbd-mysql.hash    |  4 +-
 package/perl-dbd-mysql/perl-dbd-mysql.mk      | 14 +++++-
 3 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 package/perl-dbd-mysql/0001-Allow-cross-compile-on-buildroot.patch

diff --git a/package/perl-dbd-mysql/0001-Allow-cross-compile-on-buildroot.patch b/package/perl-dbd-mysql/0001-Allow-cross-compile-on-buildroot.patch
new file mode 100644
index 0000000000..0431e0092a
--- /dev/null
+++ b/package/perl-dbd-mysql/0001-Allow-cross-compile-on-buildroot.patch
@@ -0,0 +1,46 @@
+From e6689e55fb56a83f227e59d3fa258553d32524fa Mon Sep 17 00:00:00 2001
+From: Christopher McCrory <chrismcc@gmail.com>
+Date: Thu, 2 Jan 2020 07:53:20 +0000
+Subject: [PATCH 1/1] Allow cross compile on buildroot
+
+starting in 4.046_01 Devel::CheckLib is used to check if all needed libraries
+are available. It is not cross compile friendly.  Disable it and hope for the
+best.
+
+Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
+---
+ Makefile.PL | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.PL b/Makefile.PL
+index 0bf733c..668d722 100644
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -9,7 +9,8 @@ use Config;
+ use Getopt::Long;
+ use ExtUtils::MakeMaker;
+ use Data::Dumper;
+-use Devel::CheckLib;
++# broken on cross compile
++# use Devel::CheckLib;
+ use File::Path;
+ use File::Copy;
+ use File::Basename;
+@@ -207,9 +208,11 @@ MSG
+ 
+ print "Checking if libs are available for compiling...\n";
+ 
+-assert_lib(
+-  LIBS => ($opt->{'embedded'} ? $opt->{'embedded'} : $opt->{libs}),
+-);
++print "Skipping, broken on cross compile\n";
++
++#assert_lib(
++#  LIBS => ($opt->{'embedded'} ? $opt->{'embedded'} : $opt->{libs}),
++#);
+ 
+ print "Looks good.\n\n";
+ 
+-- 
+2.18.1
+
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.hash b/package/perl-dbd-mysql/perl-dbd-mysql.hash
index 51de476095..a2048ce5ff 100644
--- a/package/perl-dbd-mysql/perl-dbd-mysql.hash
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    bdf4f4d899b8af29ebd8ebfb7438d05f DBD-mysql-4.046.tar.gz
-sha256 6165652ec959d05b97f5413fa3dff014b78a44cf6de21ae87283b28378daf1f7 DBD-mysql-4.046.tar.gz
+md5    29b1f61321d0892885ccfd0e7bc07f7f DBD-mysql-4.050.tar.gz
+sha256 4f48541ff15a0a7405f76adc10f81627c33996fbf56c95c26c094444c0928d78 DBD-mysql-4.050.tar.gz
 
 # computed by scancpan
 sha256 7a9ba29702b957805cfa8aa63bca43175625824263232dbade0010d385ab888c LICENSE
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk b/package/perl-dbd-mysql/perl-dbd-mysql.mk
index 98521a78cf..c17788598c 100644
--- a/package/perl-dbd-mysql/perl-dbd-mysql.mk
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
@@ -4,9 +4,19 @@
 #
 ################################################################################
 
-PERL_DBD_MYSQL_VERSION = 4.046
+# version 4.046_01 fixes compiling against mariadb and also introduces a patch
+# that brakes with cross compiling, see patch 0001.
+# Also the buildroot host-perl ModuleManager gets somthing wrong looking for
+# libraries. Instead of checking in the build sysroot, it looks in the host
+# systems /lib, /usr/lib, etc.  For a successful build, the host system will
+# also need the matching mysql libraries installed.  Running ldd on mysql.so
+# should show libmysqlclient, and libmariadb for MariaDB. If the result spits
+# out an error about missing libraries, this is the reason.
+# This is probably the only builtroot package where this is an issue.
+
+PERL_DBD_MYSQL_VERSION = 4.050
 PERL_DBD_MYSQL_SOURCE = DBD-mysql-$(PERL_DBD_MYSQL_VERSION).tar.gz
-PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPTTOFU
+PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DV/DVEEDEN
 PERL_DBD_MYSQL_DEPENDENCIES = \
 	host-perl-dbi \
 	mysql
-- 
2.18.1
