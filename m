From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2016 09:43:21 +0100
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <20161129041655.GK14207@waldemar-brodkorb.de>
References: <20161125180016.GA360@waldemar-brodkorb.de>
 <20161128222834.37958cd9@free-electrons.com>
 <20161129041655.GK14207@waldemar-brodkorb.de>
Message-ID: <20161129094321.656d1cb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 05:16:55 +0100, Waldemar Brodkorb wrote:

> > The --start-group/--end-group ask the linker to loop between -lgcc and
> > -lc until all unresolved symbols have been resolved. So
> > dl_iterate_phdr() being defined in the C library, but used in libgcc, I
> > guess the dynamic way (-lgcc -lc -lgcc) doesn't work.  
> 
> But why gcc behaves different?
> BR+gcc5+uClibc-ng-1.0.17 - no extra -static in LDFLAGS required
> BR+gcc5+musl+static - no extra -static in LDFLAGS required
> BR+gcc5+uClibc-ng-1.0.19 - extra -static required!

I would suspect it's a fallout of the "merge everything in libc"
change, but I really can't figure out why that would make a difference.

Could it be that with older uClibc versions, gcc was not finding the
dl_iterate_phdr symbol in uClibc, and therefore disabling the unwind
code, and now, due to a change in uClibc, gcc sees the dl_iterate_phdr
symbol, enables unwinding support, which cause this extra reference
from libgcc to libc?

You would have to compare the config.log of libgcc for
BR+gcc5+uClibc-ng-1.0.17 and BR+gcc5+uClibc-ng-1.0.19 to see what's the
difference.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
