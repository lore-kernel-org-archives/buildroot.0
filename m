From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:40:12 +0200
Subject: [Buildroot] [git commit] perl: use <pkg>_EXTRA_DOWNLOADS
Message-ID: <20150330214111.A91BA7FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45d6ac63c4172b02e88e717ca958d2aeea42d1ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of manually using the DOWNLOAD macro (which should remain an
internal macro), this commit converts the Perl package to use
<pkg>_EXTRA_DOWNLOADS, now that it has been extended to allow full
URLs.

[Thomas: as suggested by Yann, keep comment explaining how we handle
perl-cross.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/perl/perl.mk |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 133e8aa..afa9083 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -17,6 +17,8 @@ PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
 PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
+PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
+
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
 PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 
@@ -24,12 +26,6 @@ PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 # be extracted over the perl sources, so we don't define that
 # as a separate package. Instead, it is downloaded and extracted
 # together with perl
-
-define PERL_CROSS_DOWNLOAD
-	$(call DOWNLOAD,$(PERL_CROSS_SITE:/=)/$(PERL_CROSS_SOURCE))
-endef
-PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
-
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
