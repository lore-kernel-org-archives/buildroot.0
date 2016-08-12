From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Aug 2016 15:51:48 +0200
Subject: [Buildroot] [PATCH 2/2] fwup: link in pthreads for static builds
In-Reply-To: <9D32ABC7-1620-4C8E-983B-1D82180CB888@gmail.com>
References: <1470868546-8237-1-git-send-email-fhunleth@troodon-software.com>
 <1470868546-8237-2-git-send-email-fhunleth@troodon-software.com>
 <20160812000628.3fc05f4e@free-electrons.com>
 <9D32ABC7-1620-4C8E-983B-1D82180CB888@gmail.com>
Message-ID: <20160812155148.1a0e2508@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Aug 2016 21:54:24 -0700, Khem Raj wrote:

> > The problem is that this doesn't work with static linking with uClibc.
> > I believe it's a uClibc bug, but I'm not entirely sure either.  
> 
> As per elf specs.
> 
> "A weak definition does not change the rules by which object files are
> selected from libraries. However, if a link set contains both a weak
> definition and a non-weak definition, the non-weak definition will always
> be used.?
> 
> The "link set" is the set of objects that have been loaded by the linker.
> It does not include objects from libraries that are not required.
> 
> So if libc.a appears first and provides the symbol it will be used
> even if its weak. If you exchange the order where libpthread appears
> first it will use the libpthread provided symbols. another option
> could be to use
> 
> -Wl,--whole-archive -lpthread -Wl,--no-whole-archive
> 
> This would link the right strong symbols into binary irrespective of
> link order
> 
> but this will also include unused symbols into binary, probably not
> optimal, and may using -Wl,--gc-sections could help in letting linker
> remove the unused functions, maybe worth trying.

Thanks for those details, but I'm not sure to understand what is the
conclusion. Do you mean that it's impossible to implement this dual
symbol definition mechanism with static libraries? Indeed, while shared
libraries have the weak/non-weak mechanism that allows to be sure the
pthread implementation of the symbols will be used if available, with
static libraries, only the link order will decide if the libpthread of
libc implementation is used.

So, if this cannot be fixed in uClibc, how should this problem be
addressed?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
