From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 22 Dec 2014 19:57:34 -0500
Subject: [Buildroot] [PATCH] erlang: selectively enable libatomic_ops
In-Reply-To: <20141222212458.GB4306@free.fr>
References: <1419239071-4637-1-git-send-email-fhunleth@troodon-software.com>
 <20141222171304.GA4306@free.fr>
 <CA+-urNRRY6-uq-j8+UtaYbcVazFWPEnHTB7EOte6K0nGmBd=OQ@mail.gmail.com>
 <20141222212458.GB4306@free.fr>
Message-ID: <CA+-urNTBHZA6gkmp6PG8Ey1=81e6-Pp_+WchfMaWNux7hRbJ+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Dec 22, 2014 at 4:24 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Frank, All,
>
> On 2014-12-22 12:49 -0500, Frank Hunleth spake thusly:
>> On Mon, Dec 22, 2014 at 12:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > Franck, All,
>> >
>> > On 2014-12-22 04:04 -0500, Frank Hunleth spake thusly:
>> >> Erlang can use either the system libatomic_ops or its own version.
>> >> However, if using the system version, it must find implementations for
>> >> AO_compare_and_swap() and other calls.  Since these are not available on
>> >> all platforms, selectively enable the use of the system libatomic_ops.
>> >>
>> >> Fixes:
>> >> http://autobuild.buildroot.net/results/eba/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/
>> >> http://autobuild.buildroot.net/results/c74/c743cfca629fb332bbb1327cf4ea360f0a4e4bfe/
>> >> http://autobuild.buildroot.net/results/095/095348d4d309c2a408a3b297b4325348ed1dd7e8/
>> >>
>> >> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> >> ---
>> >>  package/erlang/Config.in | 10 ++++++++++
>> >>  package/erlang/erlang.mk |  4 +++-
>> >>  2 files changed, 13 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
>> >> index 56830da..9caf1ec 100644
>> >> --- a/package/erlang/Config.in
>> >> +++ b/package/erlang/Config.in
>> >> @@ -26,6 +26,16 @@ config BR2_PACKAGE_ERLANG_SMP
>> >>         If you do not need SMP support, turning this option off reduces
>> >>         compile time and the size of the Erlang installation.
>> >>
>> >> +config BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS
>> >> +     bool
>> >> +     select BR2_PACKAGE_LIBATOMIC_OPS
>> >> +     default y if BR2_ARM_CPU_ARMV7A || BR2_x86_64
>> >
>> > Well, we already have BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS that defines
>> > which architecture libatomic_ops supports.
>> >
>> > So, unless AO_compare_and_swap() is not available on all those
>> > architectures (and it seems it is), you should use that symbol instead.
>>
>> That was my first thought, but if you look at the configs for the
>> failed builds, BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS=y is defined. E.g.:
>>
>>    http://autobuild.buildroot.net/results/eba/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/config
>>
>> Unfortunately, configure only prints the following to the build log so
>> it's not immediately obvious which function was missing:
>>
>>    checking for a usable libatomic_ops implementation... no
>>    configure: error: No usable libatomic_ops implementation found
>>
>> My assumption is that AO_compare_and_swap() is missing since that's
>> what I saw on a BR2_ARM_CPU_ARMV4 platform, but it could be something
>> else on BR2_ARM_CPU_ARMV5 (the config that I referenced above).
>
> Well, looking at output/build/erlang-17.4/erts/config.log, one can see:
>     conftest.c:84:2: error: #error No compare_and_swap
>
> which is consistent with the corresponding check, that looks for some
> variant of AO_compare_and_swap.
>
> So you were right, it's AO_compare_and_swap that is missing.
>
> Let's see why...
>
> Any definition of AO_compare_and_swap is enclosed in a pre-processor
> block, conditional on AO_ARM_HAVE_LDREX.
>
> AO_ARM_HAVE_LDREX is defined for anything armv6+ (except armv6m which is
> thumb-only, but I doubt we have support for that, and that Linux even
> runs on that processor).
>
> So for ARM, we need armv6+ to use libatomic_ops.
>
> However, I fail to see the reasoning for singling-out armv7a (and armv6)
> and x86_64. Is there no other architecture that has AO_compare_and_swap()
> or any of its variants? What about armv8 (AArch64), i386, sparc and the
> others?
>
> Maybe we could add this instead:
>
>     config BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS
>         bool
>         default y
>         depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
>         # On ARM, only armv6+ has the necessary AO_compare_and_swap()
>         depends on BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A || !(BR2_arm || BR2_armeb)
>         help
>           Use the system libatomic_ops on platforms that provide
>           implementations for AO_store(), AO_load(), and AO_compare_and_swap().
>           Platforms without support for those functions must still use the
>           Erlang-provided implementation.
>

Completely agree. I've updated the patch. Thanks for investigating
more into which systems should have an AO_compare_and_swap()
implementation.

>> >>  config BR2_PACKAGE_ERLANG_MEGACO
>> >>       bool "install megaco application"
>> >>       help
>> >> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
>> >> index 0b8619e..007053a 100644
>> >> --- a/package/erlang/erlang.mk
>> >> +++ b/package/erlang/erlang.mk
>> >> @@ -22,9 +22,11 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
>> >>
>> >>  ERLANG_CONF_OPTS = --without-javac
>> >>
>> >> -ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>> >> +ifeq ($(BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS),y)
>> >>  ERLANG_DEPENDENCIES += libatomic_ops
>> >>  ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
>> >> +else
>> >> +ERLANG_CONF_OPTS += --without-libatomic_ops
>
> It would also be good to add a comment that says something like:
>
>     # --without-libatomic_ops means: do not use an external libatomic_ops;
>     # atomic operations use an internal implementation instead.

Done.

Thank you very much for spending time looking into the patch.

Frank
