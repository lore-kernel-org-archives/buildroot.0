From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 15:08:04 +0200
Subject: [Buildroot] [git commit] package/kexec: fix i386 build
Message-ID: <20200501125336.6911090CF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40b4d243f7de9e2c789a55a0e4632c67ee8f6f7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/905178cd793dc2b9b26814f7736186b33b468741

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-kexec-build-multiboot2-for-i386.patch     | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/kexec/0001-kexec-build-multiboot2-for-i386.patch b/package/kexec/0001-kexec-build-multiboot2-for-i386.patch
new file mode 100644
index 0000000000..c67da98ce7
--- /dev/null
+++ b/package/kexec/0001-kexec-build-multiboot2-for-i386.patch
@@ -0,0 +1,72 @@
+From 2c9f26ed20a791a7df0182ba82e93abb52f5a615 Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Mon, 18 Nov 2019 12:52:15 +1300
+Subject: kexec: build multiboot2 for i386
+
+This addresses the following compilation issues when building for i386.
+
+ kexec/arch/i386/kexec-x86.c:39:22: error: 'multiboot2_x86_probe' undeclared here (not in a function); did you mean 'multiboot_x86_probe'?
+   { "multiboot2-x86", multiboot2_x86_probe, multiboot2_x86_load,
+                       ^~~~~~~~~~~~~~~~~~~~
+                       multiboot_x86_probe
+ kexec/arch/i386/kexec-x86.c:39:44: error: 'multiboot2_x86_load' undeclared here (not in a function); did you mean 'multiboot_x86_load'?
+   { "multiboot2-x86", multiboot2_x86_probe, multiboot2_x86_load,
+                                             ^~~~~~~~~~~~~~~~~~~
+                                             multiboot_x86_load
+ kexec/arch/i386/kexec-x86.c:40:4: error: 'multiboot2_x86_usage' undeclared here (not in a function); did you mean 'multiboot_x86_usage'?
+     multiboot2_x86_usage },
+     ^~~~~~~~~~~~~~~~~~~~
+     multiboot_x86_usage
+ make: *** [Makefile:114: kexec/arch/i386/kexec-x86.o] Error 1
+ make: *** Waiting for unfinished jobs....
+
+Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=2c9f26ed20a791a7df0182ba82e93abb52f5a615]
+---
+ kexec/arch/i386/Makefile    | 2 +-
+ kexec/arch/i386/kexec-x86.h | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/arch/i386/Makefile b/kexec/arch/i386/Makefile
+index 105cefd..f486103 100644
+--- a/kexec/arch/i386/Makefile
++++ b/kexec/arch/i386/Makefile
+@@ -7,6 +7,7 @@ i386_KEXEC_SRCS += kexec/arch/i386/kexec-elf-x86.c
+ i386_KEXEC_SRCS += kexec/arch/i386/kexec-elf-rel-x86.c
+ i386_KEXEC_SRCS += kexec/arch/i386/kexec-bzImage.c
+ i386_KEXEC_SRCS += kexec/arch/i386/kexec-multiboot-x86.c
++i386_KEXEC_SRCS += kexec/arch/i386/kexec-mb2-x86.c
+ i386_KEXEC_SRCS += kexec/arch/i386/kexec-beoboot-x86.c
+ i386_KEXEC_SRCS += kexec/arch/i386/kexec-nbi.c
+ i386_KEXEC_SRCS += kexec/arch/i386/x86-linux-setup.c
+@@ -14,7 +15,6 @@ i386_KEXEC_SRCS += kexec/arch/i386/crashdump-x86.c
+ 
+ dist += kexec/arch/i386/Makefile $(i386_KEXEC_SRCS)			\
+ 	kexec/arch/i386/crashdump-x86.h					\
+-	kexec/arch/i386/kexec-mb2-x86.c					\
+ 	kexec/arch/i386/kexec-x86.h					\
+ 	kexec/arch/i386/x86-linux-setup.h				\
+ 	kexec/arch/i386/include/arch/options.h
+diff --git a/kexec/arch/i386/kexec-x86.h b/kexec/arch/i386/kexec-x86.h
+index 1b58c3b..0f941df 100644
+--- a/kexec/arch/i386/kexec-x86.h
++++ b/kexec/arch/i386/kexec-x86.h
+@@ -60,6 +60,11 @@ int multiboot_x86_load(int argc, char **argv, const char *buf, off_t len,
+ 	struct kexec_info *info);
+ void multiboot_x86_usage(void);
+ 
++int multiboot2_x86_load(int argc, char **argv, const char *buf, off_t len,
++			struct kexec_info *info);
++void multiboot2_x86_usage(void);
++int multiboot2_x86_probe(const char *buf, off_t buf_len);
++
+ int elf_x86_probe(const char *buf, off_t len);
+ int elf_x86_load(int argc, char **argv, const char *buf, off_t len,
+ 	struct kexec_info *info);
+-- 
+cgit 1.2-0.3.lf.el7
+
