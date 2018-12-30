From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:11:20 +0100
Subject: [Buildroot] [PATCH 3/4] arch/arm: add armv8.2a cortex-based
 cores
In-Reply-To: <4d7b62349a7cedd6d3762b39196a9069eb86297e.1546179362.git.yann.morin.1998@free.fr>
References: <cover.1546179362.git.yann.morin.1998@free.fr>
 <4d7b62349a7cedd6d3762b39196a9069eb86297e.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <20181230161120.23e57e35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 15:16:12 +0100, Yann E. MORIN wrote:
> The armv8.2a generation is a cumulative extension to armv8.1a.
> 
> Since gcc correctly enables the appropriate extensions based on the core
> name, we don't really need to introduce a separate config for armv8.2a,
> and we can piggyback on armv8a.
> 
> In theory, gcc supports those cores in arm mode. However, configuring
> gcc thusly generates a non-working gcc that constantly whines:
>     cc1: warning: switch -mcpu=cortex-a55 conflicts with -march=armv8.2-a switch
> 
> It is to be noted that the -march flag is internal to gcc. It is not
> something that Buildroot did set when configuring gcc; Buildroot only
> ever sets --with-cpu (not --with-arch).
> 
> Additionally, uClibc fails to build entirely (unsure if this is caused
> by the above, or if it is a separate issue, though), with:
>     #### Your compiler does not support TLS and you are trying to build uClibc-ng
>     #### with NPTL support. Upgrade your binutils and gcc to versions which
>     #### support TLS for your architecture. Do not contact uClibc-ng maintainers
>     #### about this problem.
> 
> Glibc and musl have not been tested in arm mode, so maybe we could have
> a toolchain that eventually works (or at least, pretends to be working),
> but we decided it was not worth the effort.
> 
> Thus, we restrict those cores to AArch64 mode only.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Notes: those few packages that have a cortex-dependent option have been
> checked to not require extending the list: at91bootstrap3, gst-omapfb,
> kodi, nvidia-tegra23, and openblas. Only kvm-unit-tests may need it, but
> it has not been done by lack of testing possibility.
> ---
>  arch/Config.in.arm | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
