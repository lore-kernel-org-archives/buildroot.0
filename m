From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 29 Feb 2016 17:00:56 +0000
Subject: [Buildroot] [PATCH] sox: disable SSP when using MIPS Codescape
	toolchains
In-Reply-To: <20160229175158.3c01895a@free-electrons.com>
References: <1456763982-36511-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160229175158.3c01895a@free-electrons.com>
Message-ID: <56D47948.9020505@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 29/02/16 16:51, Thomas Petazzoni wrote:
> Vicente,
> 
> On Mon, 29 Feb 2016 16:39:42 +0000, Vicente Olivert Riera wrote:
> 
>> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
>> index f4d1608..61f5220 100644
>> --- a/package/sox/sox.mk
>> +++ b/package/sox/sox.mk
>> @@ -13,6 +13,12 @@ SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
>>  SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
>>  SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
>>  
>> +# MIPS Codescape toolchains don't support stack-smashing protection
>> +# despite of using glibc.
>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
>> +SOX_CONF_OPTS += --disable-stack-protector
>> +endif
> 
> Shouldn't we instead change BR2_TOOLCHAIN_HAS_SSP so that it is defined
> to false for those toolchains?

Uhm..., how would you do that? BR2_TOOLCHAIN_HAS_SSP is selected by
BR2_TOOLCHAIN_USES_GLIBC. We would need to do changes in the toolchain
infra in order to not define it in that place, and define it
individually for every toolchain. Is that what you mean?

Regards,

Vincent.

> This way:
> 
>  1/ The existing BR2_TOOLCHAIN_HAS_SSP tests would do the right thing
>     for the Codescape toolchains.
> 
>  2/ The additional test you are adding would also be useful for other
>     non-SSP capable toolchains.
> 
> That being said, we're very close to 2016.02, so I'm not sure this will
> get into 2016.02. If the folks releasing the Codescape toolchain
> release soon a version which has a properly working SSP implementation,
> then we could simply forget about this problem until they make this
> release. If of course such a new toolchain version is not planned in
> the near future, we would need to fix the problem.
> 
> Best regards,
> 
> Thomas
> 
