From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Jul 2015 19:00:22 +0200
Subject: [Buildroot] [PATCH 1/7] package/perf: if slang is enabled,
 depend on it
In-Reply-To: <55A52EA2.4020000@openwide.fr>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
 <55A52EA2.4020000@openwide.fr>
Message-ID: <55A54026.7070203@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 14/07/2015 17:45, Romain Naour a ?crit :
> Hi Steven,
> 
> Le 18/03/2015 22:42, Steven Noonan a ?crit :
>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>> ---
>>  package/perf/perf.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
>> index f6591a6..2b0702c 100644
>> --- a/package/perf/perf.mk
>> +++ b/package/perf/perf.mk
>> @@ -34,6 +34,10 @@ ifeq ($(BR2_arc),y)
>>  	PERF_MAKE_FLAGS += NO_BACKTRACE=1
>>  endif
>>  
>> +ifeq ($(BR2_PACKAGE_SLANG),y)
>> +	PERF_DEPENDENCIES += slang
>> +endif
>> +
> 
> The slang support can't be enabled simply by adding the slang package
> dependency, because newt support is disabled in PERF_MAKE_FLAGS:
> 
> PERF_MAKE_FLAGS = NO_NEWT=1
> 
> In tools/perl/config/Makefile, the slang support is disabled here (kernel 4.2-rc2):
> 
> ifdef NO_NEWT
>   NO_SLANG=1
> endif

It turn out, that NO_NEWT=1 in PERF_MAKE_FLAGS doesn't drive the Perf
configuration...

It seems that slang and libunwind depends on eflutils package... but the
dependency issue can be fixed in a followup patch.

In think, we can merge your patches as is except patches 5/7 and 6/7.

I'll post a new series with your patches in it.

Best regards,
Romain Naour.

> 
> So, you need to enable newt before.
> 
> Can you rework this patch and resubmit ?
> 
> Best regards,
> Romain Naour
> 
>>  ifeq ($(BR2_PACKAGE_ELFUTILS),y)
>>  	PERF_DEPENDENCIES += elfutils
>>  else
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
