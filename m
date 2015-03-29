From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 13:23:01 +0200
Subject: [Buildroot] [PATCH 1/3 v2] toolchain/external: add Linaro ARM
 2014.11 ARMv7 EABIhf
In-Reply-To: <20150329131143.2288634c@free-electrons.com>
References: <cover.1427556250.git.yann.morin.1998@free.fr>
 <09383bf10969ac4b1705180abd33576e52b5a3e6.1427556250.git.yann.morin.1998@free.fr>
 <20150329131143.2288634c@free-electrons.com>
Message-ID: <20150329112301.GA4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 13:11 +0200, Thomas Petazzoni spake thusly:
> On Sat, 28 Mar 2015 16:27:10 +0100, Yann E. MORIN wrote:
> 
> >   - it is available only for x86_64 hosts
> > 
> >   - the toolchain is split in three parts:
> >     - the main archive, with the tools and a minimalist sysroot with
> >       just the strictly required stuff (e.g. just the C library and most
> >       libs as static libs, i.e. no shared libs but libc.so)
> >     - a secondary archive, with the complete sysroot , duplicationg most
> >       previously existing files in the minimal sysroot, above
> >     - a tertiary archive, with the 'runtime' content (whatever that
> >       could mean...); that one seems completely unnecessary for
> >       Buildroot.
> > 
> >   - the sys/types.h headers from the main sysroot is correct, while the
> >     one from the secondary archive (thus overwriting the main one) is
> >     broken, as it removes the definition of caddr_t (why? WHY?).
> 
> Can you report this bug to the Linaro folks?

ACK, will do.

> >   - there's a stray backup file for libstdc++
> I already reported the stray backup file issue, but as part of my
> original bug report. Maybe we should report it as a separate bug.

ACK, will do.

> > +config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_11
> > +	bool "Linaro arm 2014.11"
> 
> For Linaro toolchains, we've stopped adding version-specific Config.in
> options. At any given time, we support only one Linaro toolchain, under
> the option BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM.

Well, because the 2014.11 is kinda new and a bit broken so far, I wanted
to keep the 2014.09 as a backup, in case I missed issues with 2014.11.

I was able to build quite a lot of stuff with it, like the full Kodi
suite and the whole of Qt5, but QtWebKit, which should exercise the
compiler pretty well, but there might still be issues lurking around.
Hence adding it instead of replacing.

But if you really want we replace the existing one, I'm OK.

> > +#   sysroot without a lot of share dlibs (e.g. libstdc++.so)
> > +# - a secondrary archive with another part of the sysroot (in that both
> > +#   the intersection and exclusion are non-empty)
> "in that both the intersection and exclusion are non-empty" ?!?

Well, it means the set of files in the sysroot archive is not a superset
of the sysroot files of the main archive:

  - main archive's sysroot:       [----------------]
  - secondary archive's sysroot:       [-----------------------]
  - intersection:                      [-----------]
  - exclusion:                    [----]           [-----------]

> > +# The standard package infra handles the main archive, and we use a
> > +# post-extract hook to extract the secondary, sysroot archive
> > +define TOOLCHAIN_EXTERNAL_LINARO_2014_11_EXTRACT_SYSROOT
> > +	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
> > +		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/libc $(TAR_OPTIONS) -
> > +endef
> > +# The sysroot archive is kinda broken, keep the pieces together...
> 
> Maybe be more specific here about what is being done rather than just
> "let's fix the breakage".

ACK, will do.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
