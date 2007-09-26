From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 26 Sep 2007 13:25:36 +0200
Subject: [Buildroot] cannot execute binary file
In-Reply-To: <406A31B117F2734987636D6CCC93EE3C023DCA36@ehost011-3.exch011.intermedia.net>
References: <406A31B117F2734987636D6CCC93EE3C023DCA36@ehost011-3.exch011.intermedia.net>
Message-ID: <1190805936.4933.34.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-25 klockan 13:03 -0700 skrev Leonid:
> Hi:
> 
> I'm trying to build buildroot for at91rm9200df board, I'm using snapshot
> of yesterday, 9/24/2007, 6 p.m.
> 
> I have already passed through several stages and it is building MTD
> utilities for target now. However for some reason after creating each
> MTD utility, it tries to run it (on the host) and naturally fails
> (jffs2dump in this example):
> 
> [leonid at jaipur buildroot]$ make
> 
> Checking build system dependencies:
> BUILDROOT_DL_DIR clean:                         Ok
> CC clean:                                       Ok
> CXX clean:                                      Ok
> CPP clean:                                      Ok
> CFLAGS clean:                                   Ok
> INCLUDES clean:                                 Ok
> CXXFLAGS clean:                                 Ok
> which installed:                                Ok
> sed works:                                      Ok (/bin/sed)
> GNU make version '3.81':                        Ok
> C compiler '/usr/lib/ccache/gcc'
> C compiler version '4.1.2':                     Ok
> C++ compiler '/usr/lib/ccache/g++'
> C++ compiler version '4.1.2':                   Ok
> bison installed:                                Ok
> flex installed:                                 Ok
> gettext installed:                              Ok
> makeinfo installed:                             Ok
> Build system dependencies:                      Ok
> 
> rm -rf
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//buildroot-config
> mkdir -p
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll/
> cp -dpRf package/config/buildroot-config
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//buildroot-config
> /usr/bin/make -j2
> CC=/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/usr/bin/arm
> -linux-uclibc-gcc
> CROSS_COMPILE="/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc
> /usr/bin/arm-linux-uclibc-" \
>  
> CROSS="/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/usr/bin
> /arm-linux-uclibc-"
> PREFIX="/home/leonid/LM150/software/linux/rootfs/buildroot/project_build
> _arm_small//root" \
>                 ARCH=arm \
>                 EXTRA_CFLAGS="-Os -pipe
> -I/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/usr/include
> -I/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/include" -C
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//busybox-1.5.0 install
> make[1]: Entering directory
> `/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sm
> all/busybox-1.5.0'
>   ./_install/sbin/halt -> ../bin/busybox
>   ./_install/sbin/poweroff -> ../bin/busybox
>   ./_install/sbin/reboot -> ../bin/busybox
>   ./_install/sbin/start-stop-daemon -> ../bin/busybox
>   ./_install/usr/bin/mesg -> ../../bin/busybox
> make[1]: Leaving directory
> `/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sm
> all/busybox-1.5.0'
> # Just in case
> chmod a+x
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//root/usr/share/udhcpc/default.script
> mkdir -p
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//root/usr/sbin
> cp -f
> /home/leonid/LM150/software/linux/rootfs/buildroot/build_arm_small/mtd_o
> rig/util/jffs2dump
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//root/usr/sbin/jffs2dump
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//root/usr/sbin/jffs2dump
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//root/usr/sbin/jffs2dump:
> /home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
> ll//root/usr/sbin/jffs2dump: cannot execute binary file
> make: ***
> [/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sm
> all//root/usr/sbin/jffs2dump] Error 126
> 
> This is happening again and again for each utility. What is wrong?
> 

Here are the rules governing this:

MTD_TARGETS_n :=
MTD_TARGETS_y :=

MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASE) += flash_erase
MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_ERASEALL) += flash_eraseall
MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_INFO) += flash_info
MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_LOCK) += flash_lock
MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_UNLOCK) += flash_unlock
MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASHCP) += flashcp
MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2) += mkfs.jffs2
MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS) += mkfs.jffs
MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP) += jffs2dump
#MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS3DUMP) += jffs3dump
MTD_TARGETS_$(BR2_PACKAGE_MTD_SUMTOOL) += sumtool
MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_CHECK) += ftl_check
MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT) += ftl_format
MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTLDUMP) += nftldump
MTD_TARGETS_$(BR2_PACKAGE_MTD_NFTL_FORMAT) += nftl_format
MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP) += nanddump
MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE) += nandwrite
MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG) += mtd_debug
MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK) += docfdisk
MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS) += doc_loadbios

MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))

$(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
        mkdir -p $(TARGET_DIR)/usr/sbin
        $(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include
-I
$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
                CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR)
WITHOUT_XATTR=1 -C
$(MTD_DIR)

MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))

$(MTD_TARGETS): $(TARGET_DIR)/usr/sbin/% : $(MTD_DIR)/%
        cp -f $< $@
        $(STRIP) $@


--------------
I am not sure what happens but this is what I think.

In:
        cp -f $< $@
"$<" is empty.

Question is Why?


MTD_TARGETS is a list of "$(TARGET_DIR)/usr/sbin/*"

If I understand the rule correctly,
$(TARGET_DIR)/usr/sbin/% 
	(where %=$(TARGET_DIR)/usr/sbin/)
is a list of "$(TARGET_DIR)/usr/sbin/$(TARGET_DIR)/usr/sbin/*" 
which is clearly wrong.


> Thanks,
> 
> Leonid.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
