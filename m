From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:08:25 +0200
Subject: [Buildroot] [PATCH 1/5] linux: split calling "all" and
 "$(LINUX_TARGET_NAME)" targets
In-Reply-To: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190422200830.2831-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1eac3287ab..dca3d63cd9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -444,7 +444,8 @@ define LINUX_BUILD_CMDS
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
 		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
 	)
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
 endef
-- 
2.20.1
