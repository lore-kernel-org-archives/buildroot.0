From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 22 Mar 2013 18:28:38 +0100
Subject: [Buildroot] [PATCH v3 1/2] package: Makefile.in: Add target
 compilation flags for NOMMU architecture.
In-Reply-To: <20130322152920.59b74891@skate>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <20130322152920.59b74891@skate>
Message-ID: <CAAXf6LXr7oQ2_FkzXsjuvAFCF6zicd36-iZk3g9sH=jA9q5_ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Mar 22, 2013 at 3:29 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Sonic Zhang,
>
> On Fri, 22 Mar 2013 17:01:41 +0800, Sonic Zhang wrote:
> > From: Sonic Zhang <sonic.zhang@analog.com>
>
> Thanks for getting back to us with Blackfin-related changes!
>
> > +config BR2_TARGET_ABI_FLAT
> > +     bool
>
> I don't think FLAT is an ABI, it's a binary format.
>
> For example, on ARM, you can have ELF or FLAT binaries, that follow
> either the OABI or EABI. True, OABI is deprecated, but it still clearly
> points the fact that FLAT is *not* an ABI, but a binary format.
>
> Therefore, I think we should introduce config options like:
>
> config BR2_BINFMT_ELF
>         bool
>
> config BR2_BINFMT_FDPIC
>         bool
>
> config BR2_BINFMT_FLAT
>         bool
>
> probably with a choice list or something.
>
> >  if BR2_arm || BR2_armeb
> >  source "arch/Config.in.arm"
> >  endif
> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index a8bf36b..acfd9c8 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -103,6 +103,14 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI)
> $(TARGET_OPTIMIZATION) $(TARGET
> >  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
> >  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
> >
> > +ifeq ($(BR2_TARGET_ABI_FLAT),y)
> > +TARGET_LDFLAGS += -Wl,-elf2flt
> > +endif
>
> This will have to use some BR2_BINFMT_FLAT config option, as per the
> discussion above.
>
> > +ifneq ($(BR2_USE_MMU), y)
> > +TARGET_CFLAGS += -D__NOMMU__
> > +endif
>
> I'm still not entirely happy with that. This define is completely
> non-standard, I am not sure we want to have this at the global level.
> autotools-based packages should be fixed to check if fork() is
> available or not. For other packages, this special flag can be
> introduced on a per-package basis. But it's true that maybe a good
> number of packages will need that. Not sure here. What do others think?
>

Isn't this conceptually at the same level as settings like LARGEFILE,
WCHAR, etc.
In the case of LARGEFILE, a variable DISABLE_LARGEFILE is provided
(expanding to --disable-largefile), that packages can use to set the
necessary config options in a common way. Package infrastructures like
autotools-package can also use this.

This reasoning would then indeed suggest against such a global option, and
instead only provide a way to set this flag on a per-package basis or in an
infrastructure.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130322/52fa0831/attachment.html>
