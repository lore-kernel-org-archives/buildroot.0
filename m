From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 21:46:01 +0100
Subject: [Buildroot] [git commit] dropbear: bump version
Message-ID: <20140219204832.297369CABF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=171fb7aa0c60c394e3868216dac6725b380e41f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of issues. From the changelog:

- Avoid getting stuck in a loop writing huge key files, reported by Bruno
  Thomsen
- Avoid crash on exit due to cleaned up keys before last packets are sent,
  debugged by Ronald Wahl
- Fix a race condition in rekeying where Dropbear would exit if it received a
  still-in-flight packet after initiating rekeying. Reported by Oliver Metz.
  This is a longstanding bug but is triggered more easily since 2013.57
- Ensure that generated RSA keys are always exactly the length
  requested. Previously Dropbear always generated N+16 or N+15 bit keys.
  Thanks to Unit 193
- Fix DROPBEAR_CLI_IMMEDIATE_AUTH mode which saves a network round trip if the
  first public key succeeds. Still not enabled by default, needs more
  compatibility testing with other implementations.
- Fix signal handlers so that errno is saved, thanks to Erik Ahl??n for a patch
  and Mark Wickham for independently spotting the same problem.

And at the same time get rid of the TIMEVAL_TO_TIMESPEC as dropbear provides a
fallback implementation if not available (and has done so since 2006).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dropbear-fix-missing-TIMEVAL_TO_TIMESPEC.patch |   11 -----------
 package/dropbear/dropbear.mk                       |    2 +-
 2 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/package/dropbear/dropbear-fix-missing-TIMEVAL_TO_TIMESPEC.patch b/package/dropbear/dropbear-fix-missing-TIMEVAL_TO_TIMESPEC.patch
deleted file mode 100644
index 8060684..0000000
--- a/package/dropbear/dropbear-fix-missing-TIMEVAL_TO_TIMESPEC.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -ur dropbear-0.48/includes.h dropbear-0.48-patched/includes.h
---- dropbear-0.48/includes.h	2006-03-09 09:06:02.000000000 -0600
-+++ dropbear-0.48-patched/includes.h	2006-03-15 22:36:12.000000000 -0600
-@@ -35,6 +35,7 @@
- #include <sys/param.h> /* required for BSD4_4 define */
- #include <sys/socket.h>
- #include <sys/stat.h>
-+#define _GNU_SOURCE
- #include <sys/time.h>
- #include <sys/un.h>
- #include <sys/wait.h>
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 3ef6c8d..2ac6211 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2013.62
+DROPBEAR_VERSION = 2014.63
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
