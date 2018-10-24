From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:16:19 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/dtc: fix include
 guards for older kernel/u-boot
Message-ID: <20181024121623.B41458892B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6591bb1b92ddae61a8bca4add1e5c56be658bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

U-Boot has a copy of dtc in-tree. However, it has a bug in its build
system which could result in both one of the in-tree dtc include files
and the same host-installed include file to be #included.

Normally, that wouldn't be a problem, because (a) the two include files
are compatible, so it doesn't matter which one you include, and (b) the
include guards are the same in both, so only one of them really does
get included. However, upstream dtc has changed the include guards,
removing the leading underscore. Therefore, now the header file does
get included twice, which leads to multiple definitions like:

/builds/buildroot.org/buildroot/output/host/include/libfdt.h:1790:19: error: redefinition of 'fdt_appendprop_cell'
 static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
                   ^~~~~~~~~~~~~~~~~~~
In file included from tools/fdt_host.h:11:0,
                 from tools/imagetool.h:24,
                 from tools/atmelimage.c:8:
tools/../include/libfdt.h:1656:19: note: previous definition of 'fdt_appendprop_cell' was here
 static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
                   ^~~~~~~~~~~~~~~~~~~

To fix this, patch (host) dtc to accept the old include guard as well,
which restores the old behaviour. This patch is probably not
upstreamable, since it's really a hack to work around an issue in
U-Boot.  Note that it has been fixed upstream, but Buildroot supports
building older versions of U-Boot as well.

Note that the problem may still occur if you have libdtc-dev installed
on the host. However, now there is a simple workaround: enable
BR2_TARGET_UBOOT_NEEDS_DTC.

Note that a similar problem also occurs with the beaglebone fork of the
kernel. It's not clear if it has been fixed there.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
[Arnout: rewrite commit message, rewrap patch commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit c7ffd8a75d55e24d793106eabbb80964ab91081f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...de-guards-for-older-kernel-u-boot-sources.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
new file mode 100644
index 0000000000..e4e49bf6e4
--- /dev/null
+++ b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
@@ -0,0 +1,46 @@
+From b1f8b84489c96465b63485b884238b61d31ca84d Mon Sep 17 00:00:00 2001
+From: Lothar Felten <lothar.felten@gmail.com>
+Date: Mon, 8 Oct 2018 13:29:44 +0200
+Subject: [PATCH 1/1] Fix include guards for older kernel/u-boot sources
+
+Linux kernels before 4.17 and U-Boot versions before 2018.07 use libfdt
+include guards with leading underscores.
+
+Those have been removed in dtc-1.4.7.
+
+This patch handles both include guard types and allows the compilation
+of older Linux kernel and u-boot sources.
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
