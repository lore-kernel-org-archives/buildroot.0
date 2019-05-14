From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 19:21:21 +0200
Subject: [Buildroot] [git commit branch/next] package/dt-utils: bump to
 v2019.01.0
Message-ID: <20190514171615.51DA183B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3fa1c18209baf7dd5b58ca73d292151952b1e6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also drop patch which is part of new release.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pilation-for-glibc-version-2.27.9000-36.f.patch | 75 ----------------------
 package/dt-utils/dt-utils.hash                     |  2 +-
 package/dt-utils/dt-utils.mk                       |  2 +-
 3 files changed, 2 insertions(+), 77 deletions(-)

diff --git a/package/dt-utils/0001-src-fix-compilation-for-glibc-version-2.27.9000-36.f.patch b/package/dt-utils/0001-src-fix-compilation-for-glibc-version-2.27.9000-36.f.patch
deleted file mode 100644
index 8c2f585946..0000000000
--- a/package/dt-utils/0001-src-fix-compilation-for-glibc-version-2.27.9000-36.f.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 1c80e31872aec9f2ef7eca6a52aa89c0ea759d8f Mon Sep 17 00:00:00 2001
-From: Enrico Joerns <ejo@pengutronix.de>
-Date: Wed, 5 Sep 2018 12:28:28 +0200
-Subject: [PATCH] src: fix compilation for glibc version 2.27.9000-36.fc29 and
- newer
-
-As recent glibc versions (>= 2.27.9000-36.fc29) also define 'struct
-statx' which is also defined in linux/stat.h, compilation fails with
-error:
-
-| In file included from ../dt-utils-2018.05.0/src/crypto/digest.c:24:
-| [..]/usr/include/linux/stat.h:56:8: error: redefinition of 'struct statx_timestamp'
-|  struct statx_timestamp {
-|         ^~~~~~~~~~~~~~~
-| In file included from [..]/usr/include/sys/stat.h:446,
-|                  from ../dt-utils-2018.05.0/src/dt/common.h:15,
-|                  from ../dt-utils-2018.05.0/src/crypto/digest.c:19:
-| [..]/usr/include/bits/statx.h:25:8: note: originally defined here
-|  struct statx_timestamp
-|         ^~~~~~~~~~~~~~~
-| In file included from ../dt-utils-2018.05.0/src/crypto/digest.c:24:
-| [..]/usr/include/linux/stat.h:99:8: error: redefinition of 'struct statx'
-|  struct statx {
-|         ^~~~~
-| In file included from [..]/usr/include/sys/stat.h:446,
-|                  from ../dt-utils-2018.05.0/src/dt/common.h:15,
-|                  from ../dt-utils-2018.05.0/src/crypto/digest.c:19:
-| [..]/usr/include/bits/statx.h:36:8: note: originally defined here
-|  struct statx
-|         ^~~~~
-
-The linux/stat.h originates from the code that was copied from barebox
-but is not explicitly required to be linux/stat.h instead of sys/stat.h
-and we do not actually use struct statx.
-
-Thus it is safe to simply replace occurrences of linux/stat.h by
-sys/stat.h to fix compilation.
-
-Signed-off-by: Enrico Joerns <ejo@pengutronix.de>
-[Thomas: backport from upstream.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/barebox-state/backend_storage.c | 2 +-
- src/crypto/digest.c                 | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/barebox-state/backend_storage.c b/src/barebox-state/backend_storage.c
-index 53fe829..1052656 100644
---- a/src/barebox-state/backend_storage.c
-+++ b/src/barebox-state/backend_storage.c
-@@ -19,7 +19,7 @@
- #include <linux/kernel.h>
- #include <linux/list.h>
- #include <linux/mtd/mtd-abi.h>
--#include <linux/stat.h>
-+#include <sys/stat.h>
- #include <linux/fs.h>
- #include <malloc.h>
- #include <printk.h>
-diff --git a/src/crypto/digest.c b/src/crypto/digest.c
-index 7a8c3c0..8353412 100644
---- a/src/crypto/digest.c
-+++ b/src/crypto/digest.c
-@@ -21,7 +21,7 @@
- #include <malloc.h>
- #include <fs.h>
- #include <fcntl.h>
--#include <linux/stat.h>
-+#include <sys/stat.h>
- #include <errno.h>
- #include <module.h>
- #include <linux/err.h>
--- 
-2.19.2
-
diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 5805adf361..3610fe164f 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d0f53c76bc9f821a6506c8db3b623922d82570a017a9a40ad118bd7c957672b6  dt-utils-v2018.05.0.tar.gz
+sha256 61440ab222543268923175eb5c7425076d2b8bce4c1dfc177f2eb3873449af7c  dt-utils-v2019.01.0.tar.gz
 sha256 a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index 3dbadc7b9e..25c287d434 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = v2018.05.0
+DT_UTILS_VERSION = v2019.01.0
 DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
 DT_UTILS_SITE_METHOD = git
 DT_UTILS_LICENSE = GPL-2.0
