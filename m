From: Steffen Schulz <pepe_ml@gmx.net>
Date: Fri, 8 May 2009 12:13:07 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <20090507082927.GB16268@cbg.dyndns.org>
References: <20090506124243.GB2496@cbg.dyndns.org>
	<87y6tadzww.fsf@macbook.be.48ers.dk>
	<20090507082927.GB16268@cbg.dyndns.org>
Message-ID: <20090508101307.GA18388@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Okay, I did another attempt to compile xorg and selected a few more X
packages. Now it tries to build Mesa before getting to the missing
makedepend I had before. Interestingly, the problem seems to be the
similar.

When I manually add xutil_makedepend to the mesa dependencies and then
copy the makedepend binary to staging/usr/bin/, the next build attempt
yields:

/bin/sh: /home/pepe/repo/buildroot/buildroot/build_i686/staging_dir/usr/bin/makedepend:
No such file or directory


./i686-linux-ldd makedepend
checking sub-depends for '/lib/libgcc_s.so.1'
checking sub-depends for 'not found'
checking sub-depends for '/lib/libc.so.6'
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x00000000)
        libc.so.0 => not found (0x00000000)
        libc.so.6 => /lib/libc.so.6 (0x00000000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x00000000)


find staging_dir -name libgcc\*
staging_dir/usr/lib/gcc/i686-linux-uclibc/4.3.3/libgcc_eh.a
staging_dir/usr/lib/gcc/i686-linux-uclibc/4.3.3/libgcc.a
staging_dir/usr/i686-linux-uclibc/lib/libgcc_s.so.1
staging_dir/usr/i686-linux-uclibc/lib/libgcc_s.so


When I copy libgcc* to staging/lib/, ldd still reports the same
problem.


So I removed makedepend and install it on the host instead. Now mesa
fails with 

[...]  -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING
-DHAVE_ALIAS -DHAVE_POSIX_MEMALIGN -DUSE_X86_ASM -DUSE_MMX_ASM
-DUSE_3DNOW_ASM -DUSE_SSE_ASM -fno-strict-aliasing gen_matypes.c -o gen_matypes
./gen_matypes > matypes.h
/bin/sh: ./gen_matypes: No such file or directory

Note that ./gen_matypes is local. It fails again because of missing
libgcc. Even though staging/lib/libgcc_s.so.1 still exists from before.


What am I missing here?

thanks,
/steffen
