From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 23 Nov 2013 10:25:49 +0100
Subject: [Buildroot] [pkg-perl infra V3 12/12] libxml-libxml-perl: new
	package
In-Reply-To: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1385198749-6249-13-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and its CPAN dependencies

(depends on libxml2 & zlib)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpan/Config.in                             |    4 ++++
 package/cpan/libxml-libxml-perl/Config.in          |    9 ++++++++
 .../cpan/libxml-libxml-perl/libxml-libxml-perl.mk  |   22 ++++++++++++++++++++
 .../cpan/libxml-namespacesupport-perl/Config.in    |    5 +++++
 .../libxml-namespacesupport-perl.mk                |   16 ++++++++++++++
 package/cpan/libxml-sax-base-perl/Config.in        |    5 +++++
 .../libxml-sax-base-perl/libxml-sax-base-perl.mk   |   16 ++++++++++++++
 package/cpan/libxml-sax-perl/Config.in             |    7 +++++++
 package/cpan/libxml-sax-perl/libxml-sax-perl.mk    |   15 +++++++++++++
 9 files changed, 99 insertions(+)
 create mode 100644 package/cpan/libxml-libxml-perl/Config.in
 create mode 100644 package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk
 create mode 100644 package/cpan/libxml-namespacesupport-perl/Config.in
 create mode 100644 package/cpan/libxml-namespacesupport-perl/libxml-namespacesupport-perl.mk
 create mode 100644 package/cpan/libxml-sax-base-perl/Config.in
 create mode 100644 package/cpan/libxml-sax-base-perl/libxml-sax-base-perl.mk
 create mode 100644 package/cpan/libxml-sax-perl/Config.in
 create mode 100644 package/cpan/libxml-sax-perl/libxml-sax-perl.mk

diff --git a/package/cpan/Config.in b/package/cpan/Config.in
index 8574978..d162c57 100644
--- a/package/cpan/Config.in
+++ b/package/cpan/Config.in
@@ -1,2 +1,6 @@
 source "package/cpan/libcurses-perl/Config.in"
 source "package/cpan/libnet-ssleay-perl/Config.in"
