From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jan 2010 16:24:22 +0100
Subject: [Buildroot] Issue for the integration of Codesourcery external
	toolchains
Message-ID: <20100104162422.5b7e7bf6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Now that the new package infrastructure has been integrated, I started
working again on the usage of Codesourcery toolchains as external
toolchains in Buildroot. Compared to the Crosstool-NG toolchains that
we already support, the main difference is that the Codesoucery
toolchains are multilib.

Unfortunately, I'm facing an issue for which I haven't found an issue
and I'm therefore asking for your input and ideas on the matter.

External toolchains in Buildroot
================================

The external toolchain integration code is in
toolchain/external-toolchain/ext-tool.mk. As the comment at the top of
the file says, we basically do three things:

 1. Do various checks of the toolchain and the compatibility between
    the options configured in Buildroot and the configuration of the
    toolchain.

    One of the important check we do is to verify that the toolchain
    supports the sysroot mechanism. This mechanism allows to copy all
    the libraries and headers of the toolchain in another location,
    and using the --sysroot option, tell the compiler/linker where
    these files are located now. The location of the original sysroot
    directory is found by running CROSS-gcc -v and looking at the
    --with-sysroot configuration option of gcc.

 2. From the toolchain, we copy the C library and other related
    libraries needed at runtime into $(TARGET_DIR). This will ensure
    that these libraries will be available on the target.

    We assume that these libraries are available in the lib/ directory
    of the original sysroot directory. The list of library to copy is
    taken from a fixed list (EXTERNAL_LIBS in the code)

 3. Finally, we copy the _complete_ sysroot directory into
    $(STAGING_DIR). This allows to keep *all* libraries and headers (C
    library but also other userspace libraries compiled later) into
    the same directory. This solution makes it very easy to support
    external toolchains, since we then only have to pass the --sysroot
    $(STAGING_DIR) option to the compiler.

    For reference, when we introduced external toolchain support, we
    tried the solution to keep the C library/headers in their original
    location, and with a combination of -I/-L option, point the
    compiler/linker to the $(STAGING_DIR). But this solution raised a
    lot of problems that we easily solved by using --sysroot.

Codesoucery toolchains
======================

The Codesourcery toolchain (at least the arm2009q1 I've been testing)
are multilib toolchains. This means that within a single toolchain,
several variants of the C library are available:

$ arm-none-linux-gnueabi-gcc -print-multi-lib
.;
armv4t;@march=armv4t
thumb2;@mthumb at march=armv7

We have one default variant, one variant for armv4t which is selected
when -march=armv4t is passed on the gcc command line, and one variant
for thumb2, which is selected when -mthumb -march=armv7 is passed on
the gcc command line.

Each variant is associated with a different sysroot:

$ arm-none-linux-gnueabi-gcc -print-sysroot
/usr/local/xtools/arm-2009q1/bin/../arm-none-linux-gnueabi/libc

$ arm-none-linux-gnueabi-gcc -print-sysroot -march=armv4t
/usr/local/xtools/arm-2009q1/bin/../arm-none-linux-gnueabi/libc/armv4t

$ arm-none-linux-gnueabi-gcc -print-sysroot -march=armv7 -mthumb
/usr/local/xtools/arm-2009q1/bin/../arm-none-linux-gnueabi/libc/thumb2

(Note: /usr/local/xtools/arm-2009q1/ is where I installed the
toolchain)

Issue with the Codesourcery toolchain
=====================================

The first obvious option that I tried was to copy the sysroot that
correspond to the selected architecture. For example, copy only the
contents of
/usr/local/xtools/arm-2009q1/bin/../arm-none-linux-gnueabi/libc/armv4t
to $(STAGING_DIR). Unfortunately, this doesn't work, since the header
files are shared between the three sysroots (the armv4t and thumb2
directories do not contain any header files).

So there is no other choice that copying the full
/usr/local/xtools/arm-2009q1/bin/../arm-none-linux-gnueabi/libc
directory. This is the solution I implemented.

Unfortunately, when you do this, you have the following hierarchy in
$(STAGING_DIR):

 * armv4t
   * lib
   * usr
     * lib
 * lib
 * thumb2
   * lib
   * usr
     * lib
 * usr
   * include
   * lib

When the armv5t architecture is selected, everything works as
expected: the includes are in $(STAGING_DIR)/usr/include, the
libraries in $(STAGING_DIR)/lib and $(STAGING_DIR)/usr/lib.

When armv4t is selected, the include files are in
$(STAGING_DIR)/usr/include, but the libraries are in
$(STAGING_DIR)/armv4t/lib and $(STAGING_DIR)/armv4t/usr/lib. And the
linker *only* looks in these directories for the libraries.

Unfortunately, all Buildroot packages install their libraries in
$(STAGING_DIR)/lib and $(STAGING_DIR)/usr/lib, so the linker doesn't
find them.

For example, compiling zlib works, but compiling libpng fails because
it cannot find zlib. This is because zlib has been installed in
$(STAGING_DIR)/usr/lib and not in $(STAGING_DIR)/armv4t/usr/lib.

Possible solutions
==================

 * Build a more normal sysroot in $(STAGING_DIR) by combining the
   contents of armv4t and the header files. But this would require
   telling gcc that the libraries aren't in armv4t anymore. This is
   probably possible using a custom spec file, but is quite
   complicated.

 * Reconsider the solution of copying the sysroot, and try harder with
   the more traditionnal -L/-I solutions.

 * Another solution ?

Thanks for reading such a long mail, and thanks in advance for your
ideas!

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
