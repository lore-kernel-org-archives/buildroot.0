From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 09:49:10 +0200
Subject: [Buildroot] [PATCH] php.ini: set date.timezone to UTC
In-Reply-To: <55440789.50004@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <5543FCCE.2000904@mind.be> <55440789.50004@je-eigen-domein.nl>
Message-ID: <55448176.6050108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 01:08, Floris Bos wrote:
> On 05/02/2015 12:23 AM, Arnout Vandecappelle wrote:
>> On 01/05/15 20:12, Floris Bos wrote:
>>> Prevent a warning being logged each time a PHP date/time method is
>>> used by setting UTC as (default) timezone in php.ini
>>>
>>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>>> ---
>>>   package/php/php.mk | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/package/php/php.mk b/package/php/php.mk
>>> index 3b9a117..7bd3f63 100644
>>> --- a/package/php/php.mk
>>> +++ b/package/php/php.mk
>>> @@ -288,6 +288,7 @@ define PHP_INSTALL_FIXUP
>>>       rm -f $(TARGET_DIR)/usr/bin/phpize
>>>       $(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
>>>           $(TARGET_DIR)/etc/php.ini
>>> +    $(SED) 's/;date.timezone =/date.timezone = UTC/' $(TARGET_DIR)/etc/php.ini
>>   Would it be possible to use BR2_TARGET_LOCALTIME (if set) instead? Something
>> like:
>>
>> ifeq ($(BR2_TARGET_LOCALTIME),)
>> PHP_LOCALTIME = UTC
>> else
>> PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
>> endif
>>
>>     $(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
>>         $(TARGET_DIR)/etc/php.ini
>>
>>   That is, assuming that php can deal with complex timezones like
>> Europe/Brussels.
> 
> PHP used to use the system's time zone name automatically in older PHP versions.
> But nowadays fills your log with warnings that is not reliable:
> 
> ==
> Warning: strtotime(): It is not safe to rely on the system's timezone settings.

 Any idea _why_ it is not safe? I've tried to google it but didn't come up with
a reason, just a lot of fixes.

> You are *required* to use the date.timezone setting or the
> date_default_timezone_set() function. In case you used any of those methods and
> you are still getting this warning, you most likely misspelled the timezone
> identifier. We selected the timezone 'UTC' for now, but please set date.timezone
> to select your timezone.
> ==
> 
> It certainly does work for common names like Europe/Brussels, but not sure if
> that goes for every zone name.

 Hm, php (like so often) has its own re-implementation of the timezone
database... . It's based on the same Olson database so it's probably OK for
valid timezones, but tzdata has additional posix/ and right/ variants and it
also has the old SystemV/ timezones...

 Well, people who use one of these weird timezones will see the php error so
they can solve it I guess.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
