From: Carlos Soto <csotoalonso@gmail.com>
Date: Sat, 2 May 2015 23:16:00 +0200
Subject: [Buildroot] Libtool problem building mesa3d-demos
In-Reply-To: <55453750.9080302@mind.be>
References: <CAD7j7Q96pGF1qedawQw4-FHSyC15EyXH1DBu=MNkvFQg_Ys-dg@mail.gmail.com>
 <5543FACD.4010307@mind.be>
 <CAD7j7Q-9n+y-38sHk+ESnOkr4rBnRAQ8tvt5fMC=_f7J-0wkHA@mail.gmail.com>
 <55452348.7030306@mind.be>
 <CAD7j7Q9-bJDVNo7yfOowfuiD6X=KTPjTwvGtznoenG8c2Hzqxg@mail.gmail.com>
 <55453750.9080302@mind.be>
Message-ID: <CAD7j7Q8_T_i2baF-x2XKjuLO6ckykqgohstdW75VzPXWQ-rJng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-05-02 22:45 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

> On 02/05/15 22:42, Carlos Soto wrote:
> >
> >      Since this xtools thing is not passed on the command line, it must
> be in your
> >     environment. Can you do 'env | grep xtools'?
> >
> >      Regards,
> >      Arnout
> >
> > No, it's not in my environment. As far as I can tell, libtool seems to be
> > joining together my toolchain path
> > (usr/local/xtools//arm-cortexa9_neon-linux-gnueabihf) and the buildroot
> staging
> > sysroot path (
> > /home/starsl/iMX6/buildroot/output/host/usr/lib)
>
>  OK, so then there must be some .la file which has something funny. Can
> you grep
> for xtools in all the .la files in output/ ?
>
>  Regards,
>  Arnout
>
>
Done. Yes, there is something funny in some .la files.
I've found this line
libdir='/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/arm-cortexa9_neon-linux-gnueabihf/lib'
in some .la files in /host/usr/arm-buildroot-linux-gnueabihf/sysroot/lib,
but that's expected because these are copied from my external toolchain.

The awful one is libGLU.la, which contains the strange search path for
libstdc++.la in 'dependency_libs'
There are 4 libGLU.la in my output directory, and 3 of them have a valid
path
./build/libglu-9.0.0/libGLU.la
./build/libglu-9.0.0/.libs/libGLU.la
./target/usr/lib/libGLU.la

But this one
./host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libGLU.la
has the wrong path:
dependency_libs='
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libGL.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/
libexpat.la
/home/starsl/iMX6/buildroot/output/build/mesa3d-10.4.4/src/mapi/shared-glapi/
libglapi.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libXdamage.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libXfixes.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libX11-xcb.la
/home/starsl/iMX6/buildroot/output/build/xlib_libX11-1.6.2/src/libX11.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/
libxcb-glx.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/
libxcb-dri2.la /home/starsl/iMX6/buildroot/output/build/libxcb-1.11/src/
libxcb.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libXxf86vm.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libXext.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libX11.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/
libxcb.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libXau.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libXdmcp.la
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/
libdrm.la -lpthread -ldl
/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/lib/gcc/arm-cortexa9_neon-linux-gnueabihf/4.9.1/../../../../arm-cortexa9_neon-linux-gnueabihf/lib/libstdc++.la'





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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150502/b30999e9/attachment.html>
