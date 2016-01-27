From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 27 Jan 2016 15:21:04 +1100
Subject: [Buildroot] glibc and --enable-kernel
Message-ID: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot people,

I've noticed that when building glibc, buildroot's configure command doesn't
pass any "--enable-kernel" option, which according to the documentation...

http://www.gnu.org/software/libc/manual/html_node/Configuring-and-compiling.html

... means that glibc is always built to support the oldest possible kernel.

At first this seems like a good idea but the documentation is misleading, and
it actually causes two problems:

1) Unnecessary compat code: If you've built a kernel and glibc together
(presumably this is common when using buildroot) then you have no need of any
compat code because the only kernel you'll be using is the one you just built.
According to the doc (above) this causes glibc to include unnecessary compat
code which slows it down.

2) Availability of new features: It appears from the code that the
documentation leaves out some important information. What actually happens
while building glibc is that the "minimum kernel version" (which is either the
version given by "--enable-kernel=" or the oldest possible version for that
architecture) sets both __LINUX_KERNEL_VERSION and __ABI_TAG_VERSION so that
glibc will never use any kernel features *newer* than this version. Therefore
you cannot get access to recent kernel features *at all* via glibc (without
manually altering glibc.mk).

(An example of a recent feature would be the sendmmsg syscall, which
requires a kernel version of 3.0.0 but the minimum version for PowerPC 64 is
2.6.24.)

I'd like to prepare a patch to make this configurable, and it obviously
wouldn't be difficult to add but I'm not sure of the best way to do it.

The most obvious way seems to be to add a menu item to the Toolchain menu, just
after "glibc version" (and only enabled when glibc is the C library), called
"glibc kernel API version" with a default value of "same as kernel headers".
The other options would be "as old as possible" or a specific version.

Comments?

Is the default value reasonable even though it changes behaviour for current
configs? (Presumably it will just make them faster :-) )

Am I missing something? Would this be useful to others?

Cheers,
Sam.
