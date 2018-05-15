From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2018 23:52:33 +0200
Subject: [Buildroot] [PATCH 6/8] ti-sgx-km: rename options to have
 proper prefix
In-Reply-To: <20180513193140.GJ22130@scaer>
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
 <20180513190737.26079-7-thomas.petazzoni@bootlin.com>
 <20180513193140.GJ22130@scaer>
Message-ID: <e477cbd2-f662-b196-0c2c-f6959e42e983@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-05-18 21:31, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-05-13 21:07 +0200, Thomas Petazzoni spake thusly:
>> The sub-options of the ti-sgx-km package had their name option
>> prefixed by BR2_PACKAGE_TI_SGX, while the prefix should be
>> BR2_PACKAGE_TI_SGX_KM. This commit fixes that, and adds the necessary
>> Config.in.legacy handling.
>>
>> Since those options are part of a choice, the legacy handling cannot
>> select the new name of the options, so the legacy handling only
>> informs the user of the rename.
> 
> As I was explaining on IRC, we /could/ have legacy handling for choices.
> This would be done in three parts;
> 
>   - the new options replace the old ones in the choice, as we currently
>     do (and as is done in this patch);
> 
>   - this choice is given a "name" (see below), so we can redefine it
>     elsewhere;
> 
>   - in the legacy menu, we duplicate the choice with the same "name"
>     and the same options, but with a set of "default-if" options.
> 
> 
> For example:
> 
>     # In bar/Config.in:
>     choice BAR
>         bool "bar choice"
>     config BAR_1
>         bool "bar 1"
>     config BAR_2
>         bool "bar 2"
>     endchoice
> 
>     # In Config.in.legacy:
>     choice BAR
>         bool "bar choice"
>         default BAR_1 if FOO_1
>         default BAR_2 if FOO_2
>     config BAR_1
>         bool "bar 1"
>     config BAR_2
>         bool "bar 2"
>     endchoice
> 
>     config FOO_1
>         bool "foo 1 was renamed"
>     config FOO_2
>         bool "foo 2 was renamed"
> 
> (not tested, but it should work).

 I tested, it works, but it needlessly repeats the user-visible choice in the
legacy menu. This is simpler and works as well:

# In bar/Config.in:
choice BAR
	bool "bar choice"
config BAR_1
	bool "bar 1"
config BAR_2
	bool "bar 2"
endchoice

# In Config.in.legacy:
choice BAR
	default BAR_1 if FOO_1
	default BAR_2 if FOO_2
endchoice

config FOO_1
	bool "foo 1 was renamed"
config FOO_2
	bool "foo 2 was renamed"


> What is nice with this solution, is that we have the new choice that is
> right near the legacy option so we can chek it, and it automatically
> gets the old setting.
> 
> But I am not too convinced, however, because we do not usually use the
> name of a choice elsewhere...

 Legacy is pretty special anyway. I do think it's worthwhile it to do this properly.

 Regards,
 Arnout

