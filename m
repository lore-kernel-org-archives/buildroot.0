From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Wed, 20 Aug 2014 16:02:46 -0500
Subject: [Buildroot] [PATCH] hostname: fix conflicting installs of
	/bin/hostname
Message-ID: <1408568566-30391-1-git-send-email-andrew.ruder@elecsyscorp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Surprisingly long-standing issue with conflicting /bin/hostname
installs.  Reported as early as November 2005 by Joseph Dupre.

All together at one point or another there are at least 4 possible
sources of /bin/hostname:

        busybox
        util-linux
        coreutils
        net-tools

Buildroot depends on the -F flag being available in the default
/etc/inittab.  Out of the 4 listed projects only net-tools and buildroot
for sure support the -F flag.  I'm a little unclear on util-linux as it
has been removed entirely (in favor of net-tools) for some time.

As of coreutils 6.9.90 (2007-12-01), coreutils does not install its
/bin/hostname by default.  The following commit reenabled its build:

d6e58cb coreutils: fixed missing hostname (Sep 2010)

This was done to fix a build error in coreutils regarding help2man.  A
later patch:

30c5105 coreutils: bump to version 8.21

disabled the help2man functionality entirely but left hostname being
installed.

On a very related note, net-tools now contains an obsolete check to add
util-linux as a dependency to force it to build first (so that net-tools
ends up with /bin/hostname).

This patch fixes both of these issues so that hostname always comes from
one of two places:

    busybox
    net-tools

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Co-authored-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 package/coreutils/coreutils.mk | 5 ++---
 package/net-tools/net-tools.mk | 5 -----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index af202b4..458a495 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 COREUTILS_DEPENDENCIES = busybox
 endif
 
-COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false hostname \
+COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
 	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
 	uname join
 
@@ -61,8 +61,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		PERL=missing
 
 COREUTILS_CONF_OPT = --disable-rpath \
-		--disable-dependency-tracking \
-		--enable-install-program=hostname
+		--disable-dependency-tracking
 
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 3538655..a2abf5b 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -17,11 +17,6 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	NET_TOOLS_DEPENDENCIES += busybox
 endif
 
-# Install after util-linux since net-tools hostname is better
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),y)
-	NET_TOOLS_DEPENDENCIES += util-linux
-endif
-
 define NET_TOOLS_CONFIGURE_CMDS
 	(cd $(@D); yes "" | ./configure.sh config.in )
 endef
-- 
2.0.1
