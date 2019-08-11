From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Aug 2019 23:55:30 +0200
Subject: [Buildroot] [PATCH v2] libdrm: fix static build (tests/nouveau)
In-Reply-To: <20190811153846.68028925@windsurf.home>
References: <20190809231908.22209-1-ps.report@gmx.net>
 <20190811153846.68028925@windsurf.home>
Message-ID: <20190811235530.453661e3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 11 Aug 2019 15:38:46 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> Thanks for working on this topic. Some questions/comments below.
> 
> On Sat, 10 Aug 2019 01:19:08 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Some toolchains (e.g. br-arm-cortex-m4-full) provide empty libdl
> > libraries. This fools the dynamic/static detection for tests/nouveau,
> > so explicit check for library type instead.
> > 
> > Fixes [1]:
> > 
> >   ../tests/nouveau/threaded.c:24:10: fatal error: dlfcn.h: No such file or directory  
> 
> So the error is about not finding a header.

Yes, follow up failure from misdetecting dynamic library support...
 
> 
> > + # Among others FreeBSD does not have a separate dl library.
> > + if not cc.has_function('dlsym')
> > ++  # fooled in case empty libdl provided, e.g. toolchain br-arm-cortex-m4-full
> > +   dep_dl = cc.find_library('dl', required : with_nouveau)  
> 
> What about instead checking for the availability of dlfcn.h, in
> addition to checking the availability of the libdl library ?

Yes, this would be the better/perfect solution (but did not yet find the
time to impelment it)....

> 
> Also, how come the cc.has_function('dlsym') checks returns true ? I
> guess in a static library configuration, this check should return false.

Mind the 'not' in the if statement, if no 'native' cc support for dlsym
check for libdl as indication for dynamic library support...

> 
> Also, could you drop the references to br-arm-cortex-m4-full, so that
> the patch can be upstreamed ?

Yes will do (as soon as I find a suitable timeslot ;-) )...

The librm/meson patch series is re-suggested upsteam, see [1], [2], [3]...

Regards,
Peter

[1] https://lists.freedesktop.org/archives/dri-devel/2019-August/230489.html
[2] https://lists.freedesktop.org/archives/dri-devel/2019-August/230490.html
[3] https://lists.freedesktop.org/archives/dri-devel/2019-August/230491.html

> 
> BTW, with uClibc-ng and musl, the libdl library is always empty,
> regardless of whether it has dynamic library support or not. Here is a
> uClibc-ng toolchain, with dynamic library support:
> 
> -rw-r--r-- 1 thomas thomas 8  1 ao?t  22:23 output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libdl.a
> 
> Indeed, since quite a while, uClibc-ng is all in a single file,
> libc.so, including symbols that used to be in libdl.so:
> 
> $ ./output/host/bin/arm-linux-readelf -s output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libc.so.1  | grep "FUNC.*dlsym"
>    884: 00058fe0   468 FUNC    GLOBAL DEFAULT    8 dlsym
>   7356: 00058fe0   468 FUNC    GLOBAL DEFAULT    8 dlsym
> 
> Best regards,
> 
> Thomas
