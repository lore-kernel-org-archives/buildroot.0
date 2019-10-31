From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 31 Oct 2019 10:05:22 -0500
Subject: [Buildroot] crda and python-pycrypto build issues
Message-ID: <CAMQcK5KNoRnCF-cJUVCAC-+qFc=bpsWxXP05xkfXx8CntHNspg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We've recently run into issues with building defconfigs with the crda
package selected. The issue is that host-python-pycrypto fails to
build on certain builds machines due host-python-pycrypto not being
able to link against static libraries. The issue experience with
host-python-pycrypto compiling is:

config.status: creating src/config.h
building 'Crypto.PublicKey._fastmath' extension
creating build/temp.linux-x86_64-2.7
creating build/temp.linux-x86_64-2.7/src
/usr/bin/gcc -pthread -fno-strict-aliasing
-I/tmp/pycrypto/build/host/include -fwrapv -Wall -Wstrict-prototypes
-fPIC -std=c99 -O3 -fomit-frame-pointer -Isrc/
-I/tmp/pycrypto/build/host/include/python2.7 -c src/_fastmath.c -o
build/temp.linux-x86_64-2.7/src/_fastmath.o
/usr/bin/gcc -pthread -shared -L/tmp/pycrypto/build/host/lib
-Wl,-rpath,/tmp/pycrypto/build/host/lib -Wl,--enable-new-dtags
build/temp.linux-x86_64-2.7/src/_fastmath.o
-L/tmp/pycrypto/build/host/lib -lgmp -lpython2.7 -o
build/lib.linux-x86_64-2.7/Crypto/PublicKey/_fastmath.so
/usr/bin/ld: /tmp/pycrypto/build/host/lib/libgmp.a(lt23-init2.o):
relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
making a shared object; recompile with -fPIC
/tmp/pycrypto/build/host/lib/libgmp.a: error adding symbols: Bad value
collect2: error: ld returned 1 exit status
error: command '/usr/bin/gcc' failed with exit status 1
package/pkg-generic.mk:238: recipe for target
'/tmp/pycrypto/build/build/host-python-pycrypto-2.6.1/.stamp_built'
failed
make[1]: *** [/tmp/pycrypto/build/build/host-python-pycrypto-2.6.1/.stamp_built]
Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

Investigation into this issue leads to the conclusion that
host-python-pycrypto is attempting to link against libgmp and is
trying to using the shared library object. For the host-libgmp build,
only the static library is compiled as only 'host/usr/lib/libgmp.a' is
in the host folder. There is no configure option to use static
libraries only so it looks like this package depends on shared
libraries.

For host-python packages/host packages in general, are they required
to be statically linked?

This leads into the second issue that we have found, why is working on
some build machines and not others. Further investigation showed that
the python distutils configure does not work properly as it is using
the host's library paths for it's tests. On the build machines that
this failed on, the following is outputted in the config.log:

configure:3110: checking for __gmpz_init in -lgmp
configure:3135: gcc -o conftest -g -O2   conftest.c -lgmp   >&5
configure:3135: $? = 0
configure:3144: result: yes

However on the build machines that it does work, the following is found:

configure:3135: gcc -o conftest -g -O2   conftest.c -lgmp   >&5
/usr/bin/ld: cannot find -lgmp
collect2: error: ld returned 1 exit status
configure:3135: $? = 1

This is due to the fact that libgmp.a is not found the build machine
where the compilation works. The difference is that libgmp-dev is
installed on machine where the build fails and only libgmp is
installed on where it succeeds. libgmp package does not include the
static library.

How do we ensure that host-python packages that use distutils are
running their configure checks against the host folder and not the
host machines installed libraries?

How should this issue be fixed? Compile the shared library for host-libgmp?

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
