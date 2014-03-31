From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Mar 2014 12:32:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-28
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356C9AB43@de02wembxa.internal.synopsys.com>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356C9AB43@de02wembxa.internal.synopsys.com>
Message-ID: <20140331123233.256f294c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon, 31 Mar 2014 10:24:47 +0000, Anton Kolesov wrote:

> > ARC compiler error. Anton?
> > 
> >   CC       magick/magick_libMagickCore_6_Q16_la-cipher.lo
> > magick/cipher.c: In function 'IncrementCipherNonce.constprop.2':
> > magick/cipher.c:535:1: internal compiler error: Segmentation fault
> >  }
> >  ^
> 
> [AK:] This one is fixed in our repository. We should have a new release on a two weeks that will resolve many of the compiler failures. I will bump versions in Buildroot after that.

Great, thanks for the feedback!


> > Anton ?
> > 
> > /home/test/test/2/output/host/usr/lib/gcc/arc-buildroot-linux-
> > uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld: bayrad.so: hidden
> > symbol `__fini_array_end' isn't defined
> > /home/test/test/2/output/host/usr/lib/gcc/arc-buildroot-linux-
> > uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld: final link failed: Bad
> > value
> > collect2: error: ld returned 1 exit status
> > 
> 
> [AK:] It looks like that this is caused by "-static -shared". In general it cannot work for ARC out of the box - because
> it is "-static" then shared library will be linked with libc.a (not
> libc.so), however because it is a shared library, then all of the code
> inside should be compiled -fPIC. But I believe that is not true for ARC
> tool chain: libc.a by default is compiled without -fPIC for the
> performance reasons. So the final shared object will have potions of
> position dependent code - that's not gonna work, previously that was
> causing an error at runtime in dynamic loader, due to invalid
> relocations, but since new release linker will abort on attempt to link
> non-PIC code into shared library. That means that for "-static -shared"
> to work libc.a should be compiled with -fPIC as well. In this
> particular case it results in some linker failure (maybe because it is
> C++, instead of C?). I've tried to link without -static and it worked
> fine. I presume the error will go away if libc.a will be compiled with
> -fPIC, but I haven't tried this myself yet. 

No, I don't think libc.a should be built with -fPIC. Just leave the ARC
build as it is. The real problem here is that lcdproc attempts to build
a shared library, even if the configuration says BR2_PREFER_STATIC_LIB.
So it should be fixed either by making lcdproc not available when
BR2_PREFER_STATIC_LIB=y, or by fixing lcdproc itself to generate a
shared library when needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
