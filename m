From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Aug 2017 14:20:32 +0200
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <20170815063102.ED3612091A@mail.free-electrons.com>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
Message-ID: <20170815142032.329e8103@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 08:31:02 +0200 (CEST), Thomas Petazzoni wrote:

>       x86_64 |                    faad2-2.8.1 | NOK | http://autobuild.buildroot.net/results/6b159b766d791492bab4d897c33ce07845fb7119 |     

getopt.c:175:13: error: conflicting types for 'strncmp'
 extern int  strncmp(const char *s1, const char *s2, unsigned int n);

The code has some logic to detect if the GNU C library is being used,
and if not, defines its own functions. Except that the detection logic
doesn't work properly when musl is used.

>       x86_64 |                 flashrom-0.9.9 | NOK | http://autobuild.buildroot.net/results/e362848eb45f6b8100131361e6e5faa546f0bbd8 |     

/home/buildroot/autobuild/run/instance-0/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(strnlen.os): In function `__GI_strnlen':
strnlen.c:(.text+0x0): multiple definition of `strnlen'

Redefines strnlen() while it's already provided by the C library.

>          arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/0a3a2485c187a000482c178f1e9c64dd716a858f |     

/home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(libgstreamer_1.0_la-gstinfo.o): In function `generate_unwind_trace':
/home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2687: undefined reference to `_ULarm_init_local'
/home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2694: undefined reference to `_ULarm_step'
/home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2717: undefined reference to `_ULarm_get_proc_name'

No idea. It's happening in a static linking configuration. Not sure
what is supposed to provide those symbols.

> microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/2387103a559da5a0fa77b8c5a17151284132d74c |     

Fixed by
https://git.buildroot.org/buildroot/commit/?id=e6d0177f5319457588080b7ed111da2c3b628cf8.

> microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/bbba2a2c97dbec21340c7fd07162a316a411cba4 |     

I've proposed a patch to fix this, see
https://patchwork.ozlabs.org/patch/801340/.

>         mips |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/9e1157776dfba79102225ac2d48e99644e1558b3 |     

/home/test/autobuild/run/instance-2/output/build/ltp-testsuite-20170516/testcases/kernel/include/linux_syscall_numbers.h:10022:2: error: #endif without #if
 #endif

Bug in the tool that generates this file ?

>          arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/1a606e34f9c54f4c0b60c36eedeff05d947ee5a7 |     

src/rtphint.cpp:342:35: error: ISO C++ forbids comparison between pointer and integer [-fpermissive]

Quite easy to fix.

>          arm |                      mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/879c79e505f65387a46c4be263dc8783c8ca61bf | ORPH

Would be fixed by https://patchwork.ozlabs.org/patch/801414/. BTW, mtd
is a quite important package, but we have nobody listed for it in the
DEVELOPERS file. Would someone volunteer ?

>          arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/d99b9e3da5851ac5279d8b7a6e7eeae4f6077c0c |     
>          arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/958c853f89dba7d1d70665d2b2c1031c3abc9403 |     

Some C++ issue.

/home/buildroot/autobuild/run/instance-2/output/build/norm-1.5r6/protolib/include/protoTree.h: In member function 'ITEM_TYPE* ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const':
/home/buildroot/autobuild/run/instance-2/output/build/norm-1.5r6/protolib/include/protoTree.h:652:93: error: no matching function for call to 'ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const'

Gustavo is listed in the DEVELOPERS file for this package, but I don't
think he is going to be active in fixing this. Anyone else to look into
that ?

>       x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/1cc523dccb1524f9f6fc8fe1af451beb62c38058 |     

That's the same PYTHON_PATH issue we had with python 2.x, now with
python 3.x. I have a patch fixing that, but it needs more testing.

>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2948ec94cc4f5f98f296fa487c481e971721cff8 | ORPH

GCC ICE :

tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in validate_condition_mode, at config/rs6000/rs6000.c:17988

Weird, we're using a modern gcc version here, on a fairly well-known
architecture. Google doesn't know much about this ICE, so perhaps we
should report it upstream to gcc.


>       x86_64 |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/8f0342b7b88df979a59fdab574b2489628d7ffa5 | ORPH

Not sure what's happening here:

linking shared-library libruby.so.2.4.1
libruby.so.2.4.1: final close failed: Invalid operation
collect2: error: ld returned 1 exit status

Anyone to look into this ?

>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/11119a8e3948bce27ad748bd9160a01b8f06f4f8 |     
>       mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/7283cb4e1e6ae32ac14083ce1a00b0cd28fbb6a7 |     
>          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4d35c523e36cce6d638fa10659e374ebaf6a7f00 |     
>     mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/c5922b271252462601489f05a922d68140ef348f |     
>       mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/5cdc5304654a277071d34d73c6c2c4a7808ac60d |     
>       mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/ade9f0689b53cf461637f38b3640bfd89fe89ef0 |     

All of these are qemu-user failures, due to the host kernel headers
being too old. This error is normally ignored by autobuild-run, but
Julien's autobuilder is running a too old version of autobuild-run. So
I've temporarily added some filtering on the server side to reject such
bogus failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
