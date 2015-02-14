From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 14 Feb 2015 09:09:53 +0100
Subject: [Buildroot] [PATCH v4 2/3] system: Defaulting TZ_LOCALTIME to
	UTC
In-Reply-To: <20150214083639.04c134f3@free-electrons.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
 <1423748972-17471-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150214083639.04c134f3@free-electrons.com>
Message-ID: <CA+TH9VncYdU5-EJW8h7H81py7q6WzF1q0g9hpjG-1LqOpbZQow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-02-14 8:36 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Thu, 12 Feb 2015 14:49:31 +0100, Angelo Compagnucci wrote:
>> This patch sets the default timezone to UTC if not overwritten.
>> Some packages need a configured system timezone for properly
>> operating like mono based software.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>>  system/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/system/Config.in b/system/Config.in
>> index 95e10ab..d967002 100644
>> --- a/system/Config.in
>> +++ b/system/Config.in
>> @@ -371,6 +371,7 @@ config BR2_TARGET_TZ_ZONELIST
>>
>>  config BR2_TARGET_LOCALTIME
>>       string "default local time"
>> +     default "Etc/UTC"
>>       help
>>         The time zone to install as the default local time, expressed as a
>>         tzdata location, such as:
>
> Can you give more details as to what doesn't work with the current
> default of an empty local time? An empty local time already means UTC,
> so there should be no need to specify Etc/UTC as the local time.
>
> Improving the commit log to give more details about the exact failure
> solved by this patch would be useful.

I just discovered that problems is in the whole Mono libraries, not
only in gtk#.
Without /etc/timezone and /etc/localtime files this is the error:

System.TimeZoneNotFoundException: Exception of type
'System.TimeZoneNotFoundException' was thrown.
  at System.TimeZoneInfo.get_Local () [0x00000] in <filename unknown>:0
  at System.CurrentSystemTimeZone.GetUtcOffset (DateTime time)
[0x00000] in <filename unknown>:0
  at System.TimeZone.GetLocalTimeDiff (DateTime time) [0x00000] in
<filename unknown>:0
  at System.DateTime.get_Now () [0x00000] in <filename unknown>:0
  at MainClass.Main (System.String[] args) [0x00000] in <filename unknown>:0
[ERROR] FATAL UNHANDLED EXCEPTION: System.TimeZoneNotFoundException:
Exception of type 'System.TimeZoneNotFoundException' was thrown.
  at System.TimeZoneInfo.get_Local () [0x00000] in <filename unknown>:0
  at System.CurrentSystemTimeZone.GetUtcOffset (DateTime time)
[0x00000] in <filename unknown>:0
  at System.TimeZone.GetLocalTimeDiff (DateTime time) [0x00000] in
<filename unknown>:0
  at System.DateTime.get_Now () [0x00000] in <filename unknown>:0
  at MainClass.Main (System.String[] args) [0x00000] in <filename unknown>:0

Mono libraries wants an explicit localtime to work, cannot be empty.

I do you suggest to solve this problem? Obviously it belongs to the
mono package, but how to solve it in a clean way?

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
