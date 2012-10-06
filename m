From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2012 15:53:46 +0200
Subject: [Buildroot] [PATCH v9 03/10] perl: add DB_File
In-Reply-To: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1349531633-26717-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/Config.in |   10 ++++++++++
 package/perl/perl.mk   |    4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 096159f..9a13223 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -15,5 +15,15 @@ config BR2_PACKAGE_PERL
 
 	  http://www.perl.org/
 
+if BR2_PACKAGE_PERL
+
+config BR2_PACKAGE_PERL_DB_FILE
+	bool "DB_File"
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  Build the DB_File module.
+
+endif
+
 comment "perl requires an architecture supported by qemu"
 	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b29e99f..fbaba54 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -11,7 +11,11 @@ PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic
 PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
+
 PERL_DEPENDENCIES = host-qemu
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+    PERL_DEPENDENCIES += berkeleydb
+endif
 
 PERL_CONF_OPT = -des \
 		-Dusecrosscompile \
-- 
1.7.9.5
