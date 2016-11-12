From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Nov 2016 19:17:56 +0100
Subject: [Buildroot] [git commit] package/sane-backends: fix musl build issue
Message-ID: <20161112181807.7E3D98184E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6795d79317b47bbd5407a9c0a4e3bbe0fbb0501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We should include config.h from sanei_backend.h in order to use the
correct if/else HAVE_FOO.

For some reason with Glibc or uClibc there is no problem but with musl
we have the following weird issue:

In file included from epsonds.h:41:0,
                 from epsonds-jpeg.c:18:
../include/sane/sanei_backend.h:99:33: error: expected ';', identifier or '(' before 'int'

../include/sane/sanei_backend.h:99:33: warning: useless type name in empty declaration

That's because HAVE_SIGPROCMASK is not defined although it's correctly
detected by the configure script.

$ grep config.log
config.log:#define HAVE_SIGPROCMASK 1

So, include config.h to avoid to redefine sigset_t.

Fixes:
http://autobuild.buildroot.net/results/9f1/9f1f1cb727b5c5407e69172280a3dee880e55cdf

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-sane_backend-add-missing-config.h.patch   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/sane-backends/0003-sane_backend-add-missing-config.h.patch b/package/sane-backends/0003-sane_backend-add-missing-config.h.patch
new file mode 100644
index 0000000..8e56b02
--- /dev/null
+++ b/package/sane-backends/0003-sane_backend-add-missing-config.h.patch
@@ -0,0 +1,49 @@
+From 13aadf79659dd238b618c8be7c1de44960bd5d50 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 11 Nov 2016 22:20:03 +0100
+Subject: [PATCH] sane_backend: add missing config.h
+
+We should include config.h from sanei_backend.h in order to use the
+correct if/else HAVE_FOO.
+
+For some reason with Glibc or uClibc there is no problem but with musl
+we have the following weird issue:
+
+In file included from epsonds.h:41:0,
+                 from epsonds-jpeg.c:18:
+../include/sane/sanei_backend.h:99:33: error: expected ';', identifier or '(' before 'int'
+ # define sigset_t               int
+                                 ^
+../include/sane/sanei_backend.h:99:33: warning: useless type name in empty declaration
+
+That's because HAVE_SIGPROCMASK is not defined although it's correctly
+detected by the configure script.
+
+$ grep config.log
+config.log:#define HAVE_SIGPROCMASK 1
+
+So, include config.h to avoid to redefine sigset_t.
+
+Fixes:
+http://autobuild.buildroot.net/results/9f1/9f1f1cb727b5c5407e69172280a3dee880e55cdf
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/sane/sanei_backend.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/sane/sanei_backend.h b/include/sane/sanei_backend.h
+index 1b5afe2..2a96532 100644
+--- a/include/sane/sanei_backend.h
++++ b/include/sane/sanei_backend.h
+@@ -8,6 +8,7 @@
+  * @sa sanei.h sanei_thread.h
+  */
+ 
++#include "../include/sane/config.h"
+ 
+ /*
+  * Compiler related options
+-- 
+2.5.5
+
