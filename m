From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 26 Oct 2017 16:50:32 +0530
Subject: [Buildroot] [PATCH v3 02/11] support/scripts: Add
	sunxi64-post-build.sh
In-Reply-To: <20171022142919.6dc03525@windsurf>
References: <1508406333-27138-1-git-send-email-jagan@amarulasolutions.com>
 <1508406333-27138-3-git-send-email-jagan@amarulasolutions.com>
 <20171021230637.60959eed@windsurf>
 <CAMty3ZCQSpztnqCa8=uZMB1LsF2zPq_OF5uUsagJ9Uv4Z8JUZA@mail.gmail.com>
 <4cb45577-1f4a-ce9c-7204-74934272b789@arm.com>
 <20171022142919.6dc03525@windsurf>
Message-ID: <CAMty3ZAHk2gnOCWKiWSmYK6rBW4ZWFmdbZNzmciJnyjCHo3FsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 22, 2017 at 5:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 22 Oct 2017 12:05:52 +0100, Andr? Przywara wrote:
>
>> > This wasn't only the case with sunxi it's been the U-Boot FIT
>> > behaviour..even rockchip do follow same build process.
>> >
>> > Ideally FIT need input files to produce blob like dtb.
>> >
>> > Added Andre he will give some more insight.
>>
>> So yes, ATF supports *multiple* ways of integration:
>> - On the Juno it has the capability of loading images - from NOR flash,
>> so not a big deal. This means the BL1 and BL2 stages read the BL31
>> (containing the PSCI runtime) and BL33 (U-Boot or EDK2), also this uses
>> the ATF defined FIP image format.
>> - For other platforms (like rockchip or sunxi) we usually load from MMC
>> or SPI flash. So using the traditional ATF approach would mean to have
>> MMC and SPI drivers in the early ATF stages, also do the DRAM
>> initialization there. Since ATF is BSD licensed, it's more involved than
>> just copying some code from U-Boot.
>> So the pragmatic approach - which ATF actually embraces - is to just use
>> a subset of the whole ATF (BL31) and do the rest via some platform
>> specific firmware: which is U-Boot's SPL in our case, since it already
>> has support for this hardware. Other platform (most ARM64 servers) tend
>> to have their proprietary early-init firmware there.
>
> Thanks for summarizing the context.
>
>> So I virtually know nothing about buildroot, but it might not be a good
>> idea to shoehorn the second approach into the Juno ATF build scheme.
>> As I believe that in fact more platforms use the second approach, it
>> might be worthwhile to introduce some extra code in buildroot to support
>> that specifically instead of working around the Juno ATF way.
>> Maybe it can be modelled as some U-Boot FIT build process with an
>> additional requirement, similar to a binary blob?
>
> And this is exactly what I was suggesting Jagan to do: extend Buildroot
> so that it covers the U-Boot-bundles-ATF scenario (sunxi/rockchip,
> etc.) in addition to the already supported ATF-bundles-U-Boot scenario
> (Juno).

Based on the ATF build this look not an exact U-Boot-bundles-ATF
scenario. Whether for Juno(ATF-bundles-U-Boot scenario) or for SUNXI,
ATF want a dependence to build U-Boot first atleast for FIP point.

ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        BL33=$(BINARIES_DIR)/u-boot.bin \

Here BL33 need u-boot.bin to export for building FIP in default that
could be the reason of making ARM_TRUSTED_FIRMWARE_DEPENDENCIES +=
uboot
in atf.

I tried to build for U-Boot-bundles-ATF scenario by not to dependent
U-Boot so that U-boot build later. Since at this movement there is no
U-Boot build, ATF is unable to get the BL33, I don't know whether this
BL33 is needed for all because I'm trying for BL31.

Build Log:
-------------
un50iw1p1 all fip
make[1]: Entering directory
`/mnt/jagan/buildroot/buildroot-sun32/output/build/arm-trusted-firmware-aa75c8da415158a94b82a430b2b40000778e851f'
make[1]: Nothing to be done for `bl31'.
make[1]: *** No rule to make target
`/mnt/jagan/buildroot/buildroot-sun32/output/images/u-boot.bin',
needed by `build/sun50iw1p1/release/fip.bin'.  Stop.
make[1]: *** Waiting for unfinished jobs....
Building sun50iw1p1

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
