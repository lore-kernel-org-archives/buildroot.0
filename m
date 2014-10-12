From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 16:58:24 +0200
Subject: [Buildroot] [PATCH] inotify-tools: Bump version
Message-ID: <1413125904-22372-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The release is a few years old but the repository is still going, so
uses the SHA1 and uses the github function to download it.

Also, it now needs AUTORECONF.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../inotify-tools-01-static-build.patch            | 47 ----------------------
 package/inotify-tools/inotify-tools.mk             |  5 ++-
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/inotify-tools/inotify-tools-01-static-build.patch

diff --git a/package/inotify-tools/inotify-tools-01-static-build.patch b/package/inotify-tools/inotify-tools-01-static-build.patch
deleted file mode 100644
index ee2af02..0000000
--- a/package/inotify-tools/inotify-tools-01-static-build.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 672a3199615e6bbaa9cc788a67ac45213a528971 Mon Sep 17 00:00:00 2001
-From: Thomas Kho <tkho@facebook.com>
-Date: Thu, 28 Oct 2010 20:21:35 -0700
-Subject: [PATCH] Support building static binaries via --enable-static-binary
- configure flag
-
-Patch taken from upstream commit
-https://github.com/rvoicilas/inotify-tools/commit/672a3199615e6bbaa9cc788a67ac45213a528971,
-but with only the source code changes kept. The build system changes
-adding the --enable-static-binary is not needed, and not having them
-avoids the need for autoreconfiguring the package.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
- 
-diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
-index b3feca3..966e828 100644
---- a/libinotifytools/src/inotifytools.c
-+++ b/libinotifytools/src/inotifytools.c
-@@ -150,7 +150,7 @@ static int init = 0;
- static char* timefmt = 0;
- static regex_t* regex = 0;
- 
--int isdir( char const * path );
-+static int isdir( char const * path );
- void record_stats( struct inotify_event const * event );
- int onestr_to_event(char const * event);
- 
-@@ -193,8 +193,8 @@ int onestr_to_event(char const * event);
-  *
-  * @param  mesg  A human-readable error message shown if assertion fails.
-  */
--void _niceassert( long cond, int line, char const * file, char const * condstr,
--                  char const * mesg ) {
-+static void _niceassert( long cond, int line, char const * file,
-+                  char const * condstr, char const * mesg ) {
- 	if ( cond ) return;
- 
- 	if ( mesg ) {
-@@ -1594,7 +1594,7 @@ int inotifytools_error() {
- /**
-  * @internal
-  */
--int isdir( char const * path ) {
-+static int isdir( char const * path ) {
- 	static struct stat64 my_stat;
- 
- 	if ( -1 == lstat64( path, &my_stat ) ) {
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 96b23ce..3502525 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-INOTIFY_TOOLS_VERSION = 3.14
-INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools
+INOTIFY_TOOLS_VERSION = 06007d350faa8731c67e186923ab417486104719
+INOTIFY_TOOLS_SITE = $(call github,rvoicilas,inotify-tools,$(INOTIFY_TOOLS_VERSION))
 INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 INOTIFY_TOOLS_INSTALL_STAGING = YES
+INOTIFY_TOOLS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.1.1
