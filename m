From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 May 2019 17:07:07 +0200
Subject: [Buildroot] [PATCH v2 02/15] linux: disable Werror for powerpc
 kernels
In-Reply-To: <20190508150720.27946-1-romain.naour@gmail.com>
References: <20190508150720.27946-1-romain.naour@gmail.com>
Message-ID: <20190508150720.27946-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From patch [1] included in kernel >= 5.0:
"The upcoming GCC 9 release extends the -Wmissing-attributes warnings
(enabled by -Wall) to C and aliases: it warns when particular function
attributes are missing in the aliases but not in their target.

In particular, it triggers for all the init/cleanup_module
aliases in the kernel (defined by the module_init/exit macros),
ending up being very noisy.

These aliases point to the __init/__exit functions of a module,
which are defined as __cold (among other attributes). However,
the aliases themselves do not have the __cold attribute.

Since the compiler behaves differently when compiling a __cold
function as well as when compiling paths leading to calls
to __cold functions, the warning is trying to point out
the possibly-forgotten attribute in the alias."

Werror is set by default while building ppc kernel [2], but
some warning can be introduced while building current kernel with
newer compiler (for example building kernel 4.19 with gcc 9.1).

For the same reason why we remove Werror in packages's compiler
flags. Building with Werror is not bulletproof when we start
using a newer compiler that introduce new warnings.
This is the case here.

Also this option is a bit strange since it's specific to ppc kernels:
"The intention is to make it harder for people to inadvertantly
introduce warnings in the arch/powerpc code."
Other kernel developers on other arch may be interested by a
similar/more generic option.

So, It's clearly intended for kernel developers.

Instead of backporting this patch [1] to kernel 4.19, select
unconditionally the Kconfig option CONFIG_PPC_DISABLE_WERROR
that allow to disable Werror.

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435741

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=a6e60d84989fa0e91db7f236eda40453b0e44afa
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=ba55bd74360ea4b8b95e73ed79474d37ff482b36
[3] https://gitlab.com/bootlin/toolchains-builder

Fix-suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: add a shared fragment in board/fragments/linux and update
    qemu ppc* defconfigs. (Arnout)

v3: commit log (Yann)
    enable the option from linux.mk instead of the defconfig.
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 51fd41fa15..85364451a8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -315,6 +315,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
+	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
 	# As the kernel gets compiled before root filesystems are
-- 
2.14.5
