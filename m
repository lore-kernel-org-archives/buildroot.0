From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 1 Jun 2016 09:54:04 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-05-31
In-Reply-To: <20160601101953.54e9e80d@free-electrons.com>
References: <20160601063019.5D553101D2D@stock.ovh.net>
 <1464769003.3171.25.camel@synopsys.com>
 <20160601101953.54e9e80d@free-electrons.com>
Message-ID: <1464774805.3171.37.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2016-06-01 at 10:19 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 1 Jun 2016 08:17:21 +0000, Alexey Brodkin wrote:
> 
> > 
> > > 
> > > ?????????arc |??????????????????jack2-v1.9.10 | NOK |
> > > http://autobuild.buildroot.net/results/c05e4a5280f34b2a1dff8a10adfd46f53344e13a/??
> > So this one is almost fixed by Bernd but given he has no time for the real fix
> > we'll take a look at proposed solution and hopefully will cook up a patch ourselves.
> Aah, good. I proposed a fix in a reply to Bernd, I believe it should
> work, it just needs to be tested a little bit on platforms where NGREG
> is really defined.

Hm I see that NGREG is defined in Linux kernel in "include/uapi/linux/elfcore.h" as:
----------------->8----------------
#ifndef __KERNEL__
...
#define NGREG ELF_NGREG
#endif
----------------->8----------------

Then in its turn ELF_NGREG is defined for ARC in "arch/arc/include/uapi/asm/elf.h" as:
----------------->8----------------
#define ELF_NGREG	(sizeof(struct user_regs_struct) / sizeof(elf_greg_t))
----------------->8----------------

And since kernel's UAPI is meant to be exported to user-space I would expect NGREG to
be available for ARC and all other users of UAPI.

So might be a better solution would be to just include "elfcore.h" in jack's "dbus/sigsegv.c"?
I'll give it a try locally and if that works I'll send a patch upstream.

-Alexey
