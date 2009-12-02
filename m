From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 2 Dec 2009 06:44:40 -0600
Subject: [Buildroot] Shared objects, load order?
In-Reply-To: <op.u4auhacnyqa4qb@jap>
References: <op.u4auhacnyqa4qb@jap>
Message-ID: <200912020644.43103.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed December 2 2009, Joachim Pihl wrote:
> 
> I only have one hurdle left before the upgrade from 0.10.0 to 2009.11 is  
> in place. It may be related to .so's referring other .so's.
> 
> In the beginning, I thought that _none_ of our C++ applications would run  
> on the updated platform, they would all die with a segmentation fault  
> before reaching main(). Then I discovered something interesting, namely  
> that _one_ application actually runs. All the apps are production code,  
> they run on the same hardware with the old buildroot system, so the fact  
> that they do not all behave the same is intriguing. I think it may be  
> caused by some .so referring something in another .so that has not been  
> loaded yet. ldd shows that the working app and one of the crashing ones  
> reference (in essence) the same .so's, but lists them in different order.
> 
> Works:
> 
> # ldd /multicon/gyda
> 	libxml2.so.2 => /usr/lib/libxml2.so.2 (0x4000e000)
> 	libgd.so.2 => /usr/lib/libgd.so.2 (0x4012b000)
> 	libpng12.so.0 => /usr/lib/libpng12.so.0 (0x4016b000)
> 	libpthread.so.0 => /lib/libpthread.so.0 (0x40191000)
> 	libz.so.1 => /usr/lib/libz.so.1 (0x401ab000)
> 	libboost_thread-mt.so => /usr/lib/libboost_thread-mt.so (0x401c4000)
> 	libspread.so.2 => /usr/lib/libspread.so.2 (0x401d8000)
> 	libcrypt.so.0 => /lib/libcrypt.so.0 (0x4023f000)
> 	libsqlite3.so.0 => /usr/lib/libsqlite3.so.0 (0x4025c000)
> 	libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x402c5000)
> 	libm.so.0 => /lib/libm.so.0 (0x40376000)
> 	libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x40390000)
> 	libc.so.0 => /lib/libc.so.0 (0x403a3000)
> 	libdl.so.0 => /lib/libdl.so.0 (0x40401000)
> 	librt.so.0 => /lib/librt.so.0 (0x4040c000)
> 	libnsl.so.0 => /lib/libnsl.so.0 (0x40415000)
> 	ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x40000000)
> 
> 
> Crashes:
> 
> # ldd /multicon/phy
> 	libboost_thread-mt.so => /usr/lib/libboost_thread-mt.so (0x4000e000)
> 	libspread.so.2 => /usr/lib/libspread.so.2 (0x40022000)
> 	libcrypt.so.0 => /lib/libcrypt.so.0 (0x40089000)
> 	libsqlite3.so.0 => /usr/lib/libsqlite3.so.0 (0x400a6000)
> 	libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x4010f000)
> 	libm.so.0 => /lib/libm.so.0 (0x401c0000)
> 	libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x401da000)
> 	libc.so.0 => /lib/libc.so.0 (0x401ed000)
> 	libpthread.so.0 => /lib/libpthread.so.0 (0x4024b000)
> 	librt.so.0 => /lib/librt.so.0 (0x40265000)
> 	libnsl.so.0 => /lib/libnsl.so.0 (0x4026e000)
> 	libdl.so.0 => /lib/libdl.so.0 (0x40277000)
> 	ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x40000000)
> 
> 
> Any changes in uclibc regarding this over the last two years? I have seen  
> that linkers are sometimes fuzzy about the ordering of static libraries, I  
> have never had a problem with shared ones.
> 
> 

Did you enable sstrip?
The sstrip in the 2009.8 (and probably in 2009.11, since I never saw it fixed)
creates object (and statically linked) objects with corrupted headers.

Turn it off, rebuild, report back.

Mike
