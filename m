From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:17:03 -0800
Subject: [Buildroot] [git commit] perl: remove the double configure hack
Message-ID: <20121203145716.3BF3199808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92cad6008d6b6a18f09d77f6e4c08572967eb9f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure had to be called twice because with --mode=cross the
miniperl-step failed.  However, just leaving out the --mode parameter
is sufficient to make it work.  Since GNU_TARGET_NAME is always
different from the host's tuple (it has -buildroot- in it), we can
safely assume that the configure script will automatically enter
cross mode.

Also fix a type in perladmin definition.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perl/perl.mk |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b84917b..0893eb5 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -47,19 +47,10 @@ ifeq ($(BR2_PACKAGE_GDBM),y)
     PERL_DEPENDENCIES += gdbm
 endif
 
-# Normally, --mode=cross should automatically do the two steps
-# below, but it doesn't work for some reason.
-PERL_HOST_CONF_OPT = \
-	--mode=buildmini \
-	--target=$(GNU_TARGET_NAME) \
-	--target-arch=$(GNU_TARGET_NAME) \
-	--set-target-name=$(GNU_TARGET_NAME)
-
 # We have to override LD, because an external multilib toolchain ld is not
 # wrapped to provide the required sysroot options.  We also can't use ccache
 # because the configure script doesn't support it.
 PERL_CONF_OPT = \
-	--mode=target \
 	--target=$(GNU_TARGET_NAME) \
 	--target-tools-prefix=$(TARGET_CROSS) \
 	--prefix=/usr \
@@ -71,7 +62,7 @@ PERL_CONF_OPT = \
 	-A myuname="Buildroot $(BR2_VERSION_FULL)" \
 	-A osname=linux \
 	-A osvers=$(LINUX_VERSION) \
-	-A perlamdin=root
+	-A perladmin=root
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_CONF_OPT += -Dusedevel
@@ -87,8 +78,7 @@ PERL_CONF_OPT += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
 endif
 
 define PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_HOST_CONF_OPT))
-	(cd $(@D); ./configure $(PERL_CONF_OPT))
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPT))
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
