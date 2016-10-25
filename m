From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 25 Oct 2016 23:21:09 +0200
Subject: [Buildroot] [PATCH 1/1] perl: update config.{sub,
	guess} using autotools hook
Message-ID: <1477430469-17537-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perl may fail to build on newer host architectures such as aarch64 due
to its inability to guess the host architecture to build 'miniperl',
which is built during the process. An error message looks like this:

  Configuring build-time miniperl for unknown
  ERROR: No $target defined (?!)
  ERROR: configure --mode=buildmini failed

This happens because the config.sub and config.guess files from perl are
not modified and may become outdated.
These files are normally updated automatically by a Buildroot hook for
autotools packages, to avoid problems like these.
Although perl uses the config.sub and config.guess files, it is not a
strict autotools package, so it is not defined as an "autotools-package"
in Buildroot and so it doesn't inherit the hook.
This commit makes perl borrow the hook from the autotools infrastructure
so that it can build on newer build architectures.
This has been tested by building it on an aarch64 host machine.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/perl/perl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 29b4455..a8768b2 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -33,6 +33,12 @@ define PERL_CROSS_EXTRACT
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
+# Even though perl is not an autotools-package, it uses config.sub and
+# config.guess. Up-to-date versions of these files may be needed to build perl
+# on newer host architectures, so we borrow the hook which updates them from the
+# autotools infrastructure.
+PERL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+
 define PERL_CROSS_SET_POD
 	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
 endef
-- 
2.7.4
