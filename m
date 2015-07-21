From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 20 Jul 2015 21:59:24 -0400
Subject: [Buildroot] [PATCH 1/1] perl: only run finalize hook when necessary
Message-ID: <1437443964-1988-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/perl/perl.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
