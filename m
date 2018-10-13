From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 13 Oct 2018 16:12:00 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-perl: add patch_subdir_makefile function
Message-ID: <20181013141201.4234-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

based on an initial work of Christopher McCrory <chrismcc@gmail.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 07348bd5d..a78c1cd95 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -22,6 +22,21 @@
 PERL_ARCHNAME = $(ARCH)-linux
 PERL_RUN = PERL5LIB= PERL_USE_UNSAFE_INC=1 $(HOST_DIR)/bin/perl
 
+# Some arguments to Makefile.PL do not get propagated to subdirectories
+# similar to:
+# https://rt.cpan.org/Public/Bug/Display.html?id=28632
+define patch_subdir_makefile
+	$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(1)
+	$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(1)
+	$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(1)
+	$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(1)
+	$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(1)
+	$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(1)
+	$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(1)
+	$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(1)
+	$(SED) "s:^PERL_INC = .*:PERL_INC = $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE:g" $(1)
+endef
+
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
 # installation of a perl package should be done, implements a
-- 
2.17.1
