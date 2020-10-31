From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:43:49 +0100
Subject: [Buildroot] [git commit] package/s390-tools: bump to version 2.15.1
Message-ID: <20201031223126.1BDDD8212A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38b2d0d641180fff2f239a3d11d6d63cd9e2941e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../s390-tools/0001-zipl-boot-disable-SSP.patch    | 28 ----------------------
 .../0002-genprotimg-boot-disable-SSP.patch         | 28 ----------------------
 package/s390-tools/s390-tools.hash                 |  2 +-
 package/s390-tools/s390-tools.mk                   |  2 +-
 4 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/s390-tools/0001-zipl-boot-disable-SSP.patch b/package/s390-tools/0001-zipl-boot-disable-SSP.patch
deleted file mode 100644
index bedc94d62d..0000000000
--- a/package/s390-tools/0001-zipl-boot-disable-SSP.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5ba78a11cbf2cab793e4214170a9ab540687e3c8 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar@linux.ibm.com>
-Date: Tue, 20 Oct 2020 12:50:58 +0200
-Subject: [PATCH] zipl/boot: disable SSP
-
-SSP cannot work with boot loaders because it requires libc.
-
-Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
----
- zipl/boot/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
-index 359189e5..a2e5f190 100644
---- a/zipl/boot/Makefile
-+++ b/zipl/boot/Makefile
-@@ -7,7 +7,7 @@ INCLUDE_PARMS := $(addprefix -I,$(INCLUDE_PATHS))
- ALL_CFLAGS = $(NO_PIE_CFLAGS) -Os -g $(INCLUDE_PARMS) \
- 	  -DS390_TOOLS_RELEASE=$(S390_TOOLS_RELEASE) \
- 	  -fno-builtin -ffreestanding -fno-asynchronous-unwind-tables \
--	  -fno-delete-null-pointer-checks \
-+	  -fno-delete-null-pointer-checks -fno-stack-protector \
- 	  -fexec-charset=IBM1047 -m64 -mpacked-stack \
- 	  -mstack-size=4096 -mstack-guard=128 -msoft-float \
- 	  -W -Wall -Wformat-security
--- 
-2.26.2
-
diff --git a/package/s390-tools/0002-genprotimg-boot-disable-SSP.patch b/package/s390-tools/0002-genprotimg-boot-disable-SSP.patch
deleted file mode 100644
index 63ca7d0aa4..0000000000
--- a/package/s390-tools/0002-genprotimg-boot-disable-SSP.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6a7800c00752dc0e68939d640274b9813cf0604e Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar@linux.ibm.com>
-Date: Tue, 20 Oct 2020 12:55:44 +0200
-Subject: [PATCH] genprotimg/boot: disable SSP
-
-SSP cannot work with boot loaders because it requires libc.
-
-Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
----
- genprotimg/boot/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/genprotimg/boot/Makefile b/genprotimg/boot/Makefile
-index d39bbd66..f2bc25c3 100644
---- a/genprotimg/boot/Makefile
-+++ b/genprotimg/boot/Makefile
-@@ -12,7 +12,7 @@ ALL_CFLAGS := $(NO_PIE_CFLAGS) -Os -g \
- 	-DENABLE_SCLP_ASCII=1 \
- 	-DS390_TOOLS_RELEASE=$(S390_TOOLS_RELEASE) \
- 	-fno-builtin -ffreestanding -fno-asynchronous-unwind-tables \
--	-fno-delete-null-pointer-checks \
-+	-fno-delete-null-pointer-checks -fno-stack-protector \
- 	-fexec-charset=IBM1047 -m64 -mpacked-stack \
- 	-mstack-size=4096 -mstack-guard=128 -msoft-float \
- 	-Wall -Wformat-security -Wextra -Werror
--- 
-2.26.2
-
diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index 38c2431c25..4f60b22b05 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  02171161c3f858e413f777dac542d37328b7b882a7919cfb966ea554bb6ac0b2  s390-tools-2.14.0.tar.gz
+sha256  8dc1180031018756ccd5acf6c26c4175bcac79e512e8a2ea8569fdf5d3f9bd6c  s390-tools-2.15.1.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  COPYING
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index d186f85cd3..5a3bcffba9 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.14.0
+S390_TOOLS_VERSION = 2.15.1
 S390_TOOLS_SITE = $(call github,ibm-s390-tools,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
