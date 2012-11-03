From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 11:41:29 +0100
Subject: [Buildroot] [git commit] perl: add DB_File
Message-ID: <20121103161143.B879B99A31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df9a5973e9ff5c659e0901ef4b1e07f820ff149a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perl/Config.in |   10 ++++++++++
 package/perl/perl.mk   |    4 ++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 0a41a97..6cb89f0 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -14,5 +14,15 @@ config BR2_PACKAGE_PERL
 
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
index 7ac1aed..186158b 100644
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
