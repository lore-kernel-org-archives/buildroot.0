From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 00:24:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] sysvinit: fix compilation
	error against musl
Message-ID: <20170905222811.9738E7FF63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd86df9e0b1a885fe86b2fed23a86f435f39dd32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This commit adds a patch to the sysvinit package that fixes various
build issues against musl due to missing header includes.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7ec15db9db138c71133413fbc9f354de9b74e309)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-musl-fix-compilation-errors.patch         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/sysvinit/0002-musl-fix-compilation-errors.patch b/package/sysvinit/0002-musl-fix-compilation-errors.patch
new file mode 100644
index 0000000..5dcdecf
--- /dev/null
+++ b/package/sysvinit/0002-musl-fix-compilation-errors.patch
@@ -0,0 +1,38 @@
+Fix various compilation errors when compiling against must libc
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+
+diff -Nupr a/src/init.c b/src/init.c
+--- a/src/init.c	2017-08-13 18:44:27.000000000 +0300
++++ b/src/init.c	2017-08-13 18:34:45.000000000 +0300
+@@ -37,6 +37,7 @@
+ #include <sys/kd.h>
+ #endif
+ #include <sys/resource.h>
++#include <sys/ttydefaults.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
+diff -Nupr a/src/init.h b/src/init.h
+--- a/src/init.h	2017-08-13 19:35:46.000000000 +0300
++++ b/src/init.h	2017-08-13 19:36:01.000000000 +0300
+@@ -22,6 +22,8 @@
+  *
+  */
+ 
++#include <time.h>
++
+ /* Standard configuration */
+ #define CHANGE_WAIT 0			/* Change runlevel while
+ 					   waiting for a process to exit? */
+diff -Nupr a/src/mountpoint.c b/src/mountpoint.c
+--- a/src/mountpoint.c	2017-08-13 20:28:26.000000000 +0300
++++ b/src/mountpoint.c	2017-08-13 20:28:40.000000000 +0300
+@@ -24,6 +24,7 @@
+  */
+ 
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <string.h>
