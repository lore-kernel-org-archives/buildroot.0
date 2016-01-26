From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 25 Jan 2016 19:43:05 -0500
Subject: [Buildroot] [PATCH 18/18] erlang: make libatomic_ops optional
In-Reply-To: <20160123092549.2c47f3b5@free-electrons.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
 <1453511471-28519-19-git-send-email-fhunleth@troodon-software.com>
 <20160123092549.2c47f3b5@free-electrons.com>
Message-ID: <CA+-urNRdjP16nOm6ARH3WLgtopK61hhQB8PSm9FnYk_MdBUJJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Jan 23, 2016 at 3:25 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Frank,
>
> On Fri, 22 Jan 2016 20:11:11 -0500, Frank Hunleth wrote:
>> The Erlang developers prefer the use of Erlang's native atomics in
>> Erlang 18. In the previous Erlang release, the native atomics
>> implementation was not complete and so libatomic_ops was necessary. Now
>> libatomic_ops is used as a fallback, but based on tests of every
>> qemu_*_defconfig and several other configs it appears to not be
>> necessary. In fact, it causes build failures on aarch64. Since it is
>
> If using libatomic_ops on aarch64 with erlang causes build failures,
> then your BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS option should depend
> on !BR2_aarch64.
>
>> conceivable that a platform exists that may still require libatomic_ops,
>> this change makes the use of the library optional.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> ---
>>  package/erlang/Config.in | 10 ++++++++--
>>  package/erlang/erlang.mk |  2 ++
>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
>> index 0ec01bb..9bd64ac 100644
>> --- a/package/erlang/Config.in
>> +++ b/package/erlang/Config.in
>> @@ -7,8 +7,7 @@ config BR2_PACKAGE_ERLANG
>>       bool "erlang"
>>       depends on BR2_USE_MMU # fork()
>>       depends on !BR2_STATIC_LIBS
>> -     depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
>> -     select BR2_PACKAGE_LIBATOMIC_OPS
>> +     depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # erlang native atomics and libatomic_ops
>
> This shouldn't be here, since you no longer select libatomic_ops.

I'm having trouble addressing this one. It seems like some "depends
on" clause should be here. The Erlang docs are vague on what all they
support natively, so I was originally thinking that
BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS has a good list. Here's the text
from the Erlang docs in case it gives you a good idea on what to do:

"Erlang/OTP itself provides implementations of native atomic memory operations
that can be used when compiling with a `gcc` compatible compiler for 32/64-bit
x86, 32/64-bit SPARC V9, 32-bit PowerPC, or 32-bit Tile. When compiling with
a `gcc` compatible compiler for other architectures, the VM may be able to make
use of native atomic operations using the `__atomic_*` builtins (may be
available when using a `gcc` of at least version 4.7) and/or using the
`__sync_*` builtins (may be available when using a `gcc` of at least version
4.1). If only the `gcc`'s `__sync_*` builtins are available, the performance
will suffer. Such a configuration should only be used as a last resort. When
compiling on Windows using a MicroSoft Visual C++ compiler native atomic
memory operations are provided by Windows APIs.

Native atomic implementation in the order preferred:
1.  The implementation provided by Erlang/OTP.
2.  The API provided by Windows.
3.  The implementation based on the `gcc` `__atomic_*` builtins.
4.  If none of the above are available for your architecture/compiler, you
    are recommended to build and install [libatomic_ops][] before building
    Erlang/OTP. The `libatomic_ops` library provides native atomic memory
    operations for a variety of architectures and compilers. When building
    Erlang/OTP you need to inform the build system of where the
    `libatomic_ops` library is installed using the
    `--with-libatomic_ops=PATH` `configure` switch.
5.  As a last resort, the implementation solely based on the `gcc`
    `__sync_*` builtins. This will however cause lots of expensive and
    unnecessary memory barrier instructions to be issued. That is,
    performance will suffer. The `configure` script will warn at the end
    of its execution if it cannot find any other alternative than this.
"

Or maybe the answer is to delete it and add a !BR2_xyz_platform
whenever the autobuilders catch something. The only platform I know of
that isn't supported is BR2_sparc_v8.

>
>>       help
>>         Erlang is a programming language used to build massively scalable
>>         soft real-time systems with requirements on high availability.
>> @@ -20,6 +19,13 @@ config BR2_PACKAGE_ERLANG
>>
>>  if BR2_PACKAGE_ERLANG
>>
>> +config BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS
>
> We rarely use _USE_ in Config.in options for such cases. Just
> BR2_PACKAGE_ERLANG_LIBATOMIC_OPS is enough.
>
>> +     bool "use libatomic_ops"
>> +     select BR2_PACKAGE_LIBATOMIC_OPS
>
> This is where you should have the
> "depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS".
>
>> +     help
>> +       Erlang's native atomic ops implementation is preferred. If this is
>> +       insufficient, enabling this option forces Erlang to use libatomic_ops.
>
> Lines too long I believe.
>
>> +
>>  config BR2_PACKAGE_ERLANG_SMP
>>       bool "enable SMP support"
>>       help
>> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
>> index dfab30d..a2f75e7 100644
>> --- a/package/erlang/erlang.mk
>> +++ b/package/erlang/erlang.mk
>> @@ -30,8 +30,10 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
>>
>>  ERLANG_CONF_OPTS = --without-javac
>>
>> +ifeq ($(BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS),y)
>>  ERLANG_DEPENDENCIES += libatomic_ops
>>  ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
>> +endif
>
> Can you add a "else" clause to explicitly disable libatomic_ops
> support? Otherwise, libatomic_ops may be enabled in the Buildroot
> configuration, built before erlang, and detected automatically by
> erlang configure script.

The configure script doesn't provide a --without-libatomic_ops or a
--only-use-native-atomic-ops or anything that I can tell can be used
to disable use of libatomic_ops. Based on my tests, the configure
script does not use libatomic_ops even if present. It's also low down
on their priority list for the atomics implementation to use, so I
think this was intentional.

Also, thanks for the comments on the other patches. I've addressed
those and will submit back after I understand what to do on this one.

Regards,
Frank
