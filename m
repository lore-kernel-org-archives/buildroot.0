From: Quick X <quickx@hotmail.com>
Date: Tue, 6 Jan 2009 12:40:11 -0800
Subject: [Buildroot] Buildroot Not Using Saved Config for Linux
In-Reply-To: <1231266708.32308.211.camel@elrond.atmel.com>
References: <BAY124-W25B0802FB150D5566BD194D2E10@phx.gbl>
	<1231266708.32308.211.camel@elrond.atmel.com>
Message-ID: <BAY124-W57E1951ECAC0A6C8CF1BCCD2DE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


My apologies, I'm still very new at this so maybe this is just me, however, I'm still unable to get it to work.
 
To clarify, what your saying is that when I do "$ make BOARD=MYPROJECT" and there is a "local/MYPROJECT/linux-2.6.24.3.config", and the "BR2_PACKAGE_LINUX_KCONFIG" is set to ".//local/at91sam9261ek/linux-2.6.24.3.config".  Then where it's actually looking for the linux config is:
 
"buildroot/local/MYPROJECT/local/MYPROJECT/linux-2.6.24.3.config"?  Thus I have to do "$ make BOARD=at91sam9261ek getconfig" and then issue a "make"?  I've just tried the following examples:
 
--Start From Scratch with using my local dir--
$ svn co svn://uclibc.org/trunk/buildroot -r 24237 buildroot
$ cd buildroot
$ cp -rap ../local/ local/
$ make menuconfig (SAVE EXIT)
$ make BOARD=MYPROJECT getconfig
$ make
--Result--
"buildroot/local/MYPROJECT/MYPROJECT.config" is used, however "buildroot/local/MYPROJECT/linux-2.6.24.3.config" is not used; it creates a brand new config based on the kernels at91sam9261ek_defconfig.  This is how it acts even if I don't issue the "getconfig" command.
 

--Start With Linux Directory Already Extracted--
$ svn co svn://uclibc.org/trunk/buildroot -r 24237 buildroot
$ make menuconfig (SAVE EXIT)
$ make at91sam9261ek_defconfig
[[WAIT Till FINISH]]
$ make clean
$ rm -rf binaries
$ make linux26-menuconfig (DISABLE 16Bit NAND Flash Bus)
$ make saveconfig
$ make linux26-menuconfig (ENABLE 16Bit NAND Flash Bus)
$ make BOARD=MYPROJECT getconfig
$ make            ALSO Tried        $ make BOARD=MYPROJECT
--Result--
The "Enable 16Bit NAND Flash Bus" config is used, not the saved "Disable 16Bit NAND Flash Bus" config.

 
 
> It does not modify the ?$(TOPDIR)/.config file,so you
> will still be using the same paths.
Aye, I did notice this.  However, when I Issue a "make BOARD=MYPROJECT", for me, it does use the "buildroot/local/MYPROJECT/MYPROJECT.config", ignoring the "buildroot/.config" config.
 

> If you want to use the new board stuff, you have to do
> $ make BOARD=MYPROJECT getconfig 
Even after issuing this command, and doing "make" or "make BOARD=MYPROJECT', the linux config still isn't getting used properly.
 
 
> Note that you can set BUILDROOT_LOCAL to whatever in 
> your shell environment so you can store your project
> files outside the buildroot source tree.

Ahh I didn't know this.  I only use the local directory inside the buildroot tree right now, however, it's good to know for the future.  Thanks
 
 
 
------Below is a snipplet of the make log file of "Example 1" if it is helpful----------
$ svn co svn://uclibc.org/trunk/buildroot -r 24237 buildroot
$ cp -rap ../local/ local/
$ make menuconfig (SAVe EXIT)
$ make BOARD=at91sam9261ek getconfig
$ make
[[[SNIP]]]
rm -rf /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3
*** Unpacking kernel source
bzcat /home/dustin/buildroot/dl/linux-2.6.24.tar.bz2 | tar -C /home/dustin/buildroot/project_build_arm/at91sam9261ek   -xf -
# Rename the dir from the downloaded version to the AFTER patch version
mv -f /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24 /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3
touch /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.unpacked
toolchain/patch-kernel.sh /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 /home/dustin/buildroot/dl patch-2.6.24.3.bz2
toolchain/patch-kernel.sh /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 toolchain/kernel-headers \
                linux-2.6.24.3-\*.patch{,.gz,.bz2}
