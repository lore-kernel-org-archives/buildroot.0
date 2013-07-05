From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Jul 2013 15:30:41 +0200
Subject: [Buildroot] [git commit] gcc: apply PowerPC patch when needed
Message-ID: <20130705133335.CA77E9A358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=197006a41c1a0450bf6350d5742e186b5b0c69de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When converting gcc to the package infrastructure, a specific thing
for PowerPC was forgotten: applying the conditional patch
powerpc-link-with-math-lib.patch.conditional. This breaks the build of
some PowerPC toolchains, with failures such as:

<http://jenkins.free-electrons.com/job/buildroot/./config=qemu_ppc_virtex_ml507_defconfig/ws/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/lib/libgcc_s.so.1>: undefined reference to `copysignl'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
