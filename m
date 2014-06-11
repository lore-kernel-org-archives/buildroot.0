From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 11:13:22 +0200
Subject: [Buildroot] [git commit] pkg-perl: fix for Perl XS packages
	configured by Makefile.PL
Message-ID: <20140611092236.9826D9CFBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e037db345e09241a6a88d22886aa45a165f39dc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

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
