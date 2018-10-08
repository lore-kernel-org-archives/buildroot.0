From: Lothar Felten <lothar.felten@gmail.com>
Date: Mon,  8 Oct 2018 13:51:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for older
 kernel/u-boot
Message-ID: <20181008115146.17797-1-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch dtc to accept libfdt include guards with and without leading underscore.
A compiler warning is added to notify the user.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 ...de-guards-for-older-kernel-u-boot-sources.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch

diff --git a/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
new file mode 100644
index 0000000000..40cb0bdb2a
--- /dev/null
+++ b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
@@ -0,0 +1,42 @@
+From b1f8b84489c96465b63485b884238b61d31ca84d Mon Sep 17 00:00:00 2001
+From: Lothar Felten <lothar.felten@gmail.com>
+Date: Mon, 8 Oct 2018 13:29:44 +0200
+Subject: [PATCH 1/1] Fix include guards for older kernel/u-boot sources
+
+Linux kernels before 4.17 and U-Boot versions before 2018.07 use libfdt include guards with leading underscores.
+Those have been removed in dtc-1.4.7.
+This patch handles both include guard types and allows the compilation of older Linux kernel and u-boot sources.
+
+Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+---
+ libfdt/libfdt.h     | 4 ++++
+ libfdt/libfdt_env.h | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
+index 830b77e..bef4566 100644
+--- a/libfdt/libfdt.h
++++ b/libfdt/libfdt.h
+@@ -1,3 +1,7 @@
++#ifdef _LIBFDT_H
++#warning "Please consider updating your kernel and/or u-boot version"
++#define LIBFDT_H
++#endif
+ #ifndef LIBFDT_H
+ #define LIBFDT_H
+ /*
+diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
+index eb20538..6a61e6a 100644
+--- a/libfdt/libfdt_env.h
++++ b/libfdt/libfdt_env.h
+@@ -1,3 +1,7 @@
++#ifdef _LIBFDT_ENV_H
++#warning "Please consider updating your kernel and/or u-boot version"
++#define LIBFDT_ENV_H
++#endif
+ #ifndef LIBFDT_ENV_H
+ #define LIBFDT_ENV_H
+ /*
+-- 
+2.11.0
+
-- 
2.11.0
