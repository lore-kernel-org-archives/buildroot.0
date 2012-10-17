From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Wed, 17 Oct 2012 14:04:07 +0200
Subject: [Buildroot] no /dev/console;
 /dev/null when booting with initrd of type 'ext2'
In-Reply-To: <507D86C9.2050008@mind.be>
References: <507D6C50.4060607@wanadoo.fr> <507D86C9.2050008@mind.be>
Message-ID: <507E9EB7.3010008@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 16/10/2012 18:09, Arnout Vandecappelle a ?crit :
> On 16/10/12 16:16, Thierry Bultel wrote:
>> When booting with an initrd of type "ext2", as it is the case when
>> using a generated ISO image,
>
>  ISO?
>
>> the kernel (a 3.2.21 in my case) does not automagically create the
>> "/dev/null" and "dev/console" entries,
>> whereas it does when using a cpio.
>
>  The kernel doesn't, but buildroot does.  We copy fs/cpio/init to /init
> for cpio (and initramfs) archives, because those are the ones that are
> normally used for initrd.
>
>  You can copy fs/cpio/init to /init in your post-build script, if you
> like.
>
>
>> Would the solution be to always have these inodes created in
>> 'device_table.txt' ?
>> (Works in my case, I do not plan to use the static table)
>
>  Not really: the kernel doesn't automount devtmps for initrd.
>
>> Or change the ISO generation for using cpio instead of ext2 ?
>
>  There's no point in using ext2 for initrd, it just adds overhead.
> So yes, switch to cpio.
>
>  Oh, now I see your point with the iso image: fs/iso9660 uses an ext2
> initrd...  Hm, that seems like a bad idea.  Someone should rewrite that.

FYI, I have hacked into "iso9660.mk"

diff -r1.1.1.1 iso9660.mk
18c18
< $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux
rootfs-ext2 grub
---
> $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux
rootfs-cpio grub
22a23

25c26
<     cp $(BINARIES_DIR)/rootfs.ext2 $(ISO9660_TARGET_DIR)/initrd
---
>     cp $(BINARIES_DIR)/rootfs.cpio $(ISO9660_TARGET_DIR)/initrd

and it works perfectly without having to use the "device_table_dev.txt"

The other thing that is missing here is that the iso9660 build does not
support the grub splashscreen.

>
>  Regards,
>  Arnout
