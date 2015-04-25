From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 15:54:48 +0200
Subject: [Buildroot] [PATCH 6/6] package/perl-mail-spamassassin: new package
In-Reply-To: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429970088-593-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains a dependency check which only checks for installed
modules in host-perl, not the target variant. Therefore some host package
of perl modules are needed as dependency.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |    1 +
 package/perl-mail-spamassassin/Config.in           |   18 ++++++++++++++++
 .../perl-mail-spamassassin.hash                    |    3 +++
 .../perl-mail-spamassassin.mk                      |   22 ++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/perl-mail-spamassassin/Config.in
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.hash
 create mode 100644 package/perl-mail-spamassassin/perl-mail-spamassassin.mk

diff --git a/package/Config.in b/package/Config.in
index 5752fc5..f892ed3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -529,6 +529,7 @@ menu "Perl libraries/modules"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mail-dkim/Config.in"
+	source "package/perl-mail-spamassassin/Config.in"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-mail-spamassassin/Config.in b/package/perl-mail-spamassassin/Config.in
new file mode 100644
index 0000000..7240c26
--- /dev/null
+++ b/package/perl-mail-spamassassin/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN
+	bool "perl-mail-spamassassin"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_DB_FILE
+	select BR2_PACKAGE_PERL_DIGEST_SHA1
+	select BR2_PACKAGE_PERL_ENCODE_DETECT
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
diff --git a/package/perl-mail-spamassassin/perl-mail-spamassassin.hash b/package/perl-mail-spamassassin/perl-mail-spamassassin.hash
new file mode 100644
index 0000000..7e2896f
--- /dev/null
+++ b/package/perl-mail-spamassassin/perl-mail-spamassassin.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    5d0b50cee3bfa905cca35c33296c8c2a Mail-SpamAssassin-3.4.0.tar.gz
+sha256 244914c30976844878a7f129fd503eb40986c68a3800f416c3a68b14507c0a64 Mail-SpamAssassin-3.4.0.tar.gz
diff --git a/package/perl-mail-spamassassin/perl-mail-spamassassin.mk b/package/perl-mail-spamassassin/perl-mail-spamassassin.mk
new file mode 100644
index 0000000..227c76d
--- /dev/null
+++ b/package/perl-mail-spamassassin/perl-mail-spamassassin.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# perl-mail-spamassassin
+#
+################################################################################
+
+PERL_MAIL_SPAMASSASSIN_VERSION = 3.4.0
+PERL_MAIL_SPAMASSASSIN_SOURCE = Mail-SpamAssassin-$(PERL_MAIL_SPAMASSASSIN_VERSION).tar.gz
+PERL_MAIL_SPAMASSASSIN_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KM/KMCGRAIL/SpamAssassin
+PERL_MAIL_SPAMASSASSIN_LICENSE = Artistic or GPLv1+
+PERL_MAIL_SPAMASSASSIN_LICENSE_FILES = LICENSE
+PERL_MAIL_SPAMASSASSIN_DEPENDENCIES = \
+	perl \
+	perl-db_file \
+	perl-digest-sha1 \
+	perl-encode-detect \
+	perl-html-parser host-perl-html-parser \
+	perl-mail-dkim \
+	perl-net-dns host-perl-net-dns \
+	perl-netaddr-ip host-perl-netaddr-ip
+
+$(eval $(perl-package))
-- 
1.7.10.4