touch /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.patched
if [ -d target/device/Atmel/arch-arm/kernel-patches-2.6.24 ] ; then \
        toolchain/patch-kernel.sh /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 target/device/Atmel/arch-arm/kernel-patches-2.6.24 \
                linux-\*.patch{,.gz,.bz2} ; \
        fi
touch /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.patched.arch
if [ -d target/device/Atmel/at91sam9261ek/kernel-patches/ ] ; then \
        toolchain/patch-kernel.sh /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 target/device/Atmel/at91sam9261ek/kernel-patches/ \
                linux-2.6.24.3\*.patch{,.gz,.bz2} ; \
        fi
touch /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.patched.board
# Try user defined config
if [ -f "target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.24.3.config" ] ; then \
                cp -dpf target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.24.3.config /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config ; \
        fi
# Try to get a config for this linux version in the board directory
echo "LINUX26_VERSION = 2.6.24.3"
LINUX26_VERSION = 2.6.24.3
if [ ! -f "/home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" ] ; then \
            if [ -f "target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.24.3.config" ] ; then \
                cp -dpf target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.24.3.config /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config ; \
            fi ; \
        fi
# Try to get a config for latest linux version in the board directory
if [ ! -f "/home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" ] ; then \
                scripts/get_linux_config.sh target/device/Atmel/at91sam9261ek /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 ; \
        fi
Copying at91sam9261ek-linux-2.6.21.1.config ...
Copying at91sam9261ek-linux-2.6.22.1.config ...
# Use a board config defined in the linux source.
if [ ! -f "/home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" ] ; then \
                /usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm CFLAGS_KERNEL="-Os -I/home/dustin/buildroot/build_arm/staging_dir/usr/include -I/home/dustin/buildroot/build_arm/staging_dir/include --sysroot=/home/dustin/buildroot/build_arm/staging_dir/ -isysroot /home/dustin/buildroot/build_arm/staging_dir -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" INSTALL_MOD_PATH=/home/dustin/buildroot/project_build_arm/at91sam9261ek/root CROSS_COMPILE=/home/dustin/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc- LDFLAGS="-L/home/dustin/buildroot/build_arm/staging_dir/lib -L/home/dustin/buildroot/build_arm/staging_dir/usr/lib --sysroot=/home/dustin/buildroot/build_arm/staging_dir/" LZMA="/home/dustin/buildroot/toolchain_build_arm/bin/lzma" -C /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 at91sam9261ek_defconfig || \
                        echo "at91sam9261ek_defconfig failed..." ; \
        fi
# let the user create his/her own config
if [ ! -f "/home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" ] ; then \
                /usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm CFLAGS_KERNEL="-Os -I/home/dustin/buildroot/build_arm/staging_dir/usr/include -I/home/dustin/buildroot/build_arm/staging_dir/include --sysroot=/home/dustin/buildroot/build_arm/staging_dir/ -isysroot /home/dustin/buildroot/build_arm/staging_dir -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" INSTALL_MOD_PATH=/home/dustin/buildroot/project_build_arm/at91sam9261ek/root CROSS_COMPILE=/home/dustin/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc- LDFLAGS="-L/home/dustin/buildroot/build_arm/staging_dir/lib -L/home/dustin/buildroot/build_arm/staging_dir/usr/lib --sysroot=/home/dustin/buildroot/build_arm/staging_dir/" LZMA="/home/dustin/buildroot/toolchain_build_arm/bin/lzma" -C /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 xconfig ; \
        fi
