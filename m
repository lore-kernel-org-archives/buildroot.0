From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 22 Dec 2014 12:49:10 -0500
Subject: [Buildroot] [PATCH] erlang: selectively enable libatomic_ops
In-Reply-To: <20141222171304.GA4306@free.fr>
References: <1419239071-4637-1-git-send-email-fhunleth@troodon-software.com>
 <20141222171304.GA4306@free.fr>
Message-ID: <CA+-urNRRY6-uq-j8+UtaYbcVazFWPEnHTB7EOte6K0nGmBd=OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Dec 22, 2014 at 12:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Franck, All,
>
> On 2014-12-22 04:04 -0500, Frank Hunleth spake thusly:
>> Erlang can use either the system libatomic_ops or its own version.
>> However, if using the system version, it must find implementations for
>> AO_compare_and_swap() and other calls.  Since these are not available on
>> all platforms, selectively enable the use of the system libatomic_ops.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/eba/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/
>> http://autobuild.buildroot.net/results/c74/c743cfca629fb332bbb1327cf4ea360f0a4e4bfe/
>> http://autobuild.buildroot.net/results/095/095348d4d309c2a408a3b297b4325348ed1dd7e8/
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> ---
>>  package/erlang/Config.in | 10 ++++++++++
>>  package/erlang/erlang.mk |  4 +++-
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
>> index 56830da..9caf1ec 100644
>> --- a/package/erlang/Config.in
>> +++ b/package/erlang/Config.in
>> @@ -26,6 +26,16 @@ config BR2_PACKAGE_ERLANG_SMP
>>         If you do not need SMP support, turning this option off reduces
>>         compile time and the size of the Erlang installation.
>>
>> +config BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS
>> +     bool
>> +     select BR2_PACKAGE_LIBATOMIC_OPS
>> +     default y if BR2_ARM_CPU_ARMV7A || BR2_x86_64
>
> Well, we already have BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS that defines
> which architecture libatomic_ops supports.
>
> So, unless AO_compare_and_swap() is not available on all those
> architectures (and it seems it is), you should use that symbol instead.

That was my first thought, but if you look at the configs for the
failed builds, BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS=y is defined. E.g.:

   http://autobuild.buildroot.net/results/eba/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/config

Unfortunately, configure only prints the following to the build log so
it's not immediately obvious which function was missing:

   checking for a usable libatomic_ops implementation... no
   configure: error: No usable libatomic_ops implementation found

My assumption is that AO_compare_and_swap() is missing since that's
what I saw on a BR2_ARM_CPU_ARMV4 platform, but it could be something
else on BR2_ARM_CPU_ARMV5 (the config that I referenced above).

Thanks,
Frank

>
>> +     help
>> +       Use the system libatomic_ops on platforms that provide
>> +       implementations for AO_store(), AO_load(), and AO_compare_and_swap().
>> +       Platforms without support for those functions must still use the
>> +       Erlang-provided implementation.
>> +
>>  config BR2_PACKAGE_ERLANG_MEGACO
>>       bool "install megaco application"
>>       help
>> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
>> index 0b8619e..007053a 100644
>> --- a/package/erlang/erlang.mk
>> +++ b/package/erlang/erlang.mk
>> @@ -22,9 +22,11 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
>>
>>  ERLANG_CONF_OPTS = --without-javac
>>
>> -ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>> +ifeq ($(BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS),y)
>>  ERLANG_DEPENDENCIES += libatomic_ops
>>  ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
>> +else
>> +ERLANG_CONF_OPTS += --without-libatomic_ops
>>  endif
>
> So the consition for this block should stay the same, but the
> --without-libatomic_ops addition is still welcome.
>
> Regards,
> Yann E. MORIN.
>
>>  # erlang uses openssl for all things crypto. Since the host tools (such as
>> --
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
