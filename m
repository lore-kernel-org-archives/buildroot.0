From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 12 May 2021 19:17:30 +0200
Subject: [Buildroot] sudo: error while loading shared libraries
In-Reply-To: <AM0PR06MB5923BBCDE75371734EDAA309C0549@AM0PR06MB5923.eurprd06.prod.outlook.com>
References: <AM0PR06MB5923A441CD0C1EF1952FC031C05A9@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <20210504214306.378dbbaf@windsurf>
 <AM0PR06MB5923BCE07863B47DBF9AAC02C0599@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <AM0PR06MB5923358E8BAADC4FAA9F5542C0589@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <20210506213744.3c03ca12@gmx.net>
 <AM0PR06MB5923BBCDE75371734EDAA309C0549@AM0PR06MB5923.eurprd06.prod.outlook.com>
Message-ID: <20210512191730.0a16ca32@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Uwe,

On Mon, 10 May 2021 13:10:31 +0000, Uwe Fechner <uwe.fechner@nl.abb.com> wrote:

> Dear Peter,
>
> I executed the steps that you suggested. My results:
>
> ufechner at builder:~/repos/armxl-buildroot$ cat build_rootfs.log | grep rpath | grep libtool | tail -1
> libtool: link: /mnt/data/repos/armxl-buildroot/output_imx6_rootfs/host/bin/arm-buildroot-linux-gnueabihf-gcc -o sudo conversation.o copy_file.o edit_open.o env_hooks.o exec.o exec_common.o exec_monitor.o exec_nopty.o exec_pty.o get_pty.o hooks.o limits.o load_plugins.o net_ifs.o parse_args.o preserve_fds.o signal.o sudo.o sudo_edit.o tcsetpgrp_nobg.o tgetpass.o ttyname.o utmp.o -Wl,--enable-new-dtags -Wl,-z -Wl,relro -fstack-protector-strong  -lutil ../lib/util/.libs/libsudo_util.so -lpthread -ldl -Wl,-rpath -Wl,/mnt/data/repos/armxl-buildroot/output_imx6_rootfs/build/sudo-1.9.5p2/lib/util/.libs -Wl,-rpath -Wl,/usr/libexec/sudo

This one looks good...

>
> ufechner at builder:~/repos/armxl-buildroot/output_imx6_rootfs$ readelf -d ./target/usr/bin/sudo | grep RUNPATH
>  0x0000001d (RUNPATH)                    Library runpath: [libexec/sudo]

This one is definitely wrong/unexpected...

>
> ufechner at builder:~/repos/armxl-buildroot/output_imx6_rootfs$ make > /dev/null 2>&1
> ufechner at builder:~/repos/armxl-buildroot/output_imx6_rootfs$ readelf -d ./target/usr/bin/sudo | grep RUNPATH
>  0x0000001d (RUNPATH)                    Library runpath: []

Follow-up failure, only the correct/absolute path '/usr/libexec/sudo' would be kept...

>
> So the runpath is wrong after the first build and empty after the second build.
>
> Any idea why this can happen?

Can you try to execute the link step on command line?

	$ cd build/sudo-1.9.5p2/src
	$ /mnt/data/repos/armxl-buildroot/output_imx6_rootfs/host/bin/arm-buildroot-linux-gnueabihf-gcc -o sudo ...
	$ readelf -d sudo

Do you have ccache enabled (in case try to build without)?

Regards,
Peter

