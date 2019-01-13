From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jan 2019 14:56:35 +0100
Subject: [Buildroot] [PATCH v2,1/1] lxc: bump to version 3.1.0
Message-ID: <20190113135635.24358-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove both patches (already in version) and so remove LXC_AUTORECONF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix typo in commit log and remove LXC_AUTORECONF=YES

 ...01-stringutils-include-stdarg-for-va_list.patch | 30 ------------------
 ...gure.ac-fix-build-without-stack-protector.patch | 37 ----------------------
 package/lxc/lxc.hash                               |  2 +-
 package/lxc/lxc.mk                                 |  4 +--
 4 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 package/lxc/0001-stringutils-include-stdarg-for-va_list.patch
 delete mode 100644 package/lxc/0002-configure.ac-fix-build-without-stack-protector.patch

diff --git a/package/lxc/0001-stringutils-include-stdarg-for-va_list.patch b/package/lxc/0001-stringutils-include-stdarg-for-va_list.patch
deleted file mode 100644
index b1fe989237..0000000000
--- a/package/lxc/0001-stringutils-include-stdarg-for-va_list.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b7df06ad14c04f18b7db5b64d5142b802bf64cb2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 3 Dec 2018 22:18:16 +0100
-Subject: [PATCH] stringutils: include stdarg for va_list
-
-Fixes:
- - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/lxc/lxc/commit/b7df06ad14c04f18b7db5b64d5142b802bf64cb2]
----
- src/lxc/string_utils.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/lxc/string_utils.h b/src/lxc/string_utils.h
-index 4065e4e6..d4e633cc 100644
---- a/src/lxc/string_utils.h
-+++ b/src/lxc/string_utils.h
-@@ -20,6 +20,8 @@
- #ifndef __LXC_STRING_UTILS_H
- #define __LXC_STRING_UTILS_H
- 
-+#include <stdarg.h>
-+
- #include "config.h"
- 
- #include "initutils.h"
--- 
-2.14.1
-
diff --git a/package/lxc/0002-configure.ac-fix-build-without-stack-protector.patch b/package/lxc/0002-configure.ac-fix-build-without-stack-protector.patch
deleted file mode 100644
index 744fcbbed3..0000000000
--- a/package/lxc/0002-configure.ac-fix-build-without-stack-protector.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3aa7271157d3c815a4426c1f8eaea2f3b6dafa6a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 4 Dec 2018 08:40:05 +0100
-Subject: [PATCH] configure.ac: fix build without stack-protector
-
-Compiler based hardening (including -fstack-protector-strong) are
-enabled since version 3.0.3 and
-https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a
-
-However, some compilers could missed the needed library (-lssp or
--lssp_nonshared) at linking step so use ax_check_link_flag instead of
-ax_check_compile_flag
-
-Fixes:
- - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9a9adac3..032e4cfd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -696,7 +696,7 @@ AX_CHECK_COMPILE_FLAG([-Wcast-align], [CFLAGS="$CFLAGS -Wcast-align"],,[-Werror]
- AX_CHECK_COMPILE_FLAG([-Wstrict-prototypes], [CFLAGS="$CFLAGS -Wstrict-prototypes"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-fno-strict-aliasing], [CFLAGS="$CFLAGS -fno-strict-aliasing"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-fstack-clash-protection], [CFLAGS="$CFLAGS -fstack-clash-protection"],,[-Werror])
--AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
-+AX_CHECK_LINK_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-g], [CFLAGS="$CFLAGS -g"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([--mcet -fcf-protection], [CFLAGS="$CFLAGS --mcet -fcf-protection"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-Werror=implicit-function-declaration], [CFLAGS="$CFLAGS -Werror=implicit-function-declaration"],,[-Werror])
--- 
-2.14.1
-
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index c741a5baba..aad38ca57a 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	620cb832cc02c63bf4d330657bf6176544e145da281ee384a34d689635a19841	lxc-3.0.3.tar.gz
+sha256	4d8772c25baeaea2c37a954902b88c05d1454c91c887cb6a0997258cfac3fdc5	lxc-3.1.0.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index c758a15b9d..a059fd578e 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LXC_VERSION = 3.0.3
+LXC_VERSION = 3.1.0
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
-# We're patching configure.ac
-LXC_AUTORECONF = YES
 
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-werror \
-- 
2.14.1
