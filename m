From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Dec 2015 18:28:12 +0100
Subject: [Buildroot] [V5] perl-mail-spamassassin: new package
In-Reply-To: <1450027692-16039-1-git-send-email-francois.perrad@gadz.org>
References: <1450027692-16039-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1450027692-16039-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                  |  1 +
 .../0001-without-host-perl-dependencies.patch      | 64 ++++++++++++++++++++++
 package/perl-mail-spamassassin/Config.in           | 28 ++++++++++
 .../perl-mail-spamassassin.hash                    |  3 +
 .../perl-mail-spamassassin.mk                      | 38 +++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
 create mode 100644 package/perl-mail-spamassassin/Config.in
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.hash
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..f0989d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -553,6 +553,7 @@ menu "Perl libraries/modules"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mail-dkim/Config.in"
+	source "package/perl-mail-spamassassin/Config.in"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch b/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
new file mode 100644
index 0000000..c38aba1
--- /dev/null
+++ b/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
@@ -0,0 +1,64 @@
+Remove host-perl-* dependencies
+
+The module  Mail-SpamAssassin tries to do the following things:
+1) as usual CPAN module, install many .pm files in /usr/lib/perl5/site_perl/
+and few scripts in /usr/bin.
+2) "compile" SpamAssassin rules, that requires to install/run SpamAssassin on the host side.
+As we don't want install host-perl modules, this step is disabled.
+Please, consider the installed script `sa-update` for installing the rules for the first time.
+3) spamc, an executable which embeds libperl
+The cross-compilation case is not supported, a host executable gets built.
+For this reason, this step is disabled.
+(note: the option BUILD_SPAMC=yes/no is handled only on Windows)
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -133,10 +133,8 @@
+       'spamassassin.raw' => 'spamassassin',
+       'sa-learn.raw'     => 'sa-learn',
+       'sa-update.raw'    => 'sa-update',
+-      'sa-compile.raw'   => 'sa-compile',
+       'sa-awl.raw'       => 'sa-awl',
+       'sa-check_spamd.raw' => 'sa-check_spamd',
+-      'spamc/spamc.c'    => 'spamc/spamc$(EXE_EXT)',
+       'spamd/spamd.raw'  => 'spamd/spamd',
+     },
+ 
+@@ -304,16 +302,6 @@
+ 
+ ';
+ 
+-# check optional module versions
+-use lib 'lib';
+-use Mail::SpamAssassin::Util::DependencyInfo;
+-if (Mail::SpamAssassin::Util::DependencyInfo::long_diagnostics() != 0) {
+-  # missing required module?  die!
+-  # bug 5908: http://cpantest.grango.org/wiki/CPANAuthorNotes says
+-  # we should exit with a status of 0, but without creating Makefile
+-  exit 0;
+-}
+-
+ foreach my $file (@FILES_THAT_MUST_EXIST) {
+   open (TOUCH, ">>$file") or die "cannot touch '$file'";
+   close TOUCH;
+@@ -1013,7 +1001,7 @@
+ 
+ FIXBANG		= -Msharpbang \
+                   -Mconditional \
+-		  -DPERL_BIN="$(PERL_BIN)" \
++		  -DPERL_BIN="/usr/bin/perl" \
+ 		  -DPERL_WARN="$(PERL_WARN)" \
+ 		  -DPERL_TAINT="$(PERL_TAINT)"
+ 
+@@ -1023,7 +1011,7 @@
+ sa-learn: sa-learn.raw
+ 	$(PREPROCESS) $(FIXBYTES) $(FIXVARS) $(FIXBANG) -m$(PERM_RWX) -i$? -o$@
+ 
+-sa-update: sa-update.raw build_rules
++sa-update: sa-update.raw
+ 	$(PREPROCESS) $(FIXBYTES) $(FIXVARS) $(FIXBANG) -m$(PERM_RWX) -isa-update.raw -osa-update
+ 
+ sa-compile: sa-compile.raw
+
diff --git a/package/perl-mail-spamassassin/Config.in b/package/perl-mail-spamassassin/Config.in
new file mode 100644
index 0000000..deb8b7a
--- /dev/null
+++ b/package/perl-mail-spamassassin/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN
+	bool "perl-mail-spamassassin"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_DIGEST_SHA1
+	select BR2_PACKAGE_PERL_HTML_PARSER
+	select BR2_PACKAGE_PERL_MAIL_DKIM
+	select BR2_PACKAGE_PERL_NET_DNS
+	select BR2_PACKAGE_PERL_NETADDR_IP
+	help
+	  SpamAssassin is an extensible email filter which is used to
+	  identify spam
+
+	  http://spamassassin.apache.com/
+
+comment "perl-mail-spamassassin needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+if BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN
+
+config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN_CONTACT_ADDRESS
+	string "contact address"
+	default "the administrator of that BR system"
+	help
+	  What email address or URL should be used in the suspected-spam
+	  report text for users who want more information on your filter
+	  installation?
+
+endif
diff --git a/package/perl-mail-spamassassin/perl-mail-spamassassin.hash b/package/perl-mail-spamassassin/perl-mail-spamassassin.hash
new file mode 100644
index 0000000..7708008
--- /dev/null
+++ b/package/perl-mail-spamassassin/perl-mail-spamassassin.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    76eca1f38c11635d319e62c26d5b034b Mail-SpamAssassin-3.4.1.tar.gz
+sha256 9b7a95a594cdca4f265707364478b57813b82a0ec7e520d9bc818bfbcafdd726 Mail-SpamAssassin-3.4.1.tar.gz
diff --git a/package/perl-mail-spamassassin/perl-mail-spamassassin.mk b/package/perl-mail-spamassassin/perl-mail-spamassassin.mk
new file mode 100644
index 0000000..e1eea4f
--- /dev/null
+++ b/package/perl-mail-spamassassin/perl-mail-spamassassin.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# perl-mail-spamassassin
+#
+################################################################################
+
+PERL_MAIL_SPAMASSASSIN_VERSION = 3.4.1
+PERL_MAIL_SPAMASSASSIN_SOURCE = Mail-SpamAssassin-$(PERL_MAIL_SPAMASSASSIN_VERSION).tar.gz
+PERL_MAIL_SPAMASSASSIN_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KM/KMCGRAIL/SpamAssassin
+PERL_MAIL_SPAMASSASSIN_DEPENDENCIES = perl-digest-sha1 perl-html-parser perl-mail-dkim perl-net-dns perl-netaddr-ip
+PERL_MAIL_SPAMASSASSIN_LICENSE = Apache-2.0
+
+ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
+PERL_MAIL_SPAMASSASSIN_DEPENDENCIES += perl-db-file
+endif
+
+ifeq ($(BR2_PACKAGE_PERL_ENCODE_DETECT),y)
+PERL_MAIL_SPAMASSASSIN_DEPENDENCIES += perl-encode-detect
+endif
+
+ifeq ($(BR2_PACKAGE_PERL_HTTP_DATE),y)
+PERL_MAIL_SPAMASSASSIN_DEPENDENCIES += perl-http-date
+endif
+
+ifeq ($(BR2_PACKAGE_PERL_IO_SOCKET_SSL),y)
+PERL_MAIL_SPAMASSASSIN_DEPENDENCIES += perl-io-socket-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_PERL_LIBWWW_PERL),y)
+PERL_MAIL_SPAMASSASSIN_DEPENDENCIES += perl-libwww-perl
+endif
+
+PERL_MAIL_SPAMASSASSIN_CONF_OPTS += \
+	VENDORPREFIX=/usr \
+	INSTALLVENDORCONF=/etc/mail/spamassassin \
+	CONTACT_ADDRESS="$(call qstrip,$(BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN_CONTACT_ADDRESS))"
+
+$(eval $(perl-package))
-- 
2.5.0
