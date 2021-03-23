From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 22:10:08 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-eh71wlNtmF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #5 from Peter Seiderer <ps.report@gmx.net> ---
I can reproduce (maybe the same) problem on Rpi4 with this defconfig:

BR2_arm=y
BR2_cortex_a72=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_PASSWD_SHA512=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ROOTFS_MERGED_USR=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_SYSTEM_DHCP="eth0"
BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
BR2_TARGET_TZ_INFO=y
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_LIBCAP=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_KMOD_TOOLS=y
BR2_PACKAGE_UTIL_LINUX_AGETTY=y
BR2_PACKAGE_UTIL_LINUX_FSCK=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


On the serial console I get the following log in case of ssh login
abort/failure:

[  110.415395] audit: type=1326 audit(110.409:3): auid=4294967295 uid=1001
gid=1001 ses=4294967295 pid=248 comm="sshd" exe="/usr/sbin/sshd" sig=31
arch=40000028 syscall=403 compat=0 ip=0xb6b9b766 code=0x0


Strace output looks like the following:

243   write(6, "\0\0\0e\0\0\0\23ecdsa-sha2-nistp256\0\0\0J\0"..., 105
<unfinished ...>                                   
248   read(5,  <unfinished ...>                                                 
243   <... write resumed>)              = 105                                   
248   <... read resumed>"\7\0\0\0e\0\0\0\23ecdsa-sha2-nistp256\0\0\0J"..., 106)
= 106                           
243   poll([{fd=6, events=POLLIN}, {fd=7, events=POLLIN}], 2, -1 <unfinished
...>                                
248   clock_gettime64(CLOCK_BOOTTIME,  <unfinished ...>) = ?                    
248   +++ killed by SIGSYS +++                                                  
243   <... poll resumed>)               = 2 ([{fd=6, revents=POLLIN|POLLHUP},
{fd=7, revents=POLLHUP}])          
243   --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_KILLED, si_pid=248,
si_uid=1001, si_status=SIGSYS, si_utime=4, si_stime=1} ---


The call to clock_gettime64() is aborted with SIGSYS...., but there is already
an (doubled) entry for it in openssh-8.4p1/sandbox-seccomp-filter.c (maybe 
__NR_clock_gettime64 is not defined), see e.g. [1]...

[1] http://lists.busybox.net/pipermail/buildroot/2020-August/289369.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
