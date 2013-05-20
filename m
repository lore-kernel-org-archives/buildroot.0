From: Charles Musser <cmusser@sonic.net>
Date: Mon, 20 May 2013 09:20:25 -0700
Subject: [Buildroot] fenv.h not found
Message-ID: <F0D0E0DF-8063-4C7F-883B-46E28EF703D0@sonic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had to jump through some hoops to cross-compile the "libsodium" cryptography library using Buildroot (version 2013.02) and I want to know if there's a better way. The build system is x86_64-linux-gnu and the target is mipsel-linux. The compilation failed partway through when one of the source files included <fenv.h> and it couldn't be found.

libsodium's compilation is managed with GNU autoconf, and I configured it as follows. Note that the "${BR}" in the examples below is a stand in for the Buildroot root directory, in order to make the paths clearer.:

./configure --host mipsel-linux --prefix ${BR}/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/ CFLAGS="-std=c99"

I found the fenv.h files here:

${BR}/output/toolchain/uClibc-0.9.33.2/include/fenv.h
${BR}/output/toolchain/uClibc-0.9.33.2/include/bits/fenv.h

But the compiler (or preprocessor) expected them in these locations:

${BR}/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/include/fenv.h
${BR}/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/include/bits/fenv.h

Copying the two files from the "toolchain" area to the "sysroot" area allowed the compilation to succeed, but this doesn't seem like the
right way to get things to work. I'm not sure I understand the distinction between the two areas. The include directories have similar, but not identical, sets of files. Is there a technique that obviates the need to manually copy files around in the Buildroot installation?

Thanks,

Chuck
