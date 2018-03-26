From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:32:51 +0200
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Qualcomm video
 firmware option
In-Reply-To: <CAEj2-1OQaPzpLwrrzN-42WDUiRk-eWd9=GPUtUYmJXdWQp124Q@mail.gmail.com>
References: <CAEj2-1OQaPzpLwrrzN-42WDUiRk-eWd9=GPUtUYmJXdWQp124Q@mail.gmail.com>
Message-ID: <20180326233251.22f44208@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andre,

Thanks for this contribution! See below for some comments.

On Sun, 11 Mar 2018 21:57:15 +0000, Andre Renaud wrote:
> Added Qualcomm video firmware option.
> 
> Signed-off-by: Andre Renaud <andre@ignavus.net>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in
> b/package/linux-firmware/Config.in
> index 4e77a3f9a3..61164e101c 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
>         help
>           Firmware files for AMD Radeon video cards.
> 
> +config BR2_PACKAGE_LINUX_FIRMWARE_QCOM
> +       bool "Qualcomm video card firmware"
> +       help
> +         Firmware files for Qualcomm/Snapdragon video cards.

"video cards" doesn't mean much. Are you talking about GPU, VPU?

And in fact, if you look at the "WHENCE" file in the linux-firmware
project, you'll see:

--------------------------------------------------------------------------

Driver: venus - Qualcomm Venus video codec accelerator

File: qcom/venus-1.8/venus.mdt
File: qcom/venus-1.8/venus.b00
File: qcom/venus-1.8/venus.b01
File: qcom/venus-1.8/venus.b02
File: qcom/venus-1.8/venus.b03
File: qcom/venus-1.8/venus.b04

Version: 1.8-00109

File: qcom/venus-4.2/venus.mdt
File: qcom/venus-4.2/venus.b00
File: qcom/venus-4.2/venus.b01
File: qcom/venus-4.2/venus.b02
File: qcom/venus-4.2/venus.b03
File: qcom/venus-4.2/venus.b04

Version: 4.2

Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details

Binary files supplied originally from
https://developer.qualcomm.com/hardware/dragonboard-410c/tools

--------------------------------------------------------------------------

--------------------------------------------------------------------------

Driver: adreno - Qualcomm Adreno GPU firmware

File: qcom/a300_pfp.fw
Link: a300_pfp.fw -> qcom/a300_pfp.fw
File: qcom/a300_pm4.fw
Link: a300_pm4.fw -> qcom/a300_pm4.fw
File: qcom/a530_pfp.fw
File: qcom/a530_pm4.fw
File: qcom/a530v3_gpmu.fw2
File: qcom/a530_zap.b00
File: qcom/a530_zap.b01
File: qcom/a530_zap.b02
File: qcom/a530_zap.mdt

Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details

Binary files supplied originally from
https://developer.qualcomm.com/hardware/dragonboard-410c/tools

--------------------------------------------------------------------------

So the files in qcom/venus/ are for a video processing unit (doing
video encoding/decoding acceleration), while the qcom/a* files are for
the Adreno GPUs.

So, I believe we need two sub-options:

BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS
BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO

Could you rework your patch to add those two options instead ?

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
