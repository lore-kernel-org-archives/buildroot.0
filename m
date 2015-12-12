From: Sanchayan Maity <maitysanchayan@gmail.com>
Date: Sat, 12 Dec 2015 12:36:56 +0530
Subject: [Buildroot] [PATCH v2 0/2] Add support for Toradex Colibri Vybrid
	modules
Message-ID: <cover.1449902276.git.maitysanchayan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the second iteration for adding support for Toradex Colibri
Vybrid modules.

Discussions on the first version of the patch are here
http://lists.busybox.net/pipermail/buildroot/2015-October/142453.html

Thanks Arnout Vandecappelle for your feedback on v1 patches.

Changes since v1:
1. Remove use of external toolchain and package selection like GDB and
iproute using only minimal configuration
2. Add support for building uboot
3. Add a readme file for users

Explanations on some of the configs used:
1. Custom git repos maintained by Toradex have been used for both
uboot and Linux kernel. Also just note (not sure if required) this
is my personal work and not officially supported. I will take the
onus of updating the config periodically with each release we do here
at Toradex.

2. The BR2_LINUX_KERNEL_INSTALL_TARGET though is not considered a good
idea and it is recommended to put the kernel in a seperate MTD partition
or UBI volume, however currently on the Colibri Vybrid modules we have one
UBI parition on which the root filesystem resides along with the kernel
and device tree blobs in /boot. From uboot we then use boot from ubifs.

I have added the above since it directly gives a rootfs ubifs image which
users of the Colibri Vybrid can then directly use as per how we define our
update procedures at the moment. If and when we do move to use of static
UBI parition for the kernel by itself, I will update this accordingly.

3. The config file keeps use of some of the default UBI options. Even though
the defaults are the same as we use, I would like it to be explicit just in
case if the default by any reason change in the future and this also aligns
with what we use in OpenEmbedded/our scripts during the rootfs ubifs image
generation.

One question, I did like a specific name for the rootfs ubifs image generated.
For this I specify -o in extra options for mkfs.ubifs however this does not
seem to work. During the run, from build output I see

echo "  /home/sanchayan/Toradex/buildroot/output/host/usr/sbin/mkfs.ubifs -d
/home/sanchayan/Toradex/buildroot/output/target -e 0x1f000 -c 8112 -m 0x800 -x lzo --space-fixup -o ubifs.img -o
/home/sanchayan/Toradex/buildroot/output/images/rootfs.ubifs" >>
/home/sanchayan/Toradex/buildroot/output/build/_fakeroot.fs

Is the -o option provided to be prefixed with a ${BINARIES_DIR}/?

Thanks & Regards,
Sanchayan Maity.

Sanchayan Maity (2):
  configs: Add support for Toradex Colibri Vybrid Modules
  board: Add a readme file for Toradex Colibri Vybrid module

 board/toradex/colibri-vf/readme.txt | 23 ++++++++++++++++++++++
 configs/colibri_vf_defconfig        | 38 +++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 board/toradex/colibri-vf/readme.txt
 create mode 100644 configs/colibri_vf_defconfig

-- 
2.6.4
