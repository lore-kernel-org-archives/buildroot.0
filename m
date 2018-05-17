From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 May 2018 09:00:38 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.1
In-Reply-To: <0ff358a9-2d87-b5cb-e1ac-be7294751618@mind.be>
References: <20180516135856.29408-1-brgl@bgdev.pl>
 <0ff358a9-2d87-b5cb-e1ac-be7294751618@mind.be>
Message-ID: <CAMRc=MfkUTd5Fz0ABqdwfdN5Au+YTY6GuV2YQqz6cDf8=S9eqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-05-16 23:48 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 16-05-18 15:58, Bartosz Golaszewski wrote:
>> This is a minor release the main feature of which are the
>> object-oriented bindings for C++ and Python3. Other than that there's
>> a couple bug-fixes and minor improvements all around.
>
>  So for -next, I guess?
>
>>
>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> ---
>>  package/libgpiod/Config.in     | 20 ++++++++++++++++++++
>>  package/libgpiod/libgpiod.hash |  2 +-
>>  package/libgpiod/libgpiod.mk   | 20 ++++++++++++++++++--
>>  3 files changed, 39 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/libgpiod/Config.in b/package/libgpiod/Config.in
>> index 63a7cb6e78..c10f11cc15 100644
>> --- a/package/libgpiod/Config.in
>> +++ b/package/libgpiod/Config.in
>> @@ -14,6 +14,26 @@ config BR2_PACKAGE_LIBGPIOD_TOOLS
>>       help
>>         Include a set of command-line tools for managing GPIOs.
>>
>> +config BR2_PACKAGE_LIBGPIODCXX
>> +     bool "install C++ bindings"
>> +     depends on BR2_INSTALL_LIBSTDCPP
>> +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>
>  Is there really a need to make these bindings optional? We try to avoid too
> many Config.in options. So only if the bindings are relatively large on target
> it's worthwhile to make them optional (more than, say 20% of libgpiod itself,
> after stripping).
>

The basic library and tools only require a libc and recent kernel
headers. I don't want users of very simple systems to carry all those
dependencies for C++ and Python if they're not using it.

>  If the bindings don't make it much larger, you can just move the dependencies
> to the BR2_PACKAGE_LIBGPIODCXX condition in the .mk file.
>
>
>> +     help
>> +       Build C++ bindings for libgpiod.
>> +
>> +comment "C++ bindings need a toolchain w/ C++, gcc >= 4.8"
>> +     depends on !BR2_INSTALL_LIBSTDCPP || \
>> +             !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>> +
>> +config BR2_PACKAGE_LIBGPIOD_PYTHON
>> +     bool "install python bindings"
>> +     depends on BR2_PACKAGE_PYTHON3
>
>  Same here of course.
>
>  Otherwise,
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  Regards,
>  Arnout
>
>> +     help
>> +       Build Python3 bindings for libgpiod.
>> +
>> +comment "Python bindings need python3"
>> +     depends on !BR2_PACKAGE_PYTHON3
>> +
>>  endif
>
> [snip]
>
> --
> Arnout Vandecappelle                          arnout at mind be

Thanks,
Bart
