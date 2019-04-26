From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:00:48 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] linux: split calling
 "all" and "$(LINUX_TARGET_NAME)" targets
Message-ID: <20190426130223.BFBAB80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dc7deaba3751df40bc66b65054a0d5e7a754264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In commit ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
LINUX_BUILD_CMDS"), we changed LINUX_BUILD_CMDS to essentially do:

  make all $(LINUX_TARGET_NAME)

Unfortunately, it turns out that it breaks the build of a number of
defconfigs, with errors such as:

  fixdep: error opening file: arch/xtensa/boot/lib/.inftrees.o.d: No such file or directory

Calling "all" and "$(LINUX_TARGET_NAME)" as separate make invocations
avoids this problem, and fixes the build of several defconfigs.

Fixes:

  ts7680_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339583

  qemu_xtensa_lx60_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339553

  roseapplepi_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339564

  qemu_xtensa_lx60_nommu_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339554

  qemu_ppc64_e5500_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339539

  freescale_t2080_qds_rdb_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339455

  arcturus_ucp1020_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339399

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: add comment in the code to explain why we call the two make
targets separately, as suggested by Yann E. Morin]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 2a7cf511f4cd4b708eb68d3fe98e291ee6a588b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1eac3287ab..51fd41fa15 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -439,12 +439,16 @@ endif
 endif
 
 # Compilation. We make sure the kernel gets rebuilt when the
-# configuration has changed.
+# configuration has changed. We call the 'all' and
+# '$(LINUX_TARGET_NAME)' targets separately because calling them in
+# the same $(MAKE) invocation has shown to cause parallel build
+# issues.
 define LINUX_BUILD_CMDS
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
 		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
 	)
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
 endef
