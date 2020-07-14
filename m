From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:44:31 +0200
Subject: [Buildroot] [git commit] package/umtprd: fix build on musl
Message-ID: <20200714214047.EC51D8693C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d96a1a346e867c7060ed4de68f034ff0f9e3eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/0b577a2f0582e38d33bd41a4d8e4cb7ec6eab52b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ons-build-errors-warnings-on-some-systems.patch | 38 +++++++++++
 ...ng-definition-build-error-on-some-systems.patch | 78 ++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch b/package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch
new file mode 100644
index 0000000000..78dfb3657f
--- /dev/null
+++ b/package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch
@@ -0,0 +1,38 @@
+From b6eccf2160fd16405542249c62a87aff2fbfcd33 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jean-Fran=C3=A7ois=20DEL=20NERO?=
+ <jeanfrancoisdelnero@free.fr>
+Date: Sat, 16 May 2020 09:37:40 +0200
+Subject: [PATCH] Fix the missing definitions build errors/warnings on some
+ systems.
+
+[Retrieved from:
+https://github.com/viveris/uMTP-Responder/commit/b6eccf2160fd16405542249c62a87aff2fbfcd33]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/usb_gadget.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/usb_gadget.c b/src/usb_gadget.c
+index 856bb53..9f3896f 100644
+--- a/src/usb_gadget.c
++++ b/src/usb_gadget.c
+@@ -27,7 +27,10 @@
+ 
+ #include "buildconf.h"
+ 
++#include <endian.h>
+ #include <inttypes.h>
++#include <pthread.h>
++#include <sys/time.h>
+ 
+ #include <sys/ioctl.h>
+ 
+@@ -38,7 +41,7 @@
+ #include <unistd.h>
+ #include <string.h>
+ #include <stdio.h>
+-#include <pthread.h>
++
+ #include <signal.h>
+ 
+ #include <errno.h>
diff --git a/package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch b/package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch
new file mode 100644
index 0000000000..b7d211c6eb
--- /dev/null
+++ b/package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch
@@ -0,0 +1,78 @@
+From 2e7aaf0c373a0e3a271f4b374bd98de8a80aefb0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jean-Fran=C3=A7ois=20DEL=20NERO?=
+ <jeanfrancoisdelnero@free.fr>
+Date: Sat, 16 May 2020 09:20:01 +0200
+Subject: [PATCH] Fix the pthread missing definition build error on some
+ systems.
+
+[Retrieved from:
+https://github.com/viveris/uMTP-Responder/commit/2e7aaf0c373a0e3a271f4b374bd98de8a80aefb0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/fs_handles_db.c                    | 1 +
+ src/mtp_cfg.c                          | 1 +
+ src/mtp_datasets.c                     | 1 +
+ src/mtp_operations/mtp_op_sendobject.c | 1 +
+ src/mtp_properties.c                   | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/src/fs_handles_db.c b/src/fs_handles_db.c
+index a91268a..178bd90 100644
+--- a/src/fs_handles_db.c
++++ b/src/fs_handles_db.c
+@@ -26,6 +26,7 @@
+ #include "buildconf.h"
+ 
+ #include <inttypes.h>
++#include <pthread.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <string.h>
+diff --git a/src/mtp_cfg.c b/src/mtp_cfg.c
+index 30f473a..1f2302d 100644
+--- a/src/mtp_cfg.c
++++ b/src/mtp_cfg.c
+@@ -26,6 +26,7 @@
+ #include "buildconf.h"
+ 
+ #include <inttypes.h>
++#include <pthread.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+diff --git a/src/mtp_datasets.c b/src/mtp_datasets.c
+index 95cec68..fbd67e2 100644
+--- a/src/mtp_datasets.c
++++ b/src/mtp_datasets.c
+@@ -26,6 +26,7 @@
+ #include "buildconf.h"
+ 
+ #include <inttypes.h>
++#include <pthread.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/statvfs.h>
+diff --git a/src/mtp_operations/mtp_op_sendobject.c b/src/mtp_operations/mtp_op_sendobject.c
+index 8af2c6b..8e1498c 100644
+--- a/src/mtp_operations/mtp_op_sendobject.c
++++ b/src/mtp_operations/mtp_op_sendobject.c
+@@ -26,6 +26,7 @@
+ #include "buildconf.h"
+ 
+ #include <inttypes.h>
++#include <pthread.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <pthread.h>
+diff --git a/src/mtp_properties.c b/src/mtp_properties.c
+index 4500cd4..5cf6e2d 100644
+--- a/src/mtp_properties.c
++++ b/src/mtp_properties.c
+@@ -26,6 +26,7 @@
+ #include "buildconf.h"
+ 
+ #include <inttypes.h>
++#include <pthread.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <sys/types.h>
