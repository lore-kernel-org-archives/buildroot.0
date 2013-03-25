From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 08:58:31 +0100
Subject: [Buildroot] [PATCH v3 1/2] package: Makefile.in: Add target
 compilation flags for NOMMU architecture.
In-Reply-To: <CAJxxZ0PCJ6X==pGsDajmDoD8mkcimZD58rfwQZyxCFSNTx=Uqg@mail.gmail.com>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <20130322152920.59b74891@skate>
 <CAJxxZ0PCJ6X==pGsDajmDoD8mkcimZD58rfwQZyxCFSNTx=Uqg@mail.gmail.com>
Message-ID: <20130325085831.36ff0afe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

Thanks for following up on this discussion!

On Mon, 25 Mar 2013 15:50:49 +0800, Sonic Zhang wrote:

> > For example, on ARM, you can have ELF or FLAT binaries, that follow
> > either the OABI or EABI. True, OABI is deprecated, but it still clearly
> > points the fact that FLAT is *not* an ABI, but a binary format.
> >
> > Therefore, I think we should introduce config options like:
> >
> > config BR2_BINFMT_ELF
> >         bool
> >
> > config BR2_BINFMT_FDPIC
> >         bool
> >
> > config BR2_BINFMT_FLAT
> >         bool
> >
> > probably with a choice list or something.
> >
> 
> OK.

It would be good if this BR2_BINFMT_<foo> thing was introduced as a
separate patch. It can be part of the same patch series, but it would
be could to see it introduced separately from the Blackfin additions.

> >> +ifneq ($(BR2_USE_MMU), y)
> >> +TARGET_CFLAGS += -D__NOMMU__
> >> +endif
> >
> > I'm still not entirely happy with that. This define is completely
> > non-standard, I am not sure we want to have this at the global level.
> > autotools-based packages should be fixed to check if fork() is
> > available or not. For other packages, this special flag can be
> > introduced on a per-package basis. But it's true that maybe a good
> > number of packages will need that. Not sure here. What do others think?
> >
> 
> Macro __NOMMU__ is not used only for fork/vfork. There are some
> difference between MMU and NOMMU application. For example:
> - exit(n) should be replaced by _exit(n) in child process.
> - Large buffer or array shouldn't be defined on stack.
> - calloc() should be replaced by malloc().
> 
> All these changes to MMU application should be protected by macro __NOMMU__

The issue I have is that this __NOMMU__ define is, as far as I know,
entirely non-standard. So whenever you will send a patch for a package
that introduces some #ifdef __NOMMU__ ... #endif clause, we'll have no
way of pushing it upstream.

Have you managed to pushed upstream noMMU related changes that are
guarded using __NOMMU__ ?

> >>  # Configure step. Only define it if not already defined by the package
> >> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >> index 57b0fd0..5ce32f9 100644
> >> --- a/package/pkg-generic.mk
> >> +++ b/package/pkg-generic.mk
> >> @@ -303,6 +303,11 @@ endif
> >>
> >>  $(2)_REDISTRIBUTE            ?= YES
> >>
> >> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
> >> + ifneq ($$($(2)_FLAT_STACKSIZE),)
> >> +  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
> >> + endif
> >> +endif
> >
> > How is this one supposed to work? Who will use <pkg>_FLAT_LDFLAGS?
> 
> If the generic package wants to be built into FLAT binary, it should
> append this package specific link flag <pkg>_FLAT_LDFLAGS to the build
> command line in its makefile. This flag can't be added to
> TARGET_LDFLAGS, because it is package specific.

Hum, right, but then it means that we should modify *all* our packages
so that they add $(<pkg>_FLAT_LDFLAGS) to their LDFLAGS ? Having to
change the recipe of all packages doesn't seem easy to do. Maybe with
enough $ signs we can delay the expansion of TARGET_LDFLAGS so that we
can use a package specific variable in it. Makefile experts? Arnout? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
