From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Oct 2014 08:36:45 +0200
Subject: [Buildroot] [V2 4/4] perl: remove useless hacks
In-Reply-To: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
References: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1413009405-13870-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/Config.in                          |  2 --
 package/perl-gdgraph/Config.in                     |  1 -
 .../perl-gdgraph-01-fix-Makefile-PL.patch          | 24 --------------------
 package/perl/perl.mk                               | 26 ----------------------
 4 files changed, 53 deletions(-)
 delete mode 100644 package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch

diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 3434507..7c85cfc 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PERL_GD
 	bool "perl-gd"
 	depends on !BR2_PREFER_STATIC_LIB
-	# Does not build on machines having a old host perl
-	depends on BR2_BROKEN
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_FREETYPE
diff --git a/package/perl-gdgraph/Config.in b/package/perl-gdgraph/Config.in
index 972a5c5..e722c06 100644
--- a/package/perl-gdgraph/Config.in
+++ b/package/perl-gdgraph/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PERL_GDGRAPH
 	bool "perl-gdgraph"
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_BROKEN # perl-gd
 	select BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_PERL_GDTEXTUTIL
 	help
diff --git a/package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch b/package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch
deleted file mode 100644
index e95a64e..0000000
--- a/package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-partial revert to 1.47 in order to work with an old perl 5.10.1
-
-With old ExtUtils::MakeMaker, AUTHOR takes a string/number not a ARRAY reference.
-See http://api.metacpan.org/source/RUZ/GDGraph-1.48/CHANGES
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/Makefile.PL
-===================================================================
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -19,11 +19,7 @@
- 
-         ($] >= 5.005 ?
-             ('ABSTRACT'	    => 'Produces charts with GD',
--             'AUTHOR'       => [
--                 'Martien Verbruggen <mgjv@tradingpost.com.au>',
--                 'Benjamin Warfield <bwarfield@cpan.org>',
--                 'Ruslan Zakirov <Ruslan.Zakirov@gmail.com>',
--            ]
-+             'AUTHOR'	    => 'Martien Verbruggen <mgjv@tradingpost.com.au>',
-             ):()
-         ),
- 
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 16a8d68..3ce55a8 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -100,32 +100,6 @@ define PERL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
-# perl infra: fix for Perl XS packages configured by Makefile.PL
-#
-# ExtUtils::MakeMaker adds all the header files used by the perl as
-# dependencies to the generated Makefile. This means that the generated
-# Makefile will depend on the system's header files.
-#
-# Usually this is not a problem, because when building the target package,
-# these header files will indeed be found in $(STAGING_DIR). However, some
-# distro's add an extra header file to the system's perl. This header is
-# also included in the generated Makefile, which makes the build fail
-# because it doesn't exist in $(STAGING_DIR).
-#
-# As a work-around, explicitly create this header file in $(STAGING_DIR).
-# It doesn't hurt to create it even if the system perl doesn't need it.
-#
-define PERL_ADD_CORE_H
-	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h
-	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-gentoo.h
-	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/cc_runtime.h
-	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/fakethr.h
-	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/perlsfio.h
-	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/vutil.h
-endef
-
-PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_CORE_H
-
 HOST_PERL_CONF_OPTS = \
 	-des \
 	-Dprefix="$(HOST_DIR)/usr" \
-- 
1.9.1
