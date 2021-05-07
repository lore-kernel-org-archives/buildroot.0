From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 May 2021 10:34:46 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/kexec: fix build
 on pre 4.4 kernels
Message-ID: <20210507081607.47A0886283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bbaaa6b474641b2620e388d7144deff2e347e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

kexec build will fail on older kernels (pre 4.4) as the define VIDEO_CAPABILITY_64BIT_BASE was not present at that time.

This patch adds it, as per linux/include/uapi/linux/screen_info.h, if not present.

Signed-off-by: Federico Pellegrin <fede@evolware.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-kexec-tools-fix-build-on-pre-4.4-kernels.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/kexec/0003-kexec-tools-fix-build-on-pre-4.4-kernels.patch b/package/kexec/0003-kexec-tools-fix-build-on-pre-4.4-kernels.patch
new file mode 100644
index 0000000000..fcac604dfd
--- /dev/null
+++ b/package/kexec/0003-kexec-tools-fix-build-on-pre-4.4-kernels.patch
@@ -0,0 +1,34 @@
+From cbbe4c47cb2acae04083c510dbe0efc5f48f5bb6 Mon Sep 17 00:00:00 2001
+From: Federico Pellegrin <fede@evolware.org>
+Date: Wed, 3 Feb 2021 11:00:17 +0100
+Subject: [PATCH] kexec-tools: fix build on pre 4.4 kernels
+
+kexec build will fail on older kernels (pre 4.4) as the define
+VIDEO_CAPABILITY_64BIT_BASE was not present at that time.
+
+This patch adds it, as per linux/include/uapi/linux/screen_info.h,
+if not present.
+
+Signed-off-by: Federico Pellegrin <fede@evolware.org>
+---
+ kexec/arch/i386/x86-linux-setup.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
+index 76e1185..ab54a4a 100644
+--- a/kexec/arch/i386/x86-linux-setup.c
++++ b/kexec/arch/i386/x86-linux-setup.c
+@@ -37,6 +37,10 @@
+ #include "x86-linux-setup.h"
+ #include "../../kexec/kexec-syscall.h"
+ 
++#ifndef VIDEO_CAPABILITY_64BIT_BASE
++#define VIDEO_CAPABILITY_64BIT_BASE (1 << 1)	/* Frame buffer base is 64-bit */
++#endif
++
+ void init_linux_parameters(struct x86_linux_param_header *real_mode)
+ {
+ 	/* Fill in the values that are usually provided by the kernel. */
+-- 
+2.26.2
+
