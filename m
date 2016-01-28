From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jan 2016 09:36:18 +0100
Subject: [Buildroot] glibc and --enable-kernel
In-Reply-To: <20160128025537.GB5589@tungsten.ozlabs.ibm.com>
References: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
 <20160127092119.7cf8953d@free-electrons.com>
 <20160128025537.GB5589@tungsten.ozlabs.ibm.com>
Message-ID: <20160128093618.42baf311@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam,

On Thu, 28 Jan 2016 13:55:37 +1100, Sam Bobroff wrote:

> > Ah, so you're working on PowerPC 64, great! We have a toolchain build
> > problem that I reported on Power PC 64, when building for Power 8:
> > 
> >   http://lists.busybox.net/pipermail/buildroot/2016-January/150338.html
> > 
> > If you have some time to look at it, it would be great.
> 
> No problem, I've replied in that thread :-)

Seen that, thanks!

> Ok that is certainly easier and works for me, so I'll post a patch :-)
> 
> I'm curious tho: when I hacked up some test code I used
> BR2_DEFAULT_KERNEL_HEADERS (which seems to have the same value) but I must
> confess I don't understand the implications of choosing between
> BR2_DEFAULT_KERNEL_HEADERS or BR2_TOOLCHAIN_HEADERS_AT_LEAST. Could you explain
> the difference so I don't have to read so much Make code? ;-)

There would be no real difference between the two for your use case.

BR2_DEFAULT_KERNEL_HEADERS is a string that contains the version number
of the Linux kernel sources chosen in the linux-headers package. It
would contain things like 3.2.76, 4.3.4, etc. or a user-specified
kernel version. It would have worked all fine for your case.

BR2_TOOLCHAIN_HEADERS_AT_LEAST is a string that exists for both the
internal and external toolchains, and which indicates the "series" of
the kernel headers (i.e just 3.2, 3.4, 4.0, etc.).

The only reason that may encourage you to use
BR2_TOOLCHAIN_HEADERS_AT_LEAST instead of BR2_DEFAULT_KERNEL_HEADERS is
an upcoming patch from Yann E. Morin (already submitted but not merged
yet), which allows to tell Buildroot to use the kernel version
specified in the "Kernel" menu as the version for the kernel headers.
In this case, I believe BR2_DEFAULT_KERNEL_HEADERS will not be correct,
while BR2_TOOLCHAIN_HEADERS_AT_LEAST will be.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
