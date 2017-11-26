From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:11:21 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] openssh: fix
 getpagesize() related static linking issue
Message-ID: <20171126184640.69316802DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3218c1bca24dcf65b8d4e59b8caa0ccaa8b15963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes:
http://autobuild.buildroot.net/results/8cc/8cc30818a400c7a392a3de787cabc9cd8425495f/

The configure script checks for getpagesize() and sets HAVE_GETPAGESIZE in
config.h, but bsd-getpagesize.c forgot to include includes.h (which
indirectly includes config.h) so the checks always fails, causing linker
issues when linking statically on systems with getpagesize().

Fix it by including includes.h.

Patch submitted upstream:
https://lists.mindrot.org/pipermail/openssh-unix-dev/2017-October/036413.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit cc856401e8ac6a2c7a8767737b73dde933a5798a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pat-bsd-getpagesize.c-include-includes.h-.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch b/package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch
new file mode 100644
index 0000000..ce60072
--- /dev/null
+++ b/package/openssh/0005-openbsd-compat-bsd-getpagesize.c-include-includes.h-.patch
@@ -0,0 +1,35 @@
+From 9a43657a3dcb868b4f36ade3aba5dcf0871fb412 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 30 Oct 2017 23:36:56 +0100
+Subject: [PATCH] openbsd-compat/bsd-getpagesize.c: include includes.h for
+ config.h defines
+
+The configure script checks for getpagesize() and sets HAVE_GETPAGESIZE in
+config.h, but bsd-getpagesize.c forgot to include includes.h (which
+indirectly includes config.h) so the checks always fails, causing linker
+issues when linking statically on systems with getpagesize():
+
+http://autobuild.buildroot.net/results/8cc/8cc30818a400c7a392a3de787cabc9cd8425495f/build-end.log
+
+Fix it by including includes.h
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ openbsd-compat/bsd-getpagesize.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/openbsd-compat/bsd-getpagesize.c b/openbsd-compat/bsd-getpagesize.c
+index 9daddfbd..416a8d4c 100644
+--- a/openbsd-compat/bsd-getpagesize.c
++++ b/openbsd-compat/bsd-getpagesize.c
+@@ -1,5 +1,7 @@
+ /* Placed in the public domain */
+ 
++#include "includes.h"
++
+ #ifndef HAVE_GETPAGESIZE
+ 
+ #include <unistd.h>
+-- 
+2.11.0
+
