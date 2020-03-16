From: Gao Xiang <hsiangkao@aol.com>
Date: Mon, 16 Mar 2020 09:58:37 +0800
Subject: [Buildroot] [PATCH v2 1/2] package/erofs-utils: new package
References: <20200316015838.15183-1-hsiangkao.ref@aol.com>
Message-ID: <20200316015838.15183-1-hsiangkao@aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds EROFS userspace tool erofs-utils to buildroot,
which can be used to generate EROFS images.

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
---

Changes since v1:
 - use upper-case name EROFS, except all config items because
   it seems other filesystem names are all in low-case.

Hi,

EROFS filesystem [1] [2] has been included in linux 5.4 formally
and it has been enabled as a module in openSUSE, Debian, Ubuntu
and Fedora as well.

This patchset enables alternative EROFS support for buildroot and
I think it will be useful for such embedded devices which need
better dynamic performance with moderate compressed rootfs.

[1] https://static.sched.com/hosted_files/kccncosschn19chi/ce/EROFS%20file%20system_OSS2019_Final.pdf
[2] https://www.usenix.org/system/files/atc19-gao.pdf

Thanks,
Gao Xiang


 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 .../0001-erofs-utils-fix-configure.ac.patch   | 33 +++++++++++
 ...d-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch | 58 +++++++++++++++++++
 package/erofs-utils/Config.in                 | 16 +++++
 package/erofs-utils/Config.in.host            |  6 ++
 package/erofs-utils/erofs-utils.hash          |  3 +
 package/erofs-utils/erofs-utils.mk            | 22 +++++++
 8 files changed, 140 insertions(+)
 create mode 100644 package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch
 create mode 100644 package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch
 create mode 100644 package/erofs-utils/Config.in
 create mode 100644 package/erofs-utils/Config.in.host
 create mode 100644 package/erofs-utils/erofs-utils.hash
 create mode 100644 package/erofs-utils/erofs-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 146fc1bbc3..3aeb32a5de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ menu "Filesystem and flash utilities"
 	source "package/e2fsprogs/Config.in"
 	source "package/e2tools/Config.in"
 	source "package/ecryptfs-utils/Config.in"
+	source "package/erofs-utils/Config.in"
 	source "package/exfat/Config.in"
 	source "package/exfat-utils/Config.in"
 	source "package/f2fs-tools/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index dfea478868..64a88f7630 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -18,6 +18,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/erofs-utils/Config.in.host"
 	source "package/eudev/Config.in.host"
 	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
