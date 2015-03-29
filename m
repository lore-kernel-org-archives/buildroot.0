From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:47:40 +0200
Subject: [Buildroot] [git commit] gdb: add version 7.9
Message-ID: <20150329124810.D31BE80820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2e99bb2fa9284209b3b012f0327530b053e07bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add gdb version 7.9, and adjust the tarball logic to default to .tar.xz
(for 7.8 & 7.9), fall back to .tar.bz2 for 7.7.x and leave the rest
alone.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host |    4 ++++
 package/gdb/gdb.mk         |    9 ++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2a03939..cda9d12 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -37,6 +37,9 @@ choice
 	config BR2_GDB_VERSION_7_8
 		bool "gdb 7.8.x"
 
+	config BR2_GDB_VERSION_7_9
+		bool "gdb 7.9.x"
+
 endchoice
 
 endif
@@ -49,3 +52,4 @@ config BR2_GDB_VERSION
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
+	default "7.9"      if BR2_GDB_VERSION_7_9
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 58f0631..3ae473f 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -6,6 +6,7 @@
 
 GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
@@ -19,13 +20,11 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-# Starting from 7.8.x, bz2 tarballs no longer available, use .tar.xz
-# instead.
-ifneq ($(filter 7.8.%,$(GDB_VERSION)),)
-GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
+# Use .tar.bz2 for 7.7.x since there was no .tar.xz release back then
+ifneq ($(filter 7.7.%,$(GDB_VERSION)),)
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
 endif
 
-GDB_SOURCE ?= gdb-$(GDB_VERSION).tar.bz2
 GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
