From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:13 -0700
Subject: [Buildroot] [PATCH 12/18] perl-soap-wsdl: new package
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-13-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/perl-soap-wsdl/Config.in           | 19 +++++++++++++++++++
 package/perl-soap-wsdl/perl-soap-wsdl.hash |  6 ++++++
 package/perl-soap-wsdl/perl-soap-wsdl.mk   | 16 ++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/perl-soap-wsdl/Config.in
 create mode 100644 package/perl-soap-wsdl/perl-soap-wsdl.hash
 create mode 100644 package/perl-soap-wsdl/perl-soap-wsdl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c2d097ce4d..da08b66c77 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -505,6 +505,7 @@ F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
 F:	package/perl-package-stash/
 F:	package/perl-params-util/
+F:	package/perl-soap-wsdl/
 F:	package/perl-sub-install/
 F:	package/perl-sys-cpu/
 F:	package/perl-sys-meminfo/
diff --git a/package/Config.in b/package/Config.in
index dcdc032b65..fff68b3e67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -731,6 +731,7 @@ menu "Perl libraries/modules"
 	source "package/perl-package-stash/Config.in"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
+	source "package/perl-soap-wsdl/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
diff --git a/package/perl-soap-wsdl/Config.in b/package/perl-soap-wsdl/Config.in
new file mode 100644
index 0000000000..2df36444a1
--- /dev/null
+++ b/package/perl-soap-wsdl/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PERL_SOAP_WSDL
+	bool "perl-soap-wsdl"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_CLASS_LOAD
+	select BR2_PACKAGE_PERL_CLASS_STD_FAST
+	select BR2_PACKAGE_PERL_MODULE_BUILD
+	select BR2_PACKAGE_PERL_TEMPLATE_TOOLKIT
+	select BR2_PACKAGE_PERL_TIMEDATE
+	select BR2_PACKAGE_PERL_URI
+	select BR2_PACKAGE_PERL_XML_PARSER
+	select BR2_PACKAGE_PERL_LIBWWW_PERL
+	help
+	  SOAP with WSDL support
+
+	  https://metacpan.org/release/SOAP-WSDL
+
+comment "perl-soap-wsdl needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+#	select BR2_PACKAGE_PERL_TERMREADKEY
diff --git a/package/perl-soap-wsdl/perl-soap-wsdl.hash b/package/perl-soap-wsdl/perl-soap-wsdl.hash
new file mode 100644
index 0000000000..ce56659e71
--- /dev/null
+++ b/package/perl-soap-wsdl/perl-soap-wsdl.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    454b0d4f71d211c77eb27f1eb7f33a1e SOAP-WSDL-3.003.tar.gz
+sha256 84f6b542d95d60211bf94cc098677c19529a897950b93461945a726d345cfcbd SOAP-WSDL-3.003.tar.gz
+
+# computed by scancpan
+sha256 398213e64d308ae3c1d9d1b4b585ed210318d66170dc3439dda8ee5f3fa96edd LICENSE
diff --git a/package/perl-soap-wsdl/perl-soap-wsdl.mk b/package/perl-soap-wsdl/perl-soap-wsdl.mk
new file mode 100644
index 0000000000..2eb0e0465a
--- /dev/null
+++ b/package/perl-soap-wsdl/perl-soap-wsdl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# perl-soap-wsdl
+#
+################################################################################
+
+PERL_SOAP_WSDL_VERSION = 3.003
+PERL_SOAP_WSDL_SOURCE = SOAP-WSDL-$(PERL_SOAP_WSDL_VERSION).tar.gz
+PERL_SOAP_WSDL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
+PERL_SOAP_WSDL_DEPENDENCIES = perl-class-load perl-class-std-fast perl-template-toolkit perl-timedate perl-uri perl-xml-parser perl-libwww-perl
+# perl-termreadkey needs license clarifications before adding to buildroot
+# PERL_SOAP_WSDL_DEPENDENCIES += perl-termreadkey
+PERL_SOAP_WSDL_LICENSE = Artistic or GPL-1.0+
+PERL_SOAP_WSDL_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4
