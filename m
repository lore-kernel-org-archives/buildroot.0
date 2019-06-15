From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 15 Jun 2019 20:43:44 +0900
Subject: [Buildroot] uboot tools: fw_setenv can break environment/cause
 bricks
Message-ID: <CAFr9PXmhFW_8QLF8noyyNxJkLe-UzAR9Sq9dkkPpReFN3jzaSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I just noticed this and couldn't find any other reports of it.

If you enable BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV you get fw_printenv
and fw_setenv built for the target but they are built with a u-boot
configuration that isn't for the target as it uses it's own copy of
the source and not the one configured in the bootloader section.

That works in most cases but if you have uninitialised or broken
environment fw_setenv will write what it thinks is the default
environment with a bootcmd that tries to boot via bootp with an NFS
root which will probably brick many targets.

I'm think if u-boot is enabled in the bootloader section there should
probably be an option there to install those tools configured for the
target that blocks the uboot tools package.

Cheers,

Daniel
