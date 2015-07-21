From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:42:36 +0200
Subject: [Buildroot] [git commit] perl: only run finalize hook when necessary
Message-ID: <20150721214242.23B5C81DF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c30dd5de91404744bbe2a5ffece0d00ce68f1f64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PERL_FINALIZE_TARGET always runs, even if perl is not installed.
This results in errors from the find command when it fails to find
anything, even when doing "make -s":

>>>   Finalizing target directory
find: `...../output/target/usr/lib/perl5/': No such file or directory
find: `...../output/target/usr/lib/perl5/': No such file or directory
find: `...../output/target/usr/lib/perl5/': No such file or directory

This is not helpful for projects that do not select Perl.  Silence this
by making the hook conditional on package selection.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 091c032..1e6a054 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -115,6 +115,7 @@ endef
 $(eval $(generic-package))
 $(eval $(host-generic-package))
 
+ifeq ($(BR2_PACKAGE_PERL),y)
 define PERL_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
@@ -122,6 +123,5 @@ define PERL_FINALIZE_TARGET
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
 endef
-
 TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
-
+endif
