From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Feb 2013 08:20:13 +0100
Subject: [Buildroot] [PATCH 3/4] fs/ext2: rename to 'ext' as it can now
 build ext2/3/4 filesystems
In-Reply-To: <bcd3b138016eb551aa3b5e3dfe461e718e83bcb3.1361142401.git.yann.morin.1998@free.fr>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <bcd3b138016eb551aa3b5e3dfe461e718e83bcb3.1361142401.git.yann.morin.1998@free.fr>
Message-ID: <512327AD.3040703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 00:10, Yann E. MORIN wrote:
> Update defconfigs and boards readmes accordingly.

  I don't really like this. I think it falls in the category "yes it 
would make things more consistent, but it's major API breakage that may 
make upgrading unnecessarily difficult". Peter decided to be more careful 
with that kind of changes, and rightly so.

  That said, I would like it if the resulting image would be called 
rootfs.ext3 instead of rootfs.ext2. However, the patch doesn't do that, 
and the infrastructure currently doesn't allow it. But we could redefine 
ROOTFS_TARGET:

define ROOTFS_TARGET
$(call ROOTFS_TARGET_INTERNAL,$(or $(2),$(1)),$(call UPPERCASE,$(1)))
endef

and then call it with

$(call ROOTFS_TARGET,ext2,ext$(BR2_TARGET_ROOTFS_EXT2_GEN))


  It would also be useful to convert some of the boards to ext4.

>
> Signed-off-by:yann.morin.1998 at free.fr
> ---
>   board/arm/foundation-v8/readme.txt          |    2 +-
>   board/boundarydevices/nitrogen6x/readme.txt |    8 +++---
>   board/qemu/arm-versatile/readme.txt         |    2 +-
>   board/qemu/arm-vexpress/readme.txt          |    2 +-
>   board/qemu/mips-malta/readme.txt            |    2 +-
>   board/qemu/mips64-malta/readme.txt          |    2 +-
>   board/qemu/mipsel-malta/readme.txt          |    2 +-
>   board/qemu/powerpc-g3beige/readme.txt       |    2 +-
>   board/qemu/sh4-r2d/readme.txt               |    2 +-
>   board/qemu/sparc-ss10/readme.txt            |    2 +-
>   board/qemu/x86/readme.txt                   |    2 +-
>   board/qemu/x86_64/readme.txt                |    2 +-
>   configs/arm_foundationv8_defconfig          |    2 +-
>   configs/beaglebone_defconfig                |    2 +-
>   configs/mx53loco_defconfig                  |    2 +-
>   configs/nitrogen6x_defconfig                |    2 +-
>   configs/pandaboard_defconfig                |    2 +-
>   configs/qemu_arm_versatile_defconfig        |    2 +-
>   configs/qemu_arm_vexpress_defconfig         |    2 +-
>   configs/qemu_mips64_malta_defconfig         |    2 +-
>   configs/qemu_mips_malta_defconfig           |    2 +-
>   configs/qemu_mipsel_malta_defconfig         |    2 +-
>   configs/qemu_ppc_g3beige_defconfig          |    2 +-
>   configs/qemu_sh4_r2d_defconfig              |    2 +-
>   configs/qemu_sparc_ss10_defconfig           |    2 +-
>   configs/qemu_x86_64_defconfig               |    2 +-
>   configs/qemu_x86_defconfig                  |    2 +-
>   fs/Config.in                                |    2 +-
>   fs/{ext2 => ext}/Config.in                  |   38 +++++++++++++-------------
>   fs/ext/ext.mk                               |   27 +++++++++++++++++++
>   fs/{ext2/genext2fs.sh => ext/genextfs.sh}   |    0
>   fs/ext2/ext2.mk                             |   27 -------------------
>   32 files changed, 77 insertions(+), 77 deletions(-)
>   rename fs/{ext2 => ext}/Config.in (55%)
>   create mode 100644 fs/ext/ext.mk
>   rename fs/{ext2/genext2fs.sh => ext/genextfs.sh} (100%)

  This rename is useful, though, and it shouldn't hurt anyone. If anyone 
is using it, it will be pretty clear what happened, and it wil draw their 
attention to the new features of genextfs.sh.


  Regards,
  Arnout

>   delete mode 100644 fs/ext2/ext2.mk


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