>
> Uwe
> ________________________________
> From: Peter Seiderer <ps.report@gmx.net>
> Sent: Thursday, May 6, 2021 9:37 PM
> To: Uwe Fechner <uwe.fechner@nl.abb.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; buildroot at busybox.net <buildroot@busybox.net>
> Subject: Re: [Buildroot] sudo: error while loading shared libraries
>
> This email originated from outside of your organization. Please do not click on links or open attachments unless you recognize the sender and know the content is safe.
>
>
> Hello Uwe,
>
> On Thu, 6 May 2021 11:34:13 +0000, Uwe Fechner <uwe.fechner@nl.abb.com> wrote:
>
> > Dear all,
> >
> > I fixed the problem with sudo by adding the following symlink:
> >
> > [/lib]$ ls -la libsudo_util.so.0
> > lrwxrwxrwx 1 root root 35 May  5 18:28 libsudo_util.so.0 -> /usr/libexec/sudo/libsudo_util.so.0
> >
> > But this is more a workaround.
> >
> > readelf -d sudo
> > has the following output:
> >
> > Dynamic section at offset 0x20b14 contains 34 entries:
> >   Tag        Type                         Name/Value
> >  0x00000001 (NEEDED)                     Shared library: [libutil.so.1]
> >  0x00000001 (NEEDED)                     Shared library: [libsudo_util.so.0]
> >  0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
> >  0x00000001 (NEEDED)                     Shared library: [libdl.so.2]
> >  0x00000001 (NEEDED)                     Shared library: [libc.so.6]
> >  0x00000001 (NEEDED)                     Shared library: [ld-linux-armhf.so.3]
> >  0x0000001d (RUNPATH)                    Library runpath: [libexec/sudo]
> >  0x0000000c (INIT)                       0x2f1c
> >
> > The library runpath is wrong, it should be /usr/libexec/sudo .
> >
> > Or the package sudo should install libsudo_util.so.0 in the folder /lib.
> >
> > My conclusion is that there is a bug in the package sudo, version 1.9.5p2 .
> >
> > Any comments?
>
> Please provide the output of the following commands (example output given):
>
>         $ rm -rf build/sudo-1.9.5p2
>
>         $ make sudo 2>&1 | grep rpath | tail -1
> libtool: link: <your_build_path>/host/bin/aarch64-buildroot-linux-gnu-gcc -o sudo conversation.o copy_file.o edit_open.o env_hooks.o exec.o exec_common.o exec_monitor.o exec_nopty.o exec_pty.o get_pty.o hooks.o limits.o load_plugins.o net_ifs.o parse_args.o preserve_fds.o signal.o sudo.o sudo_edit.o tcsetpgrp_nobg.o tgetpass.o ttyname.o utmp.o -Wl,--enable-new-dtags -Wl,-z -Wl,relro -fstack-protector-strong  -lutil ../lib/util/.libs/libsudo_util.so -lpthread -ldl -Wl,-rpath -Wl,<your_build_path>/build/sudo-1.9.5p2/lib/util/.libs -Wl,-rpath -Wl,/usr/libexec/sudo
>
>         $ readelf -d ./target/usr/bin/sudo | grep RUNPATH
>  0x000000000000001d (RUNPATH)            Library runpath: [<your_build_path>/build/sudo-1.9.5p2/lib/util/.libs:/usr/libexec/sudo]
>
>         $ make > /dev/null 2>&1
>
>         $ readelf -d ./target/usr/bin/sudo | grep RUNPATH
>  0x000000000000001d (RUNPATH)            Library runpath: [/usr/libexec/sudo]
>
>
> Just to check if the rpath is corrupted from start/compile on or if it is
> a problem of the buildroot sanitizing rpath step (or some funny problem
> with your local build path)...
>
> Regards,
> Peter
>
> >
> > Uwe
> > ________________________________
> > From: buildroot <buildroot-bounces@busybox.net> on behalf of Uwe Fechner <uwe.fechner@nl.abb.com>
> > Sent: Wednesday, May 5, 2021 1:14 PM
> > To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: buildroot at busybox.net <buildroot@busybox.net>
> > Subject: Re: [Buildroot] sudo: error while loading shared libraries
> >
> > This email originated from outside of your organization. Please do not click on links or open attachments unless you recognize the sender and know the content is safe.
> >
> > Dear Thomas,
> >
> > Thanks for looking into this issue, but your suggestion did not help:
> >
> > $ LD_LIBRARY_PATH=/usr/libexec/sudo sudo dmesg
> > sudo: error while loading shared libraries: libsudo_util.so.0: cannot open shared object file: No such file or directory
> >
> > Any other idea?
> >
> > Uwe
> > ________________________________
> > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Sent: Tuesday, May 4, 2021 9:43 PM
> > To: Uwe Fechner <uwe.fechner@nl.abb.com>
> > Cc: buildroot at busybox.net <buildroot@busybox.net>
> > Subject: Re: [Buildroot] sudo: error while loading shared libraries
> >
> > This email originated from outside of your organization. Please do not click on links or open attachments unless you recognize the sender and know the content is safe.
> >
> >
> > Hello Uwe,
> >
> > On Tue, 4 May 2021 11:18:59 +0000
> > Uwe Fechner <uwe.fechner@nl.abb.com> wrote:
> >
> > > Hello,
> > >
> > > we are using buildroot on i.mx6 since a long time.
> > >
> > > Since yesterday I get the following error with the sudo package:
> > >
> > > sudo dmesg
> > > sudo: error while loading shared libraries: libsudo_util.so.0: cannot open shared object file: No such file or directory
> > >
> > > We are using sudo-1.9.5p2 .
> > >
> > > The library exists and the permissions seem to be correct:
> > >
> > >
> > > ls -la /usr/libexec/sudo
> >
> > Based on the error message, it seems like the library is not dlopen()ed
> > but directly linked into sudo. Hwoever, /usr/libexec/sudo is not in the
> > default search path for libraries, and therefore unless the sudo binary
> > has a RPATH/RUNPATH pointing to /usr/libexec/sudo, I believe what
> > you're seeing is expected.
> >
> > To verify this, you can try:
> >
> > LD_LIBRARY_PATH=/usr/libexec/sudo sudo dmesg
> >
> > Really, I think libsudo_util.so has no business in /usr/libexec/sudo,
> > it should be in /usr/lib. Based on the names of the other .so files,
> > they look like dlopen()ed libraries, which can stay in
> > /usr/libexec/sudo.
> >
> > > total 588
> > > drwxr-xr-x  2 root root   4096 May  3 19:31 .
> > > drwxr-xr-x 11 root root   4096 May  3 19:31 ..
> > > -rw-r--r--  1 root root  17716 May  3 19:31 audit_json.so
> > > -rw-r--r--  1 root root   9380 May  3 19:31 group_file.so
> > > lrwxrwxrwx  1 root root     21 May  3 19:31 libsudo_util.so -> libsudo_util.so.0.0.0
> > > lrwxrwxrwx  1 root root     21 May  3 19:31 libsudo_util.so.0 -> libsudo_util.so.0.0.0
> > > -rwxr-xr-x  1 root root 112412 May  3 19:31 libsudo_util.so.0.0.0
> > > -rw-r--r--  1 root root   5284 May  3 19:31 sample_approval.so
> > > -rw-r--r--  1 root root 420184 May  3 19:31 sudoers.so
> > > -rw-r--r--  1 root root   5260 May  3 19:31 sudo_noexec.so
> > > -rw-r--r--  1 root root   5276 May  3 19:31 system_group.so
> > >
> > > Any idea?
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&amp;data=04%7C01%7Cuwe.fechner%40nl.abb.com%7Ce0d8778cc32d405444e608d910c671b9%7C372ee9e09ce04033a64ac07073a91ecd%7C0%7C0%7C637559266760586100%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sPNAosKwE5yE%2BWuSNtWaMwStdoE2QHzgRG1z7wdXul8%3D&amp;reserved=0<https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&amp;data=04%7C01%7Cuwe.fechner%40nl.abb.com%7Ce0d8778cc32d405444e608d910c671b9%7C372ee9e09ce04033a64ac07073a91ecd%7C0%7C0%7C637559266760586100%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sPNAosKwE5yE%2BWuSNtWaMwStdoE2QHzgRG1z7wdXul8%3D&amp;reserved=0>
>
