From: Sven Neumann <neumann@teufel.de>
Date: Thu, 17 Apr 2014 09:15:18 +0200
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.6
Message-ID: <1397718918-6590-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove two patches which have been included upstream.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 ...ix-build-failure-bzImage_support_efi_boot.patch | 28 ---------------
 ...e-probe-function-return-value-checking-fi.patch | 41 ----------------------
 package/kexec/kexec.mk                             |  2 +-
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch
 delete mode 100644 package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch

diff --git a/package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch b/package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch
deleted file mode 100644
index 3572015..0000000
--- a/package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fetch from:
-  https://git.kernel.org/cgit/utils/kernel/kexec/kexec-tools.git/patch/?id=9bcefc97bc6c03b6acc8c25f6b1d4e796521ea4c
-
-From 9bcefc97bc6c03b6acc8c25f6b1d4e796521ea4c Mon Sep 17 00:00:00 2001
-From: Tony Jones <tonyj@suse.de>
-Date: Wed, 05 Feb 2014 22:32:18 +0000
-Subject: i386: fix build failure (bzImage_support_efi_boot)
-
-Commit 9c200a85de2245a850546fded96a1977b84ad24d referenced
-'bzImage_support_efi_boot' without matching 32-bit definition.
-
-Signed-off-by: Tony Jones <tonyj@suse.de>
-Signed-off-by: Simon Horman <horms@verge.net.au>
----
-diff --git a/kexec/arch/i386/kexec-bzImage.c b/kexec/arch/i386/kexec-bzImage.c
-index fc1a54f..e7bc1d6 100644
---- a/kexec/arch/i386/kexec-bzImage.c
-+++ b/kexec/arch/i386/kexec-bzImage.c
-@@ -40,6 +40,7 @@
- #include <arch/options.h>
-
- static const int probe_debug = 0;
-+int bzImage_support_efi_boot = 0;
-
- int bzImage_probe(const char *buf, off_t len)
- {
---
-cgit v0.9.2
diff --git a/package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch b/package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch
deleted file mode 100644
index 9866cab..0000000
--- a/package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 507e210daf047a5ef98de680151ace745297d82e Mon Sep 17 00:00:00 2001
-Message-Id: <507e210daf047a5ef98de680151ace745297d82e.1392728124.git.baruch@tkos.co.il>
-From: Dave Young <dyoung@redhat.com>
-Date: Thu, 6 Feb 2014 14:30:44 +0800
-Subject: [PATCH] kernel image probe function return value checking fix
-
-Currently kexec will use the kernel image type when probe function return
-value >=0. It looks odd, but previously it works. Since commit bf06cf2095
-it does not work anymore.
-
-During my testing for arm zImage, in 2nd kernel the atags pointer and the
-machine_id are not valid, I did a lot of debugging in kernel, finally I found
-this is caused by a kexec tools bug instead.
-
-Because uImage will be probed before zImage, also the uImage probe return 1
-instead of -1 since bf06cf2095, thus kexec will mistakenly think it is uImage.
-
-Fix this issue by regarding it's valid only when probe return 0.
-
-Signed-off-by: Dave Young <dyoung@redhat.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
----
- kexec/kexec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/kexec/kexec.c b/kexec/kexec.c
-index f13e5124aacc..703d524836b4 100644
---- a/kexec/kexec.c
-+++ b/kexec/kexec.c
-@@ -691,7 +691,7 @@ static int my_load(const char *type, int fileind, int argc, char **argv,
- 	}
- 	if (!type || guess_only) {
- 		for (i = 0; i < file_types; i++) {
--			if (file_type[i].probe(kernel_buf, kernel_size) >= 0)
-+			if (file_type[i].probe(kernel_buf, kernel_size) == 0)
- 				break;
- 		}
- 		if (i == file_types) {
--- 
-1.8.5.3
-
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index b16787c..e88254c 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.5
+KEXEC_VERSION = 2.0.6
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
-- 
1.8.3.2
