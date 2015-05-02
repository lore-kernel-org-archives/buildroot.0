From: Carlos Soto <csotoalonso@gmail.com>
Date: Sat, 2 May 2015 22:42:19 +0200
Subject: [Buildroot] Libtool problem building mesa3d-demos
In-Reply-To: <55452348.7030306@mind.be>
References: <CAD7j7Q96pGF1qedawQw4-FHSyC15EyXH1DBu=MNkvFQg_Ys-dg@mail.gmail.com>
 <5543FACD.4010307@mind.be>
 <CAD7j7Q-9n+y-38sHk+ESnOkr4rBnRAQ8tvt5fMC=_f7J-0wkHA@mail.gmail.com>
 <55452348.7030306@mind.be>
Message-ID: <CAD7j7Q9-bJDVNo7yfOowfuiD6X=KTPjTwvGtznoenG8c2Hzqxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-05-02 21:19 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

> On 02/05/15 18:04, Carlos Soto wrote:
> >
> >
> > 2015-05-02 0:14 GMT+02:00 Arnout Vandecappelle <arnout@mind.be
> > <mailto:arnout@mind.be>>:
> >
> >     On 01/05/15 22:41, Carlos Soto wrote:
> >     > Hi,
> >     > I'm using buildroot to create a rootfs for iMX6-quad. I'm using an
> external
> >     > toolchain created with crosstool-ng
> (arm-cortexa9_neon-linux-gnueabihf).
> >     > When building mesa3d-demos, there is an error creating libutil.la
> <http://libutil.la>
> >     > <http://libutil.la>:
> >     >
> >     > libtool:   error:
> >     >
> '/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/lib/gcc/arm-cortexa9_neon-linux-gnueabihf/4.9.1/../../../../arm-cortexa9_neon-linux-gnueabihf/lib/libstdc++.la'
> >     > is not a valid libtool archive
> >     >
> >     > Of corse, this path is not right, it seems to be joining two
> different paths.
> >     >
> >     > I've tracked the source of the problem, and it seems to be related
> with the
> >     > libtool used by buildroot. I've modified the resulting Makefiles
> to use the host
> >     > libtool, and the problem disappears:
> >
> >      You have to use buildroot's libtool, otherwise you may get other
> problems with
> >     cross-compilation.
> >
> >     >
> >     > LIBTOOL = $(SHELL) $(top_builddir)/libtool to
> >     > LIBTOOL = $(SHELL) /usr/bin/libtool
> >     >
> >     > Any thoughts about what it's going wrong?
> >
> >      Can you tell us which options are given to libtool, and perhaps run
> it with -v
> >     to see what it does?
> >
> > That is the libtool command from the Makefile (just for
> mesa3d-demos/src/util ,
> > but it's the same for other directories)
> > /bin/bash ../../libtool --silent --tag=CC   --mode=link
> >
> /home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
> > -DMESA_EGL_NO_X11_HEADERS
> >
> -I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm
> >
> -I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
> >
> -I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/GL
> > -DMESA_EGL_NO_X11_HEADERS
> >
> -I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm
> >
> -I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
> > -DMESA_EGL_NO_X11_HEADERS
> >
> -I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm
> >
> -I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
> > -D_GNU_SOURCE -DPTHREADS -Wall -Wpointer-arith -Wstrict-prototypes
> > -Wmissing-prototypes -Wmissing-declarations -Wnested-externs
> > -fno-strict-aliasing -Wbad-function-cast -Wold-style-definition
> > -Wdeclaration-after-statement  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > -D_FILE_OFFSET_BITS=64   -Os -g2
> >
> -L/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> > -lGL
> >
> -L/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> > -lGLEW -lGLU
> >
> -L/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> > -lGL   -lGLU
> >
> -L/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
> > -lGL   -lm   -o libutil.la <http://libutil.la>  readtex.lo showbuffer.lo
> > trackball.lo
>
>  Since this xtools thing is not passed on the command line, it must be in
> your
> environment. Can you do 'env | grep xtools'?
>
>  Regards,
>  Arnout
>
> No, it's not in my environment. As far as I can tell, libtool seems to be
joining together my toolchain path
(usr/local/xtools//arm-cortexa9_neon-linux-gnueabihf)
and the buildroot staging sysroot path (
/home/starsl/iMX6/buildroot/output/host/usr/lib)


>
> > And the output is:
> > /bin/grep:
> >
> /home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/lib/gcc/arm-cortexa9_neon-linux-gnueabihf/4.9.1/../../../../arm-cortexa9_neon-linux-gnueabihf/lib/libstdc++.la:
> > No such file or directory
> > /bin/sed: can't read
> >
> /home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/lib/gcc/arm-cortexa9_neon-linux-gnueabihf/4.9.1/../../../../arm-cortexa9_neon-linux-gnueabihf/lib/libstdc++.la:
> > No such file or directory
> > libtool:   error:
> >
> '/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/lib/gcc/arm-cortexa9_neon-linux-gnueabihf/4.9.1/../../../../arm-cortexa9_neon-linux-gnueabihf/lib/libstdc++.la'
> > is not a valid libtool archive
> >
> >
> > I've tried passing the --verbose flag instead of --silent, but the
> output does
> > not change.
> >
> >
> >      Regards,
> >      Arnout
> >
> >     >
> >     > Regards,
> >     > Carlos
> >     >
> >     >
> >     >
> >     >
> >     > _______________________________________________
> >     > buildroot mailing list
> >     > buildroot at busybox.net <mailto:buildroot@busybox.net>
> >     > http://lists.busybox.net/mailman/listinfo/buildroot
> >     >
> >
> >
> >     --
> >     Arnout Vandecappelle                          arnout at mind be
> >     Senior Embedded Software Architect            +32-16-286500
> >     Essensium/Mind                                http://www.mind.be
> >     G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
> Leuven
> >     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> >     GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> >
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150502/a646c1d0/attachment.html>
