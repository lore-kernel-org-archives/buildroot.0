From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 23 Dec 2014 10:32:11 -0800
Subject: [Buildroot] Using external toolchain
In-Reply-To: <20141220161011.48833511@free-electrons.com>
References: <CALo-6+iOGt+y1JjC8AaJ3vpck_tb1h7ZTSAd3LBcypfwGCZRfg@mail.gmail.com>
 <20141220161011.48833511@free-electrons.com>
Message-ID: <CALo-6+gkiNsQ-3151+wsfqGsr9tjOhyQGGveKU7ZwsYkX9RMqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas:

As always, I appreciate working with you. Please bear with me a little as I
think I may be on to something. It looks like the compile proceeds until
loginutils is compiled. the error is finding RLIMIT_FSIZE which is declared
in ../sys/resource.h

The compile line failing has a compile invocation, a --sysroot and a -I
which dont quite match. The --sysroot makes sense as it is the copied set
of files from the external toolchain, but the -I (for include) points to a
directory with gdb stuff and not sysroot.

Here is the failing area without cluttering up the mailing list too much.


/opt/powerpc-econolite_e300c2-linux-gnu/bin/powerpc-econolite_e300c2-linux-gnu-gcc
--sysroot=/home/ckrinke/asc4_bsp/buildroot-glibc/output/host/usr/powerpc-unknown-linux-gnu/sysroot
-Wp,-MD,loginutils/.passwd.o.d   -std=gnu99 -Iinclude -Ilibbb  -include
include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.18.5)"
-DBB_BT=AUTOCONF_TIMESTAMP  -Os  -mtune=e300c2 -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/ckrinke/asc4_bsp/buildroot-glibc/output/toolchain/linux/include
-Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
-Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes
-Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition
-fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer
-ffunction-sections -fdata-sections -fno-guess-branch-probability
-funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1
-falign-labels=1 -falign-loops=1 -Os     -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(passwd)"
-D"KBUILD_MODNAME=KBUILD_STR(passwd)" -c -o loginutils/passwd.o
loginutils/passwd.c
loginutils/passwd.c: In function 'passwd_main':
loginutils/passwd.c:93:16: error: storage size of 'rlimit_fsize' isn't known
  struct rlimit rlimit_fsize;
                ^
loginutils/passwd.c:180:2: warning: implicit declaration of function
'setrlimit' [-Wimplicit-function-declaration]
  setrlimit(RLIMIT_FSIZE, &rlimit_fsize);
  ^
loginutils/passwd.c:180:12: error: 'RLIMIT_FSIZE' undeclared (first use in
this function)

My theory is "
/opt/powerpc-econolite_e300c2-linux-gnu/bin/powerpc-econolite_e300c2-linux-gnu-gcc"
is just fine. Also
"--sysroot=/home/ckrinke/asc4_bsp/buildroot-glibc/output/host/usr/powerpc-unknown-linux-gnu/sysroot"
has an include that leads to resource.h.

But,
"-I/home/ckrinke/asc4_bsp/buildroot-glibc/output/toolchain/linux/include"
doesnt lead to the right place. In fact the ...output/toolchain just leads
to a gdb-6.8 directory and I think this may be the area things are going
awry.

I'm kinda stuck with 2011.02 and wonder if you could comment on this
include issue before I delve into the 2014 release.



On Sat, Dec 20, 2014 at 7:10 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Charles Krinke,
>
> On Fri, 19 Dec 2014 11:33:10 -0800, Charles Krinke wrote:
> > I'm working with buildroot 2011.02 on a project which is in production
> and
> > the company wishes to change to a newer toolchain, crosstools-ng version
> > 1.20.0 (gcc-4.9.1).
> >
> > I set in the toolchain with the location and prefix, but the build fails
> > with an incorrect sysroot.
> >
> > For instance, the toolchain is at:
> >
> >
> /opt/toolchains/powerpc-econolite_e300c2-linux-gnu/bin/powerpc-econolite_e300c2-linux-gnu-gcc
> >
> > But the sysroot comes out:
> >
> > --sysroot=
> >
> */home/ckrinke/asc4_bsp/buildroot-glibc/output/host/usr/powerpc-unknown-linux-gnu/sysroot*
> >
> > Note the "econolite" vs the "unknown" in the tuple. This is complicated
> by
> > the fact that output/host/usr/power* is non-existent
> >
> > I *think* that one can specify sysroot when compiling and would
> appreciate
> > a suggestion or two to get me out of this despicable place.
>
> What you are seeing looks absolutely normal. Buildroot creates its own
> sysroot, output/host/usr/powerpc-unknown-linux-gnu/sysroot, and copies
> the necessary stuff from the originally sysroot location to this
> Buildroot sysroot. This is done so that all other libraries built by
> Buildroot get installed into this Buildroot specific sysroot, instead
> of being copied back to the original sysroot, which would pollute your
> toolchain.
>
> So, if the build fails, please post:
>
>  - Your complete .config file.
>  - The last 100-200 lines of the build output.
>
> Also, please try to reproduce with Buildroot 2014.11. Buildroot 2011.02
> is very very old, and we've fixed/improved the external toolchain stuff
> significantly since 3 and half years.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141223/55191dff/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: test.config
Type: application/octet-stream
Size: 19021 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141223/55191dff/attachment-0001.obj>
