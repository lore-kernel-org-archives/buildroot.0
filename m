From: Steffen Schulz <pepe_ml@gmx.net>
Date: Fri, 8 May 2009 14:07:23 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <87skjfanin.fsf@macbook.be.48ers.dk>
References: <20090506124243.GB2496@cbg.dyndns.org>
	<87y6tadzww.fsf@macbook.be.48ers.dk>
	<20090507082927.GB16268@cbg.dyndns.org>
	<20090508101307.GA18388@cbg.dyndns.org>
	<87skjfanin.fsf@macbook.be.48ers.dk>
Message-ID: <20090508120723.GA28830@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 090508 at 12:45, Peter Korsgaard wrote:
>  Steffen> When I manually add xutil_makedepend to the mesa dependencies and then
>  Steffen> copy the makedepend binary to staging/usr/bin/, the next build attempt
>  Steffen> yields:
> 
>  Steffen> /bin/sh: /home/pepe/repo/buildroot/buildroot/build_i686/staging_dir/usr/bin/makedepend:
>  Steffen> No such file or directory
> 
> So mesa needs makedepend on the host. Running the one for the target
> won't help. Do you have makedepend installed on your host?


I installed makedepend on the host after this step, which then led to
the gen_matypes problem.


>  Steffen> [...]  -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING
>  Steffen> -DHAVE_ALIAS -DHAVE_POSIX_MEMALIGN -DUSE_X86_ASM -DUSE_MMX_ASM
>  Steffen> -DUSE_3DNOW_ASM -DUSE_SSE_ASM -fno-strict-aliasing gen_matypes.c -o gen_matypes
>  Steffen> ./gen_matypes > matypes.h
>  Steffen> /bin/sh: ./gen_matypes: No such file or directory
> 
> You didn't paste enough for us to see if gen_matypes gets compiled for
> the host or the target, but from the error message it looks like it's
> for the target (which is wrong).
> 
> I'm pretty sure I compiled mesa3d for arm not that long ago, so it
> seems to be an x86 specific issue.
> 
> I'll take a look at it this weekend.

/home/pepe/repo/buildroot/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-I../../../include/GL -I../../../include -I.. -I../main -I../math
-I../glapi -I../tnl -Wall -Wmissing-prototypes -std=c99 -ffast-math -Os -pipe -Os
-I/home/pepe/repo/buildroot/buildroot/build_i686/staging_dir/usr/include
-I/home/pepe/repo/buildroot/buildroot/build_i686/staging_dir/include
--sysroot=/home/pepe/repo/buildroot/buildroot/build_i686/staging_dir/
-isysroot /home/pepe/repo/buildroot/buildroot/build_i686/staging_dir
-mtune=i686 -march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -fPIC -m32 -D_POSIX_SOURCE
-D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE -D_GNU_SOURCE
-DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER
-DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS
-DHAVE_POSIX_MEMALIGN -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM
-DUSE_SSE_ASM -fno-strict-aliasing gen_matypes.c -o gen_matypes
./gen_matypes > matypes.h
/bin/sh: ./gen_matypes: No such file or directory


I guess from --sysroot and i686-linux-uclibc-gcc we can infer that it
is done for the target? I'll be happy to try to fix it myself if you
can give me an example how it is supposed to be done.

/steffen
-- 
pepe at unixfan.net                            gpg --recv-key A04D7875
Key fingerprint: B805 57BE E4AF 0104 CC51  77A1 CE6F 8D46 A04D 7875
