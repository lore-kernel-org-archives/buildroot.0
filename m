From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2016 10:25:56 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
Message-ID: <20161021102556.10d9a5e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 18:39:37 +0200, Arnout Vandecappelle wrote:

>  Turns out that it will be slightly more complicated than this. For MIPS, the
> -mmsa option to enable SIMD processing MUST NOT be used in kernel and bootloader
> builds. Therefore we cannot add it to TARGET_WRAPPER_CFLAGS. Instead, we'll have
> a TARGET_EXTRA_CFLAGS that does not get added to the wrapper but does get added
> to TARGET_CFLAGS and therefore passed to package buidls.
> 
>  The kernel and bootloaders don't use TARGET_CFLAGS, so those are safe. Also, it
> is possible to link libraries built with -mmsa with programs that are built
> without that option, so even if build systems ignore TARGET_CFLAGS it should be OK.

That's a bit annoying because it then moves away from the idea "all
architecture variant, ABI, floating point, etc. options are encoded in
the wrapper", which was the key part of our discussion during the
meeting.

However, I don't really see a good way around it.

That being said, what matters to me is that we improve the code to make
it clear which flags go in the wrapper and which flags do not. Having a
TARGET_WRAPPER_CFLAGS separate from TARGET_EXTRA_CFLAGS will make this
very clear, which TARGET_CFLAGS being set to $(TARGET_WRAPPER_CFLAGS)
$(TARGET_EXTRA_CFLAGS).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
