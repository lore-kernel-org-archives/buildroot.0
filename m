From: Julien Olivain <juju@cotds.org>
Date: Wed, 18 Dec 2019 22:22:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to
 version 1.2.1
In-Reply-To: <CAOMZO5CTpqORMwjZi5681X7h1pngWZJzF-VZHvaVHkEe4CYq1g@mail.gmail.com>
References: <20191218130429.847805-1-juju@cotds.org>
 <CAOMZO5D_Dh2sgweJ+0U_os-jP3igeVbO2XJmeesZTdoQDe86gA@mail.gmail.com>
 <94f6389ba7bd24a86cdec3e8295fddad@cotds.org>
 <CAOMZO5CTpqORMwjZi5681X7h1pngWZJzF-VZHvaVHkEe4CYq1g@mail.gmail.com>
Message-ID: <bb1e9dbdd73a1e0b8fead464ddf9fa83@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio, All,

On 2019-12-18 14:27, Fabio Estevam wrote:
> On Wed, Dec 18, 2019 at 10:23 AM Julien Olivain <juju@cotds.org> wrote:
> 
>> As per:
>> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-sc-firmware?h=sumo-4.14.98-2.0.0_ga
>> 
>> For 4.14.98_2.0.0_ga, imx-sc-firmware is 1.2.1.
>> imx-sc-firmware is 1.2.2 is for 4.14.98_2.2.0.
>> 
>> Since the rest of the components are on 4.14.98_2.0.0_ga, I would 
>> really
>> suggest 1.2.1.
> 
> Correct, the NXP Release Notes on the web is for 4.14.98_2.2.0.
> 
> So using 1.2.1 is fine then.
> 
> Shouldn't IMX_SC_FIRMWARE_VERSION be passed via board defconfig 
> instead?
> 
> Currently we are forcing the same IMX_SC_FIRMWARE_VERSION for all imx8
> boards, which is not ideal because we may have imx8 boards running
> 4.14.78, others 4.14.98, others 4.19.35, etc
> 
> We cannot force all of them to be using the same kernel versions, so I
> think we should allow the possibility to pass IMX_SC_FIRMWARE_VERSION
> via board defconfig.
> 
> What do you think?

   I agree with you that we can't really force a single version for all
boards. Exposing a choice of version (like for Kernel, U-Boot, ATF)
seems a good trade-of (this is what I had in mind in [1]).

   For i.MX packages, several packages are in that case: I think mainly
about imx-sc-firmware, firmware-imx and imx-gpu-viv.

   The only problem I see right now is that from one version to
another, the build recipe might slightly change. We saw that recently
in [2]. This means we can't have a single recipe and a free
_CUSTOM_VERSION config option.

What about having a KConfig "choice" list of few supported versions,
also showing NXP BSP name, to help i.MX defconfig maintainers to
select the right version ? That would allow the package recipe to
adjust commands for a given version.

For example, for the imx-sc-firmware, the list of choices would be:
- 1.1.4 (4.14.78_1.0.0)
- 1.2.1 (4.14.98_2.0.0)
- 1.2.2 (4.19.35_1.0.0)
- 1.2.7.1 (4.19.35_1.1.0)

What do you think about this approach?

If you agree, I could give a try to write patches for
imx-sc-firmware package, to see how it goes...

> Thanks

Best regards,

Julien.

[1] 
http://lists.busybox.net/pipermail/buildroot/2019-December/268135.html
[2] 
http://lists.busybox.net/pipermail/buildroot/2019-December/269280.html
