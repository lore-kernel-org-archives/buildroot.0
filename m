From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 30 Nov 2019 21:20:05 +0200
Subject: [Buildroot] Compiling Python packages with C extensions with
 per-package directories
Message-ID: <CALFsTFVv0esYx0XKRLpRidTSu9sV1AmxT0n-A_GTNGEEuHWTxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As now some work on per-package directories has been merged for the
next release, I tried to play with it a little and encountered the
following problem:
When compiling a Python package with C sources, the compilation fails.
An example from python-cryptography (same for python-cffi, and others):
/home/asaf/repos/buildroot/output/per-package/python3/host/bin/i586-linux-gcc
-shared -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -pthread
build/temp.linux-x86_64-3.8/build/temp.linux-x86_64-3.8/_openssl.o
-L/home/asaf/repos/buildroot/output/per-package/python-cryptography/host/i586-buildroot-linux-gnu/sysroot/usr/lib
-lssl -lcrypto -o
build/lib.linux-x86_64-3.8/cryptography/hazmat/bindings/_openssl.abi3.so
/opt/host/bin/../lib/gcc/i586-buildroot-linux-gnu/8.3.0/../../../../i586-buildroot-linux-gnu/bin/ld:
cannot find /lib/libc.so.6
/opt/host/bin/../lib/gcc/i586-buildroot-linux-gnu/8.3.0/../../../../i586-buildroot-linux-gnu/bin/ld:
cannot find /usr/lib/libc_nonshared.a

As one can notice - we used gcc from the python3 directory and not the
one from python-cryptography. When trying to understand the problem, I
did 2 things:
* Replacing the compiler to the one from python-cryptography.
* Replacing the "-L" part to the correspondent one from python3 directory.
Each of the above (individually) fixes the problem, but I don't think
the second option is good because it uses a compiler from another
sysroot.
I think the problem occurs since the _sysconfigdata file is installed
when compiling Python and contains paths from the python3 directory,
although it's used by many other Python packages (I also verified that
by manually replacing relevant paths from the copy at
python-cryptography).

So, what do we want to do with this?
I don't think we want to tweak the _sysconfigdata file for every
python package (although it would lead to a more "correct" situation,
in which every sysroot contains _sysconfidata with proper paths).
In addition, I wonder why do we need to copy all the toolchain-related
files for every single package? (Maybe a symlink can help?)
Any other suggestions?

Thanks,
Asaf.
