From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 13:42:41 +0100
Subject: [Buildroot] [PATCH 2/2] package/xvisor: bump to version 0.2.11
In-Reply-To: <20191029124241.5734-1-fontaine.fabrice@gmail.com>
References: <20191029124241.5734-1-fontaine.fabrice@gmail.com>
Message-ID: <20191029124241.5734-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...6-Fix-build-break-with-newer-GCC-7-x.patch | 34 -------------------
 package/xvisor/xvisor.hash                    |  3 +-
 package/xvisor/xvisor.mk                      |  3 +-
 3 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch

diff --git a/package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch b/package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch
deleted file mode 100644
index 668f9df71b..0000000000
--- a/package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 48b056d958e0d9ae5758b9c927b48a2e1d98cbcd Mon Sep 17 00:00:00 2001
-From: Himanshu Chauhan <hchauhan@xvisor-x86.org>
-Date: Mon, 4 Dec 2017 18:29:09 +0530
-Subject: [PATCH] [x86] Fix build break with newer GCC (7.x)
-
-add -no-pie to C and LD flags. GCC 7.x for some reason
-doesn't like to mix 32-bit and 64-bit code and wants
-such code to be compiled with fPIC. Disable PIE from
-does the trick.
-
-Signed-off-by: Himanshu Chauhan <hchauhan@xvisor-x86.org>
-[Retrieved from:
-https://github.com/xvisor/xvisor/commit/48b056d958e0d9ae5758b9c927b48a2e1d98cbcd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- arch/x86/cpu/x86_64/objects.mk | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/arch/x86/cpu/x86_64/objects.mk b/arch/x86/cpu/x86_64/objects.mk
-index a3bed4641..1d6d5a2fb 100644
---- a/arch/x86/cpu/x86_64/objects.mk
-+++ b/arch/x86/cpu/x86_64/objects.mk
-@@ -21,8 +21,9 @@
- # @author Himanshu Chauhan (hschauhan at nulltrace.org)
- # @brief list of x86_64 object files.
- # */
--cpu-cflags +=-finline-functions -O0 -mcmodel=large
--cpu-cppflags +=-DCPU_TEXT_LMA=${CONFIG_VAPOOL_ALIGN_MB}
-+cpu-cflags +=-finline-functions -O0 -mcmodel=large -no-pie
-+cpu-cppflags +=-DCPU_TEXT_LMA=${CONFIG_VAPOOL_ALIGN_MB} -no-pie
-+cpu-ldflags += -no-pie
- 
- cpu-objs-y+= start.o
- 
diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
index c170fdb9f8..dee1ef1d08 100644
--- a/package/xvisor/xvisor.hash
+++ b/package/xvisor/xvisor.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 29b3b830380dde4f596611abd34487fb753e120ce462dbb0056f3025b88ef14f  xvisor-0.2.9.tar.gz
+sha256 a0c9537bd7fb06084c3da663f71bf6f2b1709e34b3b2fca2473c8db1cdd3de1d  xvisor-0.2.11.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index f75175a45c..6094370cc7 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-XVISOR_VERSION = 0.2.9
+XVISOR_VERSION = 0.2.11
+XVISOR_SOURCE = xvisor-$(XVISOR_VERSION).tar.xz
 XVISOR_SITE = http://www.xhypervisor.org/tarball
 XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
-- 
2.23.0
