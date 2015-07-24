From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 24 Jul 2015 22:07:24 +0200
Subject: [Buildroot] [PATCH RFC 1/1] ltp-testsuite: support building
 with toolchains without native RPC
In-Reply-To: <20150724200243.GD16376@brightrain.aerifal.cx>
References: <1437750198-21171-1-git-send-email-patrickdepinguin@gmail.com>
 <CAAXf6LVG8ZtTDjzm2N56M2=2suOuibjOC1GswupboZ+Z0qHf0Q@mail.gmail.com>
 <20150724200243.GD16376@brightrain.aerifal.cx>
Message-ID: <CAAXf6LWt7G-meF_Xvmi9UWVJuMXYW7U0PUhhfxxXQagHGeJmYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 24, 2015 at 10:02 PM, Rich Felker <dalias@aerifal.cx> wrote:
> On Fri, Jul 24, 2015 at 09:19:30PM +0200, Thomas De Schampheleire wrote:
>> On Fri, Jul 24, 2015 at 5:03 PM, Thomas De Schampheleire
>> <patrickdepinguin@gmail.com> wrote:
>> > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> >
>> > ltp-testsuite needs RPC, but this could also be provided by libtirpc.
>> >
>> > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> > ---
>> >  package/ltp-testsuite/Config.in        |  6 +++---
>> >  package/ltp-testsuite/ltp-testsuite.mk | 14 ++++++++++++--
>> >  2 files changed, 15 insertions(+), 5 deletions(-)
>> >
>> > Important note: while this works fine on glibc toolchains, I tested with
>> > http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config
>> > and found that the compiler cannot correctly link an empty C program (as done
>> > by the ltp-testsuite configure script) when -ltirpc is given, due to:
>> >
>> >     libtirpc.so: undefined reference to `authdes_seccreate'
>> >
>> > This method is part of file src/auth_des.c in libtirpc, but that file is not
>> > compiled due to the patch:
>> > 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
>> >
>> > It is unclear to me how this can work at all for non-RPC toolchains.
>> > Any suggestions on how this should be handled are welcome...
>>
>>
>> This problem has now been fixed by a patch on libtirpc by J?rg Krause.
>>
>> After this patch, ltp-testsuite still doesn't build on musl
>> toolchains, but I wonder if it makes sense to try and fix that now.
>> Instead, we could disable the package on musl toolchains?
>>
>> What do you think?
>
> To have an opinion on the matter I'd need to know more about the
> nature of the failures. But it sounds unfortunate to me that a test
> suite has blocking build failures rather than reporting failures as
> part of the test results. :(
>

First off, I now realized that ltp-testsuite was not selectable in
Buildroot even before, because it does not have native RPC support, so
to keep the same situation I will shortly update my patch to
explicitly disable ltp-testsuite on musl toolchains.

Anyway, the first set of failures I bumped into on musl were:

/home/tdescham/repo/contrib/buildroot/output/host/usr/bin/arm-linux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os
-I/home/tdescham/repo/contrib/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/tirpc/
-g -O2 -fno-strict-aliasing -pipe -Wall -I. -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2 -I../include -I../include
-I../include -I../include  -c -o tst_cwd_has_free.o tst_cwd_has_free.c
tlibio.c:449:40: error: unknown type name ?sigval_t?
 static void lio_async_callback_handler(sigval_t sigval)
                                        ^
tlibio.c: In function ?lio_write_buffer?:
tlibio.c:712:7: error: ?lio_async_callback_handler? undeclared (first
use in this function)
       lio_async_callback_handler;
       ^
tlibio.c:712:7: note: each undeclared identifier is reported only once
for each function it appears in
tlibio.c: In function ?lio_read_buffer?:
tlibio.c:1281:7: error: ?lio_async_callback_handler? undeclared (first
use in this function)
       lio_async_callback_handler;
       ^
/home/tdescham/repo/contrib/buildroot/output/host/usr/bin/arm-linux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os
-I/home/tdescham/repo/contrib/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/tirpc/
-g -O2 -fno-strict-aliasing -pipe -Wall -I. -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2 -I../include -I../include
-I../include -I../include  -c -o tst_fill_file.o tst_fill_file.c
make[2]: *** [tlibio.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory
`/home/tdescham/repo/contrib/buildroot/output/build/ltp-testsuite-20140115/lib'
make[1]: *** [lib-all] Error 2
make[1]: Leaving directory
`/home/tdescham/repo/contrib/buildroot/output/build/ltp-testsuite-20140115'
make: *** [/home/tdescham/repo/contrib/buildroot/output/build/ltp-testsuite-20140115/.stamp_built]
Error 2


The first error is sigval_t not being defined.
Regarding the second: lio_async_callback_handler is defined in that
same source file tlibio.c but under some conditions. I'm guessing that
something is wrong with that condition matching in the musl case, but
I didn't dig further.


Best regards,
Thomas
