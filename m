From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:14:10 +0200
Subject: [Buildroot] [git commit] scancpan: fix detection of native module
Message-ID: <20150920131433.7B2187FC8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ceb1214632efd4b81fc5c796391f23b6acf2dada
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a module is native or depends of a native module, it must be
disabled for static builds via its Config.in

We detect native modules by looking at the filenames listed in the
MANIFEST. If there is a file which looks like it contains code that
much be compiled (e.g. .c, .h and so on...), then we exclude that
module (and its dependencies) from static builds.

That's what we tried to do so far, but failed when there was a
comment on the same line as the filename in the manifest, like so:
    foo-bar.c # Bla bla bla

Fix that by detecting either endof-line (as currently done) or
end-of-string.

For an example of failed build of perl-html-parser, see
http://autobuild.buildroot.net/results/128/128671dfa23d843698a63220c2fac1f44e1d5845/

[Thomas: use better commit log proposed by Yann E. Morin.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-html-parser/Config.in |    4 ++++
 package/perl-libwww-perl/Config.in |    4 ++++
 package/perl-mime-base64/Config.in |    4 ++++
 package/perl-time-hires/Config.in  |    4 ++++
 support/scripts/scancpan           |    2 +-
 5 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/perl-html-parser/Config.in b/package/perl-html-parser/Config.in
index afdd523..8a725f1 100644
--- a/package/perl-html-parser/Config.in
+++ b/package/perl-html-parser/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PERL_HTML_PARSER
 	bool "perl-html-parser"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_HTML_TAGSET
 	help
 	  The HTML-Parser distribution is is a collection of modules that parse
 	  and extract information from HTML documents
 
 	  http://github.com/gisle/html-parser
+
+comment "perl-html-parser needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-libwww-perl/Config.in b/package/perl-libwww-perl/Config.in
index 3db0070..fc46bf1 100644
--- a/package/perl-libwww-perl/Config.in
+++ b/package/perl-libwww-perl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_LIBWWW_PERL
 	bool "perl-libwww-perl"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE
 	select BR2_PACKAGE_PERL_FILE_LISTING
 	select BR2_PACKAGE_PERL_HTML_PARSER
@@ -16,3 +17,6 @@ config BR2_PACKAGE_PERL_LIBWWW_PERL
 	  The World-Wide Web library for Perl
 
 	  https://metacpan.org/release/libwww-perl
+
+comment "perl-libwww-perl needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-mime-base64/Config.in b/package/perl-mime-base64/Config.in
index 7e4858f..22563dd 100644
--- a/package/perl-mime-base64/Config.in
+++ b/package/perl-mime-base64/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PERL_MIME_BASE64
 	bool "perl-mime-base64"
+	depends on !BR2_STATIC_LIBS
 	help
 	  This package contains a base64 encoder/decoder and a quoted-printable
 	  encoder/decoder.
 
 	  http://github.com/gisle/mime-base64
+
+comment "perl-mime-base64 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-time-hires/Config.in b/package/perl-time-hires/Config.in
index e10c18a..37bad71 100644
--- a/package/perl-time-hires/Config.in
+++ b/package/perl-time-hires/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PERL_TIME_HIRES
 	bool "perl-time-hires"
+	depends on !BR2_STATIC_LIBS
 	help
 	  High resolution alarm, sleep, gettimeofday, interval timers
 
 	  http://search.cpan.org/dist/Time-HiRes/HiRes.pm
+
+comment "perl-time-hires needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 1121212..a33ec8b 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -534,7 +534,7 @@ sub is_xs {
     # This heuristic determines if a module is a native extension, by searching
     # some file extension types in the MANIFEST of the distribution.
     # It was inspired by http://deps.cpantesters.org/static/purity.html
-    return $manifest =~ m/\.(swg|xs|c|h|i)\n/;
+    return $manifest =~ m/\.(swg|xs|c|h|i)[\n\s]/;
 }
 
 sub find_license_files {
