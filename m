From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 19 Dec 2009 17:30:38 +0000 (UTC)
Subject: [Buildroot] In-tree build OK, out-of-tree build fails
References: <hghkou$vu0$1@ger.gmane.org> <87k4wj2ykx.fsf@macbook.be.48ers.dk>
Message-ID: <hgj2ju$b5c$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-12-19, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Grant> The "not found" file crt1.o is present in the output directory
> Grant> in staging/usr/lib/crt1.o, but it looks like the gcc command
> Grant> line used to link busybox is missing the required --sysroot
> Grant> option.
>
> Grant> I've repeated the build several times. Building in-tree always
> Grant> works. Building out-of-tree with an internal toolchain also
> Grant> works OK.
>
> Grant> It looks like the combination of an external toolchain and
> Grant> out-of-tree build is what fails.
>
> Seems like it. I "alway" build with O=<something>, so the busybox step
> has been tested a lot, but I don't use an external toolchain.
>
> I'll try to find some time to look into it this weekend.

I've been thinking about it, and my external toolchain is
probably broken.

Since it had been working fine for internal builds, I had taken
if off the list of suspects.  But, since out-of-tree builds
work with an _internal_ toolchain I think my external toolchain
is suspect.

Looking at the output from the failed build (compared to the
successful build) the step that fails is "Trying libraries:
crypt m" and that seems like a broken toolchain. (see below)
Presumably what did build correctly (the kenernel and uboot)
don't use any of the uClibc libraries, so maybe this is the
first time when a link is performed that uses "standard"
toolchain libraries?

The same binaries and libraries appear to be present in the
staging directory in both cases, so I don't see anything
obviously wrong.

The other reason I think it's probably my external toolchain is
that I've been using a patched external-toolchain package that
enables installation of an external toolchain that requires the
--sysroot option.
 
I don't know why, but that patch has probably broken building
out-of-tree using an external toolchain.

The change I made to /toolchain/external-toolchain/ext-tool.mk
involves the SYSROOT_DIR variable who's value is parsed from
the output of "arm-linux-gcc -v".  ext-tool.mk assumes that
value is the base path relative to which it's supposed to
locate library files.  It's not.  That's the path where the
external toolchain was _built_. It's not the path where the
external toolchain is currently located.

So, I've allowed that value to be optionally overridden with a
value from the .config file.  Since the variable
BR2_TOOLCHAIN_EXTERNAL_PATH points to <sysroot>/usr, I've
defaulted the optional override value of SYSROOT_DIR to be
"$(BR2_TOOLCHAIN_EXTERNAL_PATH)/..".

There are two new config varibles: the first is a binary that
enables the override (default=no); the second is the value of
that override which defaults as explained above.

I've attached the external_toolchain package changes I'm using,
and would appreciate any advice on where I've gone wrong.


FWIW Here's the point in "make" output where the in-tree vs.
out-of-tree diverge.

In-tree build:

   yes "" | /usr/bin/make -j1 CC=/home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-gcc CROSS_COMPILE="/home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-" \
   		CROSS="/home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-" -C /home/grante/buildroot-git/buildroot/output/build/busybox-1.13.4 oldconfig
   make[1]: Entering directory `/home/grante/buildroot-git/buildroot/output/build/busybox-1.13.4'
     HOSTCC  scripts/basic/fixdep
     HOSTCC  scripts/basic/split-include
     [...]  
     LD      util-linux/volume_id/built-in.o
     AR      util-linux/volume_id/lib.a
     LINK    busybox_unstripped
*  Trying libraries: crypt m
*   Library crypt is not needed, excluding it
*   Library m is not needed, excluding it
   Final link with: <none>
     DOC     busybox.pod
     DOC     BusyBox.txt
     DOC     BusyBox.1
     DOC     BusyBox.html
   make[1]: Leaving directory `/home/grante/buildroot-git/buildroot/output/build/busybox-1.13.4'


Out-of-tree build:

   yes "" | /usr/bin/make -j1 CC=/home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-gcc CROSS_COMPILE="/home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-" \
   		CROSS="/home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-" -C /home/grante/buildroot-git/output/build/busybox-1.13.4 oldconfig
   make[1]: Entering directory `/home/grante/buildroot-git/output/build/busybox-1.13.4'
     HOSTCC  scripts/basic/fixdep
     HOSTCC  scripts/basic/split-include
     [...]
     LD      util-linux/volume_id/built-in.o
     AR      util-linux/volume_id/lib.a
     LINK    busybox_unstripped
*   Trying libraries: crypt m
*   Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
*   Output of:
*   /home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-gcc -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -Os -o busybox_unstripped -Wl,--sort-common -Wl,--gc-sections -Wl,--start-group applets/built-in.o archival/lib.a archival/libunarchive/lib.a console-tools/lib.a coreutils/lib.a coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a loginutils/lib.a mailutils/lib.a miscutils/lib.a modutils/lib.a networking/lib.a networking/libiproute/lib.a networking/udhcp/lib.a printutils/lib.a procps/lib.a runit/lib.a selinux/lib.a shell/lib.a sys
 klogd/lib.a util-linux/lib.a util-linux/volume_id/lib.a archival/built-in.o archival/libunarchive/built-in.o console-tools/built-in.o coreutils/built-in.o coreutils/libcoreutils/built-in.o debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o findutils/built-in.o init/built-in.o libbb/built-in.o libpwdgrp/built-in.o loginutils/built-in.o mailutils/built-in.o miscutils/built-in.o modutils/built-in.o networking/built-in.o networking/libiproute/built-in.o networking/udhcp/built-in.o printutils/built-in.o procps/built-in.o runit/built-in.o selinux/built-in.o shell/built-in.o sysklogd/built-in.o util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group -Wl,--start-group -lcrypt -lm -Wl,--end-group
   ==========
   /home/grante/buildroot-git/pre-built-tools/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.3.4/../../../../arm-linux-uclibcgnueabi/bin/ld: crt1.o: No such file: No such file or directory
   collect2: ld returned 1 exit status
   make[1]: *** [busybox_unstripped] Error 1
   make[1]: Leaving directory `/home/grante/buildroot-git/output/build/busybox-1.13.4'
   make: *** [/home/grante/buildroot-git/output/build/busybox-1.13.4/busybox] Error 2


And here are the changes to the external_toolchain package that
I'm using:
