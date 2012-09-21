From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 21 Sep 2012 23:38:58 +0200
Subject: [Buildroot] [PATCH v7 03/13] perl: add DB_File
In-Reply-To: <1348263548-12975-1-git-send-email-francois.perrad@gadz.org>
References: <1348263548-12975-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348263548-12975-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/Config.in |   10 ++++++++++
 package/perl/perl.mk   |    5 +++++
 2 files changed, 15 insertions(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index e4263d1..2e627da 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -16,3 +16,13 @@ config BR2_PACKAGE_PERL_ONLY_MINIPERL
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
index 134d947..aca5fb0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,6 +12,11 @@ PERL_LICENSE = Artistic
 PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
+    PERL_DEPENDENCIES += berkeleydb
+endif
+HOST_PERL_DEPENDENCIES =
+
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_USE_DEVEL=-Dusedevel
 endif
-- 
1.7.9.5
