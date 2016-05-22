From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 May 2016 14:41:40 +0200
Subject: [Buildroot] systemd and journald
Message-ID: <20160522124140.GA3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gabe, ?ric, Maxime, All,

I've been toying around with systemd lately, and I've stumbled on a
problem with our skeleton and the expectations of systemd.

Please bear in imind that I've just started, so I may be doing
somnething weird and/or incorrect. Anyway...

I'm using this defconfig (on rpi0, but that should not be specific to
the rpi):

    BR2_arm=y
    BR2_arm1176jzf_s=y
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
    BR2_GLIBC_VERSION_2_23=y
    BR2_BINUTILS_VERSION_2_26_X=y
    BR2_GCC_VERSION_5_X=y
    BR2_TOOLCHAIN_BUILDROOT_CXX=y
    BR2_INIT_SYSTEMD=y
    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_GIT=y
    BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
    BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(O)/linux.config"
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus"
    BR2_PACKAGE_RPI_FIRMWARE=y
    # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
    BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
    BR2_PACKAGE_SYSTEMD_BOOTCHART=y
    BR2_PACKAGE_SYSTEMD_NETWORKD=y
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_ROOTFS_EXT2_4=y
    # BR2_TARGET_ROOTFS_TAR is not set
    BR2_PACKAGE_HOST_DOSFSTOOLS=y
    BR2_PACKAGE_HOST_GENIMAGE=y
    BR2_PACKAGE_HOST_MTOOLS=y

This is using our default skeleton.

In this case, the journal is not accessible:

    # journalctl
    No journal files were found.
    -- No entries --

That's because the journal is started before /tmp is mounted:

             Starting Journal Service...
    [...]
    [  OK  ] Started Journal Service.
    [...]
             Mounting /tmp...
    [  OK  ] Mounted /tmp.

So, because our /var/log is a symlink to /tmp , the journal is correctly
created in /tmp/journal/c30ad28b21d444ba9fff7fb25b5454b1/system.journal
but since another filesystem is mounted over it later, it is no longer
accessible, so journalctl does not find it.

I'm not sure where to go forward rom there, but it looks like our
skeleton is wrong when the init system is systemd.

Any clue or suggestion?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
