From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:31 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/boards-cleanup
Message-ID: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the set of patches that reworks how Buildroot support
boards. Now, the principles are :

 * No more options in the menuconfig/xconfig to select the board, a
   board configuration is just a selection of configuration options,
   so a defconfig file is sufficient. So all the BR2_BOARD_NAME crap
   goes away.

 * One minimal defconfig file stored in configs/ for a given hardware
   platform. It only specifies the architecture, the kernel version
   and configuration, the bootloader version and configuration, the
   filesystem images generated. No package should be selected since
   packages are usually application-specific and not really
   hardware-specific.

 * When needed, additional board-specific files must be stored in
   board/<vendor>/<boardname>. Things such as kernel/bootloader
   patches or configuration files.

 * The addition of other target skeletons is not welcome, unless
   strongly needed. We should instead provide more options to control
   the layout/contents of the skeleton, depending on the needs.

So this patch series goes through the following steps :

 * Convert most existing defconfigs to the new mechanism, upgrading
   them to new kernel versions and new bootloader versions when
   possible.

 * Removes rendundant or useless defconfigs
   (integrator926_huge_defconfig, or all *_ext_* configurations,
   i386/i686 defconfigs).

 * Removes all the target skeleton and crap in target/device/,
   Atmel-specific options and other stuff. The target/ directory is
   much more reasonable now. The main remaining thing is the xtensa
   architecture, which is kind of special. However, as we haven't seen
   any updates to it since it has been merged in July 2009, we should
   probably contact the authors to see if they are still interested in
   maintaining the xtensa port of Buildroot.

 * Some bootloader changes: use of the official AT91Bootstrap, bump
   U-Boot and Barebox.

 * Add support for some hardware platforms: Mini2440 (from Paul Jones,
   it would benefit from an upgrade to newer kernel versions), Qemu
   ARM versatile, Qemu x86, Qemu SH4 R2D (Philippe Reynes), Qemu
   PowerPC G3 Beige and Qemu MIPSel Malta.

 * Turns the serial port configuration into a free-form text field
   instead of the growing list of serial devices.

 * In Linux, support a list of patches instead of a single patch.

 * Add options to select the /dev management technology: static,
   dynamic with devtmpfs, dynamic with mdev, dynamic with
   udev. Initial work done by Yegor Yefremov, some improvements by me.

Regards,

Thomas

The following changes since commit 7e9c3a387820154fd1355f23c2669072c0c3a5f7:
  Peter Korsgaard (1):
        docs/news.html: add 2010.11 announce link

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/boards-cleanup

Philippe Reynes (1):
      board: Add Qemu SH4 r2d configuration

Thomas Petazzoni (51):
      defconfigs: keep only one defconfig per board
      Remove unused Atmel-specific mirror definitions
      Update defconfigs after Atmel mirror related options removal
      Remove completely useless set of Makefiles specific to Atmel
      Remove useless target/device/mips
      Move Config.in.mirrors out of target/device
      Use the new BR2_ROOTFS_SKELETON_CUSTOM options
      Remove mini device table, it isn't used
      Stop referencing the crazy target/device stuff
      Remove all Config.in/Makefile.in files in target/device
      Remove Busybox skeleton from target/device/Atmel
      Remove crazy set of empty directories
      Re-add target/generic/Config.in options to menuconfig
      documentation: Update to explain how board support works
      at91bootstrap: switch to the official version
      at91bootstrap: rename config options for consistency
      board: update and minify at91sam9263ek_defconfig
      board: update and minify at91sam9261ek_defconfig
      board: update and minify at91sam9g20dfc_defconfig
      at91bootstrap: no board name check when 'make source' is used
      dependencies: add unzip
      u-boot: add U-Boot 2010.09
      barebox: bump Barebox to 2010.11
      board: minify integrator926_defconfig
      board: remove integrator926_huge_defconfig
      Remove useless kernel config files for integrator926
      board: remove i386/i686_defconfig
      Minify arm_toolchain_defconfig
      Minify arm_nptl_toolchain_defconfig
      board: simplify atngw100 support
      board: simplify kb9202 board
      board: update and minify at91rm9200df_defconfig
      board: update and minify at91sam9260dfc_defconfig
      board: remove support for at91sam9260pf
      board: update and minimize atstk100x_defconfig
      board: remove atstk1005_defconfig
      board: remove Valka v100sc2
      Remove the few remaining unused Atmel-specific bits
      board: add Qemu Versatile defconfig
      board: add support for Mini 2440
      board: add new Qemu x86 configuration file
      u-boot: add CROSS_COMPILE/ARCH when building host tools
      linux: Import minimal defconfigs as defconfigs
      linux: support a space-separated list of patches
      linux: always enable support for tmpfs in the kernel
      Improve handling of mdev/udev
      xtensa: remove unused and useless skeleton patch
      linux: add support for ELF vmlinux image
      board: Add a Qemu PPC g3beige board
      board: Add a Qemu mipsel Malta board
      linux: add KERNEL_ARCH_PATH to fix x86-specific issue

