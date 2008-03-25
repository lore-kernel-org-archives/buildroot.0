From: John Voltz <john.voltz@gmail.com>
Date: Tue, 25 Mar 2008 09:04:18 -0400
Subject: [Buildroot] Fwd: Buildroot compilation error with 2.6.18.8
	kernel
In-Reply-To: <823018ed0803242323i32734707p79e0433ee2953228@mail.gmail.com>
References: <823018ed0803191118j6146663l8a4f9bc53af05fb8@mail.gmail.com>
	<823018ed0803241139j4ebf4034qb9cf5c8cb8525dd8@mail.gmail.com>
	<46a136670803241157j605d2bb2s23356eea3326ddc9@mail.gmail.com>
	<823018ed0803242323i32734707p79e0433ee2953228@mail.gmail.com>
Message-ID: <46a136670803250604r62dcf1a0x634a9320e8a12407@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You should be able to compile the kernel separately, it doesn't depend on
uClibc. Have you ever been able to run the kernel on that processor? It
looks to me like an internal kernel problem, failing at identify_cpu. You
might want to look in the patch to see if there is any code used to identify
this new cpu. If not, make sure the manufacturer doesn't have more patches.

John


On Tue, Mar 25, 2008 at 2:23 AM, Reinier Coetzer <reinier.coetzer@gmail.com>
wrote:

> John,
>
> Firstly, DMP (the manufacturers) did supply a patch for the kernel. They
> dont mention
> any other patches required so I assume its only this one patch. So if I
> want to apply this
> patch I should simply copy it to target/device/x86/i386/kernel-patches?
> Should it be the
> zipped *.gz file or the unzipped *.patch file? I know there are options
> when using
> 'make menuconfig' to apply a patch as well, I suppose this wont be needed
> anymore?
>
> Secondly, I tried to compile the kernel seperately from the root
> filesystem, by downloading
> the kernel, extracting it, patching it and running 'make xconfig' and then
> compiled it.
> I then used buildroot for the root filesystem. However when I combined
> these two I got
> the following kernel panic at startup.
>
> *Call Trace:
>   [<c0108ef6>] identify_cpu+0x88/0x268
>   [<c03525f7>] start_kernel+0x2d/0x317
> Code: 00 80 89 f8 0f a2 89 55 10 89 f8 0f a2 89 4d 24 81 fe 03 00 00 80 76
> 07 89
> e8 e8 e1 fc ff ff 89 e8 f6 0b 00 00 b8 01 00 00 00 <0f> a2 c1 eb 18 88 9d
> 93
> 00 00 00 83 c4 10 5b 5e 5f 5d c3 57 56
> EIP: [<c0108e2f>] generic_identify+0x105/0x118 SS:ESP 0068:c034dfac
> <0>Kernel panic - not syncing: Attempt to kill the idle task!
>
> *Is it possible to compile the kernel seperately? What causes this kernel
> panic?
>
> Thanks in advance!
>
> Reinier
>
>
>
>
>
> On Mon, Mar 24, 2008 at 8:57 PM, John Voltz <john.voltz@gmail.com> wrote:
>
> > You will have to add the kernel version into the
> > target/linux/Config.in.advanced. Then make sure that any kernel patches you
> > need for it are in the target/device/whatever directory. Sorry I can't be
> > more specific, but I'm not familiar with the ebox.
> >
> > John
> >
> > On Mon, Mar 24, 2008 at 2:39 PM, Reinier Coetzer <
> > reinier.coetzer at gmail.com> wrote:
> >
> > >
> > >
> > > Hi all,
> > >
> > > I noticed that no one responded to my previous post, so I'm trying
> > > again. If there is something wrong with
> > > how I post please let me know!
> > >
> > > I want to cross-compile for my EBOX with a Vortex86SX CPU (
> > > http://www.dmp.com.tw/tech/vortex86sx/).
> > > The problem is that I have to use the 2.6.18.8 kernel as described by
> > > DMP. I configured everything
> > > with menuconfig, but I cant select kernel headers earlier than 2.6.21for my toolchain in menuconfig and I
> > > have a feeling that is why I get the following error:
> > >
> > > if [ -r System.map -a -x /home/harry/Desktop/buildroot/build_i486/staging_dir/bin/i486-linux-depmod26 ]; then
> > > /home/harry/Desktop/buildroot/build_i486/staging_dir/bin/i486-linux-depmod26
> > > -ae -F System.map -b
> > > /home/harry/Desktop/buildroot/project_build_i486/Agritel/root -r
> > > 2.6.18.8-DMP; fi
> > > make[1]: Leaving directory
> > > `/home/harry/Desktop/buildroot/project_build_i486/Agritel/linux-
> > > 2.6.18.8'
> > > rm -f
> > > /home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.18.8/build
> > > rm -f
> > > /home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.18.8/source
> > > /home/harry/Desktop/buildroot/build_i486/staging_dir/bin/i486-linux-depmod26
> > > -b /home/harry/Desktop/buildroot/project_build_i486/Agritel/root
> > > 2.6.23
> > > WARNING: Couldn't open directory
> > > /home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.23:
> > > No such file or directory
> > > FATAL: Could not open
> > > /home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.23/modules.dep.temp
> > > for writing: No such file or directory
> > > make: ***
> > > [/home/harry/Desktop/buildroot/project_build_i486/Agritel/root/lib/modules/2.6.18.8/modules.dep]
> > > Error 1
> > >
> > > I dont know what to change in order to avoid this error. I'm rather
> > > new to kernel compilation so a detailed answer would be very much
> > > appreciated. Thanks in advance!
> > >
> > > Kind Regards
> > >   Reinier
> > >
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at uclibc.org
> > > http://busybox.net/mailman/listinfo/buildroot
> > >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080325/12544f6f/attachment.htm 
