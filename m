From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Jul 2013 10:40:52 +0200
Subject: [Buildroot] [PATCH] gcc: apply PowerPC patch when needed
Message-ID: <1373013652-4162-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When converting gcc to the package infrastructure, a specific thing
for PowerPC was forgotten: applying the conditional patch
powerpc-link-with-math-lib.patch.conditional. This breaks the build of
some PowerPC toolchains, with failures such as:

<http://jenkins.free-electrons.com/job/buildroot/./config=qemu_ppc_virtex_ml507_defconfig/ws/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/lib/libgcc_s.so.1>: undefined reference to `copysignl'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Anyone knows why we have this conditional patch? Can't it be made a
normal patch, with the appropriate modifications? Why isn't that
upstream since all those years?
---
 package/gcc/gcc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 790762d..968354b 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -38,8 +38,17 @@ endef
 # Apply patches
 #
 
+ifeq ($(ARCH)-$(BR2_GCC_SHARED_LIBGCC),powerpc-y)
+ifneq ($(BR2_SOFT_FLOAT),)
+define HOST_GCC_APPLY_POWERPC_PATCH
+	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
+endef
+endif
+endif
+
 define HOST_GCC_APPLY_PATCHES
 	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) \*.patch
+	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
 #
-- 
1.8.1.2
