From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:29:19 +0200
Subject: [Buildroot] [PATCH v3 02/11] support/scripts: Add
 sunxi64-post-build.sh
In-Reply-To: <4cb45577-1f4a-ce9c-7204-74934272b789@arm.com>
References: <1508406333-27138-1-git-send-email-jagan@amarulasolutions.com>
 <1508406333-27138-3-git-send-email-jagan@amarulasolutions.com>
 <20171021230637.60959eed@windsurf>
 <CAMty3ZCQSpztnqCa8=uZMB1LsF2zPq_OF5uUsagJ9Uv4Z8JUZA@mail.gmail.com>
 <4cb45577-1f4a-ce9c-7204-74934272b789@arm.com>
Message-ID: <20171022142919.6dc03525@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 12:05:52 +0100, Andr? Przywara wrote:

> > This wasn't only the case with sunxi it's been the U-Boot FIT
> > behaviour..even rockchip do follow same build process.
> > 
> > Ideally FIT need input files to produce blob like dtb.
> > 
> > Added Andre he will give some more insight.  
> 
> So yes, ATF supports *multiple* ways of integration:
> - On the Juno it has the capability of loading images - from NOR flash,
> so not a big deal. This means the BL1 and BL2 stages read the BL31
> (containing the PSCI runtime) and BL33 (U-Boot or EDK2), also this uses
> the ATF defined FIP image format.
> - For other platforms (like rockchip or sunxi) we usually load from MMC
> or SPI flash. So using the traditional ATF approach would mean to have
> MMC and SPI drivers in the early ATF stages, also do the DRAM
> initialization there. Since ATF is BSD licensed, it's more involved than
> just copying some code from U-Boot.
> So the pragmatic approach - which ATF actually embraces - is to just use
> a subset of the whole ATF (BL31) and do the rest via some platform
> specific firmware: which is U-Boot's SPL in our case, since it already
> has support for this hardware. Other platform (most ARM64 servers) tend
> to have their proprietary early-init firmware there.

Thanks for summarizing the context.

> So I virtually know nothing about buildroot, but it might not be a good
> idea to shoehorn the second approach into the Juno ATF build scheme.
> As I believe that in fact more platforms use the second approach, it
> might be worthwhile to introduce some extra code in buildroot to support
> that specifically instead of working around the Juno ATF way.
> Maybe it can be modelled as some U-Boot FIT build process with an
> additional requirement, similar to a binary blob?

And this is exactly what I was suggesting Jagan to do: extend Buildroot
so that it covers the U-Boot-bundles-ATF scenario (sunxi/rockchip,
etc.) in addition to the already supported ATF-bundles-U-Boot scenario
(Juno).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
