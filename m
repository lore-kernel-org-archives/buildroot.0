From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 18:06:45 +0200
Subject: [Buildroot] Understanding a sysroot issue with 2014.08-rc1
In-Reply-To: <CALo-6+hcfoU04dwydZvdLr7sh6bMQEUzNsAjJqUv7e5_jr=Ezg@mail.gmail.com>
References: <CALo-6+hcfoU04dwydZvdLr7sh6bMQEUzNsAjJqUv7e5_jr=Ezg@mail.gmail.com>
Message-ID: <20140815160645.GB3863@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2014-08-15 08:31 -0700, Charles Krinke spake thusly:
> I am trying to work with the latest buildroot-2014.08-rc1 with a currently
> used external toolchain. I am currently using buildroot-2013.08 which is
> working fine with the Linaro 2013.04 external toolchain. My project is an
> ARM AM3517 based project using Qt5.
> 
> In trying to use this same external toolchain with buildroot-2014.08, I get
> caught up in
> 
> Incorrect selection of kernel headers: expected 2.6.x, got 3.2.x
> 
> I can see what is happening is that buildroot is looking at the version of
> the headers on the development Linux PC, which are 3.2 and
> check-kernel-headers.sh is looking in /usr/include/linux/version.h.
> 
> I do have a kernel tree for the 2.6.37 kernel we are working in and it is
> in ~/.../linux-2.6.37, so its partial path to version.h is
> linux-2.6.37/include/linux/version.h.
> 
> Since there is no .../usr/... in this path, I have a little trouble
> visualizing how to set SYSROOT as an environment variable to allow the
> toolchain to pick up the custom 2.6 headers instead of the development PC's
> system headers.
> 
> Could someone help me understand the path through the "Valley of
> Uncertainty" around the "Swamp of Ambiguity" past the "Rocks of Confusion"
> to the top of the "Ridge of Enlightment", please.

I'll nominate you for a quote on LWN.net for next weeks' edition! :-)

OK, so to the answer, now.

Some packages need a specific version of the kernel headers to be used
in the toolchain, or they fail to build.

Note that needs not match the running kernel. In fact, on first sight,
one needs not be concerned about matching both (although that is better),
since the C library has (by default) fallback methods when running on an
older kernel.

So, Buildroot needs to know what version of the kernel headers were used
to build the toolchain, so we can hide the packages that require a more
recent version (to avoid build breakage.)

When using an internal toolchain, Buildroot explcitly knows what version
of the kernel headers you're using, since you have to tell so in the
toolchain menuconfig.

But when using an external toolchain, Buildroot can only know the
version at build time, which is too late since the configuration is
laready done, so we can't hide the affected pacakges.

Thus, we recently added a new choice in the menuconfig, where the user
must tell what kernel version is used in the toolchain. This is located
in the same menu where you select the toolchain and its options:

    Toolchain  --->  External toolchain kernel headers series (X.Y)

In your case, you should set this choice to "3.2.x" since that's what
the error message is about:

    expected 2.6.x, got 3.2.x

It says Buildroot was configured for an external toolchain with headers
from the 2.6.x kernel (the default, since we want to be conservative),
but it found that the version is actually 3.2.x.


Thanks so much for the little fun I had reading you!
I hope this will help you pass the Ridge of Enlightment. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
