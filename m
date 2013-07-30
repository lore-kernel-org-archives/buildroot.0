From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 30 Jul 2013 16:57:49 +0800
Subject: [Buildroot] Libraries built with buildroot can only be used by
 buildroot itself.
In-Reply-To: <CAAXf6LUnzaaHCE+9DiybobpZqUgCmHFEt12a3c=5B5NTP5zsNg@mail.gmail.com>
References: <20130730044000.GA24161@zuhnb712.ap.bm.net>
 <CAAXf6LUnzaaHCE+9DiybobpZqUgCmHFEt12a3c=5B5NTP5zsNg@mail.gmail.com>
Message-ID: <20130730085749.GA12392@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 30, 2013 at 08:22:19AM +0200, Thomas De Schampheleire wrote:
> Hi,
> 
> On Tue, Jul 30, 2013 at 6:40 AM, Woody Wu <narkewoody@gmail.com> wrote:
> > Hi,
> >
> > ** In below example, I will talk directfb libraries, but I am afraid it it
> >    not specific to directfb but a more general case.
> >
> > Using buildroot and BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203, I got
> > build with some graphics libraries (in my case, these are direct frame
> > buffer libraries, i.e., BR2_PACKAGE_DIRECTFB). Then I want to use these
> > cross compiled libraries to cross compile my own written very simple
> > directfb application code.
> >
> >
> > What I did is:
> >
> >     crossroot=/home/woody/buildroot-2013.05/
> >         output/host/usr/arm-buildroot-linux-gnueabi/sysroot
> >     rm -f *.o hline
> >     arm-none-linux-gnueabi-gcc -I ${crossroot}/usr/include/directfb \
> >         -D_GNU_SOURCE -o hline.o -c hline.c
> >     arm-none-linux-gnueabi-gcc -I ${crossroot}/usr/include/directfb \
> >         -D_GNU_SOURCE -o hline hline.o -ldirectfb -L ${crossroot}/usr/lib
> >
> > In case one, I set my path to use the gcc from my own Codesourcery
> > installation, which is the same version as that buildroot is using.
> > Actually, this Codesourcery installation is a direct uncompress from the
> > tarball that buildroot downloaded from net to its download directory.
> >
> > In case two, I set my path to use the gcc directly in buildroot, i.e,
> > under /home/woody/buildroot-2013.05/host/usr/bin
> >
> > In case two, it built with success. But case one, it did not:
> >
> > /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld: skipping incompatible /lib/libc.so.6 when searching for /lib/libc.so.6
> > /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld: cannot find /lib/libc.so.6
> > /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld: skipping incompatible /usr/lib/libc_nonshared.a when searching for /usr/lib/libc_nonshared.a
> > /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld: cannot find /usr/lib/libc_nonshared.a
> > /home/woody/arm-2012.03/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld: cannot find /lib/ld-linux.so.3
> > collect2: ld returned 1 exit status
> >
> >
> > I don't understand why the error happened.  It seems the cross compiler
> > of buildroot understood things correctly, but the same cross compiler
> > install by myself did not.
> >
> > Can anyone please give me hint?
> 
> Buildroot creates a toolchain wrapper when using external toolchains.
> This wrapper passes some extra arguments to the toolchain, telling it
> where the sysroot is containing the headers and libraries, which
> architecture to build for etc. This wrapper is what you see in
> output/host/usr/bin.
> 
> You can verify that this is the case by running strace on it, or, if
> you have a very recent buildroot version (containing commit
> aaa06aaa82787b77ea56a7664cb4b0a22eca5c31, you can get a list of all
> options passed by setting the environment variable BR_DEBUG_WRAPPER
> when running the toolchain.
> 
> For your reference, the wrapper source is at
> toolchain/toolchain-external/ext-toolchain-wrapper.c
> 
> 
> So the behavior you are seeing is expected. You should always use the
> toolchain through output/host/usr/bin/.

Okay, Thomas.  But I found fully copy of output/host/usr/bin (just in
another directory) also does not work.  Is this also expected behavior?


> 
> Best regards,
> Thomas

-- 
I can't go back to yesterday - because I was a different person then
