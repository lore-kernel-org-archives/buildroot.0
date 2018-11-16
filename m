From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 15:43:35 +0100
Subject: [Buildroot] [PATCH next v4 0/6] Per-package host/target
 directory support
In-Reply-To: <a062a8a1-7a56-d8ec-6d9d-06f444a72d6b@andin.de>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <a062a8a1-7a56-d8ec-6d9d-06f444a72d6b@andin.de>
Message-ID: <20181116154335.42ddaa49@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

Thanks for your feedback!

On Thu, 15 Nov 2018 17:41:27 +0100, Andreas Naumann wrote:

> thank you for the updated version. I tried to run it with my configs. 

Thanks a lot for testing!

> For that I needed
> a) a generic patch for all kconfig packages, see my answer on the final 
> patch

For this one, we need to continue the discussion with Yann and Thomas
De Schampheleire to understand what is the right approach.

> b) linux-specific patch posted two days ago: [PATCH v2 1/1] linux: Make 
> dtc install step more reliable

This one is a package-specific fix, which can be merged separately from
the core of the PPSH series. I want to keep the PPSH series focused on
introducing PPSH support, and not make it grow infinitely with fixup
patches for lots of packages.

However, perhaps what we could do is to collect those patches in
branch, this way we could have two branches:

 - One with the PPSH core stuff

 - One with all the PPSH-related fixes, which are being
   submitted/applied progressively to Buildroot, even before PPSH
   itself is merged.

What do you think ?

> On my local machine things seemed to work, however final rootfs creation 
> failed in our CI environment due to broken host- binaries, e.g. 
> mkfs.ubifs not finding some required lib (liblzo2.so.2 in that 
> particular case).
> It seems some things with rpath manipulation/checking do not yet work 
> properly. Looking into the binary with ldd I see libs used from the 
> host-machine that probably should come from buildroots host/usr/lib...
> 	linux-vdso.so.1 =>  (0x00007ffc06fcc000)
> 	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f760428f000)
> 	liblzo2.so.2 => not found
> 	libuuid.so.1 => /lib/x86_64-linux-gnu/libuuid.so.1 (0x00007f760408a000)
> 	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f7603d81000)
> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f76039b7000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f76044a9000)

This is weird, because it works fine here:

thomas at windsurf:~/projets/outputs/t$ ldd host/sbin/mkfs.ubifs 
	linux-vdso.so.1 (0x00007ffe8cd3b000)
	libz.so.1 => /home/thomas/projets/outputs/t/per-package/host-mtd/host/lib/libz.so.1 (0x00007f1a683ff000)
	liblzo2.so.2 => /home/thomas/projets/outputs/t/per-package/host-mtd/host/lib/liblzo2.so.2 (0x00007f1a683db000)
	libuuid.so.1 => /home/thomas/projets/outputs/t/per-package/host-mtd/host/lib/libuuid.so.1 (0x00007f1a683d2000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f1a6821e000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f1a68058000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f1a6841b000)

Could you dump the RPATH of the mkfs.ubifs library, like this:

thomas at windsurf:~/projets/outputs/t$ readelf -d host/sbin/mkfs.ubifs 

Dynamic section at offset 0x11dd0 contains 29 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [liblzo2.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libuuid.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000000f (RPATH)              Library rpath: [/home/thomas/projets/outputs/t/per-package/host-mtd/host/lib:/home/thomas/projets/outputs/t/per-package/host-util-linux/host/lib]
 0x000000000000000c (INIT)               0x402000
 0x000000000000000d (FINI)               0x40bb08
 0x0000000000000019 (INIT_ARRAY)         0x412dc0
 0x000000000000001b (INIT_ARRAYSZ)       8 (bytes)
 0x000000000000001a (FINI_ARRAY)         0x412dc8
 0x000000000000001c (FINI_ARRAYSZ)       8 (bytes)
 0x000000006ffffef5 (GNU_HASH)           0x400308
 0x0000000000000005 (STRTAB)             0x4009b8
 0x0000000000000006 (SYMTAB)             0x400340
 0x000000000000000a (STRSZ)              781 (bytes)
 0x000000000000000b (SYMENT)             24 (bytes)
 0x0000000000000015 (DEBUG)              0x0
 0x0000000000000003 (PLTGOT)             0x413000
 0x0000000000000002 (PLTRELSZ)           1464 (bytes)
 0x0000000000000014 (PLTREL)             RELA
 0x0000000000000017 (JMPREL)             0x400e58
 0x0000000000000007 (RELA)               0x400db0
 0x0000000000000008 (RELASZ)             168 (bytes)
 0x0000000000000009 (RELAENT)            24 (bytes)
 0x000000006ffffffe (VERNEED)            0x400d50
 0x000000006fffffff (VERNEEDNUM)         2
 0x000000006ffffff0 (VERSYM)             0x400cc6
 0x0000000000000000 (NULL)               0x0

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
