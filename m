From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 19:40:13 +0100
Subject: [Buildroot] [git commit] perl: fix build caused by bison generated
	code
Message-ID: <20150304184101.4AC2A817FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a4c8deee9af6fa1a1e906c52d7d49a32434464c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit makes sure the date of a C file is newer than the date of
the corresponding Bison source file, so that the build process doesn't
try to regenerate it. This avoids the need to have host-bison as a
dependency for the perl build.

Fixes:

  http://autobuild.buildroot.net/results/1c2/1c261b09f5a4a314d5dcbc1e5811af9c7d18658a/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0636aba..cd4c286 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -85,6 +85,7 @@ endif
 define PERL_CONFIGURE_CMDS
 	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPTS))
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+	touch $(@D)/x2p/a2p.c # prevents regen by yacc
 endef
 
 define PERL_BUILD_CMDS
