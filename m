From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 25 Mar 2013 16:51:32 +0800
Subject: [Buildroot] [PATCH v3 1/2] package: Makefile.in: Add target
 compilation flags for NOMMU architecture.
In-Reply-To: <20130325085831.36ff0afe@skate>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <20130322152920.59b74891@skate>
 <CAJxxZ0PCJ6X==pGsDajmDoD8mkcimZD58rfwQZyxCFSNTx=Uqg@mail.gmail.com>
 <20130325085831.36ff0afe@skate>
Message-ID: <CAJxxZ0O5oa=y6dUKBdmvAMvknKHX6LDu5w7cu76G0tvoOx2MsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Mar 25, 2013 at 3:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> Thanks for following up on this discussion!
>
> On Mon, 25 Mar 2013 15:50:49 +0800, Sonic Zhang wrote:
>
>> > For example, on ARM, you can have ELF or FLAT binaries, that follow
>> > either the OABI or EABI. True, OABI is deprecated, but it still clearly
>> > points the fact that FLAT is *not* an ABI, but a binary format.
>> >
>> > Therefore, I think we should introduce config options like:
>> >
>> > config BR2_BINFMT_ELF
>> >         bool
>> >
>> > config BR2_BINFMT_FDPIC
>> >         bool
>> >
>> > config BR2_BINFMT_FLAT
>> >         bool
>> >
>> > probably with a choice list or something.
>> >
>>
>> OK.
>
> It would be good if this BR2_BINFMT_<foo> thing was introduced as a
> separate patch. It can be part of the same patch series, but it would
> be could to see it introduced separately from the Blackfin additions.
>

No problem.

>> >> +ifneq ($(BR2_USE_MMU), y)
>> >> +TARGET_CFLAGS += -D__NOMMU__
>> >> +endif
>> >
>> > I'm still not entirely happy with that. This define is completely
>> > non-standard, I am not sure we want to have this at the global level.
>> > autotools-based packages should be fixed to check if fork() is
>> > available or not. For other packages, this special flag can be
>> > introduced on a per-package basis. But it's true that maybe a good
>> > number of packages will need that. Not sure here. What do others think?
>> >
>>
>> Macro __NOMMU__ is not used only for fork/vfork. There are some
>> difference between MMU and NOMMU application. For example:
>> - exit(n) should be replaced by _exit(n) in child process.
>> - Large buffer or array shouldn't be defined on stack.
>> - calloc() should be replaced by malloc().
>>
>> All these changes to MMU application should be protected by macro __NOMMU__
>
> The issue I have is that this __NOMMU__ define is, as far as I know,
> entirely non-standard. So whenever you will send a patch for a package
> that introduces some #ifdef __NOMMU__ ... #endif clause, we'll have no
> way of pushing it upstream.
>

Busybox uses macro ENABLE_NOMMU.
Linux kernel uses macro CONFIG_MMU.
Blackfin buildroot distribution uses __NOMMU__.

Which one do you prefer? We are fine to unify the NOMMU macro name.


> Have you managed to pushed upstream noMMU related changes that are
> guarded using __NOMMU__ ?
>

Because no major Linux distributions support NOMMU architecture except
for the blackfin one and the resource shortage in ADI Linux team, we
have never tried to push the NOMMU patch to upstream packages.


>> >>  # Configure step. Only define it if not already defined by the package
>> >> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> >> index 57b0fd0..5ce32f9 100644
>> >> --- a/package/pkg-generic.mk
>> >> +++ b/package/pkg-generic.mk
>> >> @@ -303,6 +303,11 @@ endif
>> >>
>> >>  $(2)_REDISTRIBUTE            ?= YES
>> >>
>> >> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
>> >> + ifneq ($$($(2)_FLAT_STACKSIZE),)
>> >> +  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
>> >> + endif
>> >> +endif
>> >
>> > How is this one supposed to work? Who will use <pkg>_FLAT_LDFLAGS?
>>
>> If the generic package wants to be built into FLAT binary, it should
>> append this package specific link flag <pkg>_FLAT_LDFLAGS to the build
>> command line in its makefile. This flag can't be added to
>> TARGET_LDFLAGS, because it is package specific.
>
> Hum, right, but then it means that we should modify *all* our packages
> so that they add $(<pkg>_FLAT_LDFLAGS) to their LDFLAGS ? Having to
> change the recipe of all packages doesn't seem easy to do. Maybe with
> enough $ signs we can delay the expansion of TARGET_LDFLAGS so that we
> can use a package specific variable in it. Makefile experts? Arnout? :-)

The default FLAT stack size is 4K bytes without the package specific
link flag. If the package doesn't need more than 4K byte stack,
nothing needs to be changed to its makefile.

Regards,

Sonic
