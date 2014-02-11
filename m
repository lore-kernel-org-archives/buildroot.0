From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 11 Feb 2014 10:12:35 +0100
Subject: [Buildroot] [PATCH] sdl: fix autoreconf timing issue
Message-ID: <1392109955-742-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Context:
The autobuilders were failing on the symbol _XData32 being in conflicts.
A patch had been added to SDL to add a check to the configure.in

Problem:
Sometimes, the build would fail, because of an _XData32 symbol being in
conflicts eventhrough the patch was here.

What was happening:
Following the classic buildroot workflow:
   - Extract
   - [...]
   - Apply 001 patch, which touches configure.in AND configure
   - Apply 002 patch, which touches configure.in
   - Invoke autogen.sh
   - [...]

Right before running autogen.sh, we have configure.in which is more
recent than configure, which is fine.
We then, execute autogen.sh which, basically, runs autoconf.

If your machine was lighty loaded, the time difference between
configure.in and configure was really tiny (ms order), which seems to be
neglected by autoconf.
The results was that the configure was *NOT* generated. And our second
patch was taken into account.

If your machine was under heavy load, the time difference between the
two files would have been greater and then *maybe* picked up by
autoconf. And then the configure file was re-generated.

When the 0001 patch was introduced, SDL package did *NOT* run it's
autogen.sh, which is why it touches also the configure.
This came later, causing this behavior.

Fixes:
  http://autobuild.buildroot.net/results/d1c/d1c36f634dbf6b6e5d18444c2a23dfd129202b80/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../sdl/sdl-0001-use-correct-directfb-config.patch    | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/package/sdl/sdl-0001-use-correct-directfb-config.patch b/package/sdl/sdl-0001-use-correct-directfb-config.patch
index 2250790..ef671a1 100644
--- a/package/sdl/sdl-0001-use-correct-directfb-config.patch
+++ b/package/sdl/sdl-0001-use-correct-directfb-config.patch
@@ -4,13 +4,10 @@ The configure script has just checked for the correct directfb-config
 script, so also use it for the version check instead of whatever
 might be in the path.
 
-Also patch the generated configure, as it doesn't cleanly autoreconf.
-
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 ---
- configure    |    2 +-
  configure.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 Index: SDL-1.2.15/configure.in
 ===================================================================
@@ -25,16 +22,4 @@ Index: SDL-1.2.15/configure.in
              HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
              if test $HAVE_VERSION -ge $NEED_VERSION; then
                  DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
-Index: SDL-1.2.15/configure
-===================================================================
---- SDL-1.2.15.orig/configure
-+++ SDL-1.2.15/configure
-@@ -24958,7 +24958,7 @@
-         else
-             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
-             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
--            set -- `directfb-config --version | sed 's/\./ /g'`
-+            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
-             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
-             if test $HAVE_VERSION -ge $NEED_VERSION; then
-                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
+
-- 
1.8.5.3
