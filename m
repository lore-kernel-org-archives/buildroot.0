From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Tue, 20 Oct 2020 13:16:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix SSP build
Message-ID: <20201020111647.1605963-1-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/f906ca8650a7a9ccca4a2ee359a807d08a7763b9

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 .../0001-zipl-boot-disable-SSP.patch          | 28 +++++++++++++++++++
 .../0002-genprotimg-boot-disable-SSP.patch    | 28 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 package/s390-tools/0001-zipl-boot-disable-SSP.patch
 create mode 100644 package/s390-tools/0002-genprotimg-boot-disable-SSP.patch

diff --git a/package/s390-tools/0001-zipl-boot-disable-SSP.patch b/package/s390-tools/0001-zipl-boot-disable-SSP.patch
new file mode 100644
index 0000000000..6e41e93ab4
--- /dev/null
+++ b/package/s390-tools/0001-zipl-boot-disable-SSP.patch
@@ -0,0 +1,28 @@
+From 5ba78a11cbf2cab793e4214170a9ab540687e3c8 Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar@linux.ibm.com>
+Date: Tue, 20 Oct 2020 12:50:58 +0200
+Subject: [PATCH 1/2] zipl/boot: disable SSP
+
+SSP cannot work with boot loaders because it requires libc.
+
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ zipl/boot/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
+index 359189e5..a2e5f190 100644
+--- a/zipl/boot/Makefile
++++ b/zipl/boot/Makefile
+@@ -7,7 +7,7 @@ INCLUDE_PARMS := $(addprefix -I,$(INCLUDE_PATHS))
+ ALL_CFLAGS = $(NO_PIE_CFLAGS) -Os -g $(INCLUDE_PARMS) \
+ 	  -DS390_TOOLS_RELEASE=$(S390_TOOLS_RELEASE) \
+ 	  -fno-builtin -ffreestanding -fno-asynchronous-unwind-tables \
+-	  -fno-delete-null-pointer-checks \
++	  -fno-delete-null-pointer-checks -fno-stack-protector \
+ 	  -fexec-charset=IBM1047 -m64 -mpacked-stack \
+ 	  -mstack-size=4096 -mstack-guard=128 -msoft-float \
+ 	  -W -Wall -Wformat-security
+-- 
+2.26.2
+
diff --git a/package/s390-tools/0002-genprotimg-boot-disable-SSP.patch b/package/s390-tools/0002-genprotimg-boot-disable-SSP.patch
new file mode 100644
index 0000000000..9d93bdeaf5
--- /dev/null
+++ b/package/s390-tools/0002-genprotimg-boot-disable-SSP.patch
@@ -0,0 +1,28 @@
+From 6a7800c00752dc0e68939d640274b9813cf0604e Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar@linux.ibm.com>
+Date: Tue, 20 Oct 2020 12:55:44 +0200
+Subject: [PATCH 2/2] genprotimg/boot: disable SSP
+
+SSP cannot work with boot loaders because it requires libc.
+
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ genprotimg/boot/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/genprotimg/boot/Makefile b/genprotimg/boot/Makefile
+index d39bbd66..f2bc25c3 100644
+--- a/genprotimg/boot/Makefile
++++ b/genprotimg/boot/Makefile
+@@ -12,7 +12,7 @@ ALL_CFLAGS := $(NO_PIE_CFLAGS) -Os -g \
+ 	-DENABLE_SCLP_ASCII=1 \
+ 	-DS390_TOOLS_RELEASE=$(S390_TOOLS_RELEASE) \
+ 	-fno-builtin -ffreestanding -fno-asynchronous-unwind-tables \
+-	-fno-delete-null-pointer-checks \
++	-fno-delete-null-pointer-checks -fno-stack-protector \
+ 	-fexec-charset=IBM1047 -m64 -mpacked-stack \
+ 	-mstack-size=4096 -mstack-guard=128 -msoft-float \
+ 	-Wall -Wformat-security -Wextra -Werror
+-- 
+2.26.2
+
-- 
2.26.2
