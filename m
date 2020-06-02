From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Tue, 2 Jun 2020 07:32:20 +0000
Subject: [Buildroot] [PATCH v4 1/5] package/freescale-imx: Add option
 for DDR FW need
In-Reply-To: <20200529214638.GT8737@scaer>
References: <1590556068-7043-1-git-send-email-stephane.viau@oss.nxp.com>
 <1590556068-7043-2-git-send-email-stephane.viau@oss.nxp.com>,
 <20200529214638.GT8737@scaer>
Message-ID: <DB8PR04MB575538B11EC2AEC5D10413F5A78B0@DB8PR04MB5755.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>Stephane, All

Hello Yann,

>
>On 2020-05-27 07:07 +0200, Stephane Viau spake thusly:
>> Only some i.MX8 needs a DDR training firmware (8M, 8MM, 8MN). Some other
>> i.MX8 (QuadMax, QuadXPlus) rely on system controller for that task.
>>
>> Suggested-by: Julien Olivain <julien.olivain@oss.nxp.com>
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>> v4:
>>   - add Gary's reviewed-by
>> v3:
>>   - let the others 'select' this newly introduced option instead of
>>     'default y' it. I believe this option is still required since we
>>     only want to choose a DDR binary for the i.MX 8M platforms. (Yann/Gary)
>> v2:
>>   - introduce BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW to extend the DDR
>>     firmware selection to the whole i.MX 8M family (suggested by Gary)
>>
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> ---
>>  package/freescale-imx/Config.in | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
>> index b0c7de8..0be37ce 100644
>> --- a/package/freescale-imx/Config.in
>> +++ b/package/freescale-imx/Config.in
>> @@ -45,12 +45,15 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>>
>>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>>       bool "imx8m"
>> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>>
>>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>>       bool "imx8mm"
>> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>>
>>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>>       bool "imx8mn"
>> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>>
>>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>>       bool "imx8x"
>> @@ -96,6 +99,9 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>>               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
>>               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>>
>> +config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>> +     bool
>
>Now that this variable exists, I've made use of it to drive the actual
>insrallation of the DDR trainging files, instead of the concatenation
>of the corresponding platforms.
>

Quite tempting, indeed.
I have actually proposed this in my v2 series, in which Gary made these comments:
[1]:
	"
	And here is why I'm worried the name of the previous variable might be
	misleading. You don't only copy the DDR FW training under that
	BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4 macro, you also copy the HDMI FW.
	Note that the DP FW should be added as well.
	"
and [2]:
	"
	I would still keep the 'if IMX8M' around the whole block that is only
	for iMX8M.
	"
... which I did agree with and reverted back to using the whole SoC list instead.

Also, the _ifeq_ part of this _if_ statement mentions another SoC
(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X): it makes thus more sense to
use the i.MX 8M SoC list in the former part, doesn't it?

[1] http://lists.busybox.net/pipermail/buildroot/2020-May/283181.html
[2] http://lists.busybox.net/pipermail/buildroot/2020-May/283442.html

Thanks,
Stephane.

>Pelase review the commit to check I haven't totally borked the thing:
>
>    https://git.buildroot.org/buildroot/commit/?id=6bb7f3b81092e7005470c7d689a566dbc1d059c6
>
>Thanks.
>
>>  source "package/freescale-imx/imx-alsa-plugins/Config.in"
>>  source "package/freescale-imx/imx-codec/Config.in"
>>  source "package/freescale-imx/imx-kobs/Config.in"
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>--
>.-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>'------------------------------^-------^------------------^--------------------'
>
