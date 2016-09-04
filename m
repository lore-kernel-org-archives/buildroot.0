From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 4 Sep 2016 11:18:19 +0200
Subject: [Buildroot] [PATCH] package/binutils: Disable -Os for Thumb-2
 only platforms
In-Reply-To: <20160904085504.fuu4ghxjhkpxd37n@tarshish>
References: <1472978990-14884-1-git-send-email-romain.naour@gmail.com>
 <20160904085504.fuu4ghxjhkpxd37n@tarshish>
Message-ID: <ff86be54-6476-db11-65e9-a666b43138b2@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 04/09/2016 ? 10:55, Baruch Siach a ?crit :
> Hi Romain,
> 
> On Sun, Sep 04, 2016 at 10:49:50AM +0200, Romain Naour wrote:
>> ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
>> ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
>> 2 bad relocscollect2: error: ld returned 1 exit status
>>
>> Binutils build fine with -O1, -O2 or -O3.
> 
> Is there an upstream bug report we can refer to?

No, I can't find any bug report.
Also I don't understand the meaning of this error, I just try some other build
options and figured out that the issue was caused by -Os.

> 
>> Fixes:
>> http://autobuild.buildroot.net/results/e72/e727e6e9cf361acc786acec192a88f5f5444a2f6
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  package/binutils/binutils.mk | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
>> index ff90a16..6946e7e 100644
>> --- a/package/binutils/binutils.mk
>> +++ b/package/binutils/binutils.mk
>> @@ -77,6 +77,12 @@ ifeq ($(BR2_bfin),y)
>>  BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
>>  endif
>>  
>> +# Workaround a build issue with -Os on Thumb-2 only platforms
>> +# (such as Cortex-M). (Binutils 2.25.1 and 2.26.1)
>> +ifeq ($(BR2_ARM_CPU_HAS_ARM)$(BR2_OPTIMIZE_S),yy)
>> +BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
> 
> Isn't -O2 the more "standard" optimization option?

Yes maybe, it's just because I borrowed the same line above for Blackfin :)
As I said on the commit log, Binutils build fine with O1,O2 and O3 so use O2 if
it's more "standard" optimization option.

Thanks!

Best regards,
Romain

> 
>> +endif
> 
> baruch
> 
