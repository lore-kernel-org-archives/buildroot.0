From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Sep 2019 22:17:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/nvme: bump to version 1.9
Message-ID: <20190921201716.26448-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nvme/0001-Fix-CFLAGS-parameter.patch | 39 --------------------
 package/nvme/nvme.hash                       |  2 +-
 package/nvme/nvme.mk                         |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/nvme/0001-Fix-CFLAGS-parameter.patch

diff --git a/package/nvme/0001-Fix-CFLAGS-parameter.patch b/package/nvme/0001-Fix-CFLAGS-parameter.patch
deleted file mode 100644
index 1d762b5be0..0000000000
--- a/package/nvme/0001-Fix-CFLAGS-parameter.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 254bcd6b23436fd929e18c935322410b541ca121 Mon Sep 17 00:00:00 2001
-From: Breno Leitao <leitao@debian.org>
-Date: Mon, 21 Jan 2019 07:03:24 -0500
-Subject: [PATCH] Fix CFLAGS parameter
-
-Currently nvme-cli 1.7 is not compiling on Debian because the Debian helper
-(compilation toolkit) does pass a CFLAGS variable, thus, avoiding the
-initial definition (CFLAGS ?= -O2 -g -Wall -Werror -I.)
-
-The problem is that -I should not be removed, otherwise the code does not
-compile, with the following bug:
-
-	cc -Wdate-time -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -g -O2 -fdebug-prefix-map=/home/breno/nvme/nvme-cli-1.7=. -fstack-protector-strong -Wformat -Werror=format-security -std=gnu99 -DLIBUUID -DNVME_VERSION='"1.7"' -o plugins/intel/intel-nvme.o -c plugins/intel/intel-nvme.c
-	plugins/intel/intel-nvme.c:10:18: fatal error: nvme.h: No such file or directory
-	compilation terminated.
-
-This patch just moves the -I parameter to part of the CFLAGS that is not
-replaced by dh's CFLAGS.
-
-Signed-off-by: Breno Leitao <leitao@debian.org>
-[Retrieved from:
-https://github.com/linux-nvme/nvme-cli/commit/254bcd6b23436fd929e18c935322410b541ca121]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 525616af..3a4e2239 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,5 @@
--CFLAGS ?= -O2 -g -Wall -Werror -I.
--CFLAGS += -std=gnu99
-+CFLAGS ?= -O2 -g -Wall -Werror
-+CFLAGS += -std=gnu99 -I.
- CPPFLAGS += -D_GNU_SOURCE -D__CHECK_ENDIAN__
- LIBUUID = $(shell $(LD) -o /dev/null -luuid >/dev/null 2>&1; echo $$?)
- NVME = nvme
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index 0092c9a6ed..94aefb2ff9 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 3a139d40ffff48d2f0b06339fd3be3ed219241ce6838f0ea173d7459c9984ea2 nvme-1.7.tar.gz
+sha256 d7c3d56f36f81c0933f7b7c3f90c4196be0fec758affc8062c525b6bc5ea65f5 nvme-1.9.tar.gz
 sha256 a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753 LICENSE
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 1a9061fc21..5a7c634e3c 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVME_VERSION = 1.7
+NVME_VERSION = 1.9
 NVME_SITE = $(call github,linux-nvme,nvme-cli,v$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
-- 
2.23.0