/home/dustin/buildroot/toolchain_build_arm/bin/sed -i -e 's,^EXTRAVERSION.*,EXTRAVERSION = .3,g' /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/Makefile
/home/dustin/buildroot/toolchain_build_arm/bin/sed -i -e '/CONFIG_AEABI=y/d' /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config
echo "# CONFIG_AEABI is not set">> /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config
/home/dustin/buildroot/toolchain_build_arm/bin/sed -i -e '/CONFIG_IPV6=y/d' /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config
echo "CONFIG_IPV6=y">> /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config
/home/dustin/buildroot/toolchain_build_arm/bin/sed -i -e '/CONFIG_INITRAMFS_SOURCE/d' /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config
/home/dustin/buildroot/toolchain_build_arm/bin/sed -i -e '/INITRAMFS_ROOT_.ID/d' /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config
echo "CONFIG_INITRAMFS_SOURCE=\"\"">> /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3/.config
/usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm CFLAGS_KERNEL="-Os -I/home/dustin/buildroot/build_arm/staging_dir/usr/include -I/home/dustin/buildroot/build_arm/staging_dir/include --sysroot=/home/dustin/buildroot/build_arm/staging_dir/ -isysroot /home/dustin/buildroot/build_arm/staging_dir -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" INSTALL_MOD_PATH=/home/dustin/buildroot/project_build_arm/at91sam9261ek/root CROSS_COMPILE=/home/dustin/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc- LDFLAGS="-L/home/dustin/buildroot/build_arm/staging_dir/lib -L/home/dustin/buildroot/build_arm/staging_dir/usr/lib --sysroot=/home/dustin/buildroot/build_arm/staging_dir/" LZMA="/home/dustin/buildroot/toolchain_build_arm/bin/lzma" -C /home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3 oldconfig
make[1]: Entering directory `/home/dustin/buildroot/project_build_arm/at91sam9261ek/linux-2.6.24.3'
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/docproc
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/kxgettext.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/lex.zconf.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf -o arch/arm/Kconfig
.config:42:warning: trying to assign nonexistent symbol IPC_NS
.config:47:warning: trying to assign nonexistent symbol UTS_NS
.config:173:warning: trying to assign nonexistent symbol ATMEL_TCLIB
.config:582:warning: trying to assign nonexistent symbol USB_USBNET_MII
.config:621:warning: trying to assign nonexistent symbol INPUT_TSDEV
.config:622:warning: trying to assign nonexistent symbol INPUT_TSDEV_SCREEN_X
.config:623:warning: trying to assign nonexistent symbol INPUT_TSDEV_SCREEN_Y
.config:728:warning: trying to assign nonexistent symbol I2C_ATMELTWI
.config:729:warning: trying to assign nonexistent symbol I2C_ATMELTWI_BAUDRATE
.config:731:warning: trying to assign nonexistent symbol I2C_AT91_CLOCKRATE
.config:738:warning: trying to assign nonexistent symbol I2C_PCA
.config:891:warning: trying to assign nonexistent symbol FB_S1D15605
.config:1262:warning: trying to assign nonexistent symbol RAMFS
.config:1457:warning: trying to reassign symbol AEABI
*
* Linux Kernel Configuration
*
*
* General setup
*
Prompt for development and/or incomplete code/drivers (EXPERIMENTAL) [Y/n/?] y
Local version - append to kernel release (LOCALVERSION) []
Automatically append version information to the version string (LOCALVERSION_AUTO) [N/y/?] n
Support for paging of anonymous memory (swap) (SWAP) [N/y/?] n
System V IPC (SYSVIPC) [Y/n/?] y
POSIX Message Queues (POSIX_MQUEUE) [N/y/?] n
BSD Process Accounting (BSD_PROCESS_ACCT) [N/y/?] n
Export task/process statistics through netlink (EXPERIMENTAL) (TASKSTATS) [N/y/?] n
User Namespaces (EXPERIMENTAL) (USER_NS) [N/y/?] (NEW)
PID Namespaces (EXPERIMENTAL) (PID_NS) [N/y/?] (NEW)
[[[SNIP local/MYPROJECT/linux Config Isn't Being Used]]]
_________________________________________________________________
Show them the way! Add maps and directions to your party invites.
http://www.microsoft.com/windows/windowslive/events.aspx
