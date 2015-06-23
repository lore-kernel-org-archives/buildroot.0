From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Jun 2015 18:59:05 +0200
Subject: [Buildroot] [git commit] pinentry: add patch to fix ncursesw
	include path
Message-ID: <20150623165926.7441C807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d10204ba5880b1fd3900908af15461f51f9f066
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream pinentry seems to assume a fixed include path for ncursesw,
while still using pkg-config to check what that path should be.
This results in detecting the library during config failing to include
it correctly during build.

Fixes:
  http://autobuild.buildroot.org/results/d8d/d8d33efd16cc94dc9d9d4b2d7615a0abb5752ee4/
  http://autobuild.buildroot.org/results/c48/c4805785077e955c61f246d0e4d8416d8dbd10b1/
  http://autobuild.buildroot.org/results/144/14483d35ab5009e854c7ce86e26942fdefd5c1f0
and bunch of others.

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-remove-hard-wired-ncursesw-include-path.patch |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch b/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch
new file mode 100644
index 0000000..c9903c4
--- /dev/null
+++ b/package/pinentry/0001-remove-hard-wired-ncursesw-include-path.patch
@@ -0,0 +1,32 @@
+From cf84bf3ef505059d42184b22cf38f89336bec43d Mon Sep 17 00:00:00 2001
+From: Gergely Imreh <imrehg@gmail.com>
+Date: Mon, 22 Jun 2015 07:51:17 +0000
+Subject: [PATCH 1/1] remove hard-wired ncursesw include path
+
+Don't assume that the ncursesw headers are in ../usr/include/ncursesw/..,
+and pkg-config finds the correct include path anyways.
+
+Signed-off-by: Gergely Imreh <imrehg@gmail.com>
+---
+ pinentry/pinentry-curses.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/pinentry/pinentry-curses.c b/pinentry/pinentry-curses.c
+index 235435a..bdcd0f4 100644
+--- a/pinentry/pinentry-curses.c
++++ b/pinentry/pinentry-curses.c
+@@ -22,11 +22,7 @@
+ #include <config.h>
+ #endif
+ #include <assert.h>
+-#ifdef HAVE_NCURSESW
+-#include <ncursesw/curses.h>
+-#else
+ #include <curses.h>
+-#endif
+ #include <signal.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+-- 
+1.9.1
+
