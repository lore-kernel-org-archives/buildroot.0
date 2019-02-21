From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 21 Feb 2019 23:50:59 +0100
Subject: [Buildroot] [git commit] package/dtc: additional fix of include
 guards for older u-boot
Message-ID: <20190221225044.7326C8B6D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c24006b0e403d786c1a2d7bcb4127440cc13b32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With recent dtc but old u-boot, compilation issues occur related to libfdt.
These problems really are u-boot issue since it does not properly set
include paths so that its own headers are included. Nevertheless, since the
u-boot version is typically decided by users and stuck at some version
provided by a SoC or board vendor, it is not feasible to fix those old
versions.

Instead, already several fixes were made in the past, in Buildroot.
See commits:

c7ffd8a75d5 "package/dtc: fix include guards for older kernel/u-boot"
f437bf547ca "uboot: fix build for older uboot source trees"
bf733342324 "uboot: fix build when libfdt-devel is installed system-wide"
0bf80e4bcd5 "uboot: ensure host includes are searched before system default
                includes"
b15a7a62d3f "uboot: revert "uboot: use local libfdt.h""
baae5156ce3 "uboot: use local fdt headers"
3a6573ccee2 "uboot: use local libfdt.h"

Commit c7ffd8a75d55e24d793106eabbb80964ab91081f fixes the problem caused by
dtc having changed their include guards from _FOO_H to FOO_H (leading
underscore removed). Old u-boot would still use _FOO_H, which (combined with
host-dtc headers that use FOO_H) would cause the inclusion of two different
copies of the same nominal include file, e.g. libfdt.h or libfdt_env.h,
causing 'error: redefinition of xxx' compilation issues.
The fix sets the 'new' include guard when the 'old' one is detected,
preventing a second inclusion of the same nominal file.

For some u-boot versions, however, this change not only needs to be made in
libfdt.h and libfdt_env.h, but also in 'fdt.h'.

Update the dtc patch to do just that.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...de-guards-for-older-kernel-u-boot-sources.patch | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
index e4e49bf6e4..bff5f4c07a 100644
--- a/package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
+++ b/package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
@@ -1,7 +1,7 @@
-From b1f8b84489c96465b63485b884238b61d31ca84d Mon Sep 17 00:00:00 2001
+From 086283ed7f1886de05407bc75dd4c070c78a6f50 Mon Sep 17 00:00:00 2001
 From: Lothar Felten <lothar.felten@gmail.com>
 Date: Mon, 8 Oct 2018 13:29:44 +0200
-Subject: [PATCH 1/1] Fix include guards for older kernel/u-boot sources
+Subject: [PATCH] Fix include guards for older kernel/u-boot sources
 
 Linux kernels before 4.17 and U-Boot versions before 2018.07 use libfdt
 include guards with leading underscores.
@@ -12,11 +12,27 @@ This patch handles both include guard types and allows the compilation
 of older Linux kernel and u-boot sources.
 
 Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+[ThomasDS: also update fdt.h which has the same issue, seen on U-Boot
+2011.03]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 ---
+ libfdt/fdt.h        | 4 ++++
  libfdt/libfdt.h     | 4 ++++
  libfdt/libfdt_env.h | 4 ++++
- 2 files changed, 8 insertions(+)
+ 3 files changed, 12 insertions(+)
 
+diff --git a/libfdt/fdt.h b/libfdt/fdt.h
+index 74961f9..2904f48 100644
+--- a/libfdt/fdt.h
++++ b/libfdt/fdt.h
+@@ -1,3 +1,7 @@
++#ifdef _FDT_H
++#warning "Please consider updating your kernel and/or u-boot version"
++#define FDT_H
++#endif
+ #ifndef FDT_H
+ #define FDT_H
+ /*
 diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
 index 830b77e..bef4566 100644
 --- a/libfdt/libfdt.h
@@ -42,5 +58,5 @@ index eb20538..6a61e6a 100644
  #define LIBFDT_ENV_H
  /*
 -- 
-2.11.0
+2.19.2
 