Yegor Yefremov (3):
      Free text field for serial port configuration
      Add network scripting folders to fs/skeleton
      Create menu entry to select device creation method

 Config.in                                          |   72 +-
 .../friendlyarm/mini2440/linux-2.6.32.2.config     | 1025 +-
 board/qemu/arm-versatile/linux-2.6.36.config       |   88 +
 board/qemu/mipsel-malta/linux-2.6.36.config        |   77 +
 board/qemu/mipsel-malta/readme.txt                 |    7 +
 board/qemu/powerpc-g3beige/linux-2.6.36.config     |   86 +
 board/qemu/powerpc-g3beige/readme.txt              |    6 +
 ...-missing-consts-to-sys_execve-declaration.patch |   17 +
 .../linux-sh-fix-kconfig-warning.patch             |   13 +
 board/qemu/sh4-r2d/linux-2.6.36.config             |  106 +
 board/qemu/sh4-r2d/readme.txt                      |   17 +
 board/qemu/x86/linux-2.6.36.config                 |   67 +
 boot/at91bootstrap/Config.in                       |   68 +-
 .../at91bootstrap-1.16-eabi-fix.patch              |  334 +
 boot/at91bootstrap/at91bootstrap.mk                |   75 +-
 boot/barebox/barebox.mk                            |    2 +-
 boot/u-boot/Config.in                              |    6 +-
 boot/u-boot/u-boot.mk                              |    2 +-
 configs/arm_nptl_toolchain_defconfig               |  739 +-
 configs/arm_toolchain_defconfig                    |  721 +-
 configs/at91rm9200df_defconfig                     |  992 +-
 configs/at91rm9200df_ext_bare_defconfig            |  655 -
 configs/at91rm9200df_ext_defconfig                 |  921 -
 configs/at91sam9260dfc_defconfig                   | 1015 +-
 configs/at91sam9260dfc_ext_bare_defconfig          |  656 -
 configs/at91sam9260dfc_ext_defconfig               |  930 -
 configs/at91sam9260pf_defconfig                    |  639 -
 configs/at91sam9261ek_defconfig                    | 1069 +-
 configs/at91sam9261ek_ext_bare_defconfig           |  659 -
 configs/at91sam9261ek_ext_defconfig                | 1017 -
 configs/at91sam9263ek_defconfig                    | 1066 +-
 configs/at91sam9263ek_ext_bare_defconfig           |  658 -
 configs/at91sam9263ek_ext_defconfig                |  980 -
 configs/at91sam9g20dfc_defconfig                   |  929 +-
 configs/at91sam9g20dfc_ext_bare_defconfig          |  655 -
 configs/at91sam9g20dfc_ext_defconfig               |  929 -
 configs/atngw100-base_defconfig                    |  802 -
 configs/atngw100_defconfig                         |  808 +-
 configs/atstk1005_defconfig                        |  850 -
 configs/atstk100x_defconfig                        |  951 +-
 configs/i386_defconfig                             |  766 -
 configs/i686_defconfig                             |  766 -
 configs/integrator926_defconfig                    |  768 +-
 configs/integrator926_huge_defconfig               |  742 -
 configs/kb9202_defconfig                           |  733 +-
 configs/mini2440_defconfig                         |   31 +
 configs/qemu_arm_versatile_defconfig               |   11 +
 configs/qemu_mipsel_malta_defconfig                |   15 +
 configs/qemu_ppc_g3beige_defconfig                 |   15 +
 configs/qemu_sh4_r2d_defconfig                     |   17 +
 configs/qemu_x86_defconfig                         |   10 +
 configs/v100sc2_defconfig                          |  716 -
 docs/buildroot.html                                |  117 +-
 fs/Config.in                                       |   41 +-
 fs/skeleton/etc/inittab                            |    7 +-
 .../skeleton/etc/network/if-down.d}/.empty         |    0
 .../skeleton/etc/network/if-post-down.d}/.empty    |    0
 .../skeleton/etc/network/if-pre-up.d}/.empty       |    0
 .../skeleton/etc/network/if-up.d}/.empty           |    0
 linux/Config.in                                    |   13 +-
 linux/linux.mk                                     |   58 +-
 package/busybox/S10mdev                            |   22 +
 package/busybox/busybox.mk                         |   15 +
 package/udev/S10udev                               |   34 -
 target/Makefile.in                                 |    5 -
 target/device/ARMLTD/Config.in                     |   36 -
 target/device/ARMLTD/Makefile.in                   |    5 -
 .../integrator926-linux-2.6.28.2.config            | 1221 -
 .../integrator926_huge-linux-2.6.28.2.config       | 1236 -
 target/device/Atmel/AT91_Config.in                 |  335 -
 target/device/Atmel/AVR32_Config.in                |   82 -
 target/device/Atmel/Config.in                      |   62 -
 target/device/Atmel/Config.in.mirrors              |   27 -
 target/device/Atmel/Makefile.in                    |   20 -
 target/device/Atmel/Makefile.in.linux              |    3 -
 target/device/Atmel/arch-arm/arch-arm.mk           |    4 -
 .../linux-2.6.27-at91.patch.gz                     |  Bin 93020 -> 0 bytes
 .../linux-2.6.28-at91.patch.bz2                    |  Bin 67725 -> 0 bytes
 .../linux-2.6.28-exp.patch.bz2                     |  Bin 56841 -> 0 bytes
 target/device/Atmel/arch-avr32/arch-avr32.mk       |    3 -
 .../linux-2.6.28.7-100-avr32.patch                 |16813 ------------
 ...28.7-201-avr32-atmel_mpopfb-disable-debug.patch |   23 -
 ...mpopfb-add-signal-to-disable-line-caching.patch |   43 -
 ....28.7-203-avr32-fix-arch-header-byteorder.patch |   35 -
 ...4-avr32-ap700x-fix-det_pin-for-nand-flash.patch |   33 -
 .../linux-2.6.27.6-100-avr32-atmel.1.patch         |26786 --------------------
 ...00-avr32-remove.note.gnu.build-id-section.patch |   27 -
 ...27.6-201-avr32-atmel_mpopfb-disable-debug.patch |   23 -
 ...mpopfb-add-signal-to-disable-line-caching.patch |   59 -
 ....27.6-203-avr32-fix-arch-header-byteorder.patch |   35 -
 ...4-avr32-ap700x-fix-det_pin-for-nand-flash.patch |   31 -
 target/device/Atmel/at91rm9200df/Makefile.in       |    6 -
 .../at91rm9200df-linux-2.6.28.2.config             | 1570 --
 target/device/Atmel/at91sam9260dfc/Makefile.in     |   22 -
 .../at91sam9260dfc-linux-2.6.28.2.config           | 1640 --
 target/device/Atmel/at91sam9260pf/Makefile.in      |    7 -
 .../at91sam9260pf-linux-2.6.22.1.config            | 1461 --
 .../Atmel/at91sam9260pf/busybox-1.6.0.config       |  690 -
 .../Atmel/at91sam9260pf/u-boot/at91sam9260pf.h     |  370 -
 target/device/Atmel/at91sam9261ek/Makefile.in      |   22 -
 target/device/Atmel/at91sam9263ek/Makefile.in      |   18 -
 .../at91sam9263ek-linux-2.6.28.2.config            | 1440 --
 target/device/Atmel/at91sam9g20dfc/Makefile.in     |   17 -
 .../at91sam9g20dfc-linux-2.6.28.2.config           | 1650 --
 target/device/Atmel/atngw100-base/Makefile.in      |    4 -
 .../atngw100-base-linux-2.6.23.config              |  858 -
 .../atngw100-base-linux-2.6.24.config              | 1153 -
 .../Atmel/atngw100-base/busybox-1.11.0.config      |  767 -
 .../Atmel/atngw100-base/busybox-1.9.1.config       |  767 -
 target/device/Atmel/atngw100-base/device_table.txt |   56 -
 .../Atmel/atngw100-base/target_skeleton/etc/TZ     |    1 -
 .../Atmel/atngw100-base/target_skeleton/etc/fstab  |    3 -
 .../Atmel/atngw100-base/target_skeleton/etc/group  |   20 -
 .../atngw100-base/target_skeleton/etc/hostname     |    1 -
 .../Atmel/atngw100-base/target_skeleton/etc/hosts  |   12 -
 .../target_skeleton/etc/init.d/K70sendsig          |    1 -
 .../target_skeleton/etc/init.d/S00mountvirtfs      |   74 -
 .../target_skeleton/etc/init.d/S01hotplug          |   14 -
 .../target_skeleton/etc/init.d/S02hostname         |   47 -
 .../target_skeleton/etc/init.d/S08syslog           |   24 -
 .../target_skeleton/etc/init.d/S09klog             |   16 -
 .../atngw100-base/target_skeleton/etc/init.d/rcK   |    6 -
 .../atngw100-base/target_skeleton/etc/init.d/rcS   |   11 -
 .../atngw100-base/target_skeleton/etc/inittab      |   27 -
 .../atngw100-base/target_skeleton/etc/mdev.conf    |   49 -
 .../Atmel/atngw100-base/target_skeleton/etc/mtab   |    1 -
 .../target_skeleton/etc/network/interfaces         |    7 -
 .../Atmel/atngw100-base/target_skeleton/etc/passwd |   17 -
 .../atngw100-base/target_skeleton/etc/protocols    |  149 -
 .../atngw100-base/target_skeleton/etc/resolv.conf  |    1 -
 .../atngw100-base/target_skeleton/etc/services     | 2117 --
 .../Atmel/atngw100-base/target_skeleton/etc/shadow |   17 -
 .../Atmel/atngw100-base/target_skeleton/etc/shells |    8 -
 target/device/Atmel/atngw100/Makefile.in           |    4 -
 .../Atmel/atngw100/atngw100-linux-2.6.27.13.config | 1284 -
 .../Atmel/atngw100/atngw100-linux-2.6.28.2.config  | 1324 -
 .../Atmel/atngw100/atngw100-linux-2.6.29.2.config  | 1358 -
 target/device/Atmel/atngw100/device_table.txt      |  181 -
 target/device/Atmel/atngw100/jffs2_partitions.txt  |    8 -
 .../device/Atmel/atngw100/target_skeleton/etc/TZ   |    1 -
 .../atngw100/target_skeleton/etc/default/ntpdate   |    6 -
 .../atngw100/target_skeleton/etc/dnsmasq.conf      |  447 -
 .../Atmel/atngw100/target_skeleton/etc/fstab       |    4 -
 .../Atmel/atngw100/target_skeleton/etc/group       |   20 -
 .../Atmel/atngw100/target_skeleton/etc/hostname    |    1 -
 .../Atmel/atngw100/target_skeleton/etc/hosts       |   11 -
 .../atngw100/target_skeleton/etc/hosts.dnsmasq     |  246 -
 .../Atmel/atngw100/target_skeleton/etc/httpd.conf  |    2 -
 .../Atmel/atngw100/target_skeleton/etc/inetd.conf  |    3 -
 .../atngw100/target_skeleton/etc/init.d/K70sendsig |    1 -
 .../atngw100/target_skeleton/etc/init.d/K80netfs   |    1 -
 .../atngw100/target_skeleton/etc/init.d/K85network |   11 -
 .../atngw100/target_skeleton/etc/init.d/K90localfs |    1 -
 .../target_skeleton/etc/init.d/S00mountvirtfs      |   74 -
 .../atngw100/target_skeleton/etc/init.d/S01hotplug |   14 -
 .../target_skeleton/etc/init.d/S02hostname         |   47 -
 .../atngw100/target_skeleton/etc/init.d/S08syslog  |   24 -
 .../atngw100/target_skeleton/etc/init.d/S09klog    |   16 -
 .../target_skeleton/etc/init.d/S10modules-init     |   21 -
 .../atngw100/target_skeleton/etc/init.d/S15localfs |   11 -
 .../atngw100/target_skeleton/etc/init.d/S20network |   11 -
 .../atngw100/target_skeleton/etc/init.d/S21dnsmasq |   18 -
 .../target_skeleton/etc/init.d/S22iptables         |   43 -
 .../atngw100/target_skeleton/etc/init.d/S40telnetd |   16 -
 .../atngw100/target_skeleton/etc/init.d/S41inetd   |   16 -
 .../atngw100/target_skeleton/etc/init.d/S42httpd   |   16 -
 .../atngw100/target_skeleton/etc/init.d/S43ntp     |   27 -
 .../atngw100/target_skeleton/etc/init.d/S49netfs   |   11 -
 .../atngw100/target_skeleton/etc/init.d/S99gpio    |  142 -
 .../Atmel/atngw100/target_skeleton/etc/init.d/rcK  |    6 -
 .../Atmel/atngw100/target_skeleton/etc/init.d/rcS  |   11 -
 .../Atmel/atngw100/target_skeleton/etc/inittab     |   27 -
 .../Atmel/atngw100/target_skeleton/etc/mdev.conf   |   49 -
 .../device/Atmel/atngw100/target_skeleton/etc/mtab |    1 -
 .../target_skeleton/etc/network/interfaces         |   15 -
 .../Atmel/atngw100/target_skeleton/etc/ntp.conf    |   49 -
 .../Atmel/atngw100/target_skeleton/etc/passwd      |   18 -
 .../atngw100/target_skeleton/etc/proftpd.conf      |   31 -
 .../Atmel/atngw100/target_skeleton/etc/protocols   |  149 -
 .../Atmel/atngw100/target_skeleton/etc/resolv.conf |    1 -
 .../atngw100/target_skeleton/etc/samba/smb.conf    |  287 -
 .../atngw100/target_skeleton/etc/samba/smbpasswd   |    1 -
 .../Atmel/atngw100/target_skeleton/etc/services    | 2117 --
 .../Atmel/atngw100/target_skeleton/etc/shadow      |   18 -
 .../Atmel/atngw100/target_skeleton/etc/shells      |    8 -
 .../atngw100/target_skeleton/root/.bash_logout     |    7 -
 .../atngw100/target_skeleton/root/.bash_profile    |   15 -
 .../Atmel/atngw100/target_skeleton/root/.bashrc    |   48 -
 .../usr/share/udhcpc/default.script                |   19 -
 target/device/Atmel/atstk1005/Makefile.in          |    3 -
 .../atstk1005/atstk1005-linux-2.6.27.13.config     | 1522 --
 .../atstk1005/atstk1005-linux-2.6.28.2.config      | 1602 --
 target/device/Atmel/atstk1005/busybox-1.9.1.config |  767 -
 target/device/Atmel/atstk1005/device_table.txt     |  181 -
 .../device/Atmel/atstk1005/target_skeleton/etc/TZ  |    1 -
 .../atstk1005/target_skeleton/etc/asound.state     |  108 -
 .../atstk1005/target_skeleton/etc/default/ntpdate  |    6 -
 .../atstk1005/target_skeleton/etc/dnsmasq.conf     |  385 -
 .../Atmel/atstk1005/target_skeleton/etc/fb.modes   |    5 -
 .../Atmel/atstk1005/target_skeleton/etc/fstab      |    3 -
 .../Atmel/atstk1005/target_skeleton/etc/group      |   20 -
 .../Atmel/atstk1005/target_skeleton/etc/hostname   |    1 -
 .../Atmel/atstk1005/target_skeleton/etc/hosts      |   12 -
 .../atstk1005/target_skeleton/etc/hosts.dnsmasq    |  246 -
 .../Atmel/atstk1005/target_skeleton/etc/httpd.conf |    2 -
 .../Atmel/atstk1005/target_skeleton/etc/inetd.conf |    3 -
 .../target_skeleton/etc/init.d/K20alsa-utils       |   14 -
 .../target_skeleton/etc/init.d/K70sendsig          |    1 -
 .../atstk1005/target_skeleton/etc/init.d/K80netfs  |    1 -
 .../target_skeleton/etc/init.d/K85network          |   11 -
 .../target_skeleton/etc/init.d/K90localfs          |    1 -
 .../target_skeleton/etc/init.d/S00mountvirtfs      |   74 -
 .../target_skeleton/etc/init.d/S01hotplug          |   14 -
 .../target_skeleton/etc/init.d/S02hostname         |   47 -
 .../target_skeleton/etc/init.d/S03bootsplash       |   25 -
 .../atstk1005/target_skeleton/etc/init.d/S08syslog |   24 -
 .../atstk1005/target_skeleton/etc/init.d/S09klog   |   16 -
 .../target_skeleton/etc/init.d/S10modules-init     |   21 -
 .../target_skeleton/etc/init.d/S15localfs          |   11 -
 .../target_skeleton/etc/init.d/S20network          |   11 -
 .../target_skeleton/etc/init.d/S40telnetd          |   16 -
 .../atstk1005/target_skeleton/etc/init.d/S41inetd  |   16 -
 .../atstk1005/target_skeleton/etc/init.d/S42httpd  |   16 -
 .../atstk1005/target_skeleton/etc/init.d/S43ntp    |   27 -
 .../atstk1005/target_skeleton/etc/init.d/S49netfs  |   11 -
 .../target_skeleton/etc/init.d/S50alsa-utils       |   19 -
 .../atstk1005/target_skeleton/etc/init.d/S99gpio   |  142 -
 .../atstk1005/target_skeleton/etc/init.d/S99splash |   17 -
 .../Atmel/atstk1005/target_skeleton/etc/init.d/rcK |    6 -
 .../Atmel/atstk1005/target_skeleton/etc/init.d/rcS |   11 -
 .../Atmel/atstk1005/target_skeleton/etc/inittab    |   28 -
 .../Atmel/atstk1005/target_skeleton/etc/mdev.conf  |   49 -
 .../Atmel/atstk1005/target_skeleton/etc/modules    |    4 -
 .../atstk1005/target_skeleton/etc/mplayer.conf     |  129 -
 .../Atmel/atstk1005/target_skeleton/etc/mtab       |    1 -
 .../target_skeleton/etc/network/interfaces         |   11 -
 .../Atmel/atstk1005/target_skeleton/etc/ntp.conf   |   49 -
 .../Atmel/atstk1005/target_skeleton/etc/passwd     |   18 -
 .../atstk1005/target_skeleton/etc/proftpd.conf     |   31 -
 .../Atmel/atstk1005/target_skeleton/etc/protocols  |  149 -
 .../atstk1005/target_skeleton/etc/resolv.conf      |    1 -
 .../atstk1005/target_skeleton/etc/samba/smb.conf   |  287 -
 .../atstk1005/target_skeleton/etc/samba/smbpasswd  |    1 -
 .../Atmel/atstk1005/target_skeleton/etc/services   | 2117 --
 .../Atmel/atstk1005/target_skeleton/etc/shadow     |   18 -
 .../Atmel/atstk1005/target_skeleton/etc/shells     |    8 -
 .../atstk1005/target_skeleton/root/.bash_logout    |    7 -
 .../atstk1005/target_skeleton/root/.bash_profile   |   15 -
 .../Atmel/atstk1005/target_skeleton/root/.bashrc   |   48 -
 .../usr/share/udhcpc/default.script                |   19 -
 target/device/Atmel/atstk100x/Makefile.in          |    4 -
 .../atstk100x/atstk100x-linux-2.6.27.13.config     | 1283 -
 .../atstk100x/atstk100x-linux-2.6.28.2.config      | 1332 -
 target/device/Atmel/atstk100x/busybox-1.9.1.config |  767 -
 target/device/Atmel/atstk100x/device_table.txt     |  181 -
 ...-200-gpio_mouse-setup-for-atstk1000-board.patch |  130 -
 .../device/Atmel/atstk100x/target_skeleton/etc/TZ  |    1 -
 .../atstk100x/target_skeleton/etc/asound.state     |  108 -
 .../atstk100x/target_skeleton/etc/default/ntpdate  |    6 -
 .../atstk100x/target_skeleton/etc/dnsmasq.conf     |  385 -
 .../Atmel/atstk100x/target_skeleton/etc/fb.modes   |    5 -
 .../Atmel/atstk100x/target_skeleton/etc/fstab      |    3 -
 .../Atmel/atstk100x/target_skeleton/etc/group      |   20 -
 .../Atmel/atstk100x/target_skeleton/etc/hostname   |    1 -
 .../Atmel/atstk100x/target_skeleton/etc/hosts      |   12 -
 .../atstk100x/target_skeleton/etc/hosts.dnsmasq    |  246 -
 .../Atmel/atstk100x/target_skeleton/etc/httpd.conf |    2 -
 .../Atmel/atstk100x/target_skeleton/etc/inetd.conf |    3 -
 .../target_skeleton/etc/init.d/K20alsa-utils       |   14 -
 .../target_skeleton/etc/init.d/K70sendsig          |    1 -
 .../atstk100x/target_skeleton/etc/init.d/K80netfs  |    1 -
 .../target_skeleton/etc/init.d/K85network          |   11 -
 .../target_skeleton/etc/init.d/K90localfs          |    1 -
 .../target_skeleton/etc/init.d/S00mountvirtfs      |   74 -
 .../target_skeleton/etc/init.d/S01hotplug          |   14 -
 .../target_skeleton/etc/init.d/S02hostname         |   47 -
 .../target_skeleton/etc/init.d/S03bootsplash       |   25 -
 .../atstk100x/target_skeleton/etc/init.d/S08syslog |   24 -
 .../atstk100x/target_skeleton/etc/init.d/S09klog   |   16 -
 .../target_skeleton/etc/init.d/S10modules-init     |   21 -
 .../target_skeleton/etc/init.d/S15localfs          |   11 -
 .../target_skeleton/etc/init.d/S20network          |   11 -
 .../target_skeleton/etc/init.d/S40telnetd          |   16 -
 .../atstk100x/target_skeleton/etc/init.d/S41inetd  |   16 -
 .../atstk100x/target_skeleton/etc/init.d/S42httpd  |   16 -
 .../atstk100x/target_skeleton/etc/init.d/S43ntp    |   27 -
 .../atstk100x/target_skeleton/etc/init.d/S49netfs  |   11 -
 .../target_skeleton/etc/init.d/S50alsa-utils       |   19 -
 .../atstk100x/target_skeleton/etc/init.d/S99gpio   |  142 -
 .../atstk100x/target_skeleton/etc/init.d/S99splash |   17 -
 .../Atmel/atstk100x/target_skeleton/etc/init.d/rcK |    6 -
 .../Atmel/atstk100x/target_skeleton/etc/init.d/rcS |   11 -
 .../Atmel/atstk100x/target_skeleton/etc/inittab    |   28 -
 .../Atmel/atstk100x/target_skeleton/etc/mdev.conf  |   49 -
 .../Atmel/atstk100x/target_skeleton/etc/modules    |    4 -
 .../atstk100x/target_skeleton/etc/mplayer.conf     |  129 -
 .../Atmel/atstk100x/target_skeleton/etc/mtab       |    1 -
 .../target_skeleton/etc/network/interfaces         |   11 -
 .../Atmel/atstk100x/target_skeleton/etc/ntp.conf   |   49 -
 .../Atmel/atstk100x/target_skeleton/etc/passwd     |   18 -
 .../atstk100x/target_skeleton/etc/proftpd.conf     |   31 -
 .../Atmel/atstk100x/target_skeleton/etc/protocols  |  149 -
 .../atstk100x/target_skeleton/etc/resolv.conf      |    1 -
 .../atstk100x/target_skeleton/etc/samba/smb.conf   |  287 -
 .../atstk100x/target_skeleton/etc/samba/smbpasswd  |    1 -
 .../Atmel/atstk100x/target_skeleton/etc/services   | 2117 --
 .../Atmel/atstk100x/target_skeleton/etc/shadow     |   18 -
 .../Atmel/atstk100x/target_skeleton/etc/shells     |    8 -
 .../atstk100x/target_skeleton/root/.bash_logout    |    7 -
 .../atstk100x/target_skeleton/root/.bash_profile   |   15 -
 .../Atmel/atstk100x/target_skeleton/root/.bashrc   |   48 -
 .../usr/share/udhcpc/default.script                |   19 -
 target/device/Atmel/misc-patches/README            |    2 -
 .../misc-patches/u-boot-1.3.0-200MHz-ngw100.patch  |   20 -
 .../u-boot-1.3.0-64MB-sdram-ngw100.patch           |   11 -
 target/device/Atmel/root/device_table.txt          |  162 -
 target/device/Atmel/root/skel.patch                |   71 -
 target/device/Atmel/root/skel.tar.gz               |  Bin 629 -> 0 bytes
 target/device/Atmel/root/skel_busybox.patch        |  215 -
 .../Atmel/root/target_busybox_skeleton/etc/TZ      |    1 -
 .../Atmel/root/target_busybox_skeleton/etc/fstab   |    9 -
 .../Atmel/root/target_busybox_skeleton/etc/group   |   16 -
 .../root/target_busybox_skeleton/etc/hostname      |    1 -
 .../Atmel/root/target_busybox_skeleton/etc/hosts   |    1 -
 .../target_busybox_skeleton/etc/init.d/S20urandom  |   54 -
 .../target_busybox_skeleton/etc/init.d/S40network  |   35 -
 .../root/target_busybox_skeleton/etc/init.d/rcS    |   27 -
 .../Atmel/root/target_busybox_skeleton/etc/inittab |   51 -
 .../Atmel/root/target_busybox_skeleton/etc/inputrc |   44 -
 .../Atmel/root/target_busybox_skeleton/etc/issue   |    3 -
 .../target_busybox_skeleton/etc/network/interfaces |    4 -
 .../Atmel/root/target_busybox_skeleton/etc/passwd  |   15 -
 .../Atmel/root/target_busybox_skeleton/etc/profile |   48 -
 .../root/target_busybox_skeleton/etc/protocols     |   31 -
 .../root/target_busybox_skeleton/etc/random-seed   |  Bin 512 -> 0 bytes
 .../root/target_busybox_skeleton/etc/securetty     |   12 -
 .../root/target_busybox_skeleton/etc/services      |  302 -
 .../Atmel/root/target_busybox_skeleton/etc/shadow  |   12 -
 target/device/Atmel/root/target_skeleton/etc/TZ    |    1 -
 target/device/Atmel/root/target_skeleton/etc/fstab |    9 -
 target/device/Atmel/root/target_skeleton/etc/group |   16 -
 .../device/Atmel/root/target_skeleton/etc/hostname |    1 -
 target/device/Atmel/root/target_skeleton/etc/hosts |    1 -
 .../root/target_skeleton/etc/init.d/S20urandom     |   54 -
 .../root/target_skeleton/etc/init.d/S40network     |   35 -
 .../Atmel/root/target_skeleton/etc/init.d/rcS      |   27 -
 .../device/Atmel/root/target_skeleton/etc/inittab  |   45 -
 .../device/Atmel/root/target_skeleton/etc/inputrc  |   44 -
 target/device/Atmel/root/target_skeleton/etc/issue |    3 -
 .../Atmel/root/target_skeleton/etc/ld.so.conf      |    1 -
 .../root/target_skeleton/etc/network/interfaces    |    4 -
 .../device/Atmel/root/target_skeleton/etc/passwd   |   15 -
 .../device/Atmel/root/target_skeleton/etc/profile  |   48 -
 .../Atmel/root/target_skeleton/etc/protocols       |   31 -
 .../Atmel/root/target_skeleton/etc/random-seed     |  Bin 512 -> 0 bytes
 .../Atmel/root/target_skeleton/etc/securetty       |   12 -
 .../device/Atmel/root/target_skeleton/etc/services |  302 -
 .../device/Atmel/root/target_skeleton/etc/shadow   |   12 -
 .../Atmel/root/target_skeleton/root/.bash_logout   |    7 -
 .../Atmel/root/target_skeleton/root/.bash_profile  |   15 -
 .../device/Atmel/root/target_skeleton/root/.bashrc |   48 -
 .../usr/share/udhcpc/default.script                |   39 -
 target/device/Atmel/root/uClibc.config             |  167 -
 target/device/Config.in                            |   15 -
 target/device/Config.in.mirrors                    |   71 -
 target/device/KwikByte/Config.in                   |   90 -
 target/device/KwikByte/Makefile.in                 |   10 -
 target/device/KwikByte/kb9202/Makefile.in          |    3 -
 target/device/KwikByte/kb9202/busybox.config       |  829 -
 target/device/KwikByte/kb9202/device_table.txt     |  164 -
 .../KwikByte/kb9202/kb9202-linux-2.6.24.config     | 1208 -
 .../KwikByte/kb9202/target_skeleton/etc/fstab      |   11 -
 .../KwikByte/kb9202/target_skeleton/etc/group      |    7 -
 .../KwikByte/kb9202/target_skeleton/etc/hostname   |    1 -
 .../KwikByte/kb9202/target_skeleton/etc/init.d/rcS |   15 -
 .../KwikByte/kb9202/target_skeleton/etc/inittab    |   33 -
 .../KwikByte/kb9202/target_skeleton/etc/issue      |    7 -
 .../KwikByte/kb9202/target_skeleton/etc/issue.net  |    6 -
 .../kb9202/target_skeleton/etc/ld.so.cache         |  Bin 669 -> 0 bytes
 .../KwikByte/kb9202/target_skeleton/etc/mdev.conf  |   50 -
 .../KwikByte/kb9202/target_skeleton/etc/mtab       |    1 -
 .../kb9202/target_skeleton/etc/network/interfaces  |   20 -
 .../KwikByte/kb9202/target_skeleton/etc/passwd     |   13 -
 .../KwikByte/kb9202/target_skeleton/etc/profile    |    2 -
 .../KwikByte/kb9202/target_skeleton/etc/protocols  |   31 -
 .../KwikByte/kb9202/target_skeleton/etc/services   |  302 -
 .../KwikByte/kb9202/target_skeleton/etc/shadow     |   12 -
 .../kb9202/target_skeleton/etc/vsftpd.conf         |   32 -
 .../kb9202/target_skeleton/root/.ash_history       |   15 -
 .../kb9202/target_skeleton/sbin/automount.script   |   21 -
 .../usr/share/udhcpc/default.script                |   40 -
 .../device/KwikByte/kb9202/target_skeleton/var/adm |    1 -
 .../device/KwikByte/kb9202/target_skeleton/var/tmp |    1 -
 target/device/Makefile.in                          |    2 -
 target/device/Makefile.in.linux                    |    1 -
 target/device/mips/Makefile.in                     |    4 -
 target/device/valka/Config.in                      |   25 -
 target/device/valka/Makefile.in                    |    6 -
 target/device/valka/device_table.txt               |   86 -
 target/device/valka/target_skeleton/etc/TZ         |    1 -
 .../device/valka/target_skeleton/etc/crontab/root  |    2 -
 .../valka/target_skeleton/etc/default/ntpdate      |    6 -
 .../valka/target_skeleton/etc/default/rc.conf      |   82 -
 target/device/valka/target_skeleton/etc/fstab      |    3 -
 target/device/valka/target_skeleton/etc/group      |    4 -
 target/device/valka/target_skeleton/etc/hosts      |   10 -
 target/device/valka/target_skeleton/etc/inetd.conf |   23 -
 target/device/valka/target_skeleton/etc/inittab    |    8 -
 .../device/valka/target_skeleton/etc/lighttpd.conf |   25 -
 target/device/valka/target_skeleton/etc/mdev.conf  |   41 -
 target/device/valka/target_skeleton/etc/mtab       |    1 -
 .../valka/target_skeleton/etc/network/interfaces   |   11 -
 target/device/valka/target_skeleton/etc/ntp.conf   |    7 -
 target/device/valka/target_skeleton/etc/passwd     |    4 -
 target/device/valka/target_skeleton/etc/protocols  |  151 -
 target/device/valka/target_skeleton/etc/rc         |   27 -
 target/device/valka/target_skeleton/etc/rc.conf    |    1 -
 .../valka/target_skeleton/etc/rc.d/00.virtualfs    |   24 -
 .../device/valka/target_skeleton/etc/rc.d/01.mdev  |   23 -
 .../valka/target_skeleton/etc/rc.d/02.localfs      |   22 -
 .../valka/target_skeleton/etc/rc.d/03.hostname     |   25 -
 .../valka/target_skeleton/etc/rc.d/04.syslog       |   24 -
 .../device/valka/target_skeleton/etc/rc.d/05.klog  |   24 -
 .../valka/target_skeleton/etc/rc.d/06.modules      |   31 -
 .../valka/target_skeleton/etc/rc.d/10.network      |   32 -
 .../valka/target_skeleton/etc/rc.d/11.ntpdate      |   24 -
 target/device/valka/target_skeleton/etc/rc.d/crond |   27 -
 .../device/valka/target_skeleton/etc/rc.d/dropbear |   37 -
 target/device/valka/target_skeleton/etc/rc.d/gpio  |   34 -
 target/device/valka/target_skeleton/etc/rc.d/inetd |   27 -
 .../device/valka/target_skeleton/etc/rc.d/lighttpd |   17 -
 .../device/valka/target_skeleton/etc/rc.d/nbd_swap |   31 -
 target/device/valka/target_skeleton/etc/rc.d/ntpd  |   24 -
 .../device/valka/target_skeleton/etc/rc.d/onewire  |   34 -
 .../device/valka/target_skeleton/etc/rc.d/portmap  |   31 -
 target/device/valka/target_skeleton/etc/rc.local   |    3 -
 .../device/valka/target_skeleton/etc/rc.shutdown   |    7 -
 target/device/valka/target_skeleton/etc/rc.subr    |  101 -
 target/device/valka/target_skeleton/etc/services   | 2393 --
 target/device/valka/target_skeleton/etc/shadow     |    4 -
 target/device/valka/target_skeleton/etc/shells     |    5 -
 .../usr/share/udhcpc/default.script                |   40 -
 target/device/valka/target_skeleton/var/lock       |    1 -
 target/device/valka/v100sc2/busybox.config         |  853 -
 target/device/valka/v100sc2/uClibc.config          |  201 -
 target/device/x86/Config.in                        |   26 -
 target/device/x86/Makefile.in                      |    4 -
 target/device/x86/i686/Makefile.in                 |    3 -
 target/device/x86/i686/i686-linux-2.6.28.2.config  | 2112 --
 target/device/x86/i686/linux-2.6.29.2.config       | 2157 --
 target/device/xtensa/Config.in                     |   21 -
 target/device/xtensa/Makefile.in                   |    7 -
 target/device/xtensa/skeleton-patch/etc/inittab    |   45 -
 target/generic/Config.in                           |  124 +-
 target/generic/Makefile.in                         |    9 +
 target/generic/device_table_mdev_udev.txt          |   17 +
 target/generic/mini_device_table.txt               |  176 -
 toolchain/dependencies/dependencies.sh             |    2 +-
 458 files changed, 1851 insertions(+), 125009 deletions(-)
 rename target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.28.2.config => board/friendlyarm/mini2440/linux-2.6.32.2.config (60%)
 create mode 100644 board/qemu/arm-versatile/linux-2.6.36.config
 create mode 100644 board/qemu/mipsel-malta/linux-2.6.36.config
 create mode 100644 board/qemu/mipsel-malta/readme.txt
 create mode 100644 board/qemu/powerpc-g3beige/linux-2.6.36.config
 create mode 100644 board/qemu/powerpc-g3beige/readme.txt
 create mode 100644 board/qemu/sh4-r2d/kernel-patches/linux-06-17-SH-Add-missing-consts-to-sys_execve-declaration.patch
 create mode 100644 board/qemu/sh4-r2d/kernel-patches/linux-sh-fix-kconfig-warning.patch
 create mode 100644 board/qemu/sh4-r2d/linux-2.6.36.config
 create mode 100644 board/qemu/sh4-r2d/readme.txt
 create mode 100644 board/qemu/x86/linux-2.6.36.config
 create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
 delete mode 100644 configs/at91rm9200df_ext_bare_defconfig
 delete mode 100644 configs/at91rm9200df_ext_defconfig
 delete mode 100644 configs/at91sam9260dfc_ext_bare_defconfig
 delete mode 100644 configs/at91sam9260dfc_ext_defconfig
 delete mode 100644 configs/at91sam9260pf_defconfig
 delete mode 100644 configs/at91sam9261ek_ext_bare_defconfig
 delete mode 100644 configs/at91sam9261ek_ext_defconfig
 delete mode 100644 configs/at91sam9263ek_ext_bare_defconfig
 delete mode 100644 configs/at91sam9263ek_ext_defconfig
 delete mode 100644 configs/at91sam9g20dfc_ext_bare_defconfig
 delete mode 100644 configs/at91sam9g20dfc_ext_defconfig
 delete mode 100644 configs/atngw100-base_defconfig
 delete mode 100644 configs/atstk1005_defconfig
 delete mode 100644 configs/i386_defconfig
 delete mode 100644 configs/i686_defconfig
 delete mode 100644 configs/integrator926_huge_defconfig
 create mode 100644 configs/mini2440_defconfig
 create mode 100644 configs/qemu_arm_versatile_defconfig
 create mode 100644 configs/qemu_mipsel_malta_defconfig
 create mode 100644 configs/qemu_ppc_g3beige_defconfig
 create mode 100644 configs/qemu_sh4_r2d_defconfig
 create mode 100644 configs/qemu_x86_defconfig
 delete mode 100644 configs/v100sc2_defconfig
 rename {target/device/Atmel/Linux => fs/skeleton/etc/network/if-down.d}/.empty (100%)
 rename {target/device/Atmel/at91rm9200df/kernel-patches => fs/skeleton/etc/network/if-post-down.d}/.empty (100%)
 rename {target/device/Atmel/at91sam9260dfc/kernel-patches => fs/skeleton/etc/network/if-pre-up.d}/.empty (100%)
 rename {target/device/Atmel/at91sam9260pf/kernel-patches => fs/skeleton/etc/network/if-up.d}/.empty (100%)
 create mode 100644 package/busybox/S10mdev
 delete mode 100644 target/device/ARMLTD/Config.in
 delete mode 100644 target/device/ARMLTD/Makefile.in
 delete mode 100644 target/device/ARMLTD/integrator926/integrator926-linux-2.6.28.2.config
 delete mode 100644 target/device/ARMLTD/integrator926_huge/integrator926_huge-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/AT91_Config.in
 delete mode 100644 target/device/Atmel/AVR32_Config.in
 delete mode 100644 target/device/Atmel/Config.in
 delete mode 100644 target/device/Atmel/Config.in.mirrors
 delete mode 100644 target/device/Atmel/Makefile.in
 delete mode 100644 target/device/Atmel/Makefile.in.linux
 delete mode 100644 target/device/Atmel/arch-arm/arch-arm.mk
 delete mode 100644 target/device/Atmel/arch-arm/kernel-patches-2.6.27/linux-2.6.27-at91.patch.gz
 delete mode 100644 target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-at91.patch.bz2
 delete mode 100644 target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-exp.patch.bz2
 delete mode 100644 target/device/Atmel/arch-avr32/arch-avr32.mk
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-100-avr32.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-201-avr32-atmel_mpopfb-disable-debug.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-203-avr32-fix-arch-header-byteorder.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-100-avr32-atmel.1.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-200-avr32-remove.note.gnu.build-id-section.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-201-avr32-atmel_mpopfb-disable-debug.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-203-avr32-fix-arch-header-byteorder.patch
 delete mode 100644 target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch
 delete mode 100644 target/device/Atmel/at91rm9200df/Makefile.in
 delete mode 100644 target/device/Atmel/at91rm9200df/at91rm9200df-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/at91sam9260dfc/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/at91sam9260pf/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9260pf/at91sam9260pf-linux-2.6.22.1.config
 delete mode 100644 target/device/Atmel/at91sam9260pf/busybox-1.6.0.config
 delete mode 100644 target/device/Atmel/at91sam9260pf/u-boot/at91sam9260pf.h
 delete mode 100644 target/device/Atmel/at91sam9261ek/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9261ek/kernel-patches/.empty
 delete mode 100644 target/device/Atmel/at91sam9263ek/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9263ek/at91sam9263ek-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/at91sam9263ek/kernel-patches/.empty
 delete mode 100644 target/device/Atmel/at91sam9g20dfc/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/at91sam9g20dfc/kernel-patches/.empty
 delete mode 100644 target/device/Atmel/atngw100-base/Makefile.in
 delete mode 100644 target/device/Atmel/atngw100-base/atngw100-base-linux-2.6.23.config
 delete mode 100644 target/device/Atmel/atngw100-base/atngw100-base-linux-2.6.24.config
 delete mode 100644 target/device/Atmel/atngw100-base/busybox-1.11.0.config
 delete mode 100644 target/device/Atmel/atngw100-base/busybox-1.9.1.config
 delete mode 100644 target/device/Atmel/atngw100-base/device_table.txt
 delete mode 100644 target/device/Atmel/atngw100-base/kernel-patches/.empty
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/group
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/hosts
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/K70sendsig
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/S00mountvirtfs
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/S01hotplug
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/S02hostname
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/S08syslog
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/S09klog
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/rcK
 delete mode 100755 target/device/Atmel/atngw100-base/target_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/mdev.conf
 delete mode 120000 target/device/Atmel/atngw100-base/target_skeleton/etc/mtab
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/protocols
 delete mode 120000 target/device/Atmel/atngw100-base/target_skeleton/etc/resolv.conf
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/services
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/atngw100-base/target_skeleton/etc/shells
 delete mode 100644 target/device/Atmel/atngw100/Makefile.in
 delete mode 100644 target/device/Atmel/atngw100/atngw100-linux-2.6.27.13.config
 delete mode 100644 target/device/Atmel/atngw100/atngw100-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/atngw100/atngw100-linux-2.6.29.2.config
 delete mode 100644 target/device/Atmel/atngw100/device_table.txt
 delete mode 100644 target/device/Atmel/atngw100/jffs2_partitions.txt
 delete mode 100644 target/device/Atmel/atngw100/kernel-patches/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/bin/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/boot/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/config/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/dev/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/default/ntpdate
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/dnsmasq.conf
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/ethers
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/group
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/hosts
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/hosts.dnsmasq
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/httpd.conf
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/inetd.conf
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/K70sendsig
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/K80netfs
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/K85network
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/K90localfs
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S00mountvirtfs
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S01hotplug
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S02hostname
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S08syslog
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S09klog
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S10modules-init
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S15localfs
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S20network
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S21dnsmasq
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S22iptables
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S40telnetd
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S41inetd
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S42httpd
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S43ntp
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S49netfs
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/S99gpio
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcK
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/mdev.conf
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/modules
 delete mode 120000 target/device/Atmel/atngw100/target_skeleton/etc/mtab
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/ntp.conf
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/proftpd.conf
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/protocols
 delete mode 120000 target/device/Atmel/atngw100/target_skeleton/etc/resolv.conf
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/samba/smb.conf
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/samba/smbpasswd
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/services
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/etc/shells
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/home/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/lib/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/mnt/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/opt/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/root/.bash_history
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/root/.bash_logout
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/root/.bash_profile
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/root/.bashrc
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/root/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/sbin/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/sys/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/tmp/resolv.conf
 delete mode 100755 target/device/Atmel/atngw100/target_skeleton/usr/share/udhcpc/default.script
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/cache/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/lib/pcmcia/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/lock/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/log/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/pcmcia/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/run/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/spool/.empty
 delete mode 100644 target/device/Atmel/atngw100/target_skeleton/var/tmp/.empty
 delete mode 100644 target/device/Atmel/atstk1005/Makefile.in
 delete mode 100644 target/device/Atmel/atstk1005/atstk1005-linux-2.6.27.13.config
 delete mode 100644 target/device/Atmel/atstk1005/atstk1005-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/atstk1005/busybox-1.9.1.config
 delete mode 100644 target/device/Atmel/atstk1005/device_table.txt
 delete mode 100644 target/device/Atmel/atstk1005/kernel-patches/.empty
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/asound.state
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/default/ntpdate
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/dnsmasq.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/fb.modes
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/group
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/hosts
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/hosts.dnsmasq
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/httpd.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/inetd.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/K20alsa-utils
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/K70sendsig
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/K80netfs
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/K85network
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/K90localfs
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S00mountvirtfs
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S01hotplug
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S02hostname
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S03bootsplash
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S08syslog
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S09klog
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S10modules-init
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S15localfs
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S20network
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S40telnetd
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S41inetd
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S42httpd
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S43ntp
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S49netfs
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S50alsa-utils
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S99gpio
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/S99splash
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/rcK
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/mdev.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/modules
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/mplayer.conf
 delete mode 120000 target/device/Atmel/atstk1005/target_skeleton/etc/mtab
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/ntp.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/proftpd.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/protocols
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/resolv.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/samba/smb.conf
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/samba/smbpasswd
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/services
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/etc/shells
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/root/.bash_logout
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/root/.bash_profile
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/root/.bashrc
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/sys/.empty
 delete mode 100644 target/device/Atmel/atstk1005/target_skeleton/usr/share/udhcpc/default.script
 delete mode 100644 target/device/Atmel/atstk100x/Makefile.in
 delete mode 100644 target/device/Atmel/atstk100x/atstk100x-linux-2.6.27.13.config
 delete mode 100644 target/device/Atmel/atstk100x/atstk100x-linux-2.6.28.2.config
 delete mode 100644 target/device/Atmel/atstk100x/busybox-1.9.1.config
 delete mode 100644 target/device/Atmel/atstk100x/device_table.txt
 delete mode 100644 target/device/Atmel/atstk100x/kernel-patches/linux-2.6.23-200-gpio_mouse-setup-for-atstk1000-board.patch
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/asound.state
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/default/ntpdate
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/dnsmasq.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/fb.modes
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/group
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/hosts
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/hosts.dnsmasq
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/httpd.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/inetd.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K20alsa-utils
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K70sendsig
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K80netfs
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K85network
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/K90localfs
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S00mountvirtfs
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S01hotplug
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S02hostname
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S03bootsplash
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S08syslog
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S09klog
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S10modules-init
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S15localfs
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S20network
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S40telnetd
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S41inetd
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S42httpd
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S43ntp
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S49netfs
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S50alsa-utils
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99gpio
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/S99splash
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/rcK
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/mdev.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/modules
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/mplayer.conf
 delete mode 120000 target/device/Atmel/atstk100x/target_skeleton/etc/mtab
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/ntp.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/proftpd.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/protocols
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/resolv.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/samba/smb.conf
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/samba/smbpasswd
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/services
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/etc/shells
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/root/.bash_logout
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/root/.bash_profile
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/root/.bashrc
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/sys/.empty
 delete mode 100644 target/device/Atmel/atstk100x/target_skeleton/usr/share/udhcpc/default.script
 delete mode 100644 target/device/Atmel/misc-patches/README
 delete mode 100644 target/device/Atmel/misc-patches/u-boot-1.3.0-200MHz-ngw100.patch
 delete mode 100644 target/device/Atmel/misc-patches/u-boot-1.3.0-64MB-sdram-ngw100.patch
 delete mode 100644 target/device/Atmel/root/device_table.txt
 delete mode 100644 target/device/Atmel/root/skel.patch
 delete mode 100644 target/device/Atmel/root/skel.tar.gz
 delete mode 100644 target/device/Atmel/root/skel_busybox.patch
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/group
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/hosts
 delete mode 100755 target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S20urandom
 delete mode 100755 target/device/Atmel/root/target_busybox_skeleton/etc/init.d/S40network
 delete mode 100755 target/device/Atmel/root/target_busybox_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/inputrc
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/issue
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/ld.so.conf.d/.empty
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/profile
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/protocols
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/random-seed
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/securetty
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/services
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/root/target_busybox_skeleton/sys/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/bin/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/boot/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/config/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/dev/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/TZ
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/fstab
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/group
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/hostname
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/hosts
 delete mode 100755 target/device/Atmel/root/target_skeleton/etc/init.d/S20urandom
 delete mode 100755 target/device/Atmel/root/target_skeleton/etc/init.d/S40network
 delete mode 100755 target/device/Atmel/root/target_skeleton/etc/init.d/rcS
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/inittab
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/inputrc
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/issue
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/ld.so.conf
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/ld.so.conf.d/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/network/interfaces
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/passwd
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/profile
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/protocols
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/random-seed
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/securetty
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/services
 delete mode 100644 target/device/Atmel/root/target_skeleton/etc/shadow
 delete mode 100644 target/device/Atmel/root/target_skeleton/home/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/lib/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/mnt/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/opt/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/proc/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/root/.bash_history
 delete mode 100644 target/device/Atmel/root/target_skeleton/root/.bash_logout
 delete mode 100644 target/device/Atmel/root/target_skeleton/root/.bash_profile
 delete mode 100644 target/device/Atmel/root/target_skeleton/root/.bashrc
 delete mode 100644 target/device/Atmel/root/target_skeleton/root/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/sbin/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/sys/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/tmp/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/usr/bin/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/usr/include/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/usr/lib/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/usr/man/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/usr/sbin/.empty
 delete mode 100755 target/device/Atmel/root/target_skeleton/usr/share/udhcpc/default.script
 delete mode 100644 target/device/Atmel/root/target_skeleton/usr/src/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/cache/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/lib/pcmcia/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/lock/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/log/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/pcmcia/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/run/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/spool/.empty
 delete mode 100644 target/device/Atmel/root/target_skeleton/var/tmp/.empty
 delete mode 100644 target/device/Atmel/root/uClibc.config
 delete mode 100644 target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.1.4/.empty
 delete mode 100644 target/device/Atmel/toolchain/avr32/gcc-4.1.2-avr32-2.0/.empty
 delete mode 100644 target/device/Config.in
 delete mode 100644 target/device/Config.in.mirrors
 delete mode 100644 target/device/KwikByte/Config.in
 delete mode 100644 target/device/KwikByte/Makefile.in
 delete mode 100644 target/device/KwikByte/kb9202/Makefile.in
 delete mode 100644 target/device/KwikByte/kb9202/busybox.config
 delete mode 100644 target/device/KwikByte/kb9202/device_table.txt
 delete mode 100644 target/device/KwikByte/kb9202/kb9202-linux-2.6.24.config
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/bin/.empty
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/fstab
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/group
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/hostname
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/init.d/rcS
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/inittab
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/issue
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/issue.net
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/ld.so.cache
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/ld.so.conf
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/mdev.conf
 delete mode 120000 target/device/KwikByte/kb9202/target_skeleton/etc/mtab
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/network/if-down.d/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/network/if-post-down.d/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/network/if-pre-up.d/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/network/if-up.d/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/network/interfaces
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/passwd
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/profile
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/protocols
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/services
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/etc/shadow
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/etc/vsftpd.conf
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/home/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/lib/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/proc/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/root/.ash_history
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/sbin/automount.script
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/sys/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/tmp/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/usr/bin/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/usr/lib/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/usr/sbin/.empty
 delete mode 100755 target/device/KwikByte/kb9202/target_skeleton/usr/share/udhcpc/default.script
 delete mode 120000 target/device/KwikByte/kb9202/target_skeleton/var/adm
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/var/log/.empty
 delete mode 100644 target/device/KwikByte/kb9202/target_skeleton/var/run/.empty
 delete mode 120000 target/device/KwikByte/kb9202/target_skeleton/var/tmp
 delete mode 100644 target/device/Makefile.in
 delete mode 100644 target/device/Makefile.in.linux
 delete mode 100644 target/device/mips/Makefile.in
 delete mode 100644 target/device/valka/Config.in
 delete mode 100644 target/device/valka/Makefile.in
 delete mode 100644 target/device/valka/device_table.txt
 delete mode 100644 target/device/valka/target_skeleton/etc/TZ
 delete mode 100644 target/device/valka/target_skeleton/etc/crontab/root
 delete mode 100644 target/device/valka/target_skeleton/etc/default/ntpdate
 delete mode 100755 target/device/valka/target_skeleton/etc/default/rc.conf
 delete mode 100644 target/device/valka/target_skeleton/etc/fonts/.empty
 delete mode 100644 target/device/valka/target_skeleton/etc/fstab
 delete mode 100644 target/device/valka/target_skeleton/etc/group
 delete mode 100644 target/device/valka/target_skeleton/etc/hostname
 delete mode 100644 target/device/valka/target_skeleton/etc/hosts
 delete mode 100644 target/device/valka/target_skeleton/etc/inetd.conf
 delete mode 100644 target/device/valka/target_skeleton/etc/init.d/.empty
 delete mode 100644 target/device/valka/target_skeleton/etc/inittab
 delete mode 100644 target/device/valka/target_skeleton/etc/lighttpd.conf
 delete mode 100644 target/device/valka/target_skeleton/etc/mdev.conf
 delete mode 100644 target/device/valka/target_skeleton/etc/modules
 delete mode 120000 target/device/valka/target_skeleton/etc/mtab
 delete mode 100644 target/device/valka/target_skeleton/etc/network/if-down.d/.empty
 delete mode 100644 target/device/valka/target_skeleton/etc/network/if-post-down.d/.empty
 delete mode 100644 target/device/valka/target_skeleton/etc/network/if-pre-up.d/.empty
 delete mode 100644 target/device/valka/target_skeleton/etc/network/if-up.d/.empty
 delete mode 100644 target/device/valka/target_skeleton/etc/network/interfaces
 delete mode 100644 target/device/valka/target_skeleton/etc/ntp.conf
 delete mode 100644 target/device/valka/target_skeleton/etc/passwd
 delete mode 100644 target/device/valka/target_skeleton/etc/protocols
 delete mode 100755 target/device/valka/target_skeleton/etc/rc
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.conf
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/00.virtualfs
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/01.mdev
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/02.localfs
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/03.hostname
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/04.syslog
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/05.klog
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/06.modules
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/10.network
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/11.ntpdate
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/crond
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/dropbear
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/gpio
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/inetd
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/lighttpd
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/nbd_swap
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/ntpd
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/onewire
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.d/portmap
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.local
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.shutdown
 delete mode 100755 target/device/valka/target_skeleton/etc/rc.subr
 delete mode 100644 target/device/valka/target_skeleton/etc/resolv.conf
 delete mode 100644 target/device/valka/target_skeleton/etc/services
 delete mode 100644 target/device/valka/target_skeleton/etc/shadow
 delete mode 100644 target/device/valka/target_skeleton/etc/shells
 delete mode 100755 target/device/valka/target_skeleton/usr/share/udhcpc/default.script
 delete mode 100644 target/device/valka/target_skeleton/valka/web/.empty
 delete mode 100644 target/device/valka/target_skeleton/var/db/.empty
 delete mode 120000 target/device/valka/target_skeleton/var/lock
 delete mode 100644 target/device/valka/target_skeleton/var/run/.empty
 delete mode 100644 target/device/valka/v100sc2/busybox.config
 delete mode 100644 target/device/valka/v100sc2/uClibc.config
 delete mode 100644 target/device/x86/Config.in
 delete mode 100644 target/device/x86/Makefile.in
 delete mode 100644 target/device/x86/i686/Makefile.in
 delete mode 100644 target/device/x86/i686/i686-linux-2.6.28.2.config
 delete mode 100644 target/device/x86/i686/linux-2.6.29.2.config
 delete mode 100644 target/device/xtensa/Config.in
 delete mode 100644 target/device/xtensa/Makefile.in
 delete mode 100644 target/device/xtensa/skeleton-patch/etc/inittab
 create mode 100644 target/generic/device_table_mdev_udev.txt
 delete mode 100644 target/generic/mini_device_table.txt

Thanks,
-- 
Thomas Petazzoni
