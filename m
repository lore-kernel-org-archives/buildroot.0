From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Fri, 30 Apr 2021 07:37:48 +0000
Subject: [Buildroot] [PATCH 1/1] package/imx-seco: use the c0 revision
 for the imx8qxp ahab image
In-Reply-To: <CAN=fXj2O14E_PGo++gDjMW=7NWtEf_dxSqZq-n62Nx09kPwrjQ@mail.gmail.com>
References: <20210428034036.15461-1-charles.hardin@chargepoint.com>
 <AM0PR04MB69469D00A286B8447B4D49DFA75F9@AM0PR04MB6946.eurprd04.prod.outlook.com>,
 <CAN=fXj2O14E_PGo++gDjMW=7NWtEf_dxSqZq-n62Nx09kPwrjQ@mail.gmail.com>
Message-ID: <AM0PR04MB6946869268E13309E3EE186FA75E9@AM0PR04MB6946.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

>>>
>>>The silicon revision for the imx8 is C0 and this is the release
>>>candidate for the new update images. It also seems to work on
>>>some B0 early silicon in addition, so change the ahab container
>>>to use mx8qxc0-ahab-container.img
>>
>>The C0 firmware cannot be executed along with the B0 ROM for a couple
>>of reasons (different function address map and lacking features).
>>
>>Warning:
>>Once we make the switch to mx8qxc0-ahab-container, all boards based
>>on a B0 silicon version won't boot anymore!
>>
>
>That's how I found this - I had a C0 ROM and that doesn't boot with the b0 ahab,
>so it needs to be setup to go one way or the other. I think C0 is the production
>GA release from NXP, so this is out there for people as needed that have that
>problem.

It's true that the recommendation is to move onto C0 silicon version based on
the considerations mentioned in [1] ;
... and I personally have no issues with this switch (I have both B0 and C0 in hands
and would be happy to switch to C0).

However, I am wondering whether a Kconfig 'choice' would be a better option to
let the B0 users (if any?) pick mx8qxb0-ahab-container for backward compatibility?

BR, 
Stephane.

[1] https://www.nxp.com/docs/en/application-note/AN12770.pdf

>
>This was from the u-boot
>
>
>    CPU:   Freescale i.MX8QXP revC A35 at 1200 MHz at 34C
>
>
>>>
>>>Signed-off-by: Charles Hardin <ckhardin at gmail.com<mailto:ckhardin@gmail.com>>
>>
>>
>>[Stephane: tested on i.MX8 QXP EVK Rev C]
>>Tested-by: Stephane Viau <stephane.viau at oss.nxp.com<mailto:stephane.viau@oss.nxp.com>>
>>
>>BR,
>>Stephane.
>>
>>>---
>>> package/freescale-imx/imx-seco/imx-seco.mk<http://imx-seco.mk> | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/package/freescale-imx/imx-seco/imx-seco.mk<http://imx-seco.mk> b/package/freescale-imx/imx-seco/imx-seco.mk<http://imx-seco.mk>
>>>index 245c3e3311..711315ea93 100644
>>>--- a/package/freescale-imx/imx-seco/imx-seco.mk<http://imx-seco.mk>
>>>+++ b/package/freescale-imx/imx-seco/imx-seco.mk<http://imx-seco.mk>
>>>@@ -22,7 +22,7 @@ IMX_SECO_INSTALL_IMAGES = YES
>>> # is done in post-image script.
>>> ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
>>> define IMX_SECO_INSTALL_IMAGES_CMDS
>>>-       cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
>>>+       cp $(@D)/firmware/seco/mx8qxc0-ahab-container.img \
>>>                 $(BINARIES_DIR)/ahab-container.img
>>> endef
>>> else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
>>>--
>>>2.21.1 (Apple Git-122.3)
>>>
