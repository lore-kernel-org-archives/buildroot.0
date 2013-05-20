From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 May 2013 20:13:00 +0200
Subject: [Buildroot] fenv.h not found
In-Reply-To: <F0D0E0DF-8063-4C7F-883B-46E28EF703D0@sonic.net>
References: <F0D0E0DF-8063-4C7F-883B-46E28EF703D0@sonic.net>
Message-ID: <20130520201300.3e7b9ddc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Musser,

On Mon, 20 May 2013 09:20:25 -0700, Charles Musser wrote:
> I had to jump through some hoops to cross-compile the "libsodium"
> cryptography library using Buildroot (version 2013.02) and I want to
> know if there's a better way. The build system is x86_64-linux-gnu
> and the target is mipsel-linux. The compilation failed partway
> through when one of the source files included <fenv.h> and it
> couldn't be found.
> 
> libsodium's compilation is managed with GNU autoconf, and I
> configured it as follows. Note that the "${BR}" in the examples below
> is a stand in for the Buildroot root directory, in order to make the
> paths clearer.:
> 
> ./configure --host mipsel-linux --prefix
> ${BR}/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/
> CFLAGS="-std=c99"

You should rather create a Buildroot package for it. It will make the
cross-compilation process easier.

> I found the fenv.h files here:
> 
> ${BR}/output/toolchain/uClibc-0.9.33.2/include/fenv.h
> ${BR}/output/toolchain/uClibc-0.9.33.2/include/bits/fenv.h
> 
> But the compiler (or preprocessor) expected them in these locations:
> 
> ${BR}/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/include/fenv.h
> ${BR}/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/include/bits/fenv.h
> 
> Copying the two files from the "toolchain" area to the "sysroot" area
> allowed the compilation to succeed, but this doesn't seem like the
> right way to get things to work. I'm not sure I understand the
> distinction between the two areas. The include directories have
> similar, but not identical, sets of files. Is there a technique that
> obviates the need to manually copy files around in the Buildroot
> installation?

As you guessed, doing this copy is really wrong.
${BR}/output/toolchain/uClibc-0.9.33.2/ contains the source code of
uClibc. If it hasn't installed fenv.h into the sysroot folder, it's for
a good reason: you haven't enabled fenv support in uClibc. So, while
copying the header manually makes the build "work", it will miserably
fail at runtime.

Instead, you should enable fenv support. To do so:

	make clean
	make uclibc-menuconfig
	  # enable fenv support in uClibc configuration
	make

The fenv support is not enabled in our default uClibc configurations,
that why you have to enable it manually:

toolchain/uClibc/uClibc-0.9.31.config:# UCLIBC_HAS_FENV is not set
toolchain/uClibc/uClibc-0.9.32.config:# UCLIBC_HAS_FENV is not set
toolchain/uClibc/uClibc-0.9.33.config:# UCLIBC_HAS_FENV is not set
toolchain/uClibc/uClibc-snapshot.config:# UCLIBC_HAS_FENV is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
