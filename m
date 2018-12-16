From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 20:42:27 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] libmpd: fix build with
 strndup
Message-ID: <20181216193935.31B488D46F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef59580140b126f0c7cb7aefae437a6114a2846d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Retrieve a patch from upstream to include config.h otherwise build will
fail when trying to redefine strndup:
libmpd-internal.h:210:10: error: expected identifier or '(' before '__extension__'
 char *   strndup     (const char *s, size_t n);

Indeed, without an include on config.h, HAVE_STRNDUP won't be defined

Fixes:
 - http://autobuild.buildroot.org/results/a174818fa768b029d19b033139f9c5e0aaaed149

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b65c8e28ce19cee143db251d48482c3c7d2692c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Fix-build-on-archlinux-missing-include.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch b/package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch
new file mode 100644
index 0000000000..be16eb9713
--- /dev/null
+++ b/package/libmpd/0001-Fix-build-on-archlinux-missing-include.patch
@@ -0,0 +1,24 @@
+From 4f946c01000fd97100e4a534b47f9c7ace0403df Mon Sep 17 00:00:00 2001
+From: QC <qball@gmpclient.org>
+Date: Thu, 9 Oct 2014 19:51:50 +0200
+Subject: [PATCH] Fix build on archlinux (missing include)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/DaveDavenport/libmpd/commit/4f946c01000fd97100e4a534b47f9c7ace0403df]
+---
+ src/libmpd-internal.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libmpd-internal.h b/src/libmpd-internal.h
+index c84c3a4..30cdc85 100644
+--- a/src/libmpd-internal.h
++++ b/src/libmpd-internal.h
+@@ -21,6 +21,7 @@
+ #define __MPD_INTERNAL_LIB_
+ 
+ #include "libmpdclient.h"
++#include <config.h>
+ struct _MpdData_real;
+ 
+ typedef struct _MpdData_real {
