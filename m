From: Federico Pellegrin <fede@evolware.org>
Date: Fri, 29 Jan 2021 06:03:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix build on pre 4.4 kernels
Message-ID: <20210129050312.12247-1-fede@evolware.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kexec build will fail on older kernels (pre 4.4) as the define VIDEO_CAPABILITY_64BIT_BASE was not present at that time.

This patch adds it, as per linux/include/uapi/linux/screen_info.h, if not present.

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 ...-kexec-tools-video-capability-64bit-define.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/kexec/0003-kexec-tools-video-capability-64bit-define.patch

diff --git a/package/kexec/0003-kexec-tools-video-capability-64bit-define.patch b/package/kexec/0003-kexec-tools-video-capability-64bit-define.patch
new file mode 100644
index 0000000000..93a66bb1a7
--- /dev/null
+++ b/package/kexec/0003-kexec-tools-video-capability-64bit-define.patch
@@ -0,0 +1,13 @@
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
-- 
2.26.2
