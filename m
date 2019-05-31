From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 May 2019 10:46:28 +0200
Subject: [Buildroot] [PATCH] package/chrony: add option for debug logging
In-Reply-To: <b96bc92f-ec2a-acec-9667-228014c12e3f@sedsystems.ca>
References: <1559086828-14718-1-git-send-email-hancock@sedsystems.ca>
 <375f6faa-1016-2446-88ab-13dc449e5c1a@mind.be>
 <b96bc92f-ec2a-acec-9667-228014c12e3f@sedsystems.ca>
Message-ID: <e7c6fe4d-d8b6-94e4-8ee9-68008995ac2e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/05/2019 00:07, Robert Hancock wrote:
> On 2019-05-29 3:01 p.m., Arnout Vandecappelle wrote:
>>  Hi Robert,
>>
>> On 29/05/2019 01:40, Robert Hancock wrote:
>>> Add a BR2_PACKAGE_CHRONY_DEBUG_LOGGING config option to allow enabling
>>> compiled-in support for debug logging in Chrony. Enable by default as
>>> this makes it much easier to debug Chrony issues and should only be
>>> disabled by those very sensitive to binary size.
>>
>>  How big is the size difference (compared to the size of chrony itself)? Please
>> report this in the commit message.
> 
> On 32-bit ARM, the chronyd binary goes from 149632 bytes to 174208 bytes
> and chronyc from 59008 to 63104 bytes, so about 14% difference. I can
> add a note about the rough binary size difference to the config option
> if we want to keep it.

 That's enough of a size difference to make it a Config.in option, IMO,
especially since it's not something that most people would want.

 The latter would make me think whether we should even have such an option. You
can achieve the same by putting the following in an external.mk (not local.mk,
unfortunately):

CHRONY_CONF_OPTS += --enable-debug

 However, it's just a small thing and doesn't really make maintainability more
difficult.

 There's no need to respin, the 14% can be added while applying. If you want to
make our life easier and do make a respin, please add:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(I don't have time to apply it now).

 Regards,
 Arnout

> 
>>
>>  If it is less than 10%, I think we prefer to drop the Config.in option and
>> unconditionally enable debug. That is, assuming that this doesn't force other
>> options (-g for example) into the compilation. Normally it shouldn't since we
>> override CFLAGS.
>>
>>  Peter, can you confirm that we prefer without the Kconfig option?
>>
>>>
>>> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
>>> ---
>>>  package/chrony/Config.in | 8 ++++++++
>>>  package/chrony/chrony.mk | 3 ++-
>>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/chrony/Config.in b/package/chrony/Config.in
>>> index 05d6fc1..b295e8d 100644
>>> --- a/package/chrony/Config.in
>>> +++ b/package/chrony/Config.in
>>> @@ -6,3 +6,11 @@ config BR2_PACKAGE_CHRONY
>>>  	  accuracy of the system clock.
>>>  
>>>  	  http://chrony.tuxfamily.org/
>>> +
>>> +config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
>>> +	bool "enable debug logging support"
>>> +	default y
>>> +	depends on BR2_PACKAGE_CHRONY
>>> +	help
>>> +	  Enable support for debug logging output from Chrony when enabled at
>>> +	  runtime. If disabled, code for debug logging will not be compiled in.
>>> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
>>> index b5821b2..2d03fce 100644
>>> --- a/package/chrony/chrony.mk
>>> +++ b/package/chrony/chrony.mk
>>> @@ -13,7 +13,8 @@ CHRONY_CONF_OPTS = \
>>>  	--host-system=Linux \
>>>  	--host-machine=$(BR2_ARCH) \
>>>  	--prefix=/usr \
>>> -	--without-tomcrypt
>>> +	--without-tomcrypt \
>>> +	$(if $(BR2_PACKAGE_CHRONY_DEBUG_LOGGING),--enable-debug,--disable-debug)
>>
>>  If it is unconditional, add a comment like:
>>
>> # --enable-debug to make sure debug logging is compiled in and can be used when
>> # enabled at runtime.
>>
>>  Regards,
>>  Arnout
>>
>>>  
>>>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>>>  CHRONY_DEPENDENCIES += libcap
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
