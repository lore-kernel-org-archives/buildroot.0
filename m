From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Jun 2015 14:09:42 -0300
Subject: [Buildroot] [PATCH] heimdal: bump to version 1.6rc2
Message-ID: <1435252182-26100-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Helps drop some patches and hence autoreconf saving time.
Also allows parallel builds.

And fixes:
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v2-heimdal-explicitly-set-lpthread-td99422.html
without the need to hardcode libraries (disables/withouts weren't enough
though i've added them anyway for correctness).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/heimdal/0001-add-roken-h-process.patch     | 195 ---------------------
 .../{0003-vendor.patch => 0001-vendor.patch}       |   0
 package/heimdal/0002-use-Getopt-Std.patch          |  30 ----
 package/heimdal/0004-compile_et.patch              |  28 ---
 package/heimdal/heimdal.hash                       |   2 +-
 package/heimdal/heimdal.mk                         |  20 ++-
 6 files changed, 16 insertions(+), 259 deletions(-)
 delete mode 100644 package/heimdal/0001-add-roken-h-process.patch
 rename package/heimdal/{0003-vendor.patch => 0001-vendor.patch} (100%)
 delete mode 100644 package/heimdal/0002-use-Getopt-Std.patch
 delete mode 100644 package/heimdal/0004-compile_et.patch

diff --git a/package/heimdal/0001-add-roken-h-process.patch b/package/heimdal/0001-add-roken-h-process.patch
deleted file mode 100644
index b8fbd2a..0000000
--- a/package/heimdal/0001-add-roken-h-process.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-Add roken-h-process.pl from:
-https://raw.github.com/heimdal/heimdal/master/cf/roken-h-process.pl
-It's required for cross-compiling and missing from release tarballs:
-http://kerberos.996246.n3.nabble.com/Missing-roken-h-process-pl-when-cross-compiling-v1-5-2-td38806.html
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura heimdal-1.5.3.orig/cf/roken-h-process.pl heimdal-1.5.3/cf/roken-h-process.pl
---- heimdal-1.5.3.orig/cf/roken-h-process.pl	1969-12-31 21:00:00.000000000 -0300
-+++ heimdal-1.5.3/cf/roken-h-process.pl	2013-12-18 11:32:38.157625167 -0300
-@@ -0,0 +1,184 @@
-+#!/usr/bin/perl
-+
-+require 'getopts.pl';
-+
-+my $debug = 0;
-+
-+Getopts('dc:p:o:') || die "foo";
-+
-+if ($opt_d) {
-+    $debug = 1;
-+}
-+
-+die "missing arg" if (!defined $opt_c || !defined $opt_p || !defined $opt_o);
-+
-+my %defines;
-+my $IN;
-+my $OUT;
-+
-+print "parse config.h\n" if ($debug);
-+
-+open IN, $opt_c || die "failed open ${opt_c}";
-+
-+my @nesting;
-+
-+push @nesting, 1;
-+
-+while (<IN>) {
-+    if (m/\s*#ifdef\s+(.*)/) {
-+	my $var = $1;
-+	if (defined $defines{$var}) {
-+	    push @nesting, 1;
-+	} else {
-+	    push @nesting, 0;
-+	}
-+	next;
-+    } elsif (m/\s*#ifndef\s+(.*)/) {
-+	my $var = $1;
-+	if (defined $defines{$var}) {
-+	    push @nesting, 0;
-+	} else {
-+	    push @nesting, 1;
-+	}
-+	next;
-+    } elsif (m/\s*#else/) {
-+	my $var = pop @nesting;
-+	$var = !$var;
-+	push @nesting, $var;
-+	next;
-+    } elsif ($nesting[$#nesting] and m/\s*#define\s+(\w+)\s+(\S+)/) {
-+	my $res = $2;
-+	$res = 1 if (!defined $res);
-+	$defines{$1} = $res;
-+    }
-+}
-+
-+close IN;
-+
-+if ($debug) {
-+    foreach my $i (keys %defines) {
-+	print "k: $i v: $defines{$i}\n";
-+    }
-+}
-+
-+open IN, "$opt_p" || die "failed open ${opt_p}";
-+open OUT, ">$opt_o" || die "failed open ${opt_o}";
-+
-+print "parse roken.h.in\n" if ($debug);
-+
-+print OUT "/* This is an OS dependent, generated file */\n";
-+print OUT "\n";
-+print OUT "\n";
-+print OUT "#ifndef __ROKEN_H__\n";
-+print OUT "#define __ROKEN_H__\n";
-+print OUT "\n";
-+
-+ at nesting = (1);
-+
-+while (<IN>) {
-+    if (m/\s*#ifdef\s+(.*)/) {
-+	my $var = $1;
-+	if (defined $defines{$var}) {
-+	    push @nesting, 1;
-+	} else {
-+	    push @nesting, 0;
-+	}
-+	next;
-+    } elsif (m/\s*#ifndef\s+(.*)/) {
-+	my $var = $1;
-+	if (defined $defines{$var}) {
-+	    push @nesting, 0;
-+	} else {
-+	    push @nesting, 1;
-+	}
-+	next;
-+    } elsif (m/\s*#if\s+(.*)/) {
-+	my $res = parse_if($1);
-+	print "line = $res: $1\n" if ($debug);
-+	push @nesting, $res;
-+	next;
-+    } elsif (m/\s*#elif\s+(.*)/) {
-+	my $res = pop @nesting;
-+	if ($res gt 0) {
-+	    $res = -1;
-+	} else {
-+	    my $res = parse_if($1);
-+	}
-+	push @nesting, $res;
-+	next;
-+    } elsif (m/\s*#else/) {
-+	my $var = pop @nesting;
-+	$var = !$var;
-+	push @nesting, $var;
-+	next;
-+    } elsif (m/\s*#endif/) {
-+	pop @nesting;
-+	next;
-+    }
-+    print "line: $_\n"  if ($debug);
-+    print "nesting dep $#{nesting}\n"  if ($debug);
-+    my $i = 0, $t = 1;
-+    while ($i le $#nesting) {
-+	$t = 0 if ($nesting[$i] le 0);
-+	print "nesting $i val $nesting[$i] -> $t\n" if ($debug);
-+	$i++;
-+    }
-+    if ($t) {
-+	print OUT;
-+    }
-+}
-+
-+print OUT "\n";
-+print OUT "#endif /* __ROKEN_H__ */\n";
-+
-+
-+close IN;
-+
-+exit 0;
-+
-+sub parse_if
-+{
-+    my ($neg, $var);
-+
-+    $_ = shift;
-+
-+    if (m/^\s*$/) {
-+	print "end $_\n" if ($debug);
-+	return 1;
-+    } elsif (m/^([^&]+)\&\&(.*)$/) {
-+	print "$1 and $2\n" if ($debug);
-+	return parse_if($1) and parse_if($2);
-+    } elsif (m/^\(([^&]+)\&\&(.*)$/) {
-+	print "$1 and $2\n" if ($debug);
-+	return parse_if($1) and parse_if($2);
-+    } elsif (m/^([^\|]+)\|\|(.*)$/) {
-+	print "$1 or $2\n" if ($debug);
-+	return parse_if($1) or parse_if($2);
-+    } elsif (m/^\s*(\!)?\s*defined\((\w+)\)/) {
-+	($neg, $var) = ($1, $2);
-+	print "def: ${neg}-defined(${var})\n" if ($debug);
-+	my $res = defined $defines{$var};
-+	if ($neg eq "!") {
-+	    if ($res) {
-+		$res = 0;
-+	    } else {
-+		$res = 1;
-+	    }
-+	}
-+	print "res: $res\n" if ($debug);
-+	return $res;
-+    } elsif (m/^\s*(\!)?(\w+)/) {
-+	($neg, $var) = ($1, $2);
-+	print "var: $neg $var\n" if ($debug);
-+	my $res;
-+	if (defined $defines{$var}) {
-+	    $res = $defines{$var};
-+	} else {
-+	    $res = 0;
-+	}
-+	$res = ! $res if ($neg =~ m/!/);
-+	print "res: $res\n" if ($debug);
-+	return $res;
-+    }
-+    die "failed parse: $_\n";
-+}
diff --git a/package/heimdal/0003-vendor.patch b/package/heimdal/0001-vendor.patch
similarity index 100%
rename from package/heimdal/0003-vendor.patch
rename to package/heimdal/0001-vendor.patch
diff --git a/package/heimdal/0002-use-Getopt-Std.patch b/package/heimdal/0002-use-Getopt-Std.patch
deleted file mode 100644
index 134b888..0000000
--- a/package/heimdal/0002-use-Getopt-Std.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6080c0b229c6e332d7dd609d9435ac9baeeea443 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 30 Jan 2014 16:33:02 -0300
-Subject: [PATCH] roken-h-process: use Getopt::Std, getopts.pl is deprecated
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- cf/roken-h-process.pl | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cf/roken-h-process.pl b/cf/roken-h-process.pl
-index 153a35c..72d3bd3 100644
---- a/cf/roken-h-process.pl
-+++ b/cf/roken-h-process.pl
-@@ -1,10 +1,10 @@
- #!/usr/bin/perl
- 
--require 'getopts.pl';
-+use Getopt::Std;
- 
- my $debug = 0;
- 
--Getopts('dc:p:o:') || die "foo";
-+getopts('dc:p:o:') || die "foo";
- 
- if ($opt_d) {
-     $debug = 1;
--- 
-1.8.3.2
-
diff --git a/package/heimdal/0004-compile_et.patch b/package/heimdal/0004-compile_et.patch
deleted file mode 100644
index 6bdec6f..0000000
--- a/package/heimdal/0004-compile_et.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Use compile_et from e2fsprogs rather than building the native and useless one
-from heimdal.
-
-Idea from:
-http://comments.gmane.org/gmane.comp.encryption.kerberos.heimdal.general/6572
-
-Status: Backport from upstream git.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura heimdal-1.5.3.orig/cf/check-compile-et.m4 heimdal-1.5.3.et/cf/check-compile-et.m4
---- heimdal-1.5.3.orig/cf/check-compile-et.m4	2012-12-09 19:06:44.000000000 -0300
-+++ heimdal-1.5.3.et/cf/check-compile-et.m4	2013-12-18 14:20:04.025925879 -0300
-@@ -3,12 +3,12 @@
- dnl CHECK_COMPILE_ET
- AC_DEFUN([CHECK_COMPILE_ET], [
- 
--AC_CHECK_PROG(COMPILE_ET, compile_et, [compile_et])
-+AC_CHECK_PROG(COMPILE_ET, compile_et, [compile_et], [no])
- 
- krb_cv_compile_et="no"
- krb_cv_com_err_need_r=""
- krb_cv_compile_et_cross=no
--if test "${COMPILE_ET}" = "compile_et"; then
-+if test "$COMPILE_ET" != "no"; then
- 
- dnl We have compile_et.  Now let's see if it supports `prefix' and `index'.
- AC_MSG_CHECKING(whether compile_et has the features we need)
diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index 845e957..f32d279 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	aac27bedb33c341b6aed202af07ccc816146a893148721f8123abbbf93bbfea5	heimdal-1.5.3.tar.gz
+sha256	8fe19e0f12ff0d0c2f20a6cf56727deaabd89db9c197288022fb489e103b730d	heimdal-1.6rc2.tar.gz
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 972f15c..6260f8c 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,16 +4,26 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 1.5.3
+HEIMDAL_VERSION = 1.6rc2
 HEIMDAL_SITE = http://www.h5l.org/dist/src
 HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
-HOST_HEIMDAL_CONF_OPTS = --with-x=no --disable-shared --enable-static
+HOST_HEIMDAL_CONF_OPTS = \
+	--disable-shared \
+	--enable-static \
+	--without-openldap \
+	--without-capng \
+	--without-sqlite3 \
+	--without-libintl \
+	--without-openssl \
+	--without-berkeley-db \
+	--without-readline \
+	--without-libedit \
+	--without-hesiod \
+	--without-x \
+	--disable-heimdal-documentation
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
-HEIMDAL_MAKE = $(MAKE1)
-# For heimdal-0004-compile_et.patch
-HEIMDAL_AUTORECONF = YES
 HEIMDAL_LICENSE = BSD-3c
 HEIMDAL_LICENSE_FILES = LICENSE
 
-- 
2.3.6
