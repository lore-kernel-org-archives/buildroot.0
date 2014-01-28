From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 28 Jan 2014 17:34:35 -0600
Subject: [Buildroot] [PATCH v2] gcc: coexist upstream with vendor git
 releases for mb and arc
In-Reply-To: <52E7EAB5.9000909@mind.be>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
 <52E7EAB5.9000909@mind.be>
Message-ID: <CAEBucnAjAfvf650pA5css455D2TRwNteNhYzoo1pqkGy2cPPDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Can you explain this is bit better? I don't see the advantage at the
> moment...

The advantage of this approach is that as soon as upstream gcc
supports the microblaze or arc architecture, the only change required
is to remove depends on !BR2_microblaze or !BR2_arc for that release.

>  After this patch, the version is sometimes set in Config.in.host and
> sometimes in gcc.mk. I really don't like that...

I understand.  See below for a possible fix.  Let me know if you think
this is better.

>> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>> ---
>>   package/gcc/gcc.mk         | 6 ++++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>>   config BR2_EXTRA_GCC_CONFIG_OPTIONS
>> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
>> index 236297d..dd99604 100644
>> --- a/package/gcc/gcc.mk
>> +++ b/package/gcc/gcc.mk
>> @@ -19,10 +19,12 @@ ifneq ($(GCC_SNAP_DATE),)
>>   GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
>>   else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
>>   GCC_SITE = ftp://www.at91.com/pub/buildroot/
>> -else ifeq ($(BR2_arc),y)
>> +else ifeq ($(findstring git,$(GCC_VERSION))$(BR2_arc),gity)

instead of above do something like

-else ifeq ($(BR2_arc),y)
+else ifeq (BR2_GCC_VERSION_4_8_ARC,y)

>>   GCC_SITE = $(call
>> github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
>>   GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
>> -else ifeq ($(BR2_microblaze),y)
>> +else ifeq ($(findstring git,$(GCC_VERSION))$(BR2_microblaze),gity)

and instead of the above possibly

-else ifeq ($(BR2_arc),y)
+else ifeq (BR2_GCC_VERSION_4_9_MICROBLAZE,y)

>>   GCC_SITE = $(call github,Xilinx,gcc,$(GCC_VERSION))
>>   GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
>>   else

Also, updating the AVR32 code to work in the same manner would probably be best.

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
