From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 17 Jul 2015 09:11:18 +0000
Subject: [Buildroot] [PATCH] ARC: allow selection of MMU page size
In-Reply-To: <20150716232530.761b0529@free-electrons.com>
References: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
 <20150716232530.761b0529@free-electrons.com>
Message-ID: <1437124277.9157.16.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2015-07-16 at 23:25 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Thu, 16 Jul 2015 22:04:01 +0300, Alexey Brodkin wrote:
> 
> > +choice
> > +	prompt "MMU Page Size"
> > +	default BR2_arc_page_size_8k
> > +	help
> > +	    MMU starting from version 3 (could be found in ARC 770) and now
> > +	    version 4 (could be found in ARC HS38) allows selection of page
> > +	    size during ASIC design creation. And it's important to build
> 
> Remove the "And".
> 
> > +	    a toolchain with page size setting that matches hardware.
> 
> "with a page size matching the hardware configuration"
> 
> > +	    Otherwise user-space applications will fail on execution due to
> 
> "will fail at runtime"

Thanks for pointing to that.

> > +	    unexpected data layout/alignment.
> 
> What is the impact for people using external toolchains?

Well people have to use toolchain which page size matches HW.
That means you need to know which value is set in both
toolchain and HW.

By default in either substances 8k is used and most of the time
people will use it.

Still even in case of external toolchain we nay check for PAGE_SHIFT
value in "sysroot/usr/include/bits/uClibc_page.h".

PAGE_SHIFT=12 -> PAGE_SIZE=4k
PAGE_SHIFT=13 -> PAGE_SIZE=8k (default)
PAGE_SHIFT=14 -> PAGE_SIZE=16k

> > +
> > +config BR2_arc_page_size_4k
> 
> Can you use BR2_ARC_PAGE_SIZE_4K instead? I know the BR2_arc option is
> lower-case, but for most architectures options are upper-case, even if
> the core selection is lower-case. I think lower-case options is more an
> accident of the past rather than a real policy.

OK, will do.

> > +	bool "4KB"
> > +	depends on BR2_arc770d || BR2_archs38
> > +
> > +config BR2_arc_page_size_8k
> > +	bool "8KB"
> > +
> > +config BR2_arc_page_size_16k
> > +	bool "16KB"
> > +	depends on BR2_arc770d || BR2_archs38
> 
> Can you quickly comment on why 4 KB / 16 KB have dependencies on
> specific ARC cores and not 8 KB ?

8K page was the only option on earlier ARC cores like ARC 750D.
Starting from ARC 770D it's possible to select page size from 3 options:
4, 8 and 16k. But still 8k is its default value and most often that's
what people use.

Do you want that comment

> Can you respin with those changes?

Sure, will do shortly.\

-Alexey
