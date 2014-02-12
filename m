From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 12 Feb 2014 16:25:27 -0700
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FBC72D.3090706@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr> <52FBC72D.3090706@boundarydevices.com>
Message-ID: <52FC02E7.9060607@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 02/12/2014 12:10 PM, Eric Nelson wrote:
> Hi Yann,
>
> On 02/12/2014 12:03 PM, Yann E. MORIN wrote:
>> Eric, All,
>>
>> A (hopefully!) better review this time...
>>
>> On 2013-10-08 20:05 -0700, Eric Nelson spake thusly:
>>> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
>> [--SNIP--]
>>> diff --git
>>> a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
>>> b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
>>> index 8e979ee..e799fd2 100644
>>> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
>>> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
>>> @@ -4,7 +4,11 @@
>>>   #
>>>
>>> ################################################################################
>>>
>>>
>>> -GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
>>> +ifeq ($(BR2_ARM_EABIHF),y)
>>> +GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
>>> +else
>>> +GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
>>> +endif
>>>   GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_SITE)
>>>   GPU_VIV_BIN_MX6Q_SOURCE  =
>>> gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
>>
>> I think we should make the source conditional on BR2_ARM_EABIHF, not the
>> version:
>>
>>      GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
>>      ifeq ($(BR2_ARM_EABIHF),y)
>>      GPU_VIV_BIN_MX6Q_SOURCE  =
>> gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION)-hfp.bin
>>      else
>>      GPU_VIV_BIN_MX6Q_SOURCE  =
>> gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION)-sfp.bin
>>      endif
>>
>
> Agreed. This is nicer.
>

And also not very workable.

Much seems to depend on GPU_VIV_BIN_MX6Q_VERSION having the right
version.

In particular:
	the build directory is named with the version,
	the self-extractor has this name embedded in it, and
	the patch step expects it to be set.

And in some ways, the V4 version seems more correct.

When you ask "what version of the Vivante GPU libraries" a build
is using, the "-hfp" or "-sfp" piece is pretty important.

If you switch your build from EABI to ARMHF, it also makes
sense that the stamp information shouldn't follow you.

Let me know if you feel strongly about this.

Regards,


Eric
