From: Antony Vennard <antony.vennard@macrium.com>
Date: Thu, 8 Nov 2012 09:56:50 +0000
Subject: [Buildroot] Udev on a live CD system does not appear to
	populate /dev
In-Reply-To: <509AA0C4.4060506@petroprogram.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
Message-ID: <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm not using initramfs - I'm using the ISO 9660 target which as far as I
can see produces an initrd, a kernel and an ext2 raw image which it mounts
as a ramdisk. If I select the initramfs options, the cpio filesystem is
generated prior to the iso9660 one, but the initramfs afterwards! Which
means, as far as I can see, that initramfs would not be placed on the disk
- unless buildroot manipulates the iso filesystem post creation? I could of
course mkisofs myself, but I was trying to avoid that - although if this
fixes udev, I'll do it.

I've nothing /dev related in my fs/skeleton, and only the default values in
device_table.txt. Since I'm using udev, I did expect it would populate
everything it needed in /dev - although unless I add entries for null,
console and a tty into device_table.txt, I end up with a distribution that
loops forever saying "could not find /dev/tty1" (if I've configured tty1 as
the location for getty for example). I can't mitigate this by re-writing
the inittab to launch getty "once" as opposed to respawn, since buildroot
rewrites that - and askfirst:/bin/sh works, except that the respawn error
messages are written all over /dev/console, making it unusable...!

By the sounds of things this is wrong, but I'm currently attempting to
preconfigure some devices in device_table.txt - e.g. /dev/null,
/dev/urandom et al pseudo devices, and I'm borrowing Ubuntu's rules.d to
see if these are any more effective than Fedora's. Leaving device_table.txt
as its default causes the tty1 missing loop. I am not expecting this to
work - I cannot see how udev rules differ greatly between distributions -
just eliminating it as a possible cause.

Any further ideas as to what I can try? Is mdev a better choice?

Thanks for your help,

Antony

-- 
________________

Macrium(tm) Software is a trading name of Paramount Software UK Ltd, 
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
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121108/af2cc0e5/attachment.html>
