From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 26 Aug 2014 09:50:30 +0200
Subject: [Buildroot] [PATCH v2 2/2] freescale/imx6-sabresd: document how
 to create a bootable SD
In-Reply-To: <1408019813-17702-2-git-send-email-luca@lucaceresoli.net>
References: <1408019813-17702-1-git-send-email-luca@lucaceresoli.net>
 <1408019813-17702-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <53FC3C46.3020008@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I noticed a little annoyance with this version of the script when it
processes an SD that it had already processed before. This may happen
for example after the user has activated more target packages, rebuilt
and wants to recreate SD with the new root filesystem.

See below for a description of what happens.

Luca Ceresoli wrote:
> diff --git a/board/freescale/imx6sabresd/create-boot-sd.sh b/board/freescale/imx6sabresd/create-boot-sd.sh
> new file mode 100755
> index 0000000..f82f7b3
> --- /dev/null
> +++ b/board/freescale/imx6sabresd/create-boot-sd.sh
[...]
> +# Unmount the partitions if mounted
> +umount ${PART1} || true
> +umount ${PART2} || true
> +
> +# First, clear the card
> +dd if=/dev/zero of=${DEV} bs=1M count=2

This erases the first 2 MB of the SD, which include the partition table,
the bootloader and the beginning of the FAT partition. It does not
touch the ext2 partition.

> +
> +sync
> +
> +# Partition the card.
> +# SD layout for i.MX6 boot:
> +# - Bootloader at offset 1024
> +# - FAT partition starting at 1MB offset, containing uImage and *.dtb
> +# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
> +sfdisk ${DEV} <<EOF
> +32,480,b
> +512,,L
> +EOF

Here the host system detects the newly created partitions. Since the
ext2 has not been touched it contains valid data, and a
desktop-oriented automounter "might" want to mount it right away (mine
does of course).

Waiting some time and then umounting it just-in-case is an option, but I
preferred to just change the 'dd' command above to erase 20 MB, not 2,
so it also invalidates the ext2 partition.

I'll resubmit with this change.

-- 
Luca
