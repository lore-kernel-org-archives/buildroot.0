From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Mon, 07 Oct 2013 15:55:20 -0700
Subject: [Buildroot] [PATCH 2/2] i.MX: Update versions to match latest
	Freescale release
In-Reply-To: <52533659.30105@mind.be>
References: <1381088868-12739-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381088868-12739-3-git-send-email-eric.nelson@boundarydevices.com>
 <52533659.30105@mind.be>
Message-ID: <52533BD8.1020804@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the review, Arnout,

On 10/07/2013 03:31 PM, Arnout Vandecappelle wrote:
> On 10/06/13 21:47, Eric Nelson wrote:
> [snip]
>> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
>> index e1a68ef..416bb1b 100644
>> --- a/package/freescale-imx/imx-lib/imx-lib.mk
>> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
>> @@ -6,8 +6,8 @@
>>
>>    IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
>>    IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
>> -IMX_LIB_LICENSE = LGPLv2.1+
>> -# No license file included
>> +IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement
>
>   Most of it is still LGPLv2.1+, only the vpu library is FSSLA. So I think
> it should be:
>
> IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement (vpu), LGPLv2.1+ (the rest)
>

Thanks.

>> +IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
>>
>>    IMX_LIB_INSTALL_STAGING = YES
>>
>> @@ -25,6 +25,18 @@ IMX_LIB_MAKE_ENV = \
>>    	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
>>    	INCLUDE="$(IMX_LIB_INCLUDE)"
>>
>> +# The archive is a shell-self-extractor of a bzipped tar. It happens
>> +# to extract in the correct directory (imx-lib-x.y.z)
>> +# The --force makes sure it doesn't fail if the source dir already exists.
>> +# The --auto-accept skips the license check - not needed for us
>> +# because we have legal-info
>> +# Since the EULA in the bin file differs from the one in the tar file,
>> +# extract the one from the bin file as well.
>
>   This comment doesn't seem to be correct.
>
>   Can you add the awk trick to extract the license file, and add an
> IMX_LIB_LICENSE_FILES variable?
>

Will do.

> [snip]

>>    LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
>> @@ -36,4 +36,6 @@ endef
>>    # The Makefile installs several versions of the libraries, but we only
>>    # need one of them, depending on the platform.
>>
>> +LIBFSLPARSER_AUTORECONF = YES
>
>   Please add a comment why autoreconf is needed.
>

I'm not sure I know why...

Does it suffice to say that without 'autoreconf', the configure
step fails with message "unable to create executables"?

I originally copied the process from LTIB and executed 'autogen.sh'
by hand. Then Peter pointed out the _AUTORECONF flag.

 > <snip>
>> +define LIBFSLVPUWRAP_EXTRACT_CMDS
>> +	awk 'BEGIN      { start=0; } \
>> +	     /^EOEULA/  { start = 0; } \
>> +	                { if (start) print; } \
>> +	     /<<EOEULA/ { start=1; }'\
>> +	    $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) > $(@D)/EULA
>
>   You should add this to LIBFSLVPUWRAP_LICENSE_FILES.
>

Can do.

Regards,


Eric
