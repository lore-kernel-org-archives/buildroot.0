From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 23 Nov 2018 12:01:24 -0200 (BRST)
Subject: [Buildroot] [PATCH next] tpm2-abrmd: fix build without stack
 smashing protection (SSP)
In-Reply-To: <864064258.3113009.1542851218627.JavaMail.zimbra@datacom.com.br>
References: <20181121174337.341-1-casantos@datacom.com.br>
 <20181121210652.5c083b7b@windsurf>
 <864064258.3113009.1542851218627.JavaMail.zimbra@datacom.com.br>
Message-ID: <1736816953.3407907.1542981684876.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "DATACOM" <casantos@datacom.com.br>
> To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Quarta-feira, 21 de novembro de 2018 23:46:58
> Subject: Re: [Buildroot] [PATCH next] tpm2-abrmd: fix build without stack smashing protection (SSP)

>> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
>> To: "DATACOM" <casantos@datacom.com.br>
>> Cc: "buildroot" <buildroot@buildroot.org>
>> Sent: Quarta-feira, 21 de novembro de 2018 18:06:52
>> Subject: Re: [Buildroot] [PATCH next] tpm2-abrmd: fix build without stack
>> smashing protection (SSP)
> 
>> Hello,
>> 
>> On Wed, 21 Nov 2018 15:43:37 -0200, Carlos Santos wrote:
>>> The configuration environment setup that disables SSP if the toolchain
>>> does not support it must be updated after the bump to version 2.0.3.
>>> 
>>> Fixes:
>>>   http://autobuild.buildroot.net/results/bd9005eeb24678aa530179a80bbc99b2176f8559
>>>   http://autobuild.buildroot.net/results/feff61dcb481a94f5f030117830984c5e09727ea
>>> 
>>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>>> ---
>>>  package/tpm2-abrmd/tpm2-abrmd.mk | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
>>> index a4d9cfb384..74cc66ba20 100644
>>> --- a/package/tpm2-abrmd/tpm2-abrmd.mk
>>> +++ b/package/tpm2-abrmd/tpm2-abrmd.mk
>>> @@ -13,7 +13,7 @@ TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
>>>  
>>>  # configure.ac doesn't contain a link test, so it doesn't detect when
>>>  # libssp is missing.
>>> -TPM2_ABRMD_CONF_ENV = ax_cv_check_cflags___fstack_protector_all=$(if
>>> $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
>>> +TPM2_ABRMD_CONF_ENV =
>>> ax_cv_check_cflags___________Werror_______fstack_protector_all=$(if
>>> $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
>> 
>> It's a bit annoying to fix this once in a while, what about the
>> following change instead:
>> 
>> diff --git a/m4/flags.m4 b/m4/flags.m4
>> index 1b01198..59b6d5b 100644
>> --- a/m4/flags.m4
>> +++ b/m4/flags.m4
>> @@ -5,7 +5,7 @@ dnl   mandatory (configure will fail).
>> dnl $1: C compiler flag to add to EXTRA_CFLAGS.
>> dnl $2: Set to "required" to cause configure failure if flag not supported..
>> AC_DEFUN([AX_ADD_COMPILER_FLAG],[
>> -    AX_CHECK_COMPILE_FLAG([$1],[
>> +    AX_CHECK_LINK_FLAG([$1],[
>>         EXTRA_CFLAGS="$EXTRA_CFLAGS $1"
>>         AC_SUBST([EXTRA_CFLAGS])],[
>>         AS_IF([test x$2 != xrequired],[
>> 
>> (entirely untested). It could be submitted upstream.
> 
> I can forward your suggestion upstream but for the moment I'd keep
> the CONF_ENV approach.
> 
> Patching flags.m4 would require AUTORECONF, which in its turn would
> require adding host-autoconf-archive as a build dependency. So more
> dependencies, a larger build to time and exactly the same result.

Pull request created:

    https://github.com/tpm2-software/tpm2-abrmd/pull/556

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
