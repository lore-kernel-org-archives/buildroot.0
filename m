From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Apr 2019 23:47:41 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <1780e90c-9198-e9b6-5b38-9b27930337e2@digineo.de>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
 <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
 <1780e90c-9198-e9b6-5b38-9b27930337e2@digineo.de>
Message-ID: <4e0cc833-814c-3cc6-deb3-6539a0f92f4f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/04/2019 23:20, Dominik Menke wrote:
> On 4/27/19 7:56 PM, Arnout Vandecappelle wrote:
>> On 25/04/2019 20:15, Dominik Menke wrote:
>>> I've run into trouble with the following configuration on Buildroot
>>> 2019.02.1-100-g88eff22a9e (current 2019.02.x branch):
>>>
>>> ???? (
>>> ?????? echo BR2_INIT_SYSTEMD=y
>>> ?????? echo BR2_PACKAGE_E2FSPROGS=y
>>> ???? ) | cat configs/raspberrypi3_defconfig - > configs/myrpi_defconfig
>>> ???? make myrpi_defconfig
> 
> As pointed out in another response, BR2_TOOLCHAIN_BUILDROOT_GLIBC=y is missing
> here.
> 
> 
>> [snip]
>>> Looking at /usr/lib/systemd/systemd-fsck (which is executed by
>>> systemd-fsck-root.service), it calls to /sbin/fsck only if /sbin/fsck.$type
>>> exists [3]. My guess is that it then fails to proceed because e2fsprog's fsck
>>> behaves differently then fsck (of package util linux).
>>
>> ? It would be good to find out what exactly is going wrong.
> 
> Any advise on how I can to get more information? I'm struggeling with the UART
> of the RPi 3B+ to be usable (this may be related to issue 11766 [0]). Currently,
> I only have the output on the Monitor connected on the HDMI port, only a few
> pages of scrollback buffer, and no way to interact with the system.
> 
> [0]: https://bugs.busybox.net/show_bug.cgi?id=11766

 I've tried to reproduce in qemu, but it works fine there. This is the defconfig
I used:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_CCACHE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2019.02-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_SYSTEMD=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
BR2_PACKAGE_E2FSPROGS=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y


and this is the qemu command to launch:

qemu-system-arm -M vexpress-a9 \
  -drive "file=output/images/rootfs.ext2,if=sd,format=raw" \
  -append "root=/dev/mmcblk0 rootfstype=ext4 rootwait ro console=ttyAMA0" \
  -net nic,model=lan9118 -net user -dtb output/images/vexpress-v2p-ca9.dtb \
  -serial stdio -kernel output/images/zImage


Gives this output:

...
         Starting File System Check on Root Device...
...
[  OK  ] Started File System Check on Root Device.
         Starting Remount Root and Kernel File Systems...
EXT4-fs (mmcblk0): Filesystem with huge files cannot be mounted RDWR without
CONFIG_LBDAF
systemd[1]: systemd-remount-fs.service: Main process exited, code=exited,
status=1/FAILURE
systemd[1]: systemd-remount-fs.service: Failed with result 'exit-code'.
systemd[1]: Failed to start Remount Root and Kernel File Systems.
[FAILED] Failed to start Remount Root and Kernel File Systems.
See 'systemctl status systemd-remount-fs.service' for details.
...
Welcome to Buildroot
buildroot login:

 The remount error is because the filesystem isn't created with ^huge_file
(which we probably should do, as mentioned before somewhere on the list). But it
should not affect fsck AFAIU...


>> package/systemd/Config.in does select BR2_PACKAGE_UTIL_LINUX_FSCK precisely for
>> this reason...
>> I'm adding Carlos (who added that) in Cc, maybe he has something to say about it.
>>
>> ? If it now needs the fsck from e2fsprogs, then it is getting a little tricky to
>> do the right thing. We'd have to revert the dependency between e2fsprogs fsck
>> and util-linux fsck.
> 
> I don't think systemd needs e2fsprog's fsck. *I* need e2fsprogs, but only for
> its resize2fs (nevertheless, it also installs /sbin/fsck.ext4). However, systemd
> finds /sbin/fsck.ext4, and proceeds to execute /sbin/fsck.
> 
> My current working theory is that /sbin/fsck then in turn calls out to
> /sbin/fsck.ext4. As far as I can tell, /sbin/fsck originates from util-linux,
> while /sbin/fsck.* come from e2fsprogs.

 Yes indeed. And all that is exactly how it's supposed to work. So I don't
really understand why it doesn't work for you.


 Regards,
 Arnout
