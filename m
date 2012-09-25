From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:20 +0200
Subject: [Buildroot] [PATCH v8 04/11] perl: add DB_File
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348593508-14254-4-git-send-email-francois.perrad@gadz.org>
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
index 3e11574..e0dbbdf 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -17,3 +17,13 @@ config BR2_PACKAGE_PERL_ONLY_MINIPERL
 	  Usually used to bootstrap a full Perl (@INC contains only .).
 
 endif
+
+if BR2_PACKAGE_PERL && !BR2_PACKAGE_PERL_ONLY_MINIPERL
+
+config BR2_PACKAGE_PERL_DB_FILE
+	bool "DB_File"
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  Build the DB_File module.
+
+endif
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 8f7ba15..0c69e0b 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -11,7 +11,11 @@ PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic
 PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
+
 PERL_DEPENDENCIES = host-qemu
+ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
+    PERL_DEPENDENCIES += berkeleydb
+endif
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_USE_DEVEL=-Dusedevel
-- 
1.7.9.5
