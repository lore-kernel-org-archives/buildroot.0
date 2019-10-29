From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 13:42:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/xvisor: fix build on x86 with
 PIC/PIE
Message-ID: <20191029124241.5734-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/21d82ca5ca62d25be214a482017f4a671f7cc3d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...6-Fix-build-break-with-newer-GCC-7-x.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch

diff --git a/package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch b/package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch
new file mode 100644
index 0000000000..668f9df71b
--- /dev/null
+++ b/package/xvisor/0001-x86-Fix-build-break-with-newer-GCC-7-x.patch
@@ -0,0 +1,34 @@
+From 48b056d958e0d9ae5758b9c927b48a2e1d98cbcd Mon Sep 17 00:00:00 2001
+From: Himanshu Chauhan <hchauhan@xvisor-x86.org>
+Date: Mon, 4 Dec 2017 18:29:09 +0530
+Subject: [PATCH] [x86] Fix build break with newer GCC (7.x)
+
+add -no-pie to C and LD flags. GCC 7.x for some reason
+doesn't like to mix 32-bit and 64-bit code and wants
+such code to be compiled with fPIC. Disable PIE from
+does the trick.
+
+Signed-off-by: Himanshu Chauhan <hchauhan@xvisor-x86.org>
+[Retrieved from:
+https://github.com/xvisor/xvisor/commit/48b056d958e0d9ae5758b9c927b48a2e1d98cbcd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ arch/x86/cpu/x86_64/objects.mk | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/arch/x86/cpu/x86_64/objects.mk b/arch/x86/cpu/x86_64/objects.mk
+index a3bed4641..1d6d5a2fb 100644
+--- a/arch/x86/cpu/x86_64/objects.mk
++++ b/arch/x86/cpu/x86_64/objects.mk
+@@ -21,8 +21,9 @@
+ # @author Himanshu Chauhan (hschauhan at nulltrace.org)
+ # @brief list of x86_64 object files.
+ # */
+-cpu-cflags +=-finline-functions -O0 -mcmodel=large
+-cpu-cppflags +=-DCPU_TEXT_LMA=${CONFIG_VAPOOL_ALIGN_MB}
++cpu-cflags +=-finline-functions -O0 -mcmodel=large -no-pie
++cpu-cppflags +=-DCPU_TEXT_LMA=${CONFIG_VAPOOL_ALIGN_MB} -no-pie
++cpu-ldflags += -no-pie
+ 
+ cpu-objs-y+= start.o
+ 
-- 
2.23.0
