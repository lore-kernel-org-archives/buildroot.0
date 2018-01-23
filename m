From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 23 Jan 2018 05:42:21 -0500
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: require nptl threads.
In-Reply-To: <20180122111803.yh73esasjfuenunm@sapphire.tkos.co.il>
References: <20180122110938.14517-1-aduskett@gmail.com>
 <20180122111803.yh73esasjfuenunm@sapphire.tkos.co.il>
Message-ID: <CAFSsvmrmayo8Ot9sRYauiTb=Etk3+92iD2UpHVaax68_U0nOVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Mon, Jan 22, 2018 at 6:18 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Adam,
>
> On Mon, Jan 22, 2018 at 06:09:38AM -0500, Adam Duskett wrote:
>> pthread_condattr_setclock is uses which is NPTL only.
>>
>> Fixes http://autobuild.buildroot.net/results/abf058948c9e4e9a50d42a05689b76bfb54a02e2/build-end.log
>>
>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>> ---
>>  package/libcpprestsdk/Config.in | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
>> index 64c383c2c9..334df41951 100644
>> --- a/package/libcpprestsdk/Config.in
>> +++ b/package/libcpprestsdk/Config.in
>> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
>>       depends on BR2_TOOLCHAIN_HAS_THREADS # boost
>
> This dependency is now redundant. Besides, threads is a dependency of
> libcpprestsdk itself, regardless of boost.
>
>>       depends on BR2_USE_WCHAR # boost
>>       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>       select BR2_PACKAGE_BOOST
>>       select BR2_PACKAGE_BOOST_ATOMIC
>>       select BR2_PACKAGE_BOOST_CHRONO
>> @@ -22,9 +23,11 @@ config BR2_PACKAGE_LIBCPPRESTSDK
>>
>>         https://github.com/Microsoft/cpprestsdk
>>
>> -comment "libcpprestsdk needs a toolchain w/ C++, wchar, threads"
>> -     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
>> -             || !BR2_USE_WCHAR
>> +comment "libcpprestsdk needs a toolchain w/ NPTL threads, C++, wchar, threads"
>
> "threads" is duplicated here as well. Actually, "NPTL" alone is enough.
>
>> +     depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
>> +             !BR2_INSTALL_LIBSTDCPP || \
>> +             !BR2_TOOLCHAIN_HAS_THREADS || \
>> +             !BR2_USE_WCHAR
>>
>>  comment "libcpprestsdk needs exception_ptr"
>>       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

Thanks for the feedback! I submitted a V2 and will mark this as superseded.

Thanks!

Adam
