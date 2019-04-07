From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 16:02:44 +0200
Subject: [Buildroot] [git commit] package/nvme: bump to version 1.7
Message-ID: <20190407135846.67AB18DFBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61650a011b06da1a3b387aea6ddfc15c89f5d1cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add upstream patch to fix build
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nvme/0001-Fix-CFLAGS-parameter.patch       | 39 ++++++++++++++++++++++
 ...allow-linker-override-for-cross-uuid-test.patch | 34 -------------------
 package/nvme/nvme.hash                             |  3 +-
 package/nvme/nvme.mk                               |  2 +-
 4 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/package/nvme/0001-Fix-CFLAGS-parameter.patch b/package/nvme/0001-Fix-CFLAGS-parameter.patch
new file mode 100644
index 0000000000..1d762b5be0
--- /dev/null
+++ b/package/nvme/0001-Fix-CFLAGS-parameter.patch
@@ -0,0 +1,39 @@
+From 254bcd6b23436fd929e18c935322410b541ca121 Mon Sep 17 00:00:00 2001
+From: Breno Leitao <leitao@debian.org>
+Date: Mon, 21 Jan 2019 07:03:24 -0500
+Subject: [PATCH] Fix CFLAGS parameter
+
+Currently nvme-cli 1.7 is not compiling on Debian because the Debian helper
+(compilation toolkit) does pass a CFLAGS variable, thus, avoiding the
+initial definition (CFLAGS ?= -O2 -g -Wall -Werror -I.)
+
+The problem is that -I should not be removed, otherwise the code does not
+compile, with the following bug:
+
+	cc -Wdate-time -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -g -O2 -fdebug-prefix-map=/home/breno/nvme/nvme-cli-1.7=. -fstack-protector-strong -Wformat -Werror=format-security -std=gnu99 -DLIBUUID -DNVME_VERSION='"1.7"' -o plugins/intel/intel-nvme.o -c plugins/intel/intel-nvme.c
+	plugins/intel/intel-nvme.c:10:18: fatal error: nvme.h: No such file or directory
+	compilation terminated.
+
+This patch just moves the -I parameter to part of the CFLAGS that is not
+replaced by dh's CFLAGS.
+
+Signed-off-by: Breno Leitao <leitao@debian.org>
+[Retrieved from:
+https://github.com/linux-nvme/nvme-cli/commit/254bcd6b23436fd929e18c935322410b541ca121]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 525616af..3a4e2239 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,5 @@
+-CFLAGS ?= -O2 -g -Wall -Werror -I.
+-CFLAGS += -std=gnu99
++CFLAGS ?= -O2 -g -Wall -Werror
++CFLAGS += -std=gnu99 -I.
+ CPPFLAGS += -D_GNU_SOURCE -D__CHECK_ENDIAN__
+ LIBUUID = $(shell $(LD) -o /dev/null -luuid >/dev/null 2>&1; echo $$?)
+ NVME = nvme
diff --git a/package/nvme/0001-Makefile-allow-linker-override-for-cross-uuid-test.patch b/package/nvme/0001-Makefile-allow-linker-override-for-cross-uuid-test.patch
deleted file mode 100644
index dc1c01a888..0000000000
--- a/package/nvme/0001-Makefile-allow-linker-override-for-cross-uuid-test.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f926559acd1beb74dc5dc9b0e414b087110a251f Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 9 Aug 2017 09:43:12 +0300
-Subject: [PATCH] Makefile: allow linker override for cross uuid test
-
-The test to determine whether libuuid is installed uses the host 'ld' utility.
-This breaks when cross compiling, since target libraries are often different
-than host libraries.
-
-Use $(LD) instead. This allows to easily use the cross compiler linker.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/linux-nvme/nvme-cli/pull/216
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 3f1d9aaa890d..cc74bdd6c3e6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,7 +1,7 @@
- CFLAGS ?= -O2 -g -Wall -Werror
- CFLAGS += -std=gnu99
- CPPFLAGS += -D_GNU_SOURCE -D__CHECK_ENDIAN__
--LIBUUID = $(shell ld -o /dev/null -luuid >/dev/null 2>&1; echo $$?)
-+LIBUUID = $(shell $(LD) -o /dev/null -luuid >/dev/null 2>&1; echo $$?)
- NVME = nvme
- INSTALL ?= install
- DESTDIR =
--- 
-2.13.2
-
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index 92e2bc0acb..1f7be5aef9 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 52eb45c9ef5a529580a3f6f9e02c067695675ac01b8ab8b8e0398c62e8a8646d nvme-v1.3.tar.gz
+sha256 3a139d40ffff48d2f0b06339fd3be3ed219241ce6838f0ea173d7459c9984ea2 nvme-v1.7.tar.gz
+sha256 a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753 LICENSE
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 513720becb..1762a756c6 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVME_VERSION = v1.3
+NVME_VERSION = v1.7
 NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
