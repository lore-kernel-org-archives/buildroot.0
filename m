From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Oct 2016 09:17:00 +0200
Subject: [Buildroot] [git commit] Revert "package/perl: bump version to
	5.24.0"
Message-ID: <20161004071739.9B01181E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed2bf9da30a31a8a28eda3c6de9258588a1b3674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e1a4b820fff98cd5ba9ba12c4e7605496e7793b9.

As explained by Fran??ois Perrad:

"""
perl-cross 1.1.0 is not mature (11 issues opened on september), it is
a full refactor, there are already 19 commits after this tag.

I never bump a perl version 5.x.0, I always wait the version 5.x.1

If you really need a perl 5.24.0, cross-compiled it with
perl-5.24.0-cross-1.0.3.

When I bump a perl version, I run on target the full Perl test suite
(~ 800 000 tests), and failures are not expected.
With cross-perl 1.0.3 and 1.1.0 tags, there have failures described in
https://github.com/arsv/perl-cross/issues/33
"""

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   | 16 +++++++++-------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 72063d8..4afbd06 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.0.tar.bz2.{md5,sha1,sha256}.txt
-md5    59456ae4bd4b06cb6e57cb19a3b2d349                                 perl-5.24.0.tar.xz
-sha1   9d5424ac2debe979d1f7255fe0c818aff0b41b4c                         perl-5.24.0.tar.xz
-sha256 a9a37c0860380ecd7b23aa06d61c20fc5bc6d95198029f3684c44a9d7e2952f2 perl-5.24.0.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.22.2.tar.bz2.{md5,sha1,sha256}.txt
+md5    24ec0b41fdd1a4cce0e66811ae1f5e1b                                 perl-5.22.2.tar.bz2
+sha1   e2f465446dcd45a7fa3da696037f9ebe73e78e55                         perl-5.22.2.tar.bz2
+sha256 f2322b9b04fe0cdbca9fe755360da04892cb6483d44959457cfebc0bcddc8058 perl-5.22.2.tar.bz2
 
-# From https://github.com/arsv/perl-cross/releases/download/1.1.0/perl-cross-1.1.0.hash
-sha256 d02e1f60076307655ace2c63fe38832e6d81d6195af84a98221e1c617c6c733d perl-cross-1.1.0.tar.gz
+# No upstream hashes for the following
+sha256 250ab6e6c034a8b7ae447fa2b453fa0b61ebb7db4d039eba60c52e44ab5899bd perl-5.22.1-cross-1.0.2.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index ac7d418..29b4455 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,21 +5,23 @@
 ################################################################################
 
 # When updating the version here, also update support/scripts/scancpan
-PERL_VERSION_MAJOR = 24
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION_MAJOR = 22
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
-PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
+PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.0
+PERL_CROSS_VERSION = 1.0.2
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
-PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
+PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 
-PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
+PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
+PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 
 # We use the perlcross hack to cross-compile perl. It should
 # be extracted over the perl sources, so we don't define that
@@ -32,7 +34,7 @@ endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 define PERL_CROSS_SET_POD
-	$(SED) s/$(PERL_CROSS_OLD_POD)/perldelta.pod/g $(@D)/Makefile
+	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
 endef
 PERL_POST_PATCH_HOOKS += PERL_CROSS_SET_POD
 
