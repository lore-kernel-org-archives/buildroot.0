From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 24 Apr 2014 18:26:01 +0200
Subject: [Buildroot] [V2 1/2] pkg-perl: fix for Perl XS packages configured
	by Makefile.PL
Message-ID: <1398356762-12486-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ExtUtils::MakeMaker adds all the header files used by the perl as
dependencies to the generated Makefile. This means that the generated
Makefile will depend on the system's header files.

Usually this is not a problem, because when building the target package,
these header files will indeed be found in $(STAGING_DIR). However, some
distro's add an extra header file to the system's perl. This header is
also included in the generated Makefile, which makes the build fail
because it doesn't exist in $(STAGING_DIR).

As a work-around, explicitly create this header file in $(STAGING_DIR).
It doesn't hurt to create it even if the system perl doesn't need it.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 51aeb14..64ad7d3 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -94,4 +94,25 @@ define PERL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
+# perl infra: fix for Perl XS packages configured by Makefile.PL
+#
+# ExtUtils::MakeMaker adds all the header files used by the perl as
+# dependencies to the generated Makefile. This means that the generated
+# Makefile will depend on the system's header files.
+#
+# Usually this is not a problem, because when building the target package,
+# these header files will indeed be found in $(STAGING_DIR). However, some
+# distro's add an extra header file to the system's perl. This header is
+# also included in the generated Makefile, which makes the build fail
+# because it doesn't exist in $(STAGING_DIR).
+#
+# As a work-around, explicitly create this header file in $(STAGING_DIR).
+# It doesn't hurt to create it even if the system perl doesn't need it.
+#
+define PERL_ADD_PATCHLEVEL_DEBIAN_H
+	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h
+endef
+
+PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_PATCHLEVEL_DEBIAN_H
+
 $(eval $(generic-package))
-- 
1.9.1
