From: Vania Joloboff <vania.joloboff@tsinghua.edu.cn>
Date: Thu, 05 Feb 2009 10:17:23 +0800
Subject: [Buildroot] Bug with gmp and mpfr
Message-ID: <498A4C33.8000302@tsinghua.edu.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We have some experience in cross compiling but we are new users of 
buildroot.
Please pardon our ignorance.

We have built the GCC toolchain with the latest version of buildroot 
2009-02-rc3
for three targets arm, ppc and mips, all three on two different hosts 
Ubuntu 7.10 and 8.10
We have installed the three toolchains in respectively 
/usr/local/cross/{arm|ppc|mips}

The gcc cross-compilers works (almost) fine except that the gmp and mpfr
library are dynamically loaded by gcc (by cc1 more exactly) from the 
wrong place...
They are loaded from the system directory (/usr/lib) instead of the 
directory
that should correspond to the gcc build.

Because Ubuntu version 8 is using libgmp and libmpfr in a more
recent version it creates a mismatch that you can notice if you compile 
with gcc -v,
but it seems to work fine however. We did not have time to thoroughly 
test generated code

Ubuntu version 7 is older and does not use libmpfr.
If you don't have libmpfr installed in the dynamic loading system 
directories
you get an error like :

/usr/local/cross/ppc/usr/bin/../libexec/gcc/powerpc-linux-uclibc/4.3.2/cc1plus: 
error while loading shared libraries: libmpfr.so.1: cannot open shared 
object file: No such file or directory

It seems there is a bug in buildroot: the generated gcc does not take 
the libgmp
and libmpfr from the right place.
libgmp and libmpfr are not target dependent, they are host dependent.
However the cross compiler gcc should not take these libraries
from the same place as the host gcc.
It should be from the staging directory.
Moreover in our case we built the three targets (arm, ppc, mips)
with the same release of buildroot.
But it could be possible we would have the three targets built with 
different
releases of buildroot, hence different releases of mpfr. These libraries
should be loaded from the staging directory.

Perhaps it is because we missed an option somewhere in the configuration...

Anyone has an opinion on this ?

VJ
