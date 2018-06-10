From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 10 Jun 2018 20:48:34 -0300 (BRT)
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <20180608210641.GF2090@scaer>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer> <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <20180608171941.GC2090@scaer> <5f35f9b5-e308-3fff-138d-07f7b814fdd1@mind.be>
 <20180608210641.GF2090@scaer>
Message-ID: <2108507643.2044026.1528674514845.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "Arnout Vandecappelle" <arnout@mind.be>
> Cc: "DATACOM" <casantos@datacom.com.br>, "Thomas De Schampheleire" <thomas.de_schampheleire@nokia.com>, "buildroot"
> <buildroot@buildroot.org>
> Sent: Friday, June 8, 2018 6:06:41 PM
> Subject: Re: [Buildroot] [PATCH] fs: allow extra arguments to common tarball extraction

> Arnout, Carlos, All,
[...]
> And as an example of a split-var filesytem, see the attached br2-external
> tree. It ultimagtely creates $(BINARIES_DIR)/rootfs.meh, a squashfs
> image of /) and $(BINARIES_DIR)/rootfs.meh-var.tar, a tarball of /var.
> The only missing pieve is the runtime startup scripts that will format
> the on-board partition, extact /var.tar in there, and mount it.

Thanks for your example. I transformed it on an example of what I'm
attempting to achieve. Please use the contents of the attached file as
a br2_external and use the defconfig contained there; then run

    $ make rootfs-cpio rootfs-var-{lib,log}-ext4

It will create three image files files under $(BINARIES_DIR): rootfs.cpio,
rootfs.var-lib.ext4 and rootfs.var-log-ext4.

If you apply on buildroot the patch contained there the names will be
rootfs.cpio, rootfs-var-lib.ext4 and rootfs-var-log.ext4, which looks
better, IMO.

Extracting rootfs.common.tar for rootfs-var-log-ext4 is a waste of time
and disk space, since it creates an empty filesystem. Perhaps we could
add a BR2_TARGET_ROOTFS_<FOO>_START_EMPTY knob for filesystems that
populate $(TARGET_DIR) by themselves.

The example does not install a /etc/fstab with entries for /var/lib and
/var/log but of it would be necessary in a real system, of course.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-multi-fs.tar.xz
Type: application/x-xz-compressed-tar
Size: 3780 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180610/2beefde8/attachment.bin>
