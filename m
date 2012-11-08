From: Antony Vennard <antony.vennard@macrium.com>
Date: Thu, 08 Nov 2012 16:02:18 +0000
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509BA71B.6020009@petroprogram.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com>
Message-ID: <509BD78A.8050908@macrium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

Thanks for that. I have followed your instructions for making a live cd
manually with mkisofs - actually this is helpful since a later job is to
add UEFI booting to the disk, which is easier this way (although I am
going to look at modifying buildroot, if I can).

I am using grub, and have modified my grub command line to use:

title LiveCD
kernel /vmlinuz vga=0x317
initrd /initramfs.bz2

The kernel has bz2, xz and gzip initramfs support built in - so all good
there. However, the kernel complains there's no root parameter. What
should I specify for this?

Thanks,

Antony

On 08/11/2012 12:35, Stefan Fr?berg wrote:
> Hi Antony
> 
> Just one guestion: What bootloader are you using for your Live CD ?
> (I use grub)
> 
> 8.11.2012 11:56, Antony Vennard kirjoitti:
>> Hi All,
>>
>> I'm not using initramfs - I'm using the ISO 9660 target which as far
>> as I can see produces an initrd, a kernel and an ext2 raw image which
>> it mounts as a ramdisk. If I select the initramfs options, the cpio
>> filesystem is generated prior to the iso9660 one, *but the initramfs
>> afterwards!* Which means, as far as I can see, that initramfs would
>> not be placed on the disk - unless buildroot manipulates the iso
>> filesystem post creation? I could of course mkisofs myself, but I was
>> trying to avoid that - although if this fixes udev, I'll do it.
>>
> 
> Keep in mind that the buildroot way of making initramfs (that is if you
> select intramfs from menuconfig) is
> to embed your initramfs directly into kernel.
> 
> There are three disadvantages in here:
> 
> 1 ) It will make your kernel fatter
> 2 ) It will makes things more complicated than necessary
> You might have two initramfs settings: One that is embedded directly
> into your kernel and
> another that you have made by hand by yourself. And it's very possible
> that they could have conflicting stuff between them
> You can have several initramfs files (at least with grub bootloader),
> the last ones overlaying the first ones, in order.
> 3 ) It will makes less flexibe.
>  
> All kernels since 2.6 have initramfs inside them, it's just that by
> default that environment is empty.
> 
> Embedding initramfs directly to kernel might be good for those users who
> don't use any bootloader or are using a bootloader which can't
> be feeded external, separate initramfs file(s) (like grub) and want to
> have minimal system always available (as piggybacked inside kernel).
> 
> 
>> I've nothing /dev related in my fs/skeleton, and only the default
>> values in device_table.txt. Since I'm using udev, I did expect it
>> would populate everything it needed in /dev - although unless I add
>> entries for null, console and a tty into device_table.txt, I end up
>> with a distribution that loops forever saying "could not find
>> /dev/tty1" (if I've configured tty1 as the location for getty for
>> example). I can't mitigate this by re-writing the inittab to launch
>> getty "once" as opposed to respawn, since buildroot rewrites that -
>> and askfirst:/bin/sh works, except that the respawn error messages are
>> written all over /dev/console, making it unusable...!
>>
>> By the sounds of things this is wrong, but I'm currently attempting to
>> preconfigure some devices in device_table.txt - e.g. /dev/null,
>> /dev/urandom et al pseudo devices, and I'm borrowing Ubuntu's rules.d
>> to see if these are any more effective than Fedora's. Leaving
>> device_table.txt as its default causes the tty1 missing loop. I am not
>> expecting this to work - I cannot see how udev rules differ greatly
>> between distributions - just eliminating it as a possible cause.
>>
>> Any further ideas as to what I can try? Is mdev a better choice?
>>
> Well mdev is at least easier to configure than udev.
> 
> The only thing you must make sure in your init process is that /proc and
> /sys are mounted as early as possible (/etc/inittab is good place for that)
> and that echo /sbin/mdev > /proc/sys/kernel/hotplug   is also somewhere
> in /etc/init.d/rcS (maybe at the start of that file)
> 
> And check that you have etc/mdev.conf and etc/init.d/S10mdev (witch is
> called by /etc/init.d/rcS)
> 
> This is what I would do (and have done with my live CD)
> Forget the buildroot way of making initramfs for now and see if you can
> construct live CD by hand:
> 
> 1 ) make clean
> 
> 2 ) make sure you have all the needed init stuff in  fs/skeleton/etc
> directory (inittab, init.d/rcS, init.d/S* files etc.....)
>      also make sure that sbin/init is a symlink to /bin/busybox
> (I have also symlink of init --> /bin/busybox in top of fs/skeleton but
> I not sure if that is stricly needed ...
> I think kernel should be looking from /sbin/init if no other init found)
> 
> 3 )  do make menuconfig as you would normally but remember to unselect
> cpio, initramfs and iso9660 from menuconfig
>        remember to select grub from under Bootloader section if you
> don't already have it
>        don't select too much of stuff even if you have massive amounts 
> of RAM in your test systems.
>        reason being that you are making initramfs later here from your
> output/target directory and if you have massive
>       amount's of stuff in there then it will take forever to boot. (I
> have managed to do live CD with massive amounts of stuff on it and
>      booting fast with only 192 MB RAM but that needed some major hacking)
> 
> 4 ) do    make linux-menuconfig  and check that under General setup the
> setting Initramfs source files is empty
>      also check the compression support here that you want to use for
> your external initramfs (let's suppose its' the default GZ for now)
> 
> 5 ) do make
> 
> 6 ) after buildroot has finished make sure that everything is okay in
> your output/target (check especially boot/ etc/ and /dev directory)
>      also make sure you have /boot/grub/menu.lst or /boot/grub/grub.conf
> (the other is usually just symlink to other) and check it's settings
>     (If you are not familiar with grub then I can help with it's
> settings, especially important is the line where you tell grub the external
>    initramfs file)
>      remove the symlink (iso9660 format does not support symlinks)
> 
> 7 ) Create directory where you want to put your kernel & bootloader
> (a.ka. the whole contents of /boot dir) and external initramfs file
>      that is generated next:   
>     
>       mkdir /livecd && cp -r output/target/boot /livecd
> 
> 8 ) from output/target dir   do    find .  -not \( -path "./boot" -prune
> \) -print0 | cpio --null -ov --format=newc | gzip -9 > /livecd/initramfs.gz
> (we don't need boot directory inside initramfs. it needs to stay outside
> of it. that why it was copied previously)
> 
> 9 ) make iso9660 normally from the contents of your /livecd
> mkdir /livecd_output && cd /livecd && mkisofs --joliet -R -b
> boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4
> -boot-info-table -iso-level 4 -hide-rr-moved -c boot.catalog -o
> /livecd_output/your_livecd.iso .
> 
> (remember that . at the end)
> 
> 10) burn the iso to CD or even better use qemu or VirtualBox to boot
> your iso without wasting CD disc.
> 
> If this manual way worked then next try buildroot way.
> 
> Best regards
> Stefan
> 
>> Thanks for your help,
>>
>> Antony
>>
>> ________________
>>
>> Macrium? Software is a trading name of Paramount Software UK Ltd,
>> Registered in England and Wales Number 02973414
>> Registered Office: Kilburn House, Manchester Science Park, Lloyd St.
>> North, Manchester M15 6SE United Kingdom
>>
>> The information contained in this e-mail is confidential, privileged,
>> or otherwise protected from disclosure. It is intended only for the
>> use of the authorized individual as indicated in the e-mail. Any
>> unauthorized disclosure, copying, distribution or taking of any action
>> based on the contents of this material is strictly prohibited.
>>
>> If you have received this e-mail in error, please delete it immediately.
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Antony Vennard
Software Engineer

Macrium Software
Kilburn House,
Manchester Science Park
Lloyd Street North
Manchester M15 6SE
UK

Tel: +44(0)161 226 1128

Web       http://www.macrium.com/
Blog      http://blog.macrium.com/
Twitter   http://twitter.com/MacriumReflect
Facebook  http://www.facebook.com/Macrium


-- 
________________

Macrium? Software is a trading name of Paramount Software UK Ltd, 
Registered in England and Wales Number 02973414
Registered Office: Kilburn House, Manchester Science Park, Lloyd St. North, 
Manchester M15 6SE United Kingdom

The information contained in this e-mail is confidential, privileged, or 
otherwise protected from disclosure. It is intended only for the use of the 
authorized individual as indicated in the e-mail. Any unauthorized 
disclosure, copying, distribution or taking of any action based on the 
contents of this material is strictly prohibited.

If you have received this e-mail in error, please delete it immediately.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 895 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121108/5730efff/attachment.asc>
