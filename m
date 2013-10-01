From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 08:20:47 +0200
Subject: [Buildroot] [PATCH 4/4] i.MX6: Update Freescale
 hardware-acceleration bits to latest versions
In-Reply-To: <52449BF5.7030000@boundarydevices.com>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>	<1380136072-9879-5-git-send-email-eric.nelson@boundarydevices.com>
 <87k3i35qa0.fsf@dell.be.48ers.dk> <52449BF5.7030000@boundarydevices.com>
Message-ID: <524A69BF.9080906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/26/13 22:41, Eric Nelson wrote:
> Hi Peter,
>
> On 09/26/2013 12:36 PM, Peter Korsgaard wrote:
>>>>>>> "Eric" == Eric Nelson <eric.nelson@boundarydevices.com> writes:
[snip]
>>   Eric> @@ -30,8 +34,6 @@ endif
>>   Eric>  # The archive is a shell-self-extractor of a bzipped tar. It happens
>>   Eric>  # to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
>>   Eric>  # The --force makes sure it doesn't fail if the source dir already exists.
>>   Eric> -# The --auto-accept skips the license check - not needed for us
>>   Eric> -# because we have legal-info.
>>   Eric>  define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
>>   Eric>      (cd $(BUILD_DIR); \
>>   Eric>          sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)
>>
>> Did you remove this on purpose? If the --auto-accept option is gone then
>> it should also be removed from here.
>>
>
> I actually meant to, but hadn't yet started a discussion on the topic.
>
> We should be able to get rid of these comments:
>      http://git.buildroot.net/buildroot/tree/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk#n15
>
> By following the lead of the meta-fsl-arm project and allowing the first
> of any packages with the Freescale EULA to prompt the user for
> acceptance, but I'm not sure how to accomplish that.
>
> In the Yocto world, a tag ("ACCEPT_FREESCALE_EULA") placed in local.conf
> is sufficient to bypass the prompt, which requires action by the user.

  We prefer to avoid that the build stops after half an hour or so 
because it is waiting for user input. Also, I don't see a reason why we 
have to explicitly ask the user to accept this license. If we do that, we 
should probably do the same for all the other packages.

  If we do want explicit acceptance, then it can be done similar to the 
Qt license, i.e. add a config option that enables the --auto-accept.


>
>>
>>   Eric> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk
>> b/package/freescale-imx/imx-lib/imx-lib.mk
>>   Eric> index bd7e174..e3c29b1 100644
>>   Eric> --- a/package/freescale-imx/imx-lib/imx-lib.mk
>>   Eric> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
>>   Eric> @@ -6,7 +6,8 @@
>>
>>   Eric>  IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
>>   Eric>  IMX_LIB_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
>>   Eric> -IMX_LIB_LICENSE = LGPLv2.1+
>>   Eric> +IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
>>   Eric> +IMX_LIB_LICENSE = Freescale Semiconductor Software License
>> Agreement
>>   Eric>  # No license file included
>>
>> Sigh, back to self extracting binaries? :/
>>
>
> Yep. The tar-balls are gone. This one (imx-lib) is a bit misleading,
> since the extracted files say very clearly that all of the components
> are released under LGPL.

  In that case, the license is still LGPL. The EULA text specifies:

This Agreement does not concern your use of any files that
are subject to an "open source" software license, such as the Free
Software Foundation "General Public License," or "GNU GPL."

  Since only GPL stuff is included in imx-lib, the rest of the EULA 
essentially doesn't apply.

[snip]
>>   Eric> -LIBFSLCODEC_VERSION = 3.0.1
>>   Eric> +LIBFSLCODEC_VERSION = 3.5.7-1.0.0
>>   Eric>  # No official download site from freescale, just this mirror
>>   Eric> -LIBFSLCODEC_SITE =
>> http://download.ossystems.com.br/bsp/freescale/source
>>   Eric> +LIBFSLCODEC_SITE =
>> http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
>>
>> Maybe this should use FREESCALE_IMX_SITE
>>
>
> Agreed. I'm also confused about why this isn't in the freescale-imx/
> directory.

  Because the libfslcodec fits in the multimedia libraries menu more than 
in the hardware handling menu.

  Note that it is not necessary to put the libfslcodec package under the 
freescale-imx directory for it to use the FREESCALE_IMX_SITE variable. At 
least, I think so :-)


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
