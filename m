From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 27 Jan 2013 01:04:22 +0200
Subject: [Buildroot] Squashfs boot
In-Reply-To: <51045AD4.1000100@mind.be>
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
 <50FE8914.30909@petroprogram.com> <51017295.7020803@mind.be>
 <CAN_xxrUMYm_q7JvdJhCHWtcjzAVBxHkV3GHvZL4-ueur8ODvLA@mail.gmail.com>
 <5101B872.1090705@petroprogram.com>
 <CAN_xxrXsvvupyo61cqZhCR4JyLwtCsm1NRAh9JCy_uVHRqGO4A@mail.gmail.com>
 <5102FF4E.1060405@petroprogram.com> <51045AD4.1000100@mind.be>
Message-ID: <510460F6.1020507@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

27.1.2013 0:38, Arnout Vandecappelle kirjoitti:
> On 01/25/13 22:55, Stefan Fr?berg wrote:
>> Hello Stephen
>>
>> I made a quick conversion of my LiveCD initramfs stuff to squashfs image
>> file and then played little bit with it and kernel image
>> with the help of qemu. (took less time than starting all
>> reconfiguring/combiling from buildroot)
>>
>> The good news is that yes, it should be doable to do boot directly from
>> squashfs root image.
>>
>> For example I did this to start it (ramdisk_size is in kilobytes):
>>
>> qemu-system-i386 -kernel bzImage -initrd rootfs.sqfs -append
>> "ramdisk_size=131072"
>>
>> It first tries to unpack rootfs as initramfs and then it notices that
>> it's not initramfs but traditional,
>> older version of initrd file. (please see root.png).
>>
>> After that it should print RAMDISK: squashfs filesystem found and start
>> automatically loading it to ram.
>> (please see root2.png)
>>
>> After that it continues normally and starts the normal init process.
>>
>> And now the bad news:
>>
>> - Takes a lot of memory. This is old style initrd stuff (time when 2.4
>> kernel was still hot and new).
>
>  Yes, using squashfs as initrd is probably not what you want: it will
> load the entire squashfs into memory (albeit compressed), and then
> copy it (and decompress) when you access it.
>
>  The typical way to use squashfs is as a partition of your disk. So if
> you'd boot from a USB stick, you'd make two partitions: an ext2 for
> grub and the kernel, and a second one for the squashfs. To install it,
> just do "cat output/images/rootfs.sqfs > /dev/sdb2" (assuming your USB
> key is /dev/sdb and squashfs is the second partition). When booting,
> you append the following the kernel command line: "root=/dev/sda2
> rootwait" (assuming there's no hard disk or anything so the USB key
> will end up as /dev/sda).
>

But I understanded that he didn't want to use partition to boot but
directly from squashfs image.
At least that's how I understanded this part in his message:  "It would
be ideal to run the systems from a file instead of dd a image to an area"


Regards
Stefan
