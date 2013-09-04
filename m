From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 4 Sep 2013 08:50:10 +0200
Subject: [Buildroot] Why elf2flt is built *after* busybox
In-Reply-To: <CAFRkauChAKfxHt7Z5GwJ3pvpk5iEB9m=+5FuhckGWUQ6SR_4ZQ@mail.gmail.com>
References: <1378225250.11000.4.camel@phoenix> <20130903193417.1a092fd5@skate>
 <CAFRkauBmG1T5UHKaA5tRvGqPFw2eABrPrPSKeO4L-CCOTyfu=Q@mail.gmail.com>
 <CAFRkauChAKfxHt7Z5GwJ3pvpk5iEB9m=+5FuhckGWUQ6SR_4ZQ@mail.gmail.com>
Message-ID: <CAAXf6LUtV63ZX69jnXe6+HCvODre9ctbRoySNisRk72btcXdOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Axel,

Op 4-sep.-2013 04:04 schreef "Axel Lin" <axel.lin@ingics.com> het volgende:
>
> > This time my question is: Is it normal elf2flt is built *after* busybox?
> > (This looks like a new founding to me)
> > I know elf2ft is broken.
> > I'm just not sure if the build order is one of the root cause to make
> > elf2flt broken.
> > I ask the question because I'm not familiar with buiildroot now, I even
> > don't know how to specify package build order.
> > (In this case, move elf2flt build ealier than busybox.)
> > So I expect someone can answer the question on mailing list.
> Hi,
> I test build for blackfin with BR2_PACKAGE_HOST_ELF2FLT=y.
> The first time build result in a ELF 32-bit LSB executable.
> (I think it is because busybox is built *before* elf2flt.)
> However, I build busybox again with "make busybox-rebuild" and
> then I got a BFLT executable.
> So now I do think the build order for elf2flt does matter.

The build order of packages is in general to be considered random. However,
if some packages need to be built before others, this should be expressed
in the FOO_DEPENDENCIES variable. If FOO_DEPENDENCIES = bar, then package
bar will be built before package FOO.

Some packages need to be built before _all_ other packages, they are global
dependencies. For this, there is the support/dependencies infrastructure.

Some packages are also built before the real target packages as part of the
toolchain building/extracting.

Possibly, elf2flt can be added to the last category, or to the
support/dependencies one.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130904/78618709/attachment.html>
