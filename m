From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 2 Nov 2018 20:08:08 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: needs kernel headers >= 3.18
In-Reply-To: <CAPi7W81Yp=KjwbhwTUpU8BMUVHNr8fbu9JKaTSZYB_u0PWE+Xw@mail.gmail.com>
References: <20181102133521.2297-1-fontaine.fabrice@gmail.com>
 <20181102151958.23d16ccc@gmx.net>
 <CAPi7W81WAgkXDjzBy-c+0gKwpiuENN46awE2G6FyXBoXS0AcCw@mail.gmail.com>
 <20181102184645.25d7ea63@gmx.net>
 <CAPi7W81Yp=KjwbhwTUpU8BMUVHNr8fbu9JKaTSZYB_u0PWE+Xw@mail.gmail.com>
Message-ID: <20181102200808.5287fde9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 2 Nov 2018 19:41:50 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Dear Peter,
> Le ven. 2 nov. 2018 ? 18:46, Peter Seiderer <ps.report@gmx.net> a ?crit :
> >
> > Hello Fabrice,
> >
> > On Fri, 2 Nov 2018 18:01:31 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >  
> > > Dear Peter,
> > > Le ven. 2 nov. 2018 ? 15:20, Peter Seiderer <ps.report@gmx.net> a ?crit :  
> > > >
> > > > Hello Fabrice,
> > > >
> > > > On Fri,  2 Nov 2018 14:35:21 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > > >  
> > > > > Bump to version 1.16.1 added a dependency to bpf headers:
> > > > > https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80
> > > > >
> > > > > BPF headers are available since kernel 3.18:
> > > > > https://github.com/torvalds/linux/commit/c15952dc18d8a293d976ac6c06d44d9d98023b45
> > > > >
> > > > > Fixes:
> > > > >  - http://autobuild.buildroot.org/results/d22c0939eed4bc949f7eaeae7595d01ec45cc2cd
> > > > >  
> > > >
> > > > Thanks for taking care of the autobuild failure, but....
> > > >
> > > > To be exact, only utils/keytable depend on the (new) linux kernel bpf header, so
> > > > it would be sufficient for only v4l-utils to depend on headers >= 3.18 (or split
> > > > v4l-utils into the single utils with different dependencies)?  
> > > Yes, you're right, at least I should have moved this dependency to the
> > > utils option.  
> > > >
> > > > Or: the commit d6025b0e8c7f57b0f9390f987acc5eed57360d80 adds already a copy
> > > > of the linux/bpf.h header, maybe only the dependent linux/bpf_common.h file is
> > > > missing?  
> > > Indeed, I think this is the best solution. I will set this patch as
> > > rejected and let you send a new patch.  
> >
> > Ok, will try out the alternative solution...  
> I don't want to push this work on you. If you prefer, I can also work on it.
> >  

Thanks, but patch already created, see:

https://patchwork.ozlabs.org/patch/992510/

