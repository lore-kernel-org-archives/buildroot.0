From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:17 -0700
Subject: [Buildroot] [PATCH 16/18] perl-template-toolkit: use new
 patch_sub_makefile
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-17-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-template-toolkit/perl-template-toolkit.mk | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/package/perl-template-toolkit/perl-template-toolkit.mk b/package/perl-template-toolkit/perl-template-toolkit.mk
index f65d685fa1..1307c72c1f 100644
--- a/package/perl-template-toolkit/perl-template-toolkit.mk
+++ b/package/perl-template-toolkit/perl-template-toolkit.mk
@@ -11,21 +11,11 @@ PERL_TEMPLATE_TOOLKIT_DEPENDENCIES = perl-appconfig
 PERL_TEMPLATE_TOOLKIT_LICENSE = Artistic or GPL-1.0+
 PERL_TEMPLATE_TOOLKIT_LICENSE_FILES = README
 
-# There has got to be a better way... :(
-# Some arguments to Makefile.PL do not get propagated to subdirectories
-# similar to:
-# https://rt.cpan.org/Public/Bug/Display.html?id=28632
-define PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
-	$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(@D)/xs/Makefile
-	$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(@D)/xs/Makefile
-	$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(@D)/xs/Makefile
-	$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(@D)/xs/Makefile
-	$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(@D)/xs/Makefile
-	$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(@D)/xs/Makefile
-	$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(@D)/xs/Makefile
-	$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(@D)/xs/Makefile
+# Fix xs/Makefile so it will cross-compile
+define PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SUB_MAKEFILE
+	$(call patch_sub_makefile,$(@D)/xs/Makefile)
 endef
 
-PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_HOOKS += PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
+PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_HOOKS += PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SUB_MAKEFILE
 
 $(eval $(perl-package))
-- 
2.14.4
