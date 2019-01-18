From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:13:04 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/dhcpdump: fix
 build at -O2
Message-ID: <20190118131233.45E228D237@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=833689db55a4bdec6868f912b3c3300d26b6f371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Since commit aa556e2035c023d4328185a46e15df532e566067
("utils/genrandconfig: test with BR2_OPTIMIZE_2=y"), we are doing
builds at -O2 instead of -Os. This has unveiled an issue in the
strsep.c file:

strsep.c:65:23: error: register name not specified for 'delim'
  register const char *delim;

This strsep.c compatibility code is compiled in if HAVE_STRSEP is not
defined, but dhcpdump does not use any kind of configure script to
detect the availability of strsep(). Therefore by default, it gets
compiled in, and the "register" specifier used for some variable
declarations in strsep.c cause build issues at -O2.

A previous commit in Buildroot from
c2a7f0d6051f71f3bb9d83b574d70814339e4b95 ("dhcpdump: Fix strsep()
feature test"), attempted to fix this problem by changing the test on
HAVE_STRSEP by a test on _BSD_SOURCE.

Unfortunately, _BSD_SOURCE is not meant to be tested: it's a feature
macro that is meant to be *defined* by some code to tell the C library
headers to expose (or not) some given functionality.

So instead, we basically revert commit
c2a7f0d6051f71f3bb9d83b574d70814339e4b95 by dropping the patch, and
pass -DHAVE_STRSEP in the CFLAGS when building dhcpdump.

Fixes:

  http://autobuild.buildroot.net/results/7231170d3d3e3637f02382c1a0a96009b0527618/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 136c8862cf1644ac24187f60c3b9b3400b4e3fb5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dhcpdump/0002-fix-strsep-feature-test.patch    | 27 ----------------------
 package/dhcpdump/dhcpdump.mk                       |  5 +++-
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/dhcpdump/0002-fix-strsep-feature-test.patch b/package/dhcpdump/0002-fix-strsep-feature-test.patch
deleted file mode 100644
index 06bab947c0..0000000000
--- a/package/dhcpdump/0002-fix-strsep-feature-test.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Use the official _BSD_SOURCE feature test macro instead of the meaningless
-HAVE_STRSEP macro in order to detect the availability of strsep().
-
-This allows toolchains supporting strsep() to use it instead of the custom
-implementation from dhcpdump, which also avoids the following error with some
-toolchains:
-
-	In file included from dhcpdump.c:30:0:
-	dhcpdump.c: At top level:
-	strsep.c:65:23: error: register name not specified for ???delim???
-	  register const char *delim;
-	                       ^
-
-Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
-
-diff -Nrdup dhcpdump-1.8.orig/dhcpdump.c dhcpdump-1.8/dhcpdump.c
---- dhcpdump-1.8.orig/dhcpdump.c	2008-06-24 05:26:52.000000000 +0200
-+++ dhcpdump-1.8/dhcpdump.c	2011-05-31 19:22:15.987388498 +0200
-@@ -26,7 +26,7 @@
- #include <regex.h>
- #include "dhcp_options.h"
- 
--#ifndef HAVE_STRSEP
-+#ifndef _BSD_SOURCE
- #include "strsep.c"
- #endif
- 
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 96f231962d..2413812880 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -15,8 +15,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 DHCPDUMP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
+# glibc, uclibc and musl have strsep()
+DHCPDUMP_CFLAGS = $(TARGET_CFLAGS) -DHAVE_STRSEP
+
 define DHCPDUMP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(DHCPDUMP_CFLAGS) \
 		-D_GNU_SOURCE" LIBS="$(DHCPDUMP_LIBS)"
 endef
 
