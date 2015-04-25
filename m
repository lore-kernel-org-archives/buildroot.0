From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 15:14:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-libwww-perl: Move
	package/perl-libwww to new package
Message-ID: <1429967642-1762-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This move is necessary to sync the package with scancpan output
as suggested by Francois.
http://lists.busybox.net/pipermail/buildroot/2015-April/126406.html

Since perl-libwww was never part of any official buildroot release
I did not bother the include legavy handling of its options ;)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                        |    2 +-
 package/{perl-libwww => perl-libwww-perl}/Config.in      |    8 +++++---
 package/perl-libwww-perl/perl-libwww-perl.hash           |    3 +++
 .../perl-libwww-perl.mk}                                 |   14 +++++++++-----
 4 files changed, 18 insertions(+), 9 deletions(-)
 rename package/{perl-libwww => perl-libwww-perl}/Config.in (70%)
 create mode 100644 package/perl-libwww-perl/perl-libwww-perl.hash
 rename package/{perl-libwww/perl-libwww.mk => perl-libwww-perl/perl-libwww-perl.mk} (56%)

diff --git a/package/Config.in b/package/Config.in
index c8f3115..b1fed98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -524,7 +524,7 @@ menu "Perl libraries/modules"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
-	source "package/perl-libwww/Config.in"
+	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
diff --git a/package/perl-libwww/Config.in b/package/perl-libwww-perl/Config.in
similarity index 70%
rename from package/perl-libwww/Config.in
rename to package/perl-libwww-perl/Config.in
index 523371f..3db0070 100644
--- a/package/perl-libwww/Config.in
+++ b/package/perl-libwww-perl/Config.in
@@ -1,10 +1,12 @@
-config BR2_PACKAGE_PERL_LIBWWW
-	bool "perl-libwww"
+config BR2_PACKAGE_PERL_LIBWWW_PERL
+	bool "perl-libwww-perl"
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE
 	select BR2_PACKAGE_PERL_FILE_LISTING
 	select BR2_PACKAGE_PERL_HTML_PARSER
 	select BR2_PACKAGE_PERL_HTTP_COOKIES
 	select BR2_PACKAGE_PERL_HTTP_DAEMON
+	select BR2_PACKAGE_PERL_HTTP_DATE
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	select BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	select BR2_PACKAGE_PERL_NET_HTTP
@@ -13,4 +15,4 @@ config BR2_PACKAGE_PERL_LIBWWW
 	help
 	  The World-Wide Web library for Perl
 
-	  https://github.com/libwww-perl/libwww-perl
+	  https://metacpan.org/release/libwww-perl
diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
new file mode 100644
index 0000000..1ef5ccf
--- /dev/null
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    85b36bcd2fd2450718ee14f894f0d3d1 libwww-perl-6.13.tar.gz
+sha256 5fbd13eebd1933e5a203fceb2c1629efbccff3efc8fab6ec0285c79d0a95f8b2 libwww-perl-6.13.tar.gz
diff --git a/package/perl-libwww/perl-libwww.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
similarity index 56%
rename from package/perl-libwww/perl-libwww.mk
rename to package/perl-libwww-perl/perl-libwww-perl.mk
index 8157be2..64cbfd4 100644
--- a/package/perl-libwww/perl-libwww.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -1,21 +1,25 @@
 ################################################################################
 #
-# perl-libwww
+# perl-libwww-perl
 #
 ################################################################################
 
-PERL_LIBWWW_VERSION = 6.13
-PERL_LIBWWW_SITE = $(call github,libwww-perl,libwww-perl,$(PERL_LIBWWW_VERSION))
-PERL_LIBWWW_LICENSE = Artistic or GPLv1+
+PERL_LIBWWW_PERL_VERSION = 6.13
+PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
+PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_LIBWWW_PERL_LICENSE = Artistic or GPLv1+
 PERL_LIBWWW_LICENSE_FILES = README
-PERL_LIBWWW_DEPENDENCIES = \
+PERL_LIBWWW_PERL_DEPENDENCIES = \
+	perl \
 	perl-encode-locale \
 	perl-file-listing \
 	perl-html-parser \
 	perl-http-cookies \
 	perl-http-daemon \
 	perl-http-date \
+	perl-http-message \
 	perl-http-negotiate \
+	perl-lwp-mediatypes \
 	perl-net-http \
 	perl-uri \
 	perl-www-robotrules
-- 
1.7.10.4
