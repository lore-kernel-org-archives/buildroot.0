From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Mar 2014 10:47:05 +0100
Subject: [Buildroot] [git commit] gcc: fix snapshot compile
Message-ID: <20140321095023.324919C20E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0610a64cec6febbcb7162abcdc41c7a6ecfea818
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add gcc snapshot versions dependency on host-flex and host-bison
(done as suggested by Thomas Petazzoni [1]).

Fixes gcc snapshot version 4.9-20140309 compile failure [2].

Tested the following buildroot configs

BR2_arm=y
BR2_cortex_a9=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_24=y
BR2_GCC_VERSION_SNAP=y
BR2_GCC_SNAP_DATE="4.9-20140309"

and

BR2_arcle=y

For the ARC case disabled the BINUTILS_FROM_GIT host-flex and host-bison
dependency.

[1] http://lists.busybox.net/pipermail/buildroot/2014-March/092490.html
[2] http://lists.busybox.net/pipermail/buildroot/2014-March/092459.html

[Peter: simplify logic]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 236297d..dff6dce 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -151,7 +151,7 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
 HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
 endif
 
-ifeq ($(BR2_arc),y)
+ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
