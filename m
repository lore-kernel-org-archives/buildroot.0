From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:10:24 +0200
Subject: [Buildroot] [git commit] util-linux: unshare: include libmount.h to
	provide missing MS_* defines
Message-ID: <20140406121030.9EA1B9BCF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb8774327ad06e8f59faf4da4ab40ffffd39d1dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upstream patch: d754315c54af9cb8222e0a04ed5b2b4b927ed176

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...util-linux-003-unshare-include-libmount.h.patch |   44 ++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux-003-unshare-include-libmount.h.patch b/package/util-linux/util-linux-003-unshare-include-libmount.h.patch
new file mode 100644
index 0000000..5ccfe7d
--- /dev/null
+++ b/package/util-linux/util-linux-003-unshare-include-libmount.h.patch
@@ -0,0 +1,44 @@
+From d754315c54af9cb8222e0a04ed5b2b4b927ed176 Mon Sep 17 00:00:00 2001
+From: Ruediger Meier <ruediger.meier@ga-group.nl>
+Date: Mon, 17 Mar 2014 11:48:47 +0100
+Subject: [PATCH 1/1] unshare: include libmount.h to provide missing MS_*
+ defines
+
+Since 6728ca10 we are using MS_PRIVATE and MS_REC which are not defined
+in some systems's sys/mount.h.
+
+Signed-off-by: Ruediger Meier <ruediger.meier@ga-group.nl>
+---
+ sys-utils/Makemodule.am | 1 +
+ sys-utils/unshare.c     | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
+index 30b5d3e..93a2c8d 100644
+--- a/sys-utils/Makemodule.am
++++ b/sys-utils/Makemodule.am
+@@ -296,6 +296,7 @@ usrbin_exec_PROGRAMS += unshare
+ dist_man_MANS += sys-utils/unshare.1
+ unshare_SOURCES = sys-utils/unshare.c
+ unshare_LDADD = $(LDADD) libcommon.la
++unshare_CFLAGS = $(AM_CFLAGS) -I$(ul_libmount_incdir)
+ endif
+ 
+ if BUILD_NSENTER
+diff --git a/sys-utils/unshare.c b/sys-utils/unshare.c
+index 91e0ec7..1240293 100644
+--- a/sys-utils/unshare.c
++++ b/sys-utils/unshare.c
+@@ -27,6 +27,9 @@
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ 
++/* we only need some defines missing in sys/mount.h, no libmount linkage */
++#include <libmount.h>
++
+ #include "nls.h"
+ #include "c.h"
+ #include "closestream.h"
+-- 
+1.9.0
+
