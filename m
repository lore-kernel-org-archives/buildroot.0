From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:48:27 +0100
Subject: [Buildroot] [PATCH 1/1] Autobuilder: add powerpc64 and
 powerpc64le
In-Reply-To: <955cacaf56560ef6d27555e5e969a576187daba3.1477975719.git.sam.bobroff@au1.ibm.com>
References: <955cacaf56560ef6d27555e5e969a576187daba3.1477975719.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161101154827.3b5b652f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 15:53:04 +1100, Sam Bobroff wrote:
> Add autobuilder configuration for powerpc64le, with a Power8 CPU.
> Add autobuilder configuration for powerpc64 (big endian), with a
> generic PowerPC CPU.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Thanks for this initial proposal. I'm replying to some of your
questions, and asking some more below.

> The powerpc64le configuration is set up for Power8 CPUs, because
> that's where little endian support starts.
> 
> The powerpc64 configuration is set up for a generic PowerPC CPU, as
> that makes it as widely usable as possible but Power7 would be another
> reasonable choice.

Using a "reasonable" choice is probably better, i.e if you think Power7
is kind of the usually minimal machine to run PowerPC64 stuff, then the
powerpc64 config should be using power7 IMO.

> 
> I tried to follow the same style as the other configurations but I
> should point out that:
> * I did not prefix the name with "br-". I'm not sure what it means.

It means "toolchain built by Buildroot", which is your case here. This
is opposed to "Linaro toolchain", "Sourcery toolchain", etc.

> * For the actual configuration (.config files) I cut and trimmed the
>   "Target options" section of a working Buildroot configuration.

You should have used "make savedefconfig", which produces a file named
defconfig that is automatically trimmed down.

> * I haven't inlcuded a pre-built tool chain. I'd like to have one
>   but I assume it can be set up separately.

That's the point I wanted to discuss. I think I'd prefer to have
pre-built toolchains. Pre-built toolchains mean that people can much
more quickly reproduce build failures, as they can re-use the
pre-existing toolchain and just build the failing package. It *saves* a
lot of time. Also, using pre-built toolchains means that our
autobuilders CPU time is more dedicated into building packages than
building the toolchain.

The only drawback of pre-built toolchains is that they are not
automatically rebuilt when the toolchains components are
updated/patches. But I very regularly trigger a rebuild of the
pre-built toolchains, at least whenever I see some gcc/binutils/libc
changes, or when one of the person interested in a specific
architecture/toolchain asks me to do so.

So I think I'll just add a powerpc64/power7 pre-built toolchain and a
powerpc64le/power8 pre-built toolchain, if that's OK with you.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