+source "package/cpan/libxml-libxml-perl/Config.in"
+source "package/cpan/libxml-namespacesupport-perl/Config.in"
+source "package/cpan/libxml-sax-base-perl/Config.in"
+source "package/cpan/libxml-sax-perl/Config.in"
diff --git a/package/cpan/libxml-libxml-perl/Config.in b/package/cpan/libxml-libxml-perl/Config.in
new file mode 100644
index 0000000..19aa55c
--- /dev/null
+++ b/package/cpan/libxml-libxml-perl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBXML_LIBXML_PERL
+	bool "libxml-libxml-perl"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBXML_SAX_PERL
+	select BR2_PACKAGE_LIBXML_NAMESPACESUPPORT_PERL
+	help
+	  Interface to Gnome libxml2 xml parsing and DOM library
+
diff --git a/package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk b/package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk
new file mode 100644
index 0000000..5d7d0c2
--- /dev/null
+++ b/package/cpan/libxml-libxml-perl/libxml-libxml-perl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libxml-libxml-perl
+#
+################################################################################
+
+LIBXML_LIBXML_PERL_VERSION = 2.0107
+LIBXML_LIBXML_PERL_AUTHOR = SHLOMIF
+LIBXML_LIBXML_PERL_SOURCE = XML-LibXML-$(LIBXML_LIBXML_PERL_VERSION).tar.gz
+LIBXML_LIBXML_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF/
+LIBXML_LIBXML_PERL_DEPENDENCIES = perl zlib libxml2 libxml-sax-perl libxml-namespacesupport-perl
+HOST_LIBXML_LIBXML_PERL_DEPENDENCIES = host-libxml2 host-zlib host-libxml-sax-perl host-libxml-namespacesupport-perl
+LIBXML_LIBXML_PERL_LICENSE = perl_5
+
+LIBXML_LIBXML_PERL_CONF_OPT += LIBS=-L$(STAGING_DIR)/usr/lib
+LIBXML_LIBXML_PERL_CONF_OPT += INC=-I$(STAGING_DIR)/usr/include/libxml2
+
+HOST_LIBXML_LIBXML_PERL_CONF_OPT += LIBS=-L$(HOST_DIR)/usr/lib
+HOST_LIBXML_LIBXML_PERL_CONF_OPT += INC=-I$(HOST_DIR)/usr/include/libxml2
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
diff --git a/package/cpan/libxml-namespacesupport-perl/Config.in b/package/cpan/libxml-namespacesupport-perl/Config.in
new file mode 100644
index 0000000..9b3c50e
--- /dev/null
+++ b/package/cpan/libxml-namespacesupport-perl/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBXML_NAMESPACESUPPORT_PERL
+	bool "libxml-namespacesupport-perl"
+	help
+	  a simple generic namespace support class
+
diff --git a/package/cpan/libxml-namespacesupport-perl/libxml-namespacesupport-perl.mk b/package/cpan/libxml-namespacesupport-perl/libxml-namespacesupport-perl.mk
new file mode 100644
index 0000000..b7e750c
--- /dev/null
+++ b/package/cpan/libxml-namespacesupport-perl/libxml-namespacesupport-perl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libxml-namespacesupport-perl
+#
+################################################################################
+
+LIBXML_NAMESPACESUPPORT_PERL_VERSION = 1.11
+LIBXML_NAMESPACESUPPORT_PERL_AUTHOR = PERIGRIN
+LIBXML_NAMESPACESUPPORT_PERL_SOURCE = XML-NamespaceSupport-$(LIBXML_NAMESPACESUPPORT_PERL_VERSION).tar.gz
+LIBXML_NAMESPACESUPPORT_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN/
+LIBXML_NAMESPACESUPPORT_PERL_DEPENDENCIES = perl 
+HOST_LIBXML_NAMESPACESUPPORT_PERL_DEPENDENCIES = 
+LIBXML_NAMESPACESUPPORT_PERL_LICENSE = perl_5
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
diff --git a/package/cpan/libxml-sax-base-perl/Config.in b/package/cpan/libxml-sax-base-perl/Config.in
new file mode 100644
index 0000000..5687874
--- /dev/null
+++ b/package/cpan/libxml-sax-base-perl/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBXML_SAX_BASE_PERL
+	bool "libxml-sax-base-perl"
+	help
+	  Base class for SAX Drivers and Filters
+
diff --git a/package/cpan/libxml-sax-base-perl/libxml-sax-base-perl.mk b/package/cpan/libxml-sax-base-perl/libxml-sax-base-perl.mk
new file mode 100644
index 0000000..875f651
--- /dev/null
+++ b/package/cpan/libxml-sax-base-perl/libxml-sax-base-perl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libxml-sax-base-perl
+#
+################################################################################
+
+LIBXML_SAX_BASE_PERL_VERSION = 1.08
+LIBXML_SAX_BASE_PERL_AUTHOR = GRANTM
+LIBXML_SAX_BASE_PERL_SOURCE = XML-SAX-Base-$(LIBXML_SAX_BASE_PERL_VERSION).tar.gz
+LIBXML_SAX_BASE_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM/
+LIBXML_SAX_BASE_PERL_DEPENDENCIES = perl 
+HOST_LIBXML_SAX_BASE_PERL_DEPENDENCIES = 
+LIBXML_SAX_BASE_PERL_LICENSE = perl_5
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
diff --git a/package/cpan/libxml-sax-perl/Config.in b/package/cpan/libxml-sax-perl/Config.in
new file mode 100644
index 0000000..cfb1642
--- /dev/null
+++ b/package/cpan/libxml-sax-perl/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBXML_SAX_PERL
+	bool "libxml-sax-perl"
+	select BR2_PACKAGE_LIBXML_NAMESPACESUPPORT_PERL
+	select BR2_PACKAGE_LIBXML_SAX_BASE_PERL
+	help
+	  Simple API for XML
+
diff --git a/package/cpan/libxml-sax-perl/libxml-sax-perl.mk b/package/cpan/libxml-sax-perl/libxml-sax-perl.mk
new file mode 100644
index 0000000..e41c4fb
--- /dev/null
+++ b/package/cpan/libxml-sax-perl/libxml-sax-perl.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libxml-sax-perl
+#
+################################################################################
+
+LIBXML_SAX_PERL_VERSION = 0.99
+LIBXML_SAX_PERL_AUTHOR = GRANTM
+LIBXML_SAX_PERL_SOURCE = XML-SAX-$(LIBXML_SAX_PERL_VERSION).tar.gz
+LIBXML_SAX_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM/
+LIBXML_SAX_PERL_DEPENDENCIES = perl libxml-namespacesupport-perl libxml-sax-base-perl
+HOST_LIBXML_SAX_PERL_DEPENDENCIES = host-libxml-namespacesupport-perl host-libxml-sax-base-perl
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.9.5