> 
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  Config.in.legacy               | 32 ++++++++++++++++++++++++++++++++
>>  package/ti-sgx-km/Config.in    | 10 +++++-----
>>  package/ti-sgx-km/ti-sgx-km.mk |  8 ++++----
>>  3 files changed, 41 insertions(+), 9 deletions(-)
>>
>> diff --git a/Config.in.legacy b/Config.in.legacy
>> index 981306f469..5cf25463ad 100644
>> --- a/Config.in.legacy
>> +++ b/Config.in.legacy
>> @@ -145,6 +145,38 @@ endif
>>  ###############################################################################
>>  comment "Legacy options removed in 2018.05"
>>  
>> +config BR2_PACKAGE_TI_SGX_AM335X
>> +	bool "ti-sgx-km AM335X option renamed"
>> +	select BR2_LEGACY
>> +	help
>> +	  For consistency reasons, the option
>> +	  BR2_PACKAGE_TI_SGX_AM335X has been renamed to
>> +	  BR2_PACKAGE_TI_SGX_KM_AM335X.
>> +
>> +config BR2_PACKAGE_TI_SGX_AM437X
>> +	bool "ti-sgx-km AM437X option renamed"
>> +	select BR2_LEGACY
>> +	help
>> +	  For consistency reasons, the option
>> +	  BR2_PACKAGE_TI_SGX_AM437X has been renamed to
>> +	  BR2_PACKAGE_TI_SGX_KM_AM437X.
>> +
>> +config BR2_PACKAGE_TI_SGX_AM4430
>> +	bool "ti-sgx-km AM4430 option renamed"
>> +	select BR2_LEGACY
>> +	help
>> +	  For consistency reasons, the option
>> +	  BR2_PACKAGE_TI_SGX_AM4430 has been renamed to
>> +	  BR2_PACKAGE_TI_SGX_KM_AM4430.
>> +
>> +config BR2_PACKAGE_TI_SGX_AM5430
>> +	bool "ti-sgx-km AM5430 option renamed"
>> +	select BR2_LEGACY
>> +	help
>> +	  For consistency reasons, the option
>> +	  BR2_PACKAGE_TI_SGX_AM5430 has been renamed to
>> +	  BR2_PACKAGE_TI_SGX_KM_AM5430.
>> +
>>  config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
>>  	bool "janus-gateway audio-bridge option renamed"
>>  	select BR2_LEGACY
>> diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
>> index a4c9bb8ca2..db3d3f9ddd 100644
>> --- a/package/ti-sgx-km/Config.in
>> +++ b/package/ti-sgx-km/Config.in
>> @@ -20,26 +20,26 @@ if BR2_PACKAGE_TI_SGX_KM
>>  
>>  choice
>>  	prompt "Target"
>> -	default BR2_PACKAGE_TI_SGX_AM335X
>> +	default BR2_PACKAGE_TI_SGX_KM_AM335X
>>  	help
>>  	  Select the SOC for which you would like to install drivers.
>>  
>> -config BR2_PACKAGE_TI_SGX_AM335X
>> +config BR2_PACKAGE_TI_SGX_KM_AM335X
>>  	bool "AM335x"
>>  	help
>>  	  AM335x CPU
>>  
>> -config BR2_PACKAGE_TI_SGX_AM437X
>> +config BR2_PACKAGE_TI_SGX_KM_AM437X
>>  	bool "AM437x"
>>  	help
>>  	  AM437x CPU
>>  
>> -config BR2_PACKAGE_TI_SGX_AM4430
>> +config BR2_PACKAGE_TI_SGX_KM_AM4430
>>  	bool "AM4430"
>>  	help
>>  	  AM4430 CPU
>>  
>> -config BR2_PACKAGE_TI_SGX_AM5430
>> +config BR2_PACKAGE_TI_SGX_KM_AM5430
>>  	bool "AM5430"
>>  	help
>>  	  AM5430 CPU
>> diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
>> index db74da9b4a..0e1bc33902 100644
>> --- a/package/ti-sgx-km/ti-sgx-km.mk
>> +++ b/package/ti-sgx-km/ti-sgx-km.mk
>> @@ -17,13 +17,13 @@ TI_SGX_KM_MAKE_OPTS = \
>>  	KERNELDIR=$(LINUX_DIR) \
>>  	PVR_NULLDRM=1
>>  
>> -ifeq ($(BR2_PACKAGE_TI_SGX_AM335X),y)
>> +ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
>>  TI_SGX_KM_PLATFORM_NAME = omap335x
>> -else ifeq ($(BR2_PACKAGE_TI_SGX_AM437X),y)
>> +else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM437X),y)
>>  TI_SGX_KM_PLATFORM_NAME = omap437x
>> -else ifeq ($(BR2_PACKAGE_TI_SGX_AM4430),y)
>> +else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM4430),y)
>>  TI_SGX_KM_PLATFORM_NAME = omap4430
>> -else ifeq ($(BR2_PACKAGE_TI_SGX_5430),y)
>> +else ifeq ($(BR2_PACKAGE_TI_SGX_KM_5430),y)
>>  TI_SGX_KM_PLATFORM_NAME = omap5430
>>  endif
>>  
>> -- 
>> 2.14.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
