From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 14 Aug 2015 11:11:59 -0400
Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
In-Reply-To: <20150814123735.GB4017@free.fr>
References: <1439516481-3375-1-git-send-email-nimaim@gmail.com>
 <20150814121935.GA4017@free.fr>
 <CALoSW66YprLV_WKuWUrPgzT9hL2JzBh69ggg2dNE3rxEkXohXg@mail.gmail.com>
 <20150814123735.GB4017@free.fr>
Message-ID: <CALoSW67wa+ZY8PswjOFauGeT3-DT0eqd8VnxfS70OUECR_DQeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 14, 2015 at 8:37 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Nimai, All,
>
> On 2015-08-14 08:29 -0400, Nimai Mahajan spake thusly:
>> On Fri, Aug 14, 2015 at 8:19 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > On 2015-08-13 21:41 -0400, Nimai Mahajan spake thusly:
> [--SNIP--]
>> >> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
>> >> index 0426fce..144e5fb 100644
>> >> --- a/package/protobuf/protobuf.mk
>> >> +++ b/package/protobuf/protobuf.mk
>> >> @@ -4,7 +4,7 @@
>> >>  #
>> >>  ################################################################################
>> >>
>> >> -PROTOBUF_VERSION = v2.5.0
>> >> +PROTOBUF_VERSION = v2.6.1
>> >
>> > Last time we tried to bump protobuf to v2.6.0, we got a lot of build
>> > failures, so the bump was reverted;
>> >     http://git.buildroot.org/buildroot/commit/?id=7b6304af9d69d44ee3040c00b0670f19c02de7d2
>> >     http://git.buildroot.org/buildroot/commit/?id=61ae22810a8ca90d3b904d89eb3892c6cf92e87c
>>
>> Sorry, I had no idea this was already tried to be pushed up ... I did
>> try to search for this but gmane doesn't make that very easy.
>
> No problem! I only knew about the revert because I was investigating the
> static build faiulures, and also considered the bump... ;-)
>
>> > Did you test under various conditions, such as:
>> >   - static-only  (2.5.0 currently fails in this case, I'm lookimng into it)
>> >   - the various supported architectures: arm, i386, mipsel, x86_64
>> >   - with various C libraries: uClibc, musl, glibc
>> >
>> > If you did, then good! :-)
>>
>> Bah no I did not :-( I only tested with arm and i386 and glibc as I
>> have toolchains for these both. I would love to set up an environment
>> where I can test all these combinations more easily before pushing
>> something up ... what would be your recommendation for doing that?
>
> You can start with any of those defconfig:
>
>     static based on uClibc:
>     http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config
>
>     based on musl (but need to manually set static):
>     http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config
>
> Save them locally, and run:
>
>     make BR2_DEFCONFIG=/path/to/where/you/saved/br-arm-full-static.config defconfig
>     make menuconfig
>         -- enable protobuf
>         -- exit
>     make protobuf
>
> (Similarly for the musl build, but you need to enable static-only in the
> menuconfig).
>

Thanks for the suggestion! I didn't know autobuilder had prebuilt
external toolchains for anyone to use publicly; sure saves loads of
time :-) Just tested the toolchains you suggested (musl static and
uClibc static) in addition to the ones I normally test (i386 + arm
glibc shared libs) and these are the results:

protobuf-c v1.1.1 builds successfully with all toolchains ...
protobuf    v2.6.1 builds successfully with everything except uClibc
static, where it fails with this:

D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c
google/protobuf/stubs/atomicops_internals_x86_gcc.cc -o
google/protobuf/stubs/atomicops_internals_x86_gcc.o
google/protobuf/stubs/common.cc:48:2: error: #error "No suitable
threading library available."
 #error "No suitable threading library available."
  ^
/bin/bash ../libtool  --tag=CXX   --mode=compile
/home/nimai/Desktop/buildroot/buildroot/output/host/usr/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -Wall -Wwrite-strings
-Woverloaded-virtual -Wno-sign-compare  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -static -static -c
-o google/protobuf/stubs/stringprintf.lo
google/protobuf/stubs/stringprintf.cc
/bin/bash ../libtool  --tag=CXX   --mode=compile
/home/nimai/Desktop/buildroot/buildroot/output/host/usr/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -Wall -Wwrite-strings
-Woverloaded-virtual -Wno-sign-compare  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -static -static -c
-o google/protobuf/extension_set.lo google/protobuf/extension_set.cc
/bin/bash ../libtool  --tag=CXX   --mode=compile
/home/nimai/Desktop/buildroot/buildroot/output/host/usr/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -Wall -Wwrite-strings
-Woverloaded-virtual -Wno-sign-compare  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -static -static -c
-o google/protobuf/generated_message_util.lo
google/protobuf/generated_message_util.cc
/bin/bash ../libtool  --tag=CXX   --mode=compile
/home/nimai/Desktop/buildroot/buildroot/output/host/usr/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -Wall -Wwrite-strings
-Woverloaded-virtual -Wno-sign-compare  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -static -static -c
-o google/protobuf/message_lite.lo google/protobuf/message_lite.cc
libtool: compile:
/home/nimai/Desktop/buildroot/buildroot/output/host/usr/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -Wall -Wwrite-strings
-Woverloaded-virtual -Wno-sign-compare -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c
google/protobuf/stubs/stringprintf.cc -o
google/protobuf/stubs/stringprintf.o
libtool: compile:
/home/nimai/Desktop/buildroot/buildroot/output/host/usr/bin/arm-linux-g++
-DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -Wall -Wwrite-strings
-Woverloaded-virtual -Wno-sign-compare -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c
google/protobuf/extension_set.cc -o google/protobuf/extension_set.o
make[4]: *** [google/protobuf/stubs/common.lo] Error 1

Seems to be a threading library issue but toolchain has NPTL thread
support I believe so not sure why that is.

>> > Otherwise, I'd like this bump to at least be tested in the musl and
>> > static-only scenario (to see if that improves the situation...)
>> >
>> > Also, it seems v2.6.x adds proper support for PowerPC.
>>
>> Yes, 2.6.1 also fixes a bunch of bugs (we use protocol buffers in
>> production code and can attest to this) so I wanted to get it up there
>> but needs a lot more testing with getting built with various
>> configurations first.
>>
>> I can certainly at least try a musl static build with this.
>
> OK, great! Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
