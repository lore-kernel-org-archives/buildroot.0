From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Nov 2019 23:43:36 +0100
Subject: [Buildroot] [git commit branch/next] package/rng-tools: bump to 6.8
Message-ID: <20191116223937.4CA028F079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6606937d861cc4de60e40baec1cb6cdb61b2aab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Dropped autoreconf and non-standard pthread yield patches as they merged
upstream.

[Peter: really drop autoreconf]
Signed-off-by: Matthew Weber <matthew.weber at rockwellcollins.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure.ac-fix-autoreconf.patch         | 34 ----------------------
 ...-replace-non-standard-pthread_yield-with-.patch | 33 ---------------------
 package/rng-tools/rng-tools.hash                   |  2 +-
 package/rng-tools/rng-tools.mk                     |  4 +--
 4 files changed, 2 insertions(+), 71 deletions(-)

diff --git a/package/rng-tools/0001-configure.ac-fix-autoreconf.patch b/package/rng-tools/0001-configure.ac-fix-autoreconf.patch
deleted file mode 100644
index 567a7a2891..0000000000
--- a/package/rng-tools/0001-configure.ac-fix-autoreconf.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1af1b4aab717a58da1dff8888c36c741b0f6ac03 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Apr 2019 19:22:22 +0200
-Subject: [PATCH] configure.ac: fix autoreconf
-
-Use foreign instead of gnu in AM_INIT_AUTOMAKE otherwise autoreconf will
-fail on:
-Makefile.am: error: required file './README' not found
-
-Upstream:
-https://github.com/nhorman/rng-tools/commit/1af1b4aab717a58da1dff8888c36c741b0f6ac03
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d00a6f1..26b4806 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -21,7 +21,7 @@ AC_INIT(rng-tools, 6.7, [Neil Horman <nhorman@tuxdriver.com>])
- AC_PREREQ(2.52)
- AC_CONFIG_SRCDIR([rngd.c])
- AC_CANONICAL_TARGET
--AM_INIT_AUTOMAKE([gnu])
-+AM_INIT_AUTOMAKE([foreign])
- AC_CONFIG_HEADERS([rng-tools-config.h])
- AC_CONFIG_MACRO_DIRS([m4])
- 
--- 
-2.17.1
-
diff --git a/package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch b/package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch
deleted file mode 100644
index 3ce6225fa5..0000000000
--- a/package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 96f1f4d5d718834c1fde610cbed89cfa9a2206f1 Mon Sep 17 00:00:00 2001
-From: Nicola Lunghi <25422924+nicola-lunghi@users.noreply.github.com>
-Date: Wed, 5 Jun 2019 16:38:21 +0100
-Subject: [PATCH] rngd_jitter: replace non standard pthread_yield with
- sched_yield
-
-Upsteam commit:
-https://github.com/nhorman/rng-tools/commit/96f1f4d5d718834c1fde610cbed89cfa9a2206f1
-
-[Original was Nicola's but it does not include a Signed-off-by]
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
-
-
----
- rngd_jitter.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rngd_jitter.c b/rngd_jitter.c
-index 979e613..54070ae 100644
---- a/rngd_jitter.c
-+++ b/rngd_jitter.c
-@@ -168,7 +168,7 @@ try_again:
- 		} else if (request < need) {
- 			if (request == -1) {
- 				message(LOG_DAEMON|LOG_DEBUG, "failed read: %s\n", strerror(errno));
--				pthread_yield();
-+				sched_yield();
- 			} else
- 				message(LOG_DAEMON|LOG_DEBUG, "request of random data returns %ld less than need %ld\n",
- 					request, need);
--- 
-2.17.1
-
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index a0771034fe..5989d9f022 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	b85e3530dbf943b6da03ebecaf64d0a4febfcc4f562fc7f8d886483906b15f08  rng-tools-6.7.tar.gz
+sha256	93e548d4aaf2a1897d4b677f41d8473db1c7f57648adeca18cafa1907e410bb3  rng-tools-6.8.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index fa23b3316f..ce3f19753b 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.7
+RNG_TOOLS_VERSION = 6.8
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf
 
-RNG_TOOLS_AUTORECONF = YES
-
 RNG_TOOLS_CONF_OPTS = \
 	--without-nistbeacon \
 	--without-pkcs11
