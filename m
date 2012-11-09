From: Antony Vennard <antony.vennard@macrium.com>
Date: Fri, 09 Nov 2012 12:20:08 +0000
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509C2166.8050705@mind.be>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
 <509C2166.8050705@mind.be>
Message-ID: <509CF4F8.6080608@macrium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/11/2012 21:17, Arnout Vandecappelle wrote:
>  If you build a cpio rootfs, you shouldn't need any additional command line
> parameters because the kernel never gets to mounting the root
> filesystem.  It
> just runs the /init in the initramfs.
> 
>  Using a cpio rootfs should also solve your problems with the device nodes,
> because we provide a /init that mounts devtmpfs explicitly.
> 
>  Regards,
>  Arnout
> 

Yep, I'd come to the conclusion I needed an /init to exist, constructing
the root file system. Manually creating the CD as a test, the kernel
panics (root file system not found) if init doesn't exist. I used the
one from fs/cpio/init as you suggested.

The ram_disk_size parameter does appear to be entirely optional.

I'm now on to the next problem - that script exec's /sbin/init which is
really /bin/busybox... which is exiting straight away or crashing, as
the kernel is now panicking about an exiting init :(

I'm going to have an experiment with this, see if I can understand what
the issue is.

I have also grabbed a copy of buildroot git. Once I've got this working,
I'll have a go at modifying buildroot to build iso9660 targets via this
mechanism. I'm no expert in this kind of thing, but it'll be a good
learning experience.

I may also potentially be looking to integrate EFI boot into our live CD
at some stage - if this is of interest I can have a go at adding this to
buildroot also.

Thanks for your help,

Antony


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121109/742b79b0/attachment.asc>
