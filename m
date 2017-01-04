From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jan 2017 17:06:27 +0100
Subject: [Buildroot] [git commit] perl: bump to version 5.24.0
Message-ID: <20170104161500.E84F4817B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec45554cfd1b2f1eba8106d1106466b471420c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash   | 10 +++++-----
 package/perl/perl.mk     | 16 ++++------------
 support/scripts/scancpan |  6 +++---
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 4afbd06..ac417a3 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.22.2.tar.bz2.{md5,sha1,sha256}.txt
-md5    24ec0b41fdd1a4cce0e66811ae1f5e1b                                 perl-5.22.2.tar.bz2
-sha1   e2f465446dcd45a7fa3da696037f9ebe73e78e55                         perl-5.22.2.tar.bz2
-sha256 f2322b9b04fe0cdbca9fe755360da04892cb6483d44959457cfebc0bcddc8058 perl-5.22.2.tar.bz2
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.0.tar.bz2.{md5,sha1,sha256}.txt
+md5    99f39abe614b50719d9915431e54fc1e                                 perl-5.24.0.tar.bz2
+sha1   298fa605138c1a00dab95643130ae0edab369b4d                         perl-5.24.0.tar.bz2
+sha256 62328a53d157e8153b33e137594155f6f8b64418f7f9238210feb809585290e0 perl-5.24.0.tar.bz2
 
 # No upstream hashes for the following
-sha256 250ab6e6c034a8b7ae447fa2b453fa0b61ebb7db4d039eba60c52e44ab5899bd perl-5.22.1-cross-1.0.2.tar.gz
+sha256 cac4616274edaef81f48d8880d4224e05b81d0033ebad45d42a3a18664c3409c perl-5.24.0-cross-1.0.3.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 84af75d..88bacef 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,24 +5,21 @@
 ################################################################################
 
 # When updating the version here, also update support/scripts/scancpan
-PERL_VERSION_MAJOR = 22
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION_MAJOR = 24
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.0.2
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_CROSS_VERSION = 1.0.3
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 
-PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
-PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
-
 # We use the perlcross hack to cross-compile perl. It should
 # be extracted over the perl sources, so we don't define that
 # as a separate package. Instead, it is downloaded and extracted
@@ -39,11 +36,6 @@ PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 # autotools infrastructure.
 PERL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
-define PERL_CROSS_SET_POD
-	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
-endef
-PERL_POST_PATCH_HOOKS += PERL_CROSS_SET_POD
-
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 PERL_DEPENDENCIES += berkeleydb
 endif
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 3ee543a..b6123de 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -484,9 +484,9 @@ use HTTP::Tiny;
 use Safe;
 use MetaCPAN::API::Tiny;
 
-# Below, 5.022 should be aligned with the version of perl actually
+# Below, 5.024 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.022;
+die <<"MSG" if $] < 5.024;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -494,7 +494,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.22.2
+    perlbrew install perl-5.24.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
