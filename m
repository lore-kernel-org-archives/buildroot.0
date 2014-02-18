From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Feb 2014 15:12:16 +0200
Subject: [Buildroot] [PATCH] kexec: fix zImage probe
Message-ID: <a22ca23a0ac1e2ee67ee8511633cc9da613ee063.1392729136.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix probe of zImage kernels.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...e-probe-function-return-value-checking-fi.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch

diff --git a/package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch b/package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch
new file mode 100644
index 000000000000..9866cab1a1ee
--- /dev/null
+++ b/package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch
@@ -0,0 +1,41 @@
+From 507e210daf047a5ef98de680151ace745297d82e Mon Sep 17 00:00:00 2001
+Message-Id: <507e210daf047a5ef98de680151ace745297d82e.1392728124.git.baruch@tkos.co.il>
+From: Dave Young <dyoung@redhat.com>
+Date: Thu, 6 Feb 2014 14:30:44 +0800
+Subject: [PATCH] kernel image probe function return value checking fix
+
+Currently kexec will use the kernel image type when probe function return
+value >=0. It looks odd, but previously it works. Since commit bf06cf2095
+it does not work anymore.
+
+During my testing for arm zImage, in 2nd kernel the atags pointer and the
+machine_id are not valid, I did a lot of debugging in kernel, finally I found
+this is caused by a kexec tools bug instead.
+
+Because uImage will be probed before zImage, also the uImage probe return 1
+instead of -1 since bf06cf2095, thus kexec will mistakenly think it is uImage.
+
+Fix this issue by regarding it's valid only when probe return 0.
+
+Signed-off-by: Dave Young <dyoung@redhat.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+---
+ kexec/kexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index f13e5124aacc..703d524836b4 100644
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -691,7 +691,7 @@ static int my_load(const char *type, int fileind, int argc, char **argv,
+ 	}
+ 	if (!type || guess_only) {
+ 		for (i = 0; i < file_types; i++) {
+-			if (file_type[i].probe(kernel_buf, kernel_size) >= 0)
++			if (file_type[i].probe(kernel_buf, kernel_size) == 0)
+ 				break;
+ 		}
+ 		if (i == file_types) {
+-- 
+1.8.5.3
+
-- 
1.8.5.3
