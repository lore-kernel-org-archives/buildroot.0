From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Mar 2016 15:23:52 +0100
Subject: [Buildroot] [PATCH 6/6] linux/perf: build the host perf tool
In-Reply-To: <20160319145515.32875737@free-electrons.com>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
 <b5f50fa3c517ddd37dbf339c011f6bf0621f55ac.1457720152.git.yann.morin.1998@free.fr>
 <20160319145515.32875737@free-electrons.com>
Message-ID: <20160319142352.GB3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 14:55 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 19:19:59 +0100, Yann E. MORIN wrote:
> > Currently, we only build the target variant of the perf tool. However,
> > perf on the target may generate a bunch of data files that may have to
> > be analysed on the host.
> > 
> > There is no host-variant of the linux-tools infrastructure, so we just
> > build the host perf at the same time we build the target one.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> 
> First of all, I have to say I hate this target package that builds and
> installs host stuff.

Yeah, that bothered me too, enough that I had to explain it in the
commit log.

[--SNIP--]
> > diff --git a/linux/Config.tools.in b/linux/Config.tools.in
> > index 24ef8cd..a01b53e 100644
> > --- a/linux/Config.tools.in
> > +++ b/linux/Config.tools.in
> > @@ -26,4 +26,8 @@ config BR2_LINUX_KERNEL_TOOL_PERF
> >  
> >  	  https://perf.wiki.kernel.org/
> >  
> > +config BR2_LINUX_KERNEL_TOOL_HOST_PERF
> > +    bool "host-perf"
> > +    depends on BR2_LINUX_KERNEL_TOOL_PERF
> Indentation should just tab.

Damned... :-)

> > +# For the host, we inherit the same flags as for the target,
> > +# overriding just those that are needed.
> 
> I don't really understand this, it seems really weird to me, and I
> would find it much more future proof to have separate target and host
> flags. Otherwise, any addition of a flag to the target variant can
> break in subtle way the host variant.

Well, I'm not a perf expert, but my reasoning is that, if the target
perf stores info about, say, function unwinding, the host perf has to
be able to parse it. Conversely, if the target perf does not support
tracing function unwinding, there is no point in having that support
in the host perf.

So, we just use the same set of options, except for the compiler suite
and the destination directory.

> > +HOST_PERF_MAKE_FLAGS = \
> > +	$(PERF_MAKE_FLAGS) \
> > +	CFLAGS="$(HOST_CFLAGS) -I$(HOST_DIR)/usr/include/elfutils" \
> 
> We don't have this -I for the target variant. Why do we need it for the
> host variant?

I can retry without it, but IIRC it did not work. I'll double-check.

> > +	LDFLAGS="$(HOST_LDFLAGS)" \
> > +	LD="$(HOSTLD)" \
> > +	ARCH=$(PERF_ARCH) \
> > +	CROSS_COMPILE= \
> > +	DESTDIR=$(HOST_DIR)
> > +
> > +# No host-packages in Buildroot, but we don't let it depend on the
> > +# libraries provided by the host system (they may be there or not,
> > +# depending on the user's system, but we won't play that game).
> 
> This sentence is not really clear IMO. What about:
> 
> # For the following optional dependencies of perf, Buildroot doesn't
> # provide any host package, and we don't want to rely on those
> # libraries being provided by the host system.

Yeah, better. Thanks!

> > +HOST_PERF_MAKE_FLAGS += \
> > +	NO_SLANG=1 \
> > +	NO_LIBUNWIND=1 \
> > +	NO_LIBNUMA=1 \
> > +	NO_LIBELF=1 NO_DWARF=1
> > +
> >  # The call to backtrace() function fails for ARC, because for some
> >  # reason the unwinder from libgcc returns early. Thus the usage of
> >  # backtrace() should be disabled in perf explicitly: at build time
> > @@ -49,6 +69,7 @@ endif
> >  # instead of the complete backtrace.
> >  ifeq ($(BR2_arc),y)
> >  PERF_MAKE_FLAGS += NO_BACKTRACE=1
> > +HOST_PERF_MAKE_FLAGS += NO_BACKTRACE=1
> 
> Why ?

Ditto the explanation about inheriting the target options, above.

> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_SLANG),y)
> > @@ -76,14 +97,14 @@ PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_ZLIB),y)
> > -PERF_DEPENDENCIES += zlib
> > +PERF_DEPENDENCIES += zlib host-zlib
> 
> This is the part I'm really not a big fan of. You enable a target
> package, and it affects the configuration of a host package. Not nice.

Ditto, to match what the target perf supports.

However, sicne there is no host variant, there's not much we can do to
clean this mess. And I doubt we want to add a host-linux package just
for host-perf.

> Is there an actual connection between zlib/xz support in the target
> perf and the need to have it in host-perf? Like is zlib/xz support used
> to compress the data output by the target perf, which needs to be
> uncompressed by the host perf ?

TBH, I did not try. I was secretly hoping that Thomas DS would test-run
it... (Niark!)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
