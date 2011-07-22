From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 22 Jul 2011 16:45:26 +0200
Subject: [Buildroot] [PATCH 0/3] bump udev and clean up
Message-ID: <4E298D06.4050107@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following patches update udev to 172 and handle its dependencies. 

Udev changed much compared with the current version in BR. Except eliminating obsolete patches, the startup script was also changed. There is no udevstart executable any more, udevadm manages communication with udevd instead. /dev/null is created either via devtmpfs of via device file, so no need to do it in the startup script.

usbmount 0.0.14.1 used vol_id executable, that was part of older udev version. vol_id was replaced by blkid, that is part of util-linux. So util-linux was also updated and usbmount selects both util-linux and blkid. blkid provided by BusyBox's blkid delivers not enough info about the block device, so util-linux is a must.

Futher usbmount issues were addressed:

1. recent blkid show not only file system type, but also partition type:

/dev/sdb1: VERSION="0.0" TYPE="ext2" USAGE="filesystem" PART_ENTRY_SCHEME="dos"
PART_ENTRY_TYPE="0xc" PART_ENTRY_FLAGS="0x80" PART_ENTRY_NUMBER="1"

in this case parsing script took the value of partition type instead of file system type. Parsing was changed to search for " TYPE". It were very helpful, ff some one could provide better regular expression for this case.

2. udev rules for usbmount should react at "usb" subsystem, however it is reported as "block", so rules were also patched.

looking at device '/block/sdb/sdb1':
    KERNEL=="sdb1"
    SUBSYSTEM=="block"
    DRIVER==""
    ATTR{partition}=="1"
    ATTR{start}=="32"
    ATTR{size}=="31457248"
    ATTR{ro}=="0"
    ATTR{alignment_offset}=="0"
    ATTR{discard_alignment}=="0"
    ATTR{stat}=="     403      235     3184      470        1        0        2
       0        0      450      460"
    ATTR{inflight}=="       0        0" 

Yegor
