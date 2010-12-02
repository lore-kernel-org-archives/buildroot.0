From: Chris Kerios <ckerios@gmail.com>
Date: Thu, 2 Dec 2010 12:24:17 -0500
Subject: [Buildroot] Help - Buildroot-2010.11 Don't know what changed
In-Reply-To: <20101202180806.04d114c3@surf>
References: <AANLkTimk=w-b3jMs58sFzLG5SVEkybEsQmTVpyuS-P-O@mail.gmail.com>
	<20101202180806.04d114c3@surf>
Message-ID: <AANLkTinRvFJmnw+nTLFBEROd5jP-bYM8MVq7jHdBht7v@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 2, 2010 at 12:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 2 Dec 2010 11:27:09 -0500
> Chris Kerios <ckerios@gmail.com> wrote:
>
>> I am working with the 2010.11 release on a PC-104 Geode LX w/Compact
>> Flash card. Fedora 14.
>>
>> I built a minimal system with all the defaults, no external toolchain:
>>
>> Kernel = 2.6.36.1
>> uClibc = .9.31.x with .9.31.x.config file
>> Busybox = 1.17.x with 1.17.x.config file
>> gcc = 4.3.x
>> bootloader selected = grub
>>
>> I have not added any files/applications to be built, so all that is
>> being built is the toolchain, kernel, grub and busybox. ?Everything
>> downloads and builds fine!
>>
>> The problem is when I copy to flash and boot the system it comes up as
>> read-only! ?I copy things to the flash as root and preserve all
>> permissions, etc. ?I've looked at the mailing list and long ago the
>> threads said to have the entry in inittab remount the filesystem as RW
>> and it should correct the problem. ?The issue is my default inittab
>> file has this entry in it so I don't understand why I am seeing this.
>>
>> If I execute the command manually from the command line after logging
>> in, it mounts the filesystem back as RW just fine. ?Also, if I include
>> a "rw" on my kernel line in grub.conf the filesystem comes in as RW.
>>
>> Is this a busybox issue? ?I am using all buildroot defaults. ?Any
>> thoughts or ideas of things I can check?
>
> We have :
>
> ?null::sysinit:/bin/mount -o remount,rw /
>
> in our default inittab in fs/skeleton/etc/inittab. This should
> automatically remount the root filesystem as read/write when the system
> boots. Maybe you are using a different filesystem skeleton ?
>
> If not, then edit this line to be :
>
> ?::sysinit:/bin/mount -o remount,rw /
>
> and see if you have error messages.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
Hi Thomas,
I just checked everything you suggested.  I am and have been using the
default buildroot filesystem skeleton.  The inittab file entry is
exactly as you say it should be.  I also just edited the file and
rebooted the system with no luck.  There are no additional messages to
report to you.  I can issue the remount command and get it to come
back as RW it just doesn't want to boot to RW.  Darn!

Lionel was saying earlier it might be kernel config but I don't know
where in the kernel I see anything that has to with an option of
bringing up the root filesystem as read-only.

Like I was saying earlier, I did a full build on 2010.08 with apps and
didn't run into this.  I didn't build 08 as a minimal build like
described above.  I am going to rebuild that release with the minimal
default set and see if I get this same behavior.

Chris
