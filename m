From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 27 Oct 2015 09:04:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix build issue with
 some toolchains
In-Reply-To: <20151026230404.1501048e@free-electrons.com>
References: <1445894151-27841-1-git-send-email-joerg.krause@embedded.rocks>
 <20151026230404.1501048e@free-electrons.com>
Message-ID: <1445933042.18019.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Mo, 2015-10-26 at 23:04 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Mon, 26 Oct 2015 22:15:51 +0100, J?rg Krause wrote:
> 
> > +# Using 'ld' directly for the 'builtin-target' in Makefile.build
> > to compile a
> > +# set of object files into one object file does not work for some
> > toolchains
> > +# (x86_64 and mips64) leading to different kind of relocation
> > errors. By
> > +# passing the below values for 'LD' and 'ldflags-y', we ensure
> > that 'gcc' is
> > +# used to compile the 'builtin-target' target.
> > ?define SWUPDATE_BUILD_CMDS
> > -	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D)
> > +	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
> > +		LD="$(TARGET_CC)" ldflags-y="-Wl,-r -nostdlib"
> > ?endef
> 
> But shouldn't upstream be fixed to use gcc instead of ld? Using ld
> directly is normally not a good idea.

On second thought, yes.

swupdate uses simplified Kbuild files from the Linux Kernel so I was
not sure about touching the existing Makefiles. But there are some
benefits to prefer gcc over ld for partial linking.

I'll prepare a patch for upstream. Usually, Stefano (swupdate
maintainer) reviews patches near-time. If he accepts, we can backport
from upstream, right?

Best regards
J?rg Krause