diff --git a/package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch b/package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch
new file mode 100644
index 0000000000..7ced565995
--- /dev/null
+++ b/package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch
@@ -0,0 +1,33 @@
+From eefd95b37e1042992cb07bec1ac3f6dbe199d8f0 Mon Sep 17 00:00:00 2001
+From: Haruue Icymoon <i@haruue.moe>
+Date: Fri, 22 Nov 2019 16:58:59 +0800
+Subject: [PATCH] erofs-utils: fix configure.ac
+
+./configure will fail when --with-lz4-libdir is not set, since
+$with_lz4_libdir will be an empty string and generate an empty -L
+into LDFLAGS. This patch fixes it.
+
+Link: https://lore.kernel.org/r/20191122085859.GA2414688 at usamimi.host.haruue.net
+Signed-off-by: Haruue Icymoon <i@haruue.moe>
+Fixes: d51c2d043773 ("erofs-utils: introduce lz4/lz4hc compression algorithm")
+Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f925358..870dfb9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -174,7 +174,7 @@ if test "x$enable_lz4" = "xyes"; then
+ 
+   if test "x${have_lz4h}" = "xyes" ; then
+     saved_LDFLAGS=${LDFLAGS}
+-    LDFLAGS="-L$with_lz4_libdir ${LDFLAGS}"
++    test -z "${with_lz4_libdir}" || LDFLAGS="-L$with_lz4_libdir ${LDFLAGS}"
+     AC_CHECK_LIB(lz4, LZ4_compress_destSize, [
+       have_lz4="yes"
+       have_lz4hc="yes"
+-- 
+2.20.1
+
diff --git a/package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch b/package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch
new file mode 100644
index 0000000000..0b6ecab71b
--- /dev/null
+++ b/package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch
@@ -0,0 +1,58 @@
+From 41d6c984699f30c11e8c92550239bbe5a3e5ada1 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <gaoxiang25@huawei.com>
+Date: Sat, 14 Mar 2020 17:05:37 +0800
+Subject: [PATCH] erofs-utils: avoid _LARGEFILE64_SOURCE and _GNU_SOURCE
+ redefinition
+
+This patch can be used to resolve the following build errors:
+
+compress.c:10: error: "_LARGEFILE64_SOURCE" redefined [-Werror]
+ #define _LARGEFILE64_SOURCE
+
+<command-line>: note: this is the location of the previous definition
+
+io.c:9: error: "_LARGEFILE64_SOURCE" redefined [-Werror]
+ #define _LARGEFILE64_SOURCE
+
+<command-line>: note: this is the location of the previous definition
+
+Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
+---
+ lib/compress.c | 2 ++
+ lib/io.c       | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/lib/compress.c b/lib/compress.c
+index 8337487..b14ff17 100644
+--- a/lib/compress.c
++++ b/lib/compress.c
+@@ -7,7 +7,9 @@
+  * Created by Miao Xie <miaoxie@huawei.com>
+  * with heavy changes by Gao Xiang <gaoxiang25@huawei.com>
+  */
++#ifndef _LARGEFILE64_SOURCE
+ #define _LARGEFILE64_SOURCE
++#endif
+ #include <string.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+diff --git a/lib/io.c b/lib/io.c
+index 52f9424..5b998d8 100644
+--- a/lib/io.c
++++ b/lib/io.c
+@@ -6,8 +6,12 @@
+  *             http://www.huawei.com/
+  * Created by Li Guifu <bluce.liguifu@huawei.com>
+  */
++#ifndef _LARGEFILE64_SOURCE
+ #define _LARGEFILE64_SOURCE
++#endif
++#ifndef _GNU_SOURCE
+ #define _GNU_SOURCE
++#endif
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
+ #include "erofs/io.h"
+-- 
+2.20.1
+
diff --git a/package/erofs-utils/Config.in b/package/erofs-utils/Config.in
new file mode 100644
index 0000000000..75bcbdaae2
--- /dev/null
+++ b/package/erofs-utils/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_EROFS_UTILS
+	bool "erofs-utils"
+	help
+	  Userspace utilities for EROFS filesystem
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git
+
+if BR2_PACKAGE_EROFS_UTILS
+
+config BR2_PACKAGE_EROFS_UTILS_LZ4
+	bool "lz4 support"
+	select BR2_PACKAGE_LZ4
+	help
+	  Support LZ4 compression algorithm
+
+endif
diff --git a/package/erofs-utils/Config.in.host b/package/erofs-utils/Config.in.host
new file mode 100644
index 0000000000..31ea6eb2ea
--- /dev/null
+++ b/package/erofs-utils/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_EROFS_UTILS
+	bool "host erofs-utils"
+	help
+	  Userspace utilities for EROFS filesystem
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
new file mode 100644
index 0000000000..45d4883a01
--- /dev/null
+++ b/package/erofs-utils/erofs-utils.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 508ee818dc6a02cf986647e37cb991b76f7b3e7ea303ffc9e980772de68f3b10  erofs-utils-1.0.tar.gz
+sha256 feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
new file mode 100644
index 0000000000..3f28547e8e
--- /dev/null
+++ b/package/erofs-utils/erofs-utils.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# erofs-utils
+#
+################################################################################
+
+EROFS_UTILS_VERSION = 1.0
+EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
+EROFS_UTILS_AUTORECONF = YES
+EROFS_UTILS_LICENSE = GPL-2.0+
+EROFS_UTILS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_EROFS_UTILS_LZ4),y)
+EROFS_UTILS_DEPENDENCIES += lz4
+else
+EROFS_UTILS_CONF_OPTS += --disable-lz4
+endif
+
+HOST_EROFS_UTILS_DEPENDENCIES = host-lz4
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
