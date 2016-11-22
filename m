From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 09:26:56 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <bfc05511-fb21-e223-ced5-6108cd702fea@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
 <20161121230850.00bbc1cf@free-electrons.com>
 <bfc05511-fb21-e223-ced5-6108cd702fea@mind.be>
Message-ID: <20161122092656.39ae5aa4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 00:38:07 +0100, Arnout Vandecappelle wrote:

> > Hum, I think I had a look, and I was able to reproduce IIRC. I really
> > need to be better at taking notes about what I'm doing. I even think I
> > had found what the issue was.  
> 
>  I wasn't able to reproduce on my laptop (but I didn't do the whole build, just
> kvmtool).

I don't remember, I'll try to restart a full build. It might have been
an issue with the host gcc version, or something like that.

> >> http://autobuild.buildroot.net/results/4fb4353bce614b64b30b05d06831e0d0f38a48dd
> >> bfin / bf532	libarchive-3.2.1	uclibc	static
> >>  
> >>> ./.libs/libarchive.a(archive_random.o): In function `_archive_random':
> >>> libarchive/archive_random.c:(.text+0x158): undefined reference to `_pthread_mutex_lock'
> >>> libarchive/archive_random.c:(.text+0x20a): undefined reference to `_pthread_mutex_unlock'    
> >>
> >>  pthread static linking problem with the ADI toolchain. Probably solved with
> >> current uClibc-ng.  
> > 
> > Let's kill this toolchain. I checked the other day the ADI toolchain
> > SourceForge site, and they don't have any newer version.  
> 
>  OK. But let's do it after the 2016.11 release, OK?

Yes, agreed. Or I could already drop them from the autobuilder testing,
and we wait after 2016.11 to actually remove them from Buildroot.

> Perhaps if/when I (or someone else) do a respin of the external toolchain series?

Does it need a respin?

> >> http://autobuild.buildroot.net/results/0be5e6b6194df5261b5ee569100f9eb2c899b695
> >> powerpc / e500mc	lite-0.8.10	uclibc	static
> >>  
> >>> /bin/sh ../libtool --tag=CC   --mode=link /home/buildroot/build/instance-0/output/host/usr/bin/powerpc-linux-gcc  -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -static -Werror-implicit-function-declaration  -static -o lite_bench bench.o ../leck/libleck.la ../lite/liblite.la -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirectfb -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib   -lz -lfusion -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirect -lpthread -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib   ../leck/libleck.la ../lite/liblite.la -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirectfb -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/
 sysr    
> >>  oot/usr/lib   -lz -lfusion -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -ldirect -lpthread -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib    
> >>> /home/buildroot/build/instance-0/output/host/usr/bin/powerpc-linux-gcc -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -Werror-implicit-function-declaration -static -o lite_bench bench.o  -L/home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib ../leck/.libs/libleck.a /home/buildroot/build/instance-0/output/build/lite-0.8.10/lite/.libs/liblite.a ../lite/.libs/liblite.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libdirectfb.a /home/buildroot/build/instance-0/output/build/directfb-1.7.7/lib/fusion/.libs/libfusion.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libfusion.a /home/buildroot/build/instance-0/output/build/directfb-1.7.7/lib/direct/.libs/libdirect.a /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libdirect.a -lz -lrt /home/build
 root    
> >>  /build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so -lpthread   -Wl,--rpath -Wl,/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib -Wl,--rpath -Wl,/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib  
> >>> libtool: link: warning: library `/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.la' was moved.
> >>> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `/home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/../../../../powerpc-buildroot-linux-uclibc/lib/libstdc++.so'
> >>> collect2: error: ld returned 1 exit status
> >>> Makefile:378: recipe for target 'lite_bench' failed    
> >>
> >>  The linking with libstdc++.so is added by libtool and is caused by directfb.
> >> Not sure what is happening here. This isn't the same thing as for ppc64le, is it?  
> > 
> > I'm not entirely sure about that one, but it could be the following
> > (usual problem) : your create a C program, that you compile with gcc,
> > but you link it with a C++ library. With dynamic linking, it all works
> > fine because your C++ library has a NEEDED on libstdc++.so, but it
> > fails badly with static linking.  
> 
>  But it actually _is_ linking with stdc++, thanks to libtool. Only it's using
> the dynamic one instead of the static one.

Then I don't know :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
