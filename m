From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 21:27:36 +0100
Subject: [Buildroot] auto-detecting toolchain metadata?
In-Reply-To: <20161101184626.GB30593@free.fr>
References: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
 <20161101184626.GB30593@free.fr>
Message-ID: <20161101212736.790ef8af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Nov 2016 19:46:26 +0100, Yann E. MORIN wrote:

> On 2016-11-01 11:39 -0700, Hollis Blanchard spake thusly:
> [--SNIP--]
> > Another option I'm considering is a script to try to detect the necessary
> > metadata from a given toolchain path. As far as I can see, every piece of it
> > can be detected from external observation. It could be invoked outside
> > Buildroot (modifying defconfig), but of course it could be invoked from
> > within Buildroot's toolchain recipes too. Is there a reason this is a bad
> > idea or hasn't already been done?  
> 
> Such a script would be ideed very usefull.

Agreed.

> The problem is that we need to know the characteristics of the toolchain
> inside the menuconfig, so we can hide/show packages that have strict
> requirements (e.g. on gcc version for C++11, on kernel headers, on the C
> library...) but we only know the toolchain to use from inside the
> menuconfig, so it is too late to run the script.

Absolutely. In your e-mail Hollis you said:

"""
but of course it could 
be invoked from within Buildroot's toolchain recipes too
"""

but as Yann explained, this is simply not possible. We need to know, at
the Kconfig level, the properties of the toolchain. Except that the
toolchain location/choice itself is defined at the Kconfig level. So
there's no way we can have Kconfig automatically "know" the properties
of the toolchain.

> So what Buildroot currently does is check the settings after the fact,
> because there is no way we can do otherwise.
> 
> But if there was a script that would look at a toolchain and spit out
> the settings, like:
> 
>     ./support/scripts/scan-ext-toolchain /path/to/toolchain
>     BR2_USES_MUSL=y
>     BR2_GCC_ATLEAST_4_9=y
>     [and so on]

Yes, this woudl be great.

> with that output to be used as a base defconfig, then that would be
> tremendously useful, indeed.
> 
> And probably not very dificult to do either...
> 
> Bonus would be if we could also use that script to check the current
> configuration against the configured toolchain (that would mean
> extracting a lot of logic out of the Makefiles, which is not necessarily
> a bad idea either).

I didn't think about this idea, but maybe it makes sense indeed. At
least it's worth trying and see what it looks like.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
