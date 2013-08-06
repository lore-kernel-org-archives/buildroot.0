From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 6 Aug 2013 08:52:13 +0200
Subject: [Buildroot] boost autobuild failures
In-Reply-To: <20130805224226.63f66b6a@skate>
References: <CAAXf6LU4xLuafp4jjhP42kTQ-Yqg+L6L0n2+1bcpMc6pxXuKug@mail.gmail.com>
 <20130805224226.63f66b6a@skate>
Message-ID: <CAAXf6LX8VDAcqpdSR9789iaB-gddq1FszWsL08d7ievpidUaew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Aug 5, 2013 at 10:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 5 Aug 2013 18:32:31 +0200, Thomas De Schampheleire wrote:
>
>> I tried reproducing the following autobuild failure:
>> x86_64 |                   boost-1.53.0 | NOK |
>> http://autobuild.buildroot.net/results/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/
>>
>> Because the toolchain used in that config is 64-bit, I selected a
>> Sourcery toolchain for the same architecture (I'm running a 32-bit
>> machine).
>>
>> However, boost built just fine on my machine. My .config file attached.
>>
>> Unfortunately, the last lines of the build log on the autobuild do not
>> show the actual problem (at least I didn't spot it).
>>
>> Are there others with a 64-bit machine that can reproduce the problem?
>> Any idea about the solution?
>
> I reproduced the issue on the autobuilder machine. The message is the
> following one:
>
> gcc.compile.c++ bin.v2/libs/locale/build/gcc-4.7.3/release/boost.locale.posix-off/threading-multi/icu/formatter.o
> libs/locale/src/icu/formatter.cpp: In member function 'virtual boost::locale::impl_icu::number_format<CharType>::string_type boost::locale::impl_icu::number_format<CharType>::format(boost::int64_t, size_t&) const':
> libs/locale/src/icu/formatter.cpp:61:43: error: call of overloaded 'format(boost::int64_t&, icu_51::UnicodeString&)' is ambiguous
> libs/locale/src/icu/formatter.cpp:61:43: note: candidates are:
> In file included from libs/locale/src/icu/formatter.cpp:15:0:
> /home/test/outputs/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/unicode/numfmt.h:320:20: note: icu_51::UnicodeString& icu_51::NumberFormat::format(double, icu_51::UnicodeString&) const
> /home/test/outputs/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/unicode/numfmt.h:333:20: note: icu_51::UnicodeString& icu_51::NumberFormat::format(int32_t, icu_51::UnicodeString&) const
> /home/test/outputs/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/unicode/numfmt.h:346:20: note: icu_51::UnicodeString& icu_51::NumberFormat::format(int64_t, icu_51::UnicodeString&) const
>
>     "/home/test/outputs/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/output/host/usr/bin/x86_64-linux-g++"  -ftemplate-depth-128 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -O3 -finline-functions -Wno-inline -Wall -pthread -fPIC  -DBOOST_ALL_NO_LIB=1 -DBOOST_CHRONO_DYN_LINK=1 -DBOOST_LOCALE_DYN_LINK=1 -DBOOST_LOCALE_NO_POSIX_BACKEND=1 -DBOOST_LOCALE_NO_WINAPI_BACKEND=1 -DBOOST_LOCALE_WITH_ICONV=1 -DBOOST_LOCALE_WITH_ICU=1 -DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_THREAD_BUILD_DLL=1 -DBOOST_THREAD_NO_LIB=1 -DBOOST_THREAD_POSIX -DBOOST_THREAD_USE_DLL=1 -DNDEBUG  -I"." -c -o "bin.v2/libs/locale/build/gcc-4.7.3/release/boost.locale.posix-off/threading-multi/icu/formatter.o" "libs/locale/src/icu/formatter.cpp"
>
> It looks similar to https://svn.boost.org/trac/boost/ticket/6851 but
> this link doesn't give much clue about the solution, except one patch
> that was apparently not official integrated. Some other people had it
> more recently,
> http://comments.gmane.org/gmane.comp.lib.cppcms.user/2125.
>
> I'm not really familiar enough with how typing works in C++ to cook a
> patch for this. Anyone?

Thanks for the build log and initial research.
In my eyes, the proposed patch seems a suitable fix for the problem.
The argument that it may not work on Windows is not valid for
buildroot IMO. My proposal would be to test with that patch applied,
and see if it doesn't break something else. As I can't reproduce the
issue in the first place, I'm relying on you or someone else to test
it. Do you have some time to run that build?
Please let me know if you prefer me to already send an untested patch
against buildroot for this, this may be easier for you to integrate in
the test system...

Best regards,
Thomas
