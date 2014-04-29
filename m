From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Apr 2014 10:22:54 -0300
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.24.2
Message-ID: <1398777774-8493-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ine-mkostemp-for-older-version-of-uClibc.patch} |  0
 ...util-linux-003-unshare-include-libmount.h.patch | 44 ----------------------
 package/util-linux/util-linux.mk                   |  2 +-
 3 files changed, 1 insertion(+), 45 deletions(-)
 rename package/util-linux/{util-linux-004-c.h-define-mkostemp-for-older-version-of-uClibc.patch => util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch} (100%)
 delete mode 100644 package/util-linux/util-linux-003-unshare-include-libmount.h.patch

diff --git a/package/util-linux/util-linux-004-c.h-define-mkostemp-for-older-version-of-uClibc.patch b/package/util-linux/util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
similarity index 100%
rename from package/util-linux/util-linux-004-c.h-define-mkostemp-for-older-version-of-uClibc.patch
rename to package/util-linux/util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
diff --git a/package/util-linux/util-linux-003-unshare-include-libmount.h.patch b/package/util-linux/util-linux-003-unshare-include-libmount.h.patch
deleted file mode 100644
index 5ccfe7d..0000000
--- a/package/util-linux/util-linux-003-unshare-include-libmount.h.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d754315c54af9cb8222e0a04ed5b2b4b927ed176 Mon Sep 17 00:00:00 2001
-From: Ruediger Meier <ruediger.meier@ga-group.nl>
-Date: Mon, 17 Mar 2014 11:48:47 +0100
-Subject: [PATCH 1/1] unshare: include libmount.h to provide missing MS_*
- defines
-
-Since 6728ca10 we are using MS_PRIVATE and MS_REC which are not defined
-in some systems's sys/mount.h.
-
-Signed-off-by: Ruediger Meier <ruediger.meier@ga-group.nl>
----
- sys-utils/Makemodule.am | 1 +
- sys-utils/unshare.c     | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
-index 30b5d3e..93a2c8d 100644
---- a/sys-utils/Makemodule.am
-+++ b/sys-utils/Makemodule.am
-@@ -296,6 +296,7 @@ usrbin_exec_PROGRAMS += unshare
- dist_man_MANS += sys-utils/unshare.1
- unshare_SOURCES = sys-utils/unshare.c
- unshare_LDADD = $(LDADD) libcommon.la
-+unshare_CFLAGS = $(AM_CFLAGS) -I$(ul_libmount_incdir)
- endif
- 
- if BUILD_NSENTER
-diff --git a/sys-utils/unshare.c b/sys-utils/unshare.c
-index 91e0ec7..1240293 100644
---- a/sys-utils/unshare.c
-+++ b/sys-utils/unshare.c
-@@ -27,6 +27,9 @@
- #include <sys/wait.h>
- #include <sys/mount.h>
- 
-+/* we only need some defines missing in sys/mount.h, no libmount linkage */
-+#include <libmount.h>
-+
- #include "nls.h"
- #include "c.h"
- #include "closestream.h"
--- 
-1.9.0
-
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4b8f731..811d8ac 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_VERSION_MAJOR = 2.24
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
1.8.3.2
