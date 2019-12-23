From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 23 Dec 2019 07:18:59 +0000
Subject: [Buildroot] [PATCH v2] arch/arc: Accommodate 16 KiB MMU pages
In-Reply-To: <20191222210615.GL26395@scaer>
References: <20191218155555.45617-1-abrodkin@synopsys.com>
 <20191222210615.GL26395@scaer>
Message-ID: <CY4PR1201MB0120E7F45DD00B2A74F192B5A12E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Monday, December 23, 2019 12:06 AM
> To: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: buildroot at buildroot.org; arc-buildroot at synopsys.com
> Subject: Re: [Buildroot] [PATCH v2] arch/arc: Accommodate 16 KiB MMU pages
> 
> Alexey, All,
> 
> On 2019-12-18 18:55 +0300, Alexey Brodkin spake thusly:
> > ARC processors are known for its configurability and one of those
> > configurable things is MMU page size which might be set to any
> > power of two from 4 KiB to 16 MiB, though in the Linux kernel we
> > only support 4, 8 and 16 KiB due to practical considerations.
> >
> > And the most used setting is 8 KiB thus GNU LD assumes maximum
> > page size is 8 KiB by default and while this works for smaller
> > pages (it's OK to align segments by larger value it will be still
> > peoperly aligned) this breaks execution of user-space apps on HW
> > with larger pages because Elf sections might very well span across
> > allocated pages and thus make executable broken.
> 
> Applied to master, thanks.
> 
> As you explained nicely in the commit log, when the CPU uses 4KiB pages,
> the default 8KiB alignment is OK. However, is there a performance penalty
> to it?

There's a performance penalty related to page size itself. Even though I don't
have full set of data at hand to explain all minor details but from our
experience 8KiB page size seem to be a kind of optimal value for use-cases we
worry about. With smaller pages page fault exceptions happen more often,
with larger 16KiB pages memory segmentation is higher, page zeroing takes more time.
So typically we use 8KiB and advise our users to do the same (and if I were
an external ARC user designing a new SoC I'd rather use the same default value
as this is supposed to be much more tested compared to less often used configurations).

> Does it impose a limitation in how much memory one may use, per
> process or system-wide?

Given this value (the one we change - LD's "max-page-size") only affects how
linker aligns segments in resulting Elf I don't think there might be any kind of
real limitation that gets introduced by this. Indeed we may start using process'
address space a bit less efficient (think about small segments in Elf each of which
will "occupy" 2 4KiB pages instead of just 1). But I would think it is pretty rare
situation when almost 2GiB of process' address space is used for miriads of Elfs
with tiny segments. So I don't think something should become terribly bad.
 
> In short, my question is: even though it works for 4KiB, would it not be
> better to also override the default, like is done for 16KiB pages?

Well as it quite often happens I was first solving a breakage that bothered
me for real. Obviously w/o discussed change user-space apps on 16KiB MMU pages
just didn?t work and so I fixed that, thus no mention of special handling of
4KiB or 8KiB pages - there stuff just worked nicely. But read-on...

> And to push thing even further, should we not also set it for 8KiB, in
> case the default changes in a later binutils version?

Now looking at your comment indeed I realize there're at least a couple of reasons
to explicitly set this thing for al supported page sizes, namely:

1. Clarity. Implicitly set something is not good. Some people know what is
   implicitly set, some don't, some forget, some people change this :)

2. Future-proof. Indeed what if at some point we decide 4KiB is the new default.
   Well for some reason most of the 32-bit CPUs use that: x86, ARM etc.

3. Uniformity. It always helps even if it sometimes adds a few LoC :)

> If you believe those are valid, please send a follow up patch. Otherwise
> just ignore my ramblings. ;-)

So thanks a lot for these inspiring questions, will send a follow-up soon.

Thanks again for taking care and being curious!
-Alexey
