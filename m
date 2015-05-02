From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 02 May 2015 17:09:45 +0200
Subject: [Buildroot] [PATCH] php.ini: set date.timezone to UTC
In-Reply-To: <55448176.6050108@mind.be>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <5543FCCE.2000904@mind.be> <55440789.50004@je-eigen-domein.nl>
 <55448176.6050108@mind.be>
Message-ID: <5544E8B9.1080707@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/2015 09:49 AM, Arnout Vandecappelle wrote:
> On 02/05/15 01:08, Floris Bos wrote:
>> On 05/02/2015 12:23 AM, Arnout Vandecappelle wrote:
>>> On 01/05/15 20:12, Floris Bos wrote:
>>>> Prevent a warning being logged each time a PHP date/time method is
>>>> used by setting UTC as (default) timezone in php.ini
>>>>
>>>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>>>> ---
>>>>    package/php/php.mk | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/package/php/php.mk b/package/php/php.mk
>>>> index 3b9a117..7bd3f63 100644
>>>> --- a/package/php/php.mk
>>>> +++ b/package/php/php.mk
>>>> @@ -288,6 +288,7 @@ define PHP_INSTALL_FIXUP
>>>>        rm -f $(TARGET_DIR)/usr/bin/phpize
>>>>        $(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
>>>>            $(TARGET_DIR)/etc/php.ini
>>>> +    $(SED) 's/;date.timezone =/date.timezone = UTC/' $(TARGET_DIR)/etc/php.ini
>>>    Would it be possible to use BR2_TARGET_LOCALTIME (if set) instead? Something
>>> like:
>>>
>>> ifeq ($(BR2_TARGET_LOCALTIME),)
>>> PHP_LOCALTIME = UTC
>>> else
>>> PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
>>> endif
>>>
>>>      $(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
>>>          $(TARGET_DIR)/etc/php.ini
>>>
>>>    That is, assuming that php can deal with complex timezones like
>>> Europe/Brussels.
>> PHP used to use the system's time zone name automatically in older PHP versions.
>> But nowadays fills your log with warnings that is not reliable:
>>
>> ==
>> Warning: strtotime(): It is not safe to rely on the system's timezone settings.
>   Any idea _why_ it is not safe? I've tried to google it but didn't come up with
> a reason, just a lot of fixes.

I just read: 
http://derickrethans.nl/distributions-please-dont-cripple-php-or-red-hat-stop-fucking-around.html

And the problem seem to just be that there isn't a standardized way to 
retrieve the exact timezone name set on a system, only derived information.
If you have Europe/London set on your system in the winter, PHP's old 
time zone detection algorithm would only be able to detect that it is 
currently "UTC" instead of that the timezone is set to London.
I can imagine that indeed gives problems if you have PHP code that works 
with time and date values in the past or future, and needs to take into 
account day light savings time.

That means there are only problems with the detection, and not really 
with the time zone names (except the exotic ones).
And there should be no problem just specifying BR2_TARGET_LOCALTIME in 
php.ini like you suggested.

-- 
Yours sincerely,

Floris Bos
