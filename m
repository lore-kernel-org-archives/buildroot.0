From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon,  6 Aug 2018 21:25:36 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: bump to v2018.05.0 and add
 hashes
Message-ID: <20180806192536.11559-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop mainlined patches.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 ...-common-Rename-strlcpy-to-DT_strlcpy.patch | 58 -------------------
 ...02-common-Include-sys-types.h-header.patch | 38 ------------
 package/dt-utils/dt-utils.hash                |  3 +
 package/dt-utils/dt-utils.mk                  |  2 +-
 4 files changed, 4 insertions(+), 97 deletions(-)
 delete mode 100644 package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch
 delete mode 100644 package/dt-utils/0002-common-Include-sys-types.h-header.patch
 create mode 100644 package/dt-utils/dt-utils.hash

diff --git a/package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch b/package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch
deleted file mode 100644
index 79c43d6a5d..0000000000
--- a/package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 3d229cc0f8dc81335c53b1f7471ef82ef2f6e570 Mon Sep 17 00:00:00 2001
-From: Marcin Niestroj <m.niestroj@grinn-global.com>
-Date: Fri, 23 Jun 2017 11:11:04 +0200
-Subject: [PATCH] common: Rename strlcpy to DT_strlcpy
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-strlcpy function is defined in uClibc library, causing "static
-declaration of ?strlcpy? follows non-static declaration" build
-errors.
-
-Rename internal strlcpy function to DT_strlcpy to avoid conflicts.
-
-Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
----
- src/dt/common.h | 4 ++--
- src/libdt.c     | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/dt/common.h b/src/dt/common.h
-index f6bad44..992e28f 100644
---- a/src/dt/common.h
-+++ b/src/dt/common.h
-@@ -168,7 +168,7 @@ static inline char *barebox_asprintf(const char *fmt, ...)
- #define basprintf(fmt, arg...) barebox_asprintf(fmt, ##arg)
- 
- /**
-- * strlcpy - Copy a %NUL terminated string into a sized buffer
-+ * DT_strlcpy - Copy a %NUL terminated string into a sized buffer
-  * @dest: Where to copy the string to
-  * @src: Where to copy the string from
-  * @size: size of destination buffer
-@@ -178,7 +178,7 @@ static inline char *barebox_asprintf(const char *fmt, ...)
-  * of course, the buffer size is zero). It does not pad
-  * out the result like strncpy() does.
-  */
--static inline size_t strlcpy(char *dest, const char *src, size_t size)
-+static inline size_t DT_strlcpy(char *dest, const char *src, size_t size)
- {
- 	size_t ret = strlen(src);
- 
-diff --git a/src/libdt.c b/src/libdt.c
-index 4db5160..3adeed2 100644
---- a/src/libdt.c
-+++ b/src/libdt.c
-@@ -1503,7 +1503,7 @@ int of_modalias_node(struct device_node *node, char *modalias, int len)
- 	if (!compatible || strlen(compatible) > cplen)
- 		return -ENODEV;
- 	p = strchr(compatible, ',');
--	strlcpy(modalias, p ? p + 1 : compatible, len);
-+	DT_strlcpy(modalias, p ? p + 1 : compatible, len);
- 	return 0;
- }
- 
--- 
-2.13.1
-
diff --git a/package/dt-utils/0002-common-Include-sys-types.h-header.patch b/package/dt-utils/0002-common-Include-sys-types.h-header.patch
deleted file mode 100644
index a49d46867b..0000000000
--- a/package/dt-utils/0002-common-Include-sys-types.h-header.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b8bc4e83bf447b6330ece54e94a1684d12ecdd0b Mon Sep 17 00:00:00 2001
-From: Marcin Niestroj <m.niestroj@grinn-global.com>
-Date: Fri, 23 Jun 2017 12:00:30 +0200
-Subject: [PATCH] common: Include sys/types.h header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Build with musl library fails with following error:
-
-In file included from src/crypto/sha1.c:21:0:
-./src/digest.h:95:10: error: unknown type name ?ulong?
-          ulong start, ulong size);
-...
-
-Fix that by including sys/types.h header in common.h, so ulong type
-is defined with musl library.
-
-Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
----
- src/dt/common.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/dt/common.h b/src/dt/common.h
-index 992e28f..1425c53 100644
---- a/src/dt/common.h
-+++ b/src/dt/common.h
-@@ -13,6 +13,7 @@
- 
- #include <sys/ioctl.h>
- #include <sys/stat.h>
-+#include <sys/types.h>
- 
- #include <mtd/mtd-abi.h>
- 
--- 
-2.13.1
-
diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
new file mode 100644
index 0000000000..0d63b12353
--- /dev/null
+++ b/package/dt-utils/dt-utils.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 a3aae73da39fd46775de390b7babafb63767082da10870c01b6595c4c9762af6  dt-utils-v2018.05.0.tar.gz
+sha256 a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index 5b1375051e..3dbadc7b9e 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = v2017.03.0
+DT_UTILS_VERSION = v2018.05.0
 DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
 DT_UTILS_SITE_METHOD = git
 DT_UTILS_LICENSE = GPL-2.0
-- 
2.18.0
