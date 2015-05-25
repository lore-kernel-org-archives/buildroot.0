From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 25 May 2015 10:27:59 +0200
Subject: [Buildroot] [PATCH] package/harfbuzz: fix static linking for
 test-unicode program
In-Reply-To: <20150521123759.5b3c9706@free-electrons.com>
References: <1431988660-3991-1-git-send-email-romain.naour@openwide.fr>
 <20150521123759.5b3c9706@free-electrons.com>
Message-ID: <5562DD0F.8020707@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 21/05/2015 12:37, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Tue, 19 May 2015 00:37:40 +0200, Romain Naour wrote:
>> During static build, -lstdc++ is required to link
>> against libicuuc.a.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  ...1-test-unicode-add-lstdc-for-static-build.patch | 29
>> ++++++++++++++++++++++ 1 file changed, 29 insertions(+)
>>  create mode 100644
>> package/harfbuzz/0001-test-unicode-add-lstdc-for-static-build.patch
> 
> Maybe I'm missing something, but I still don't think this is the right
> fix. harfbuzz is using pkg-config to detect icu-uc. So the problem is
> really that the icu-uc .pc file does not declare its dependency on
> lstdc++.
> 
> I've tried on my Ubuntu distro. Try to build the following stupid
> program:
> 
> #include <unicode/utypes.h>
> #include <unicode/ustring.h>
> 
> int main(void) {
>  UChar         source            [42];
>  u_uastrcpy(source, "This is a test.");
>  return 0;
> }
> 
> If you build it with:
> 
> $ gcc -static -o foo foo.c $(pkg-config --static --libs --cflags icu-uc)
> 
> it fails like our build failure. Now if you fix the icu-uc .pc file by
> adding -lstdc++ -lpthread in base_libs (which gets used in
> Libs.private), the build succeeds.

On Fedora 20/21 there is no icu static libraries bundled in the icu's rpm...

> 
> So shouldn't we fix icu-uc.pc instead of hardcoding the need for
> -lstdc++ in harfbuzz?

Yes you're right, but it would require invasive change in icu build system.
If we want to do things right, we needs to patch configure.ac to add -lstdc++
when --enable-static is passed to icu's configure script.

Something like:
# When building release static library, there might be some optimization flags
we can use
if test "$ENABLE_STATIC" = "YES"; then

    [snip]

    case "${host}" in
    *-linux*|i*86-*-*bsd*|i*86-pc-gnu)
        # Add -lstdc++ in Libs.private
        LIBS="${LIBS} -lstdc++"
        ;;
    *)
        ;;
    esac
fi

Unfortunately, we can't autoreconf icu since we have a patch
0003-detect-compiler-symbol-prefix.patch which modify configure script without
updating configure.ac accordingly.

./out/tmp/icudt55l_dat.S: Assembler messages:
./out/tmp/icudt55l_dat.S:1: Error: expected symbol name
./out/tmp/icudt55l_dat.S:8: Error: Missing symbol name in directive
./out/tmp/icudt55l_dat.S:8: Error: unrecognized symbol type "SYMBOL_PREFIX"
./out/tmp/icudt55l_dat.S:8: Error: junk at end of line, first unrecognized
character is `@'
./out/tmp/icudt55l_dat.S:9: Error: junk at end of line, first unrecognized
character is `@'
-- return status = 256

[snip]

/home/naourr/git/buildroot/test/harfbuzz/host/usr/bin/x86_64-linux-g++
[snip]
uconvmsg/lib at SYMBOL_PREFIX@uconvmsg.a
[snip]
uconv.cpp:(.text._ZL7initMsgPKc.part.0+0x2): undefined reference to `uconvmsg_dat'
collect2: error: ld returned 1 exit status

So at least I can patch only the configure script.

But even with icu-uc.pc fixed, test-unicode doesn't build correctly (as you said
in a previous mail)
"Unfortunately, fixing the .pc file would not fix the internal harfbuzz
test programs, since they don't use pkg-config to get the link flags."

To fix that I added $(ICU_LIBS) in test/api/Makefile.am

test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la $(ICU_LIBS)

from the config.log:
ICU_LIBS='-L/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib
-licuuc -licudata -lpthread -ldl -lm  -lstdc++  '

Sadly, the build fail due to a well known uClibc issue...

  CCLD     test-unicode
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os):
In function `__lll_lock_wait_private':
(.text+0x0): multiple definition of `__lll_lock_wait_private'
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-lowlevellock.os):(.text+0x0):
first defined here
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(lowlevellock.os):
In function `__lll_unlock_wake_private':
(.text+0xa0): multiple definition of `__lll_unlock_wake_private'
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(libc-lowlevellock.os):(.text+0x30):
first defined here
collect2: error: ld returned 1 exit status

I reverted this change and tried to fix libharfbuzz-icu.la instead where
-lstdc++ seems to be missing in dependency_libs

dependency_libs='
-L/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib
-licuuc -licudata -ldl
/home/naourr/buildroot-test/test/harfbuzz/build/harfbuzz-0.9.40/src/libharfbuzz.la
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.la
-lintl -lpthread
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpcre.la
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libintl.la
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libfreetype.la
-lbz2
/home/naourr/git/buildroot/test/harfbuzz/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpng16.la
-lz'

But I don't know how to fix this properly...

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
