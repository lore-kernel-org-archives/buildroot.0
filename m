From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 21:20:09 +0100
Subject: [Buildroot] [PATCH 2/4] libcap: add patch to fix build issue with
	old kernel headers
In-Reply-To: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458159611-5613-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Old kernels (before 2.6.36) were defining XATTR_NAME_CAPS in
<linux/capability.h>, but using XATTR_SECURITY_PREFIX and
XATTR_CAPS_SUFFIX which were defined in the kernel-only part of
<linux/xattr.h>.

In kernel 2.6.36 (commit af4f136056c984b0aa67feed7d3170b958370b2f),
the XATTR_NAME_CAPS definition was moved to the kernel-only part of
<linux/xattr.h>. It's only in kernel 3.0 (commit
1dbe39424a43e56a6c9aed12661192af51dcdb9f) that <linux/xattr.h> was
fixed to expose XATTR_NAME_CAPS and the related definitions to
userspace.

This is the reason why the target variant of libcap has a dependency
on headers >= 3.0 for the moment.

However, this doesn't solve the problem for the host variant of
libcap, which doesn't build properly on old systems.

To solve this, we simply add a patch that defines the missing
definitions. Their values haven't changed over time since they are
part of the kernel to userspace ABI.

Fixes:

  http://autobuild.buildroot.org/results/856b71bccf14c3334a8c0fc66c1d985b09734313/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ..._file.c-fix-build-with-old-kernel-headers.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch

diff --git a/package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch b/package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch
new file mode 100644
index 0000000..02cc228
--- /dev/null
+++ b/package/libcap/0003-libcap-cap_file.c-fix-build-with-old-kernel-headers.patch
@@ -0,0 +1,51 @@
+From ace694e9574eb38e07cfe0db235434eb40003f47 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 14 Mar 2016 22:39:15 +0100
+Subject: [PATCH] libcap/cap_file.c: fix build with old kernel headers
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libcap/cap_file.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/libcap/cap_file.c b/libcap/cap_file.c
+index 40756ea..e3d54dd 100644
+--- a/libcap/cap_file.c
++++ b/libcap/cap_file.c
+@@ -23,6 +23,33 @@ extern int fsetxattr(int, const char *, const void *, size_t, int);
+ extern int removexattr(const char *, const char *);
+ extern int fremovexattr(int, const char *);
+ 
++
++/*
++ * Old kernels (before 2.6.36) were defining XATTR_NAME_CAPS in
++ * <linux/capability.h>, but using XATTR_SECURITY_PREFIX and
++ * XATTR_CAPS_SUFFIX which were defined in the kernel-only part of
++ * <linux/xattr.h>.
++ *
++ * In kernel 2.6.36 (commit af4f136056c984b0aa67feed7d3170b958370b2f),
++ * the XATTR_NAME_CAPS definition was moved to the kernel-only part of
++ * <linux/xattr.h>. It's only in kernel 3.0 (commit
++ * 1dbe39424a43e56a6c9aed12661192af51dcdb9f) that <linux/xattr.h> was
++ * fixed to expose XATTR_NAME_CAPS and the related definitions to
++ * userspace.
++ *
++ * In order to cope with kernels < 3.0, we define here the appropriate
++ * values, which we assume haven't changed over history.
++ */
++#ifndef XATTR_CAPS_SUFFIX
++#define XATTR_CAPS_SUFFIX "capability"
++#endif
++#ifndef XATTR_SECURITY_PREFIX
++#define XATTR_SECURITY_PREFIX "security."
++#endif
++#ifndef XATTR_NAME_CAPS
++#define XATTR_NAME_CAPS XATTR_SECURITY_PREFIX XATTR_CAPS_SUFFIX
++#endif
++
+ #include "libcap.h"
+ 
+ #ifdef VFS_CAP_U32
+-- 
+2.6.4
+
-- 
2.6.4