> > >
> > > We have an other build failure with this bump:
> > > http://autobuild.buildroot.org/results/c18/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0/build-end.log
> > >
> > > This build failure is due to the clang dependency that has been added with:
> > > https://git.linuxtv.org/v4l-utils.git/commit/?id=91b37c0d9cb71fc2d5f78cc96aa2ef9f3bba145b
> > >
> > > I'm trying to fix it but I don't know if this will be easy as I'm not
> > > familiar with clang.
> > > At least, we'll have to add host-clang (which is a "big" dependency)
> > > and remove or customize the "-target bpf" in the following command
> > > line:
> > > $(CLANG) $(CLANG_SYS_INCLUDES) -I$(top_srcdir)/include -target bpf -O2 -c $<
> > >
> > > An other option would be to disable BPF protocols for the time being
> > > by setting ac_cv_prog_CLANG to "".
> > > Do you have an opinion on this one?  
> >
> > The last lines from build-end.log:
> >
> >   make[1]: Leaving directory '/home/peko/autobuild/instance-0/output/build/libv4l-1.16.1'
> >   ERROR: architecture for "/lib/udev/rc_keymaps/protocols/grundig.o" is "None", should be "MIPS R3000"
> >   ERROR: architecture for "/lib/udev/rc_keymaps/protocols/pulse_length.o" is "None", should be "MIPS R3000"
> >   ERROR: architecture for "/lib/udev/rc_keymaps/protocols/rc_mm.o" is "None", should be "MIPS R3000"
> >   ERROR: architecture for "/lib/udev/rc_keymaps/protocols/pulse_distance.o" is "None", should be "MIPS R3000"
> >   ERROR: architecture for "/lib/udev/rc_keymaps/protocols/manchester.o" is "None", should be "MIPS R3000"
> >
> > Would suspect an false error detection through support/scripts/check-bin-arch script?  
> Nope, this is a true error, clang is detected on the host and it is
> used to build these 5 object files:
> 
> clang -idirafter /usr/local/include -idirafter
> /usr/lib/llvm-3.8/bin/../lib/clang/3.8.1/include -idirafter
> /usr/include/x86_64-linux-gnu -idirafter /usr/include
> -I../../../include -target bpf -O2 -c grundig.c
> clang -idirafter /usr/local/include -idirafter
> /usr/lib/llvm-3.8/bin/../lib/clang/3.8.1/include -idirafter
> /usr/include/x86_64-linux-gnu -idirafter /usr/include
> -I../../../include -target bpf -O2 -c pulse_distance.c
> clang -idirafter /usr/local/include -idirafter
> /usr/lib/llvm-3.8/bin/../lib/clang/3.8.1/include -idirafter
> /usr/include/x86_64-linux-gnu -idirafter /usr/include
> -I../../../include -target bpf -O2 -c pulse_length.c
> clang -idirafter /usr/local/include -idirafter
> /usr/lib/llvm-3.8/bin/../lib/clang/3.8.1/include -idirafter
> /usr/include/x86_64-linux-gnu -idirafter /usr/include
> -I../../../include -target bpf -O2 -c rc_mm.c
> clang -idirafter /usr/local/include -idirafter
> /usr/lib/llvm-3.8/bin/../lib/clang/3.8.1/include -idirafter
> /usr/include/x86_64-linux-gnu -idirafter /usr/include
> -I../../../include -target bpf -O2 -c manchester.c
> 
> Then these files are installed on staging/target:
> 
> /bin/bash /home/peko/autobuild/instance-0/output/build/libv4l-1.16.1/build-aux/install-sh
> grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o
> "/home/peko/autobuild/instance-0/output/host/mipsel-buildroot-linux-gnu/sysroot/lib/udev/rc_keymaps/protocols"
> 
> The issue is that these files are built for the host, not the target.
> As I said, I don't know much about clang, especially I don't know why
> they want to use it just for these BPF protocol files.
> Perhaps someone on the mailing list will be more knowledgable than me.

I still believe they are compiled for bpf interpreter (in-kernel bytecode machine),
see the '-target bpf' above...
 
Regards,
Peter
 
> >
> > Regards,
> > Peter
> >  
> > > >
> > > > Regards,
> > > > Peter
> > > >  
> > > > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > > > ---
> > > > >  package/libv4l/Config.in   | 2 +-
> > > > >  package/v4l2grab/Config.in | 2 +-
> > > > >  package/zbar/Config.in     | 2 +-
> > > > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> > > > > index 57ddde1dfb..84844349a4 100644
> > > > > --- a/package/libv4l/Config.in
> > > > > +++ b/package/libv4l/Config.in
> > > > > @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBV4L
> > > > >       bool "libv4l"
> > > > >       depends on BR2_TOOLCHAIN_HAS_THREADS
> > > > >       depends on BR2_INSTALL_LIBSTDCPP
> > > > > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
> > > > > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bpf headers
> > > > >       select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> > > > >       select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> > > > >       help
> > > > > diff --git a/package/v4l2grab/Config.in b/package/v4l2grab/Config.in
> > > > > index ec3a7a8c54..e25b1618e8 100644
> > > > > --- a/package/v4l2grab/Config.in
> > > > > +++ b/package/v4l2grab/Config.in
> > > > > @@ -4,7 +4,7 @@ config BR2_PACKAGE_V4L2GRAB
> > > > >       depends on BR2_USE_MMU # libv4l
> > > > >       depends on !BR2_STATIC_LIBS # libv4l
> > > > >       depends on BR2_INSTALL_LIBSTDCPP # libv4l
> > > > > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
> > > > > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # libv4l
> > > > >       select BR2_PACKAGE_JPEG
> > > > >       select BR2_PACKAGE_LIBV4L
> > > > >       help
> > > > > diff --git a/package/zbar/Config.in b/package/zbar/Config.in
> > > > > index 05c9b769ce..1d8f1be7cf 100644
> > > > > --- a/package/zbar/Config.in
> > > > > +++ b/package/zbar/Config.in
> > > > > @@ -3,7 +3,7 @@ config BR2_PACKAGE_ZBAR
> > > > >       depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
> > > > >       depends on BR2_USE_MMU # libv4l
> > > > >       depends on BR2_INSTALL_LIBSTDCPP # libv4l
> > > > > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
> > > > > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # libv4l
> > > > >       select BR2_PACKAGE_JPEG
> > > > >       select BR2_PACKAGE_LIBV4L
> > > > >       help  
> > > >  
> > > Best Regards,
> > >
> > > Fabrice  
> >  
> Best Regards,
> 
> Fabrice
