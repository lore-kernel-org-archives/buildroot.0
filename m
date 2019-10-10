From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 10 Oct 2019 09:32:19 -0500
Subject: [Buildroot] Buildroot for Texas Instruments AM65X - add 2nd
 toolchain?
In-Reply-To: <1570715805181.62328@amazon.com>
References: <1570715805181.62328@amazon.com>
Message-ID: <CAMQcK5+xHvWkx=_DBTReZC49wU=KW1XQesdRiHpEE2E6_iC1EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scott,

On Thu, Oct 10, 2019 at 8:57 AM Whitney, Scott <scwhitn@amazon.com> wrote:
>
> We are trying to set up Buildroot to create our cross-compilation toolchain, Linux
> image, and root filesystem for the Texas Instruments AM65X family.
>
> We'd also like to create U-Boot, but for the AM65X, U-Boot has at least one piece
> (tiboot3.bin) that runs on a 32-bit ARM R5 core, requiring a 32-bit ARM
> cross-compiler.  That piece configures some hardware like the DRAM controller
> and then loads some 64-bit code U-Boot code into DRAM, after which an A53
> 64-bit core starts running it.
>
> The rest of our project and the remainder of U-Boot can be built using the AArch64
> ARM compiler, which we have selected as our Buildroot toolchain, along with glibc.
>
> Has anyone used Buildroot with the AM65X?  Is it feasible to build/configure a 2nd
> toolchain (32-bit ARM) within Buildroot, possibly as an additional host package?

I'm not sure if anyone has used the AM65X here but the ideal solution
when using two compiles is to maintain two defconfigs. One for the
32-bit Cortex-R5 TI bootloader followed by one that builds everything
for AArch64.

There is an issue with compiling using an ARM Cortex-R5 toolchain
however. Buildroot is setup to build an Embedded Linux System, it only
supports ARM cores which can run the Linux kernel which the Cortex-R5
is not. This means a bare-metal toolchain (no C library) must be used
which buildroot doesn't support. Thus if you want to build the TI
bootloader package in buildroot using the ARM R5 bare-metal toolchain,
you will not be able to take advantage of any of the toolchain
infrastructure.

With the current state of buildroot, this leads to needing to add your
own host package for the bare metal toolchain in br2-external which
would install the toolchain into the host directory. Then you will
need to add package for the TI bootloader which depend on this host
toolchain package. The TI bootloader package would take advantage of
the generic package infrastructure and need to setup and configure the
TI bootloader source to point to the bare-metal compiler which was
placed in the host folder.

> We are also trying to create everything using a br2-external tree so that all of
> Buildroot does not need to be checked in.  We would only have to check out our
> br2-external tree, copy a specific version of Buildroot into it the same top-level
> directory as the location of our br2-external tree, and then use
> "make BR2_EXTERNAL=<path to our br2-external tree> our_defconfig",
> followed by the usual "make" to build everything.
>
> Examples of how to go about this (e.g. Config.in.host, *.mk files, etc.) if it's
> feasible would be greatly appreciated.

In the future, can you please send emails to the mailing list in plain
text format (internet style replies) format? This allows for easier
readability by all on the mailing list.

https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches

Thanks,
-Ryan
