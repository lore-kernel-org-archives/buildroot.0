From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Dec 2015 23:38:00 +0100
Subject: [Buildroot] [git commit] flite: fix alsa version check
Message-ID: <20151207073616.F26468198D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25129550c325ee29ccb976c136c7f9bb56c9ef03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The alsa version check broke with the recent alsa-lib bump to 1.1.0 as it
was only checking subminor >= 11.

Fixes:

http://autobuild.buildroot.net/results/b62/b62cd6de04ff83bf7025a8f1aca49dbcbc8d7e2d/
http://autobuild.buildroot.net/results/2c9/2c98458fef8c38ff36cd20d77c2d651129146857/
http://autobuild.buildroot.net/results/ca7/ca78c1029ef1d91b66bbc91c5e5269bf663afe8e/
http://autobuild.buildroot.net/results/eac/eacb973e7fcce385d1686ab364f60dec9e0dd2e9/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flite/0003-fix-alsa-version-check.patch | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/flite/0003-fix-alsa-version-check.patch b/package/flite/0003-fix-alsa-version-check.patch
new file mode 100644
index 0000000..8832ac3
--- /dev/null
+++ b/package/flite/0003-fix-alsa-version-check.patch
@@ -0,0 +1,26 @@
+[PATCH] fix alsa version check
+
+Check the entire alsa version, and not just the subminor - As this broke
+with the recent alsa 1.0.x -> 1.1.0 release.
+
+It is not clear what major/minor versions the check was supposed to be
+against (0.9 or 1.0).  I went with 1.0.11 to be on the safe side.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ flite-1.4-release/configure.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: flite-1.4/flite-1.4-release/configure.in
+===================================================================
+--- flite-1.4.orig/flite-1.4-release/configure.in
++++ flite-1.4/flite-1.4-release/configure.in
+@@ -270,7 +270,7 @@
+ # the one I know -- you can still specific --with-audio=alsa
+ AC_TRY_COMPILE([#include <alsa/version.h>],
+                [int j=
+-                #if SND_LIB_SUBMINOR >= 11
++                #if SND_LIB_VERSION >= 0x1000b
+                 3;
+                 #endif],
+               [AUDIODRIVER="alsa"
