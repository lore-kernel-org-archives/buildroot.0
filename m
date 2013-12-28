From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 28 Dec 2013 16:13:06 -0500
Subject: [Buildroot] host-python cflags getting into python build_ext
	compiles
Message-ID: <CANxTyt6zKXaM3gVyTDjct5fF7DbzmXZ5wu3nLp5_WP_Fi-Xd2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Folks,

I've observed some strangeness when compiling python3, and thought
that I should share with you.  I ran into a variation of this at work
with an older buildroot, where I was getting an empty
$TARGET_DIR/usr/lib/python3.3/lib-dynload/ due to python3 compile
errors.  When I tried the same thing at home with the latest buildroot
from git, I got different but equally disturbing results.  Here's the
gist of what I see:

* When host-python3 is compiled, autoconfiguration learns that the
relatively new gcc on my PC supports the -Wno-unused-result option.

* When python3 (for the target) is compiled, autoconfiguration learns
that my ancient externally installed CodeSourcery 2009q1-203 gcc does
not support the -Wno-unused-result option.

* During the python3 build stage, a lot of python3 builds fine.  But
when the extensions destined for the lib-dynload area are built, the
build_ext command creates a compile line with the -Wno-unused-result
option.  The extension compiles fail, but the overall compile just
keeps on going (very annoying).  The error looks like this:

building '_struct' extension
/home/dmocelo/buildroot-git/output.cs2009/host/usr/bin/ccache
/home/dmocelo/buildroot-git/output.cs2009/host/usr/bin/arm-none-linux-gnueabi-gcc
-fPIC -Wno-unused-result -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2
-I/home/dmocelo/buildroot-git/output.cs2009/host/usr/include
-I/home/dmocelo/buildroot-git/output.cs2009/build/host-python3-3.3.0/Include
-I. -I/home/dmocelo/buildroot-git/output.cs2009/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
-c /home/dmocelo/buildroot-git/output.cs2009/build/host-python3-3.3.0/Modules/_struct.c
-o build/temp.linux-arm-3.3/home/dmocelo/buildroot-git/output.cs2009/build/host-python3-3.3.0/Modules/_struct.o
cc1: error: unrecognized command line option "-Wno-unused-result"

and then this gets reported:

Failed to build these modules:
_bisect            _crypt             _csv
_ctypes            _ctypes_test       _datetime
_decimal           _elementtree       _heapq
_json              _lsprof            _md5
_multibytecodec    _multiprocessing   _pickle
_posixsubprocess   _random            _sha1
_sha256            _sha512            _socket
_struct            _testbuffer        _testcapi
array              atexit             audioop
binascii           cmath              fcntl
grp                math               mmap
ossaudiodev        parser             resource
select             spwd               syslog
termios            time               unicodedata

With the 64-bit build-machine that I use at work, these errors leave
my lib-dynload directory totally empty, which is how we noticed this
issue.  When I tried to replicate this at home with the latest
buildroot from git, using my home 32-bit machine, the extensions again
get built later, like this:

building '_struct' extension
/home/dmocelo/buildroot-git/output.cs2009/host/usr/bin/ccache
/usr/bin/gcc -pthread -Wno-unused-result -DNDEBUG -g -O3 -Wall
-Wstrict-prototypes -O2
-I/home/dmocelo/buildroot-git/output.cs2009/host/usr/include -fPIC
-I/home/dmocelo/buildroot-git/output.cs2009/build/host-python3-3.3.0/Include
-I. -I/home/dmocelo/buildroot-git/output.cs2009/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
-c /home/dmocelo/buildroot-git/output.cs2009/build/host-python3-3.3.0/Modules/_struct.c
-o build/temp.linux-arm-3.3/home/dmocelo/buildroot-git/output.cs2009/build/host-python3-3.3.0/Modules/_struct.o

For whatever reason, the compiler became the host gcc, and compiled
without error - but the resuling extension libs are all unusable on
the target.

So, here's the interesting part - if I explicitly disable the use of
the -Wno-unused-result option in the host-python3 configuration
("ac_cv_disable_unused_result_warning=no" for *host* conf env), then
the target extensions build without the offending option, and I get
proper arm libs in lib-dynload.

So it leaves me with the impression that the autoconf results
determined for the host-python3 are getting into the cross-compiled
python3 extension compiles.

Knowing that there was recent work for python (2) for the python
infrastructure, I tried that as well.  It's configure does not check
for -Wno-unused-result - so I put the check in using the patch at
http://hg.python.org/cpython/rev/e5dade9bf96f .  Then I saw the same
errors during the python2 target compile.  (Stuff got into
lib-dynload, but there are still many intermediate compile errors due
to the unsupported option; the errors went away when I forced the
option off in the host-python build again.)

For my immediate problem, I can simply disable the check in python3,
and be done.  (And certainly, this problem goes away if you use a
newer toolchain, which I imagine that most buildroot users do.)  But I
fear that there is a more fundamental problem of host-python cflags
getting used by the target python extension builds, so this is why I
am writing this email.

FYI, my defconfig is:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_SOFT_FLOAT=y
BR2_CCACHE=y
BR2_STRIP_none=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/codesourcery/arm-2009q1"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-none-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
BR2_PACKAGE_PYTHON3=y

Danomi -
