From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 00:49:39 +0200
Subject: [Buildroot] [git commit] inotify-tools: fix static-only build
Message-ID: <20140718225023.412469D21B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07ce78019cdf92f7d6599b1e202ceaea1c526600
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to the inotify-tools package to fix static-only
build. Fixes:

  http://autobuild.buildroot.org/results/53e/53e98db373ee0218329a5a9c418f10d7b056b5d3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../inotify-tools-01-static-build.patch            |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/inotify-tools/inotify-tools-01-static-build.patch b/package/inotify-tools/inotify-tools-01-static-build.patch
new file mode 100644
index 0000000..ee2af02
--- /dev/null
+++ b/package/inotify-tools/inotify-tools-01-static-build.patch
@@ -0,0 +1,47 @@
+From 672a3199615e6bbaa9cc788a67ac45213a528971 Mon Sep 17 00:00:00 2001
+From: Thomas Kho <tkho@facebook.com>
+Date: Thu, 28 Oct 2010 20:21:35 -0700
+Subject: [PATCH] Support building static binaries via --enable-static-binary
+ configure flag
+
+Patch taken from upstream commit
+https://github.com/rvoicilas/inotify-tools/commit/672a3199615e6bbaa9cc788a67ac45213a528971,
+but with only the source code changes kept. The build system changes
+adding the --enable-static-binary is not needed, and not having them
+avoids the need for autoreconfiguring the package.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+ 
+diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
+index b3feca3..966e828 100644
+--- a/libinotifytools/src/inotifytools.c
++++ b/libinotifytools/src/inotifytools.c
+@@ -150,7 +150,7 @@ static int init = 0;
+ static char* timefmt = 0;
+ static regex_t* regex = 0;
+ 
+-int isdir( char const * path );
++static int isdir( char const * path );
+ void record_stats( struct inotify_event const * event );
+ int onestr_to_event(char const * event);
+ 
+@@ -193,8 +193,8 @@ int onestr_to_event(char const * event);
+  *
+  * @param  mesg  A human-readable error message shown if assertion fails.
+  */
+-void _niceassert( long cond, int line, char const * file, char const * condstr,
+-                  char const * mesg ) {
++static void _niceassert( long cond, int line, char const * file,
++                  char const * condstr, char const * mesg ) {
+ 	if ( cond ) return;
+ 
+ 	if ( mesg ) {
+@@ -1594,7 +1594,7 @@ int inotifytools_error() {
+ /**
+  * @internal
+  */
+-int isdir( char const * path ) {
++static int isdir( char const * path ) {
+ 	static struct stat64 my_stat;
+ 
+ 	if ( -1 == lstat64( path, &my_stat ) ) {
