From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Jun 2017 21:14:48 +0200
Subject: [Buildroot] [git commit] package/dt-utils: new package
Message-ID: <20170624100504.29544800E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9093a64bcfc6f6e9813cc0cba95e382d25eff079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two upstreamable patches for this package to fix uClibc
and musl builds.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-common-Rename-strlcpy-to-DT_strlcpy.patch | 58 ++++++++++++++++++++++
 .../0002-common-Include-sys-types.h-header.patch   | 38 ++++++++++++++
 package/dt-utils/Config.in                         | 11 ++++
 package/dt-utils/dt-utils.mk                       | 15 ++++++
 6 files changed, 124 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 315849a..41940b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1069,6 +1069,7 @@ N:	Marcin Niestroj <m.niestroj@grinn-global.com>
 F:	board/grinn/
 F:	configs/grinn_*
 F:	package/argparse/
+F:	package/dt-utils/
 F:	package/easydbus/
 F:	package/lua-flu/
 F:	package/luaossl/
diff --git a/package/Config.in b/package/Config.in
index 95068fd..b0b829c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ endmenu
 	source "package/devmem2/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
+	source "package/dt-utils/Config.in"
 	source "package/dtv-scan-tables/Config.in"
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
diff --git a/package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch b/package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch
new file mode 100644
index 0000000..79c43d6
--- /dev/null
+++ b/package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch
@@ -0,0 +1,58 @@
+From 3d229cc0f8dc81335c53b1f7471ef82ef2f6e570 Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Fri, 23 Jun 2017 11:11:04 +0200
+Subject: [PATCH] common: Rename strlcpy to DT_strlcpy
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+strlcpy function is defined in uClibc library, causing "static
+declaration of ???strlcpy??? follows non-static declaration" build
+errors.
+
+Rename internal strlcpy function to DT_strlcpy to avoid conflicts.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ src/dt/common.h | 4 ++--
+ src/libdt.c     | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/dt/common.h b/src/dt/common.h
+index f6bad44..992e28f 100644
+--- a/src/dt/common.h
++++ b/src/dt/common.h
+@@ -168,7 +168,7 @@ static inline char *barebox_asprintf(const char *fmt, ...)
+ #define basprintf(fmt, arg...) barebox_asprintf(fmt, ##arg)
+ 
+ /**
+- * strlcpy - Copy a %NUL terminated string into a sized buffer
++ * DT_strlcpy - Copy a %NUL terminated string into a sized buffer
+  * @dest: Where to copy the string to
+  * @src: Where to copy the string from
+  * @size: size of destination buffer
+@@ -178,7 +178,7 @@ static inline char *barebox_asprintf(const char *fmt, ...)
+  * of course, the buffer size is zero). It does not pad
+  * out the result like strncpy() does.
+  */
+-static inline size_t strlcpy(char *dest, const char *src, size_t size)
++static inline size_t DT_strlcpy(char *dest, const char *src, size_t size)
+ {
+ 	size_t ret = strlen(src);
+ 
+diff --git a/src/libdt.c b/src/libdt.c
+index 4db5160..3adeed2 100644
+--- a/src/libdt.c
++++ b/src/libdt.c
+@@ -1503,7 +1503,7 @@ int of_modalias_node(struct device_node *node, char *modalias, int len)
+ 	if (!compatible || strlen(compatible) > cplen)
+ 		return -ENODEV;
+ 	p = strchr(compatible, ',');
+-	strlcpy(modalias, p ? p + 1 : compatible, len);
++	DT_strlcpy(modalias, p ? p + 1 : compatible, len);
+ 	return 0;
+ }
+ 
+-- 
+2.13.1
+
diff --git a/package/dt-utils/0002-common-Include-sys-types.h-header.patch b/package/dt-utils/0002-common-Include-sys-types.h-header.patch
new file mode 100644
index 0000000..a49d468
--- /dev/null
+++ b/package/dt-utils/0002-common-Include-sys-types.h-header.patch
@@ -0,0 +1,38 @@
+From b8bc4e83bf447b6330ece54e94a1684d12ecdd0b Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Fri, 23 Jun 2017 12:00:30 +0200
+Subject: [PATCH] common: Include sys/types.h header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Build with musl library fails with following error:
+
+In file included from src/crypto/sha1.c:21:0:
+./src/digest.h:95:10: error: unknown type name ???ulong???
+          ulong start, ulong size);
+...
+
+Fix that by including sys/types.h header in common.h, so ulong type
+is defined with musl library.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ src/dt/common.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/dt/common.h b/src/dt/common.h
+index 992e28f..1425c53 100644
+--- a/src/dt/common.h
++++ b/src/dt/common.h
+@@ -13,6 +13,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ 
+ #include <mtd/mtd-abi.h>
+ 
+-- 
+2.13.1
+
diff --git a/package/dt-utils/Config.in b/package/dt-utils/Config.in
new file mode 100644
index 0000000..7c9a1de
--- /dev/null
+++ b/package/dt-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DT_UTILS
+	bool "dt-utils"
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Tools for flattened device-tree dumping and barebox state
+	  manipulation.
+
+	  https://git.pengutronix.de/cgit/tools/dt-utils/
+
+comment "dt-utils needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
new file mode 100644
index 0000000..5b13750
--- /dev/null
+++ b/package/dt-utils/dt-utils.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# dt-utils
+#
+################################################################################
+
+DT_UTILS_VERSION = v2017.03.0
+DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
+DT_UTILS_SITE_METHOD = git
+DT_UTILS_LICENSE = GPL-2.0
+DT_UTILS_LICENSE_FILES = COPYING
+DT_UTILS_DEPENDENCIES = udev
+DT_UTILS_AUTORECONF = YES
+
+$(eval $(autotools-package))
