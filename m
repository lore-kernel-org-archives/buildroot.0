From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 6 Aug 2019 11:55:47 +0300
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix redefinition of
 'struct termios'
In-Reply-To: <20190802105743.5dc24f0e@windsurf.home>
References: <20190723085516.17377-1-vadim4j@gmail.com>
 <20190802105743.5dc24f0e@windsurf.home>
Message-ID: <CAMw6YJLGKLji4eSp92qffykp_R5JOoq3CHTF5iudNBLo-659vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 2, 2019 at 11:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Vadim,
>
> On Tue, 23 Jul 2019 11:55:16 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
>
> > Both libc and linux defines 'struct termios', in termbits.h and
> > termios.h which leads to the compilation error:
> >
> > In file included from custom_baud.c:23:0:
> >
> >           /home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/termbits.h:12:8:
> >       error: redefinition of 'struct termios'
> >        struct termios {
> >               ^~~~~~~
> >       In file included from
> >       /home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/termios.h:39:0,
> >                        from
> >       /home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/bits/ioctl-types.h:5,
> >                        from
> >       /home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/sys/ioctl.h:29,
> >                        from custom_baud.c:21:
> >       /home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/bits/termios.h:33:8:
> >       note: originally defined here
> >        struct termios {
> >               ^~~~~~~
> >
> > So fix it by renaming 'termios' to 'asmtermios' before termbits.h only,
> > because 'struct termios2' is used only.
> >
> > Fixes:
> >     http://autobuild.buildroot.net/results/797dde5cbf0e94162c7cc7b557841605c78ac2f3/
> >
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
>
> Peter and I had a look at the issue, and our conclusion is that the
> actual problem is in uClibc-ng, and should be fixed here.
>
> The problem is that the powerpc-specific ioctl-types.h in uClibc-ng
> includes <termios.h>,
> see ./libc/sysdeps/linux/powerpc/bits/ioctl-types.h. But neither the
> MIPS-specific or the generic ioctl-types.h in uClibc-ng do that.
>
> If you look at the history of
> libc/sysdeps/linux/powerpc/bits/ioctl-types.h, before commit
> e66d628551d918d4ee89d67fe62b627cae27d210, it was like the generic and
> MIPS ioctl-types.h, i.e defining a number of macros and structures, but
> certainly not including <termios.h>.
>
> Then, if you look at glibc, indeed until commit
> d4795e4a43e6f0c221bc5dc64c612206a21a177b, the powerpc-specific
> ioctl-types.h was just including <termios.h>, but in this commit, they
> changed it back to define the different macros and structures.
>
> So basically, the powerpc-specific ioctl-types.h in uClibc-ng needs to
> be resync'ed with the one from glibc, and it should fix the issue, in a
> proper way.
>
> Could you test this, and if it works, send the patch to upstream
> uClibc-ng, and add it in package/uclibc/ in Buildroot, until uClibc-ng
> integrates it in a release ?
>
> Thanks a lot!
>
> Thomas

I will try to handle this.

Regards,
Vadim Kochan
